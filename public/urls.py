from django.urls import path
from rest_framework import routers
from public import views

app_name = "public"
urlpatterns = [
    path('qiniuToken/', views.QiniuTokenAPIView.as_view()),
    # 获取七牛上传文档token
    path('imgProxy/', views.ImgProxyAPIView.as_view()),
    # 图片防盗链代理
    path('backgroundImage/', views.BackgroundImageAPIView.as_view()),
    # 获取图片地址
    path('cdnRefresh/', views.CdnRefreshAPIView.as_view()),
    # CDN接口刷新接口
    path('areaData/', views.AreaDataAPIView.as_view()),
    # 获取省市区编号
]
router = routers.DefaultRouter()
# 示例用户信息接口
router.register('demoProvince', views.DemoProvinceModelViewSet, 'demoProvince')
# 示例用户信息接口
router.register('demoUser', views.DemoUserModelViewSet, 'demoUser')
urlpatterns += router.urls
