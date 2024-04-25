import random
import re
import zoneinfo
from datetime import datetime, timedelta
import time
import uuid
from statistics import mean
from urllib.parse import urlencode
import httpx as httpx
from aliyunsdkcore.auth.credentials import AccessKeyCredential
from loguru import logger
import requests
from alipay.aop.api.request.AlipaySystemOauthTokenRequest import AlipaySystemOauthTokenRequest
from alipay.aop.api.request.AlipayUserInfoShareRequest import AlipayUserInfoShareRequest
from alipay.aop.api.constant.ParamConstants import *
from alipay.aop.api.response.AlipaySystemOauthTokenResponse import AlipaySystemOauthTokenResponse
from alipay.aop.api.response.AlipayUserInfoShareResponse import AlipayUserInfoShareResponse
from django.core.cache import cache
from django.core.mail import EmailMultiAlternatives
from django.conf import settings
from django.utils import timezone
from account.models import UserInfo, UserSource, OAuthId
from rest_framework_simplejwt.tokens import RefreshToken
import json
from tencentcloud.common import credential
from tencentcloud.common.profile.client_profile import ClientProfile
from tencentcloud.common.profile.http_profile import HttpProfile
from tencentcloud.common.exception.tencent_cloud_sdk_exception import TencentCloudSDKException
from tencentcloud.cdn.v20180606 import cdn_client, models as cdn_models
from tencentcloud.cvm.v20170312 import cvm_client, models as cvm_models
from tencentcloud.monitor.v20180724 import monitor_client, models as monitor_models
from aliyunsdkcore.client import AcsClient
from aliyunsdkcms.request.v20190101.DescribeMetricListRequest import DescribeMetricListRequest
from aliyunsdkecs.request.v20140526.DescribeInstancesRequest import DescribeInstancesRequest
from aliyunsdkecs.request.v20140526.DescribeDisksRequest import DescribeDisksRequest
from alipay.aop.api.AlipayClientConfig import AlipayClientConfig
from alipay.aop.api.DefaultAlipayClient import DefaultAlipayClient
import traceback
from django.contrib.sites.models import Site

tz = zoneinfo.ZoneInfo("Asia/Shanghai")


class AuthCode:
    """
    发送验证码
    """

    def __init__(self, contact):
        self.code = ''
        # 验证码
        self.contact = contact
        # 联系方式

    def make_code(self):
        for i in range(6):
            self.code = self.code + str(random.randint(0, 9))
        cache.set(self.contact, self.code, timeout=1800)

    def check_code(self, code):
        try:
            cache_code = cache.get(self.contact)
            if cache_code != code:
                print("邮件验证码错误！")
                return False
            else:
                print("验证通过！")
                return True
        except KeyError:
            print("邮件验证码已过期！")
            return False

    def send_email(self, receive, username, action):
        """
        发送邮件验证码
        :param str receive: 收件人
        :param str username: 收件人用户名
        :param str action: 操作内容
        :return: 1 发送成功
        """
        content = """
        <body style="background-color: #ebedf0;margin: 0;padding: 0">
            <div id="content" style="width: 75%;margin: 10% auto;background-color: white;border-radius: 10px;box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);">
                <div style="text-align: center;background-color: #ecf0f1;height: 80px">
                    <h2 style="margin: 0 auto;line-height: 80px;">【""" + Site.objects.get_current().name + """】验证码</h2>
                </div>
                <div style="padding: 0 20px;">
                    <p style="font-weight: bold">尊敬的""" + username + """：您好！</p>
                    <p style="text-indent:2em;font-weight: bold">您正在进行
                        <span style="color: #e74c3c">""" + action + """</span> 操作，请在验证码输入框输入：
                        <span style="color: #e74c3c;font-weight: bold;font-size: 40px">""" + self.code + """</span>，以完成操作，验证码有效期为3分钟。
                    </p>
                    <br>
                    <p style="color: #bdc3c7;text-indent:2em">注意：此操作可能会对您的账号进行""" + action + """操作。
                        如非本人操作，请及时登录并修改密码以保证账户安全，请勿泄露此验证码！</p>
                </div>
                <div style="background-color: #ecf0f1;padding: 20px;">
                    <p style="color: #bdc3c7;text-indent:2em;margin: 0 auto;line-height: 30px">您会收到这封邮件，是由于在
                        <a href=https://""" + Site.objects.get_current().domain + """ style="text-decoration: none">""" + Site.objects.get_current().name + """</a>
                        进行了新用户注册或修改密码、绑定邮箱等操作。如果您并没有访问过
                        <a href=https://""" + Site.objects.get_current().domain + """ style="text-decoration: none">""" + Site.objects.get_current().name + """</a>
                        ，或没有进行上述操作， 请忽略这封邮件！
                    </p>
                </div>
            </div>
            <script>
                var width = document.body.clientWidth;
                if (width < 500) {
                    document.querySelector("#content").style.width="95%"
                }
            </script>
        </body>
        """
        subject = "[" + Site.objects.get_current().name + "] Email 验证码"
        from_email = Site.objects.get_current().name + "<cuiliangblog@qq.com>"
        msg = EmailMultiAlternatives(subject, content, from_email, [receive])
        msg.content_subtype = "html"
        return msg.send()


