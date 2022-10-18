"""DRF URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path, include
from django.views.static import serve
from public.views import doc, defined, ArticleLink, RobotsAPIView
from django.conf import settings
from django.contrib.sitemaps.views import sitemap
from public.sitemaps import ArticleSitemap, SectionSitemap
from public.feeds import RssFeed

sitemaps = {
    'blog': ArticleSitemap,
    'section': SectionSitemap
}
urlpatterns = [
    path('admin/', admin.site.urls),
    # admin管理页
    path('sitemap.xml', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap'),
    # 网站地图
    path('feed.xml', RssFeed(), name='rss'),
    # RSS订阅
    path('detail/article/<int:article_id>', ArticleLink.as_view(), name="article_link"),
    # 获取文章RSS链接
    path('robots/<str:kind>/<int:content_id>', RobotsAPIView.as_view(), name="robots"),
    # 搜索引擎爬取内容接口
    re_path('static/(?P<path>.*)', serve, {'document_root': settings.STATIC_ROOT}, name='static_url'),
    # 媒体资源
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    # API接口调试认证
    path('', doc, name='doc'),
    # API文档
    path('defined/', defined, name='defined'),
    # 自定义admin页面
    path('v1/public/', include('public.urls', namespace='public')),
    # 公共API
    path('v1/account/', include('account.urls', namespace='account')),
    # 用户管理API
    path('v1/blog/', include('blog.urls', namespace='blog')),
    # 内容管理API
    path('v1/management/', include('management.urls', namespace='management')),
    # 网站管理API
    path('v1/record/', include('record.urls', namespace='record')),
    # 行为记录API
]
