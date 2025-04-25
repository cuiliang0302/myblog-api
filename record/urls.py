from django.urls import path
from rest_framework import routers
from record import views

app_name = "record"
urlpatterns = [
    path('searchHot/', views.SearchHotAPIView.as_view()),
    # 获取搜索词排序
    path('searchHistory/', views.searchHistoryAPIView.as_view()),
    # 获取搜索记录
    path('search/', views.SearchAPIView.as_view()),
    # 搜索文章
    path('articleHistory/', views.ArticleHistoryAPIView.as_view()),
    # 文章浏览记录
    path('sectionHistory/', views.SectionHistoryAPIView.as_view()),
    # 笔记浏览记录
    path('statistics/', views.StatisticsAPIView.as_view()),
    # 数据统计
    path('userEcharts/', views.UserEchartsAPIView.as_view()),
    # 用户echarts数据接口
]
router = routers.DefaultRouter()
router.register('leaveMessage', views.LeaveMessageModelViewSet, 'leaveMessage')
# 留言回复增删改查
router.register('articleComment', views.ArticleCommentModelViewSet, 'articleComment')
# 文章评论回复增删改查
router.register('sectionComment', views.SectionCommentModelViewSet, 'sectionComment')
# 笔记评论回复增删改查
urlpatterns += router.urls