class Baidu:
    """
    # 百度统计api
    """

    def __init__(self):
        self.url = 'https://api.baidu.com/json/tongji/v1/ReportService/getData'
        self.username = settings.BAIDU_USERNAME
        self.password = settings.BAIDU_PASSWORD
        self.token = settings.BAIDU_TOKEN
        self.id = settings.BAIDU_ID

    # 获取所有流量统计
    def count_all(self):
        end_date = (timezone.now()).strftime('%Y%m%d')
        data = {
            "header": {
                "username": self.username,
                "password": self.password,
                "token": self.token,
                "account_type": 1
            },
            "body": {
                "site_id": self.id,
                "start_date": settings.BAIDU_START_DATE,
                "end_date": end_date,
                "metrics": "pv_count,visitor_count,ip_count",
                "method": "trend/time/a",
                "area": ""
            }
        }
        try:
            r = requests.post(self.url, data=json.dumps(data))
            result = json.loads(r.text)
            pv = result["body"]["data"][0]["result"]["pageSum"][0][0]
            uv = result["body"]["data"][0]["result"]["pageSum"][0][1]
            ip = result["body"]["data"][0]["result"]["pageSum"][0][2]
            count_dict = dict()
            count_dict['pv'] = pv
            count_dict['uv'] = uv
            count_dict['ip'] = ip
        except Exception as e:
            print(e)
            count_dict = dict()
            count_dict['pv'] = 8024
            count_dict['uv'] = 3025
            count_dict['ip'] = 2896
        return count_dict

    # 获取当天流量统计和昨天对比
    def count_today(self):
        today = datetime.now().strftime("%Y%m%d")
        yesterday = (datetime.now() - timedelta(days=1)).strftime("%Y%m%d")
        data = {
            "header": {
                "username": self.username,
                "password": self.password,
                "token": self.token,
                "account_type": 1
            },
            "body": {
                "site_id": self.id,
                "start_date": today,
                "end_date": today,
                "metrics": "pv_count,visitor_count,avg_visit_time,avg_visit_pages,new_visitor_count",
                "method": "trend/time/a",
                "start_date2": yesterday,
                "end_date2": yesterday,
                "area": ""
            }
        }
        r = requests.post(self.url, data=json.dumps(data))
        # print(r.text)
        result = json.loads(r.text)["body"]["data"][0]["result"]["pageSum"]
        return result

    # 近7天流量趋势
    def count_trend(self):
        today = datetime.now().strftime("%Y%m%d")
        week_ago = (datetime.now() - timedelta(days=6)).strftime("%Y%m%d")
        data = {
            "header": {
                "username": self.username,
                "password": self.password,
                "token": self.token,
                "account_type": 1
            },
            "body": {
                "site_id": self.id,
                "start_date": week_ago,
                "end_date": today,
                "metrics": "pv_count,visitor_count,new_visitor_count,ip_count,avg_visit_time,avg_visit_pages",
                "method": "trend/time/a",
                "gran": "day",
                "area": ""
            }
        }
        r = requests.post(self.url, data=json.dumps(data))
        result = json.loads(r.text)["body"]["data"][0]["result"]
        return result

    # 受访页统计
    def count_page(self):
        today = datetime.now().strftime("%Y%m%d")
        week_ago = (datetime.now() - timedelta(days=6)).strftime("%Y%m%d")
        data = {
            "header": {
                "username": self.username,
                "password": self.password,
                "token": self.token,
                "account_type": 1
            },
            "body": {
                "site_id": self.id,
                "start_date": week_ago,
                "end_date": today,
                "metrics": "pv_count,visitor_count,visit1_count,average_stay_time",
                "method": "visit/toppage/a",
                "max_results": "50"
            }
        }
        r = requests.post(self.url, data=json.dumps(data))
        result = json.loads(r.text)["body"]["data"][0]["result"]
        return result

    # 用户设备统计:
    def count_device(self):
        today = datetime.now().strftime("%Y%m%d")
        week_ago = (datetime.now() - timedelta(days=6)).strftime("%Y%m%d")
        data_pc = {
            "header": {
                "username": self.username,
                "password": self.password,
                "token": self.token,
                "account_type": 1
            },
            "body": {
                "site_id": self.id,
                "start_date": week_ago,
                "end_date": today,
                "metrics": "pv_count",
                "method": "trend/time/a",
                "clientDevice": "pc",
                "gran": "day",
                "area": ""
            }
        }
        r_pc = requests.post(self.url, data=json.dumps(data_pc))
        result_pc = json.loads(r_pc.text)["body"]["data"][0]["result"]["pageSum"][0]
        data_mobile = {
            "header": {
                "username": self.username,
                "password": self.password,
                "token": self.token,
                "account_type": 1
            },
            "body": {
                "site_id": self.id,
                "start_date": week_ago,
                "end_date": today,
                "metrics": "pv_count",
                "method": "trend/time/a",
                "clientDevice": "mobile",
                "gran": "day",
                "area": ""
            }
        }
        r_mobile = requests.post(self.url, data=json.dumps(data_mobile))
        result_mobile = json.loads(r_mobile.text)["body"]["data"][0]["result"]["pageSum"][0]
        data = dict()
        data['pc'] = result_pc[-1]
        data['mobile'] = result_mobile[-1]
        return data

    # 用户区域统计:
    def count_map(self):
        today = datetime.now().strftime("%Y%m%d")
        week_ago = (datetime.now() - timedelta(days=6)).strftime("%Y%m%d")
        data = {
            "header": {
                "username": self.username,
                "password": self.password,
                "token": self.token,
                "account_type": 1
            },
            "body": {
                "site_id": self.id,
                "start_date": week_ago,
                "end_date": today,
                "metrics": "pv_count,pv_ratio",
                "method": "visit/district/a",
            }
        }
        r = requests.post(self.url, data=json.dumps(data))
        result = json.loads(r.text)["body"]["data"][0]["result"]
        return result


