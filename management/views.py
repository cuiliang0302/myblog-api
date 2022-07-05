from rest_framework import viewsets, status
from rest_framework.permissions import IsAdminUser
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_extensions.cache.mixins import CacheResponseMixin
from rest_framework_extensions.cache.decorators import cache_response
from blog.models import Article, Section, Category, Tag, Note
from management.models import Carousel, About, Link, Info, SiteConfig
from management.serializers import CarouselSerializer, AboutSerializer, LinkSerializer, InfoSerializer, \
    SiteConfigSerializer
from django.utils import timezone
from datetime import datetime
from django.conf import settings
from public.tools import Baidu, Aliyun, Tencent
from public.permissions import AdminAllOrGuestGetPost


class CarouselModelViewSet(CacheResponseMixin, viewsets.ModelViewSet):
    """
    轮播图增删改查
    """
    queryset = Carousel.objects.filter(is_show=True)
    serializer_class = CarouselSerializer


class AboutModelViewSet(CacheResponseMixin, viewsets.ModelViewSet):
    """
    关于页增删改查
    """
    queryset = About.objects.all()
    serializer_class = AboutSerializer


class LinkModelViewSet(CacheResponseMixin, viewsets.ModelViewSet):
    """
    友情链接增删改查
    """
    permission_classes = (AdminAllOrGuestGetPost,)
    queryset = Link.objects.filter(is_activate=True)
    serializer_class = LinkSerializer


class InfoModelViewSet(CacheResponseMixin, viewsets.ModelViewSet):
    """
    博主信息增删改查
    """
    queryset = Info.objects.all()
    serializer_class = InfoSerializer


class SiteConfigModelViewSet(CacheResponseMixin, viewsets.ModelViewSet):
    """
    网站配置信息增删改查
    """
    queryset = SiteConfig.objects.all()
    serializer_class = SiteConfigSerializer


class SiteStatisticsAPIView(APIView):
    """
    网站数据统计
    """

    @cache_response()
    def get(self, request):
        # 数据统计
        data_count = dict()
        # 运行时间
        now_data = str(timezone.now().strftime('%Y-%m-%d'))
        d1 = datetime.strptime(settings.BAIDU_START_DATE, '%Y%m%d')
        d2 = datetime.strptime(now_data, '%Y-%m-%d')
        data_count['uptime'] = (d2 - d1).days
        # 流量统计
        api = Baidu()
        count = api.count_all()
        data_count['pv'] = count['pv']
        data_count['uv'] = count['uv']
        data_count['ip'] = count['ip']
        # 文章总数
        data_count['article'] = Article.objects.filter(is_release=True).count()
        # 笔记总数
        data_count['section'] = Section.objects.filter(is_release=True).count()
        # 文章分类数
        data_count['category'] = Category.objects.count()
        # 笔记分类数
        data_count['note'] = Note.objects.count()
        # 标签数
        data_count['tag'] = Tag.objects.count()
        return Response(data_count, status=status.HTTP_200_OK)


class SiteCountAPIView(APIView):
    """
    网站数据统计
    """
    permission_classes = (IsAdminUser,)

    @cache_response()
    def get(self, request):
        api = Baidu()
        count = api.count_today()
        today = count[0]
        compare = count[2]
        result = {
            'today_pv': today[1],
            'today_uv': today[2],
            'today_time': today[3],
            'today_page': today[4],
            'today_new_user': today[5],
            'compare_pv': compare[1],
            'compare_uv': compare[2],
            'compare_time': compare[3],
            'compare_page': compare[4],
            'compare_new_user': compare[5],
        }
        return Response(result, status=status.HTTP_200_OK)


class ServerMonitoringAPIView(APIView):
    """
    服务器监控信息
    """

    # permission_classes = (IsAdminUser,)

    @staticmethod
    def get(request):
        manufacturer = settings.ECS_MANUFACTURER
        if manufacturer == 'aliyun':
            aliyun = Aliyun(settings.CLOUD['ECS']['ALIYUN']['KEY'], settings.CLOUD['ECS']['ALIYUN']['SECRET'])
            metric = aliyun.ecs_monitoring()
            return Response(metric, status=status.HTTP_200_OK)
        else:
            tencent = Tencent(settings.CLOUD['ECS']['TENCENT']['KEY'], settings.CLOUD['ECS']['TENCENT']['SECRET'])
            metric = tencent.ecs_monitoring()
            return Response(metric, status=status.HTTP_200_OK)


class ServerInfoAPIView(APIView):
    """
    服务器规格信息
    """

    permission_classes = (IsAdminUser,)

    @staticmethod
    def get(request):
        manufacturer = settings.ECS_MANUFACTURER
        if manufacturer == 'aliyun':
            aliyun = Aliyun(settings.CLOUD['ECS']['ALIYUN']['KEY'], settings.CLOUD['ECS']['ALIYUN']['SECRET'])
            info = aliyun.ecs_info()
            return Response(info, status=status.HTTP_200_OK)
        else:
            tencent = Tencent(settings.CLOUD['ECS']['TENCENT']['KEY'], settings.CLOUD['ECS']['TENCENT']['SECRET'])
            info = tencent.ecs_info()
            return Response(info, status=status.HTTP_200_OK)


class SiteEchartsAPIView(APIView):
    """
    echarts获取网站数据接口
    """
    permission_classes = (IsAdminUser,)

    @staticmethod
    def get(request):
        chart = request.query_params.get('chart')
        api = Baidu()
        result = []
        if chart == "trend":
            trend = api.count_trend()
            for i in trend["items"][0]:
                item = dict()
                item['date'] = i[0].replace('/', '-')
                result.append(item)
            for j in range(len(trend["items"][1])):
                result[j]['pv'] = trend["items"][1][j][0]
                result[j]['uv'] = trend["items"][1][j][1]
                result[j]['new_user'] = trend["items"][1][j][2]
                result[j]['ip'] = trend["items"][1][j][3]
                result[j]['time'] = trend["items"][1][j][4]
                result[j]['page'] = trend["items"][1][j][5]
            return Response(result, status=status.HTTP_200_OK)
        if chart == 'equipment':
            device = api.count_device()
            result = [{'name': 'PC端', 'value': device['pc']}, {'name': '移动端', 'value': device['mobile']}]
            return Response(result, status=status.HTTP_200_OK)
        if chart == 'page':
            result = []
            page = api.count_page()
            for i in range(len(page["items"][0])):
                if '屏蔽' in page["items"][0][i][0]['name'] or 'local' in page["items"][0][i][0]['name'] \
                        or '#' not in page["items"][0][i][0]['name']:
                    continue
                item = dict()
                item['url'] = page["items"][0][i][0]['name']
                item['pv'] = page["items"][1][i][0]
                item['uv'] = page["items"][1][i][1]
                item['in_count'] = page["items"][1][i][2]
                item['time'] = page["items"][1][i][3]
                result.append(item)
            return Response(result, status=status.HTTP_200_OK)
        if chart == 'area':
            area = api.count_map()
            result = []
            for i in range(len(area['items'][0])):
                pv_count = dict()
                pv_count['name'] = area['items'][0][i][0]['name']
                pv_count['value'] = area['items'][1][i][0]
                result.append(pv_count)
            return Response(result, status=status.HTTP_200_OK)
