from rest_framework import routers
from management import views
from django.urls import path

app_name = "management"
urlpatterns = [
    path('siteStatistics/', views.SiteStatisticsAPIView.as_view()),
    # 网站访问数据总统计
    path('serverMonitoring/', views.ServerMonitoringAPIView.as_view()),
    # 服务器监控信息
    path('serverInfo/', views.ServerInfoAPIView.as_view()),
    # 服务器配置信息
    path('siteEcharts/', views.SiteEchartsAPIView.as_view()),
    # 网站数据echarts接口
]
router = routers.DefaultRouter()
router.register('carousel', views.CarouselModelViewSet, 'carousel')
# 轮播图增删改查
router.register('about', views.AboutModelViewSet, 'about')
# 轮播图增删改查
router.register('link', views.LinkModelViewSet, 'link')
# 友情链接增删改查
router.register('info', views.InfoModelViewSet, 'info')
# 博主信息增删改查
router.register('siteConfig', views.SiteConfigModelViewSet, 'siteConfig')
# 网站配置增删改查
urlpatterns += router.urls