class Umami:
    """
    umami统计api
    """

    def __init__(self):
        self.base = settings.UMAMI_BASE
        self.path = ''
        self.method = ''
        self.params = {}
        self.token = ''
        self.__get_token__()

    # 请求接口数据
    def __request_data__(self):
        if self.method == "post":
            response = httpx.post(self.base + self.path, data=self.params)
            if response.status_code == 200:
                return response.json()
        else:
            headers = {'Authorization': 'Bearer ' + self.token}
            response = httpx.get(self.base + self.path, headers=headers, params=self.params)
            # logger.info(response)
            if response.status_code == 200:
                return response.json()

    # 获取token
    def __get_token__(self):
        self.path = '/api/auth/login'
        self.method = 'post'
        self.params = {
            "username": settings.UMAMI_USERNAME,
            "password": settings.UMAMI_PASSWORD
        }
        response = self.__request_data__()
        token = response['token']
        logger.info(token)
        self.token = token

    # 获取在线用户数
    def get_active(self):
        self.path = '/api/websites/' + settings.UMAMI_ID + '/active'
        self.method = 'get'
        self.params = {}
        response = self.__request_data__()
        # logger.info(response)
        return response['x']

    # 获取访问量(最近24h)
    def get_stats(self):
        self.path = '/api/websites/' + settings.UMAMI_ID + '/stats'
        self.method = 'get'
        self.params = {
            'startAt': int(round(time.time() * 1000)) - 86400000,
            'endAt': int(round(time.time() * 1000))
        }
        # logger.info(self.params)
        response = self.__request_data__()
        # logger.info(response)
        result = {
            "pv": response['pageviews']['value'],
            "uv": response['visits']['value'],
            "bounces": response['bounces']['value'],
            "page_time": int(response['totaltime']['value'] / response['pageviews']['value']),
        }
        # logger.info(result)
        return result


