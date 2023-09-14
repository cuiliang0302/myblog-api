from django.urls import path
from rest_framework import routers
from blog import views

app_name = "blog"
urlpatterns = [
    path('guessLike/<int:article_id>/', views.GuessLikeAPIView.as_view()),
    # 猜你喜欢
    path('catalogueList/<int:note_id>/', views.CatalogueAPIView.as_view()),
    # 指定笔记的目录
    path('context/<int:content_id>/', views.ContextAPIView.as_view()),
    # 文章笔记前一篇后一篇
    path('classify/', views.ClassifyAPIView.as_view()),
    # 文章归档
    path('QRcode/', views.QRcodeAPIView.as_view()),
    # 文章二维码
    path('syncNoteList/', views.SyncNoteListAPIView.as_view()),
    # 同步笔记列表
    path('syncNoteContent/', views.SyncNoteContentAPIView.as_view()),
    # 同步笔记内容
    path('like/', views.LikeAPIView.as_view()),
    # 文章或笔记点赞
]
router = routers.DefaultRouter()
router.register('article', views.ArticleModelViewSet, 'article')
# 文章列表增删改查
router.register('category', views.CategoryModelViewSet, 'category')
# 文章分类增删改查
router.register('tag', views.TagModelViewSet, 'tag')
# 文章标签增删改查
router.register('note', views.NoteModelViewSet, 'note')
# 笔记名称增删改查
router.register('section', views.SectionModelViewSet, 'section')
# 笔记内容增删改查
router.register('catalogue', views.CatalogueModelViewSet, 'catalogue')
# 笔记目录增删改查
urlpatterns += router.urls
