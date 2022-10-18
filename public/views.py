import re
from datetime import datetime, timedelta
import markdown
import httpx
from django.contrib.sites.models import Site
from django.core.cache import cache
from django.http import HttpResponse
from django.shortcuts import render
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from qiniu import Auth
from django.conf import settings
from blog.models import Article, Section
from management.models import SiteConfig
from public.permissions import AdminAllOrGuestGetPost
from public.tools import Tencent
from loguru import logger
from public.areaData import areaList


def defined(request):
    """
    admin自定义页面
    """
    return render(request, 'index.html')


def doc(request):
    """
    API 接口文档
    """
    return render(request, 'myblog.html')


class QiniuTokenAPIView(APIView):
    """
    获取七牛上传文件token
    """

    @staticmethod
    def get(request):
        q = Auth(settings.QINIU_AK, settings.QINIU_SK)
        token = q.upload_token(settings.QINIU_BUCKET)
        return Response({'token': token, 'domain': settings.QINIU_DOMAIN}, status=status.HTTP_200_OK)


class ImgProxyAPIView(APIView):
    """
    图片防盗链代理
    """

    @staticmethod
    def get(request):
        url = request.query_params.get('url')
        r = httpx.get(url, verify=False)
        return HttpResponse(r.content, content_type='image/jpeg')


class BackgroundImageAPIView(APIView):
    """
    获取背景图片url地址
    """

    @staticmethod
    def get(request):
        if cache.get("img_url"):
            # print("Redis有数据，直接用")
            img_url = cache.get("img_url")
        else:
            # print("Redis过期了，重新取")
            base_url = 'https://cn.bing.com'
            response = httpx.get(base_url + '/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-CN')
            if response.status_code == 200:
                response.close()
                url = response.json()['images'][0]['url']
                img_url = base_url + url
            else:
                img_url = settings.BGI_URL
            logger.info("图片下载地址:{}".format(img_url))
            # 计算离第二天0点过期时间
            now = datetime.now()
            today_begin = datetime(now.year, now.month, now.day, 0, 0, 0)
            tomorrow_begin = today_begin + timedelta(days=1)
            next_seconds = (tomorrow_begin - now).seconds + 1
            cache.set("img_url", img_url, timeout=next_seconds)
            img_url = cache.get("img_url")
        return Response({'url': img_url}, status=status.HTTP_200_OK)


class CdnRefreshAPIView(APIView):
    """
    CDN数据刷新接口
    """
    permission_classes = (AdminAllOrGuestGetPost,)

    @staticmethod
    def post(request):
        url = request.data.get('url')
        tencent_api = Tencent(settings.CLOUD['CDN']['TENCENT']['KEY'], settings.CLOUD['CDN']['TENCENT']['SECRET'])
        result = tencent_api.cdn_refresh(url)
        if result:
            logger.info("操作url:{} 刷新成功！".format(url))
            return Response({'msg': 'cdn刷新成功！'}, status=status.HTTP_200_OK)
        else:
            logger.info("操作url:{} 刷新失败！".format(url))
            return Response({'msg': 'cdn刷新失败！'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class AreaDataAPIView(APIView):
    """
    获取省市县编码
    """

    @staticmethod
    def get(request):
        return Response({'areaList': areaList}, status=status.HTTP_200_OK)


class ArticleLink(APIView):
    """
    获取文章RSS链接
    """

    @staticmethod
    def get(request, article_id):
        return "https://" + Site.objects.get(id=1) + "/" + article_id


class RobotsAPIView(APIView):
    """
    搜索引擎爬取内容接口
    """

    @staticmethod
    def get(request, kind, content_id):
        site = SiteConfig.objects.get(id=1)
        if kind == 'article':
            content = Article.objects.get(id=content_id)
            # 提取keyword
            keyword = content.category.name
            for i in content.tags.all():
                keyword = keyword + ',' + i.name
        else:
            content = Section.objects.get(id=content_id)
            keyword = content.note.name
        html_body = markdown.markdown(content.body)
        # 去除a标签
        body_a = re.sub(r"""<a\b[^>]+\bhref="([^"]*)"[^>]*>([\s\S]*?)</a>""", " ", html_body)
        # 去除img标签
        body = re.sub(r"""<img.*?src=[\"|\']?(.*?)[\"|\']?\s.*?>""", " ", body_a)
        return render(request, 'robots.html', locals())