class Aliyun:
    """
    阿里云sdk工具
    """

    def __init__(self, secret_id, secret_key):
        self.secretId = secret_id
        self.secretKey = secret_key
        self.location = settings.CLOUD['ECS']['LOCATION']
        self.instanceId = settings.CLOUD['ECS']['INSTANCE']

    def __ecs_metric(self, metric):
        """
        获取指标数据
        """
        startTime = (datetime.now() - timedelta(minutes=15)).strftime("%Y-%m-%d %H:%M:%S")
        try:
            client = AcsClient(self.secretId, self.secretKey, self.location)
            request = DescribeMetricListRequest()
            request.set_accept_format('json')
            request.set_StartTime(startTime)
            instance = "{\"instanceId\":\"" + self.instanceId + "\"}"
            request.set_Dimensions(instance)
            request.set_Period("60")
            request.set_Namespace("acs_ecs_dashboard")
            request.set_MetricName(metric)
            response = client.do_action_with_exception(request)
            result = str(response, encoding='utf-8')
            result_dict = json.loads(result)
            # print(result_dict)
            if result_dict['Code'] == '200':
                data = eval(result_dict['Datapoints'][1:-1])
                return round(data[0]["Average"], 2)
        except Exception as e:
            logger.error(e)
            value = 0.00
            return value

    def ecs_info(self):
        """
        云主机配置信息
        """

        result = dict()
        credentials = AccessKeyCredential(self.secretId, self.secretKey)
        client = AcsClient(region_id=self.location, credential=credentials)
        # 获取概述信息
        request = DescribeInstancesRequest()
        request.set_accept_format('json')
        request.set_InstanceIds("['" + self.instanceId + "']")
        response = json.loads(str(client.do_action_with_exception(request), encoding='utf-8'))
        result['cpu'] = response['Instances']['Instance'][0]['Cpu']
        result['memory'] = int(response['Instances']['Instance'][0]['Memory'] / 1024)
        result['os'] = response['Instances']['Instance'][0]['OSName']
        result['bandwidth'] = response['Instances']['Instance'][0]['InternetMaxBandwidthOut']
        # 获取磁盘信息
        request = DescribeDisksRequest()
        request.set_accept_format('json')
        request.set_InstanceId(self.instanceId)
        response = json.loads(str(client.do_action_with_exception(request), encoding='utf-8'))
        result['disk'] = response['Disks']['Disk'][0]['Size']
        return result

    def ecs_monitoring(self):
        """
        云主机性能监控
        """
        metric_list = ['CPUUtilization', 'memory_usedutilization', 'diskusage_utilization', 'load_15m']
        result = dict()
        for i in metric_list:
            if i == 'CPUUtilization':
                result['cpu_rate'] = self.__ecs_metric(i)
            elif i == 'memory_usedutilization':
                result['memory_rate'] = self.__ecs_metric(i)
            elif i == 'diskusage_utilization':
                result['disk_rate'] = self.__ecs_metric(i)
            else:
                result['load_15'] = self.__ecs_metric(i)
        return result

    def cdn_refresh(self, url):
        """
        cdn刷新
        """
        pass


class Tencent:
    """
    腾讯云sdk工具
    """

    def __init__(self, secret_id, secret_key):
        self.secretId = secret_id
        self.secretKey = secret_key
        self.location = settings.CLOUD['ECS']['LOCATION']
        self.instanceId = settings.CLOUD['ECS']['INSTANCE']

    def ecs_info(self):
        """
        云主机配置信息
        """

        result = dict()
        try:
            cred = credential.Credential(self.secretId, self.secretKey)
            httpProfile = HttpProfile()
            httpProfile.endpoint = "cvm.tencentcloudapi.com"

            clientProfile = ClientProfile()
            clientProfile.httpProfile = httpProfile
            client = cvm_client.CvmClient(cred, self.location, clientProfile)

            req = cvm_models.DescribeInstancesRequest()
            params = {
                "InstanceIds": [self.instanceId]
            }
            req.from_json_string(json.dumps(params))
            resp = json.loads(client.DescribeInstances(req).to_json_string())
            result['cpu'] = resp['InstanceSet'][0]['CPU']
            result['memory'] = resp['InstanceSet'][0]['Memory']
            result['os'] = resp['InstanceSet'][0]['OsName']
            result['bandwidth'] = resp['InstanceSet'][0]['InternetAccessible']['InternetMaxBandwidthOut']
            result['disk'] = resp['InstanceSet'][0]['SystemDisk']['DiskSize']

        except TencentCloudSDKException as err:
            print(err)
            result = None
        return result

    def __ecs_metric(self, metric):
        """
        获取指标数据
        """
        startTime = (datetime.now() - timedelta(minutes=15)).strftime("%Y-%m-%dT%H:%M:%S+08:00")
        endTime = datetime.now().strftime("%Y-%m-%dT%H:%M:%S+08:00")
        try:
            cred = credential.Credential(self.secretId, self.secretKey)
            httpProfile = HttpProfile()
            httpProfile.endpoint = "monitor.tencentcloudapi.com"

            clientProfile = ClientProfile()
            clientProfile.httpProfile = httpProfile
            client = monitor_client.MonitorClient(cred, self.location, clientProfile)

            req = monitor_models.GetMonitorDataRequest()
            params = {
                "Namespace": "QCE/CVM",
                "MetricName": metric,
                "Period": 300,
                "StartTime": startTime,
                "EndTime": endTime,
                "Instances": [
                    {
                        "Dimensions": [
                            {
                                "Name": "InstanceId",
                                "Value": self.instanceId
                            }
                        ]
                    }
                ]
            }
            req.from_json_string(json.dumps(params))
            resp = json.loads(client.GetMonitorData(req).to_json_string())
            return round(mean(resp['DataPoints'][0]['Values']), 2)
        except Exception as e:
            logger.error(e)
            value = 0.00
            return value

    def ecs_monitoring(self):
        """
        云主机性能监控
        """
        metric_list = ['CPUUsage', 'MemUsage', 'CvmDiskUsage', 'Cpuloadavg15m']
        result = dict()
        for i in metric_list:
            if i == 'CPUUsage':
                result['cpu_rate'] = self.__ecs_metric(i)
            elif i == 'MemUsage':
                result['memory_rate'] = self.__ecs_metric(i)
            elif i == 'CvmDiskUsage':
                result['disk_rate'] = self.__ecs_metric(i)
            else:
                result['load_15'] = self.__ecs_metric(i)
        return result

    def cdn_refresh(self, url):
        """
        cdn刷新
        """
        try:
            cred = credential.Credential(self.secretId, self.secretKey)
            httpProfile = HttpProfile()
            httpProfile.endpoint = "cdn.tencentcloudapi.com"

            clientProfile = ClientProfile()
            clientProfile.httpProfile = httpProfile
            client = cdn_client.CdnClient(cred, "", clientProfile)

            req = cdn_models.PurgeUrlsCacheRequest()
            params = {
                "Urls": [url]
            }
            req.from_json_string(json.dumps(params))

            resp = client.PurgeUrlsCache(req)
            logger.info(resp.to_json_string())
            return True

        except TencentCloudSDKException as err:
            print(err)
            logger.error(err)
            return False


class OAuth:
    """
    第三方登录
    """

    def __init__(self, platform, kind, code, redirect_uri):
        print(platform, kind, code, redirect_uri)
        self._client_key = settings.AUTH[platform][kind]['KEY']
        # 应用id
        self._client_secret = settings.AUTH[platform][kind]['SECRET']
        # 应用key
        self._code = code
        # 用户code
        self._redirect_uri = redirect_uri
        # 登录回调地址
        self.openid = ''
        # 用户第三方登录ID
        self.source_id = ''
        # 用户来源id
        self.user_id = ''
        # 用户id
        self.platform = platform
        self.kind = kind

    def __check_user_register(self):
        """
        检查用户是否已注册
        :return:
        """
        print('开始检测用户是否已注册过')
        user = OAuthId.objects.filter(source_id=self.source_id, openid=self.openid)
        if user.count() != 0:
            self.user_id = user.first().user.id
            return True
        else:
            return False

    def __create_user(self, username, **kwargs):
        """
        创建新用户
        :param username: 用户名
        :param kwargs: 用户信息
        :return: None
        """
        print("开始创建新用户啦")
        while UserInfo.objects.filter(username=username):  # 防止用户名重复
            username = username + str(random.randrange(10))
        userinfo = {
            'source_id': self.source_id,
            'username': username,
            'password': str(uuid.uuid1())
        }
        for key, value in kwargs.items():
            userinfo[key] = value
        logger.info('存储信息：{}'.format(userinfo))
        print(userinfo)
        # 用户信息表插入数据
        new_user = UserInfo.objects.create_user(**userinfo)
        self.user_id = new_user.id
        # OAuthId表插入数据
        OAuthId.objects.create(user_id=self.user_id, source_id=self.source_id, openid=self.openid)

    def __user_login(self):
        """
        用户登录签发token
        :return:
        """
        print("开始登录了")
        user = UserInfo.objects.get(id=self.user_id)
        user.last_login = timezone.now()
        user.save()
        refresh = RefreshToken.for_user(user)
        result = dict()
        result['token'] = str(refresh.access_token)
        result['userid'] = user.id
        result['username'] = user.username
        return result

    def weibo_login(self):
        """
        微博登录
        :return:
        """
        print("微博登录了")
        self.source_id = UserSource.objects.get(name='微博').id
        # 获取用户access_token和uid
        access_token_url = 'https://api.weibo.com/oauth2/access_token?client_id={0}&client_secret={1}&grant_type=authorization_code&code={2}&redirect_uri={3}'.format(
            self._client_key, self._client_secret, self._code, self._redirect_uri)
        access_response = requests.post(access_token_url).json()
        print(access_response['access_token'], access_response['uid'])
        self.openid = access_response['uid']
        # 判断用户是否已注册过
        user = self.__check_user_register()
        if user:
            print('已注册过，直接登录')
            return self.__user_login()
        else:
            # 获取用户信息
            userinfo_url = "https://api.weibo.com/2/users/show.json?access_token={0}&uid={1}".format(
                access_response['access_token'], access_response['uid'])
            userinfo_response = requests.get(userinfo_url).json()
            print(userinfo_response)
            logger.info('微博用户信息：{}'.format(userinfo_response))
            username = userinfo_response['name']
            signature = userinfo_response['description']
            photo = userinfo_response['avatar_large']
            web = userinfo_response['url']
            area_name = userinfo_response['location']
            if userinfo_response['gender'] == 'f':
                sex = 2
            else:
                sex = 1
            # 新建用户
            self.__create_user(username, signature=signature, photo=photo, web=web, area_name=area_name, sex=sex)
            # 用户登录
            return self.__user_login()

    def qq_login(self):
        """
        QQ登录
        """
        print("QQ登录了")
        self.source_id = UserSource.objects.get(name='qq').id
        # 获取用户access_token
        access_token_url = 'https://graph.qq.com/oauth2.0/token?client_id={0}&client_secret={1}&grant_type=authorization_code&code={2}&redirect_uri={3}&fmt=json'.format(
            self._client_key, self._client_secret, self._code, self._redirect_uri)
        access_response = requests.get(access_token_url).json()
        print(access_response['access_token'])
        # 使用Access Token获取用户的OpenID
        openID_url = 'https://graph.qq.com/oauth2.0/me?access_token={}&fmt=json'.format(access_response['access_token'])
        openID_response = requests.get(openID_url).json()
        print("openID:", openID_response['openid'])
        self.openid = openID_response['openid']
        # 判断用户是否已注册过
        user = self.__check_user_register()
        if user:
            print('已注册过，直接登录')
            return self.__user_login()
        else:
            # 获取用户信息
            print('开始获取用户信息')
            userinfo_url = "https://graph.qq.com/user/get_user_info?access_token={0}&oauth_consumer_key={1}&openid={2}&fmt=json".format(
                access_response['access_token'], self._client_key, self.openid)
            userinfo_response = requests.get(userinfo_url).json()
            logger.info('QQ用户信息：{}'.format(userinfo_response))
            print(userinfo_response)
            username = userinfo_response['nickname']
            photo = userinfo_response['figureurl_2']
            area_name = userinfo_response['province'] + ' ' + userinfo_response['city']
            if userinfo_response['gender'] == '女':
                sex = 2
            else:
                sex = 1
            # 新建用户
            self.__create_user(username, photo=photo, area_name=area_name, sex=sex)
            # 用户登录
            return self.__user_login()

    def baidu_login(self):
        """
        百度账号登录
        """
        print("百度登录了")
        self.source_id = UserSource.objects.get(name='百度').id
        print(self.source_id)
        # 获取用户access_token
        access_token_url = 'https://openapi.baidu.com/oauth/2.0/token?grant_type=authorization_code&client_id={0}&client_secret={1}&code={2}&redirect_uri={3}'.format(
            self._client_key, self._client_secret, self._code, self._redirect_uri)
        access_response = requests.get(access_token_url).json()
        print(access_response['access_token'])
        # 使用Access Token获取用户信息
        userinfo_url = "https://openapi.baidu.com/rest/2.0/passport/users/getInfo?access_token={}".format(
            access_response['access_token'])
        userinfo_response = requests.get(userinfo_url).json()
        logger.info('百度用户信息：{}'.format(userinfo_response))
        print(userinfo_response)
        self.openid = userinfo_response['portrait']
        # 判断用户是否已注册过
        user = self.__check_user_register()
        if user:
            print('已注册过，直接登录')
            return self.__user_login()
        else:
            # 获取用户信息
            username = userinfo_response['username']
            photo = 'https://himg.bdimg.com/sys/portrait/item/' + userinfo_response['portrait']
            # 新建用户
            self.__create_user(username, photo=photo)
            # 用户登录
            return self.__user_login()

    def microsoft_login(self):
        """
        微软账号登录
        """
        print("微软账号登录了")
        self.source_id = UserSource.objects.get(name='微软').id
        print(self.source_id)
        # 获取用户access_token
        access_token_headers = {
            'Content-Type': 'application/x-www-form-urlencoded'
        }
        access_token_data = {
            "client_id": self._client_key,
            "client_secret": self._client_secret,
            "code": self._code,
            "redirect_uri": self._redirect_uri,
            "grant_type": 'authorization_code',
            "scope": 'offline_access user.read'
        }
        access_token_url = 'https://login.microsoftonline.com/consumers/oauth2/v2.0/token'
        access_response = requests.post(access_token_url, headers=access_token_headers,
                                        data=urlencode(access_token_data)).json()
        print(access_response['access_token'])
        # 使用Access Token获取用户信息
        userinfo_headers = {
            "Authorization": 'Bearer ' + access_response['access_token'],
            "Host": 'graph.microsoft.com'
        }
        userinfo_url = "https://graph.microsoft.com/v1.0/me"
        userinfo_response = requests.get(userinfo_url, headers=userinfo_headers).json()
        logger.info('微软用户信息：{}'.format(userinfo_response))
        print(userinfo_response)
        self.openid = userinfo_response['id']
        # 判断用户是否已注册过
        user = self.__check_user_register()
        if user:
            print('已注册过，直接登录')
            return self.__user_login()
        else:
            # 获取用户信息
            username = userinfo_response['displayName'].replace(" ", "")
            # 新建用户
            self.__create_user(username)
            # 用户登录
            return self.__user_login()

    def __pay_token(self, client):
        """
        支付宝通过code获取用户token
        :param client:
        :return:
        """
        # 构造请求参数对象
        request = AlipaySystemOauthTokenRequest()
        request.code = self._code
        request.grant_type = "authorization_code"
        response_content = None
        # 执行API调用
        try:
            response_content = client.execute(request)
        except Exception as e:
            print(traceback.format_exc(), e)
        if not response_content:
            print("failed execute")
        else:
            # 解析响应结果
            response = AlipaySystemOauthTokenResponse()
            response.parse_response_content(response_content)
            if response.is_success():
                # 如果业务成功，可以通过response属性获取需要的值
                auth_token = response.access_token
                self.openid = response.user_id
                return auth_token
            # 响应失败的业务处理
            else:
                # 如果业务失败，可以从错误码中可以得知错误情况，具体错误码信息可以查看接口文档
                print(response.code + "," + response.msg + "," + response.sub_code + "," + response.sub_msg)

    def __pay_userinfo(self, client, token):
        """
        获取支付宝用户信息
        :return:
        """
        request = AlipayUserInfoShareRequest()
        # 添加auth_token
        udf_params = dict()
        udf_params[P_AUTH_TOKEN] = token
        request.udf_params = udf_params
        response_content = None
        # 执行API调用
        try:
            # 执行接口请求
            response_content = client.execute(request)
        except Exception as e:
            print(traceback.format_exc(), e)
        if not response_content:
            print("failed execute")
        else:
            response = AlipayUserInfoShareResponse()
            # 解析响应结果
            response.parse_response_content(response_content)
            # 响应成功的业务处理
            if response.is_success():
                # 如果业务成功，可以通过response属性获取需要的值
                # print(response)
                logger.info('支付宝用户信息：{}'.format(response))
                username = response.nick_name
                photo = response.avatar
                area_name = response.province + ' ' + response.city
                if response.gender == 'f':
                    sex = 2
                else:
                    sex = 1
                # 新建用户
                self.__create_user(username, photo=photo, area_name=area_name, sex=sex)
            # 响应失败的业务处理
            else:
                # 如果业务失败，可以从错误码中可以得知错误情况，具体错误码信息可以查看接口文档
                print(response.code + "," + response.msg + "," + response.sub_code + "," + response.sub_msg)

    def pay_login(self):
        """
        支付宝登录
        """
        print("支付宝登录了")
        self.source_id = UserSource.objects.get(name='支付宝').id
        # 实例化客户端
        alipay_client_config = AlipayClientConfig()
        alipay_client_config.server_url = 'https://openapi.alipay.com/gateway.do'
        alipay_client_config.app_id = self._client_key
        alipay_client_config.app_private_key = settings.AUTH[self.platform][self.kind]['PRIVATE_KEY']
        alipay_client_config.alipay_public_key = settings.AUTH[self.platform][self.kind]['PUBLIC_KEY']
        client = DefaultAlipayClient(alipay_client_config)
        # 获取用户token
        token = self.__pay_token(client)
        # 判断用户是否已注册过
        user = self.__check_user_register()
        if user:
            print('已注册过，直接登录')
            return self.__user_login()
        else:
            # 获取用户信息
            print('开始获取用户信息')
            self.__pay_userinfo(client, token)
            return self.__user_login()

    def __github_token(self):
        """
        github获取用户token
        :return:
        """
        response = None
        headers = {
            'accept': 'application/json'
        }
        url = 'https://github.com/login/oauth/access_token?client_id={0}&client_secret={1}&code={2}'.format(
            self._client_key, self._client_secret, self._code)
        i = 0
        while i < 3:
            try:
                print("开始尝试获取token", timezone.localtime())
                response = requests.post(url, headers=headers, timeout=5).json()
                if response:
                    return response
            except requests.exceptions.RequestException:
                i += 1
        if response is None:
            print("获取token请求失败了")
            return False

    @staticmethod
    def __github_userinfo(token):
        """
        github获取用户信息
        :return:
        """
        response = None
        headers = {
            'accept': 'application/json',
            'Authorization': 'token ' + token
        }
        url = 'https://api.github.com/user'
        i = 0
        while i < 3:
            try:
                print("开始尝试获取用户信息", timezone.localtime())
                response = requests.get(url, headers=headers, timeout=5).json()
                if response:
                    print(response)
                    logger.info('github用户信息：{}'.format(response))
                    return response
            except requests.exceptions.RequestException:
                i += 1
        if response is None:
            print("获取用户信息失败了")
            return False

    def github_login(self):
        """
        github登录
        :return:
        """
        print("github登录了")
        self.source_id = UserSource.objects.get(name='github').id
        # 获取用户access_token
        access_response = self.__github_token()
        if access_response:
            print(access_response['access_token'])
            # 获取用户信息
            userinfo_response = self.__github_userinfo(access_response['access_token'])
            if userinfo_response:
                print(userinfo_response)
                self.openid = userinfo_response['id']
                # 判断用户是否已注册过
                user = self.__check_user_register()
                if user:
                    print('已注册过，直接登录')
                    return self.__user_login()
                else:
                    if userinfo_response['name']:
                        username = userinfo_response['name']
                    else:
                        username = userinfo_response['login']
                    signature = userinfo_response['bio']
                    photo = userinfo_response['avatar_url']
                    if userinfo_response['blog']:
                        web = userinfo_response['blog']
                    else:
                        web = userinfo_response['html_url']
                    area_name = userinfo_response['location']
                    # 新建用户
                    self.__create_user(username, signature=signature, photo=photo, web=web, area_name=area_name)
                    # 用户登录
                    return self.__user_login()
        else:
            return False


class Yuque:
    """
    语雀笔记API
    """

    def __init__(self, token):
        self.headers = {
            "Content-Type": "application/json",
            "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1",
            "X-Auth-Token": token
        }
        self.login = None
        self.repo_list = []
        self.repo_catalogue = []
        self.repo_content = []

    # 发送请求
    def __request(self, api):
        url = "https://www.yuque.com/api/v2" + api
        r = httpx.get(url, headers=self.headers)
        return r.json()

    # 获取用户信息
    def __get_userinfo(self):
        api = "/user"
        response = self.__request(api)
        self.login = response['data']['login']

    # 获取知识库列表
    def get_repo_list(self):
        # 获取用户login代码
        self.__get_userinfo()
        api = "/users/%s/repos" % self.login
        response = self.__request(api)
        for i in response['data']:
            info = dict()
            if i['public'] == 1:
                # print(i)
                info['id'] = i['id']
                info['namespace'] = i['namespace']
                info['name'] = i['name']
                info['description'] = i['description']
                info['items_count'] = i['items_count']
                self.repo_list.append(info)

    # 获取知识库目录
    def get_repo_catalogue(self, namespace):
        # 获取用户login代码
        api = "/repos/%s/toc" % namespace
        response = self.__request(api)
        for i in response['data']:
            info = dict()
            # print(i)
            info['type'] = i['type']
            info['title'] = i['title']
            info['uuid'] = i['uuid']
            if i['type'] == 'DOC':
                info['doc_id'] = i['doc_id']
                info['slug'] = i['slug']
            else:
                info['doc_id'] = None
                info['slug'] = None
            self.repo_catalogue.append(info)

    # 获取知识库文章内容
    def get_repo_content(self, namespace, slug):
        api = "/repos/%s/docs/%s" % (namespace, slug)
        response = self.__request(api)
        info = dict()
        info['id'] = response['data']['id']
        info['slug'] = response['data']['slug']
        info['title'] = response['data']['title']
        regex = re.compile(r'<a name="\w+"><\/a>')
        info['body'] = regex.sub('', response['data']['body'])
        info['created_at'] = response['data']['created_at']
        info['content_updated_at'] = response['data']['content_updated_at']
        self.repo_content.append(info)
