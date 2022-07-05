from django.contrib import admin
from management.models import Carousel, Link, About, SiteConfig, Info


# 轮播图
@admin.register(Carousel)
class CarouselAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'img', 'url', 'is_show')


# 友情链接
@admin.register(Link)
class LinkAdmin(admin.ModelAdmin):
    list_display = ('name', 'url', 'describe', 'type', 'is_activate')


# 关于
@admin.register(About)
class AboutAdmin(admin.ModelAdmin):
    list_display = ('title', 'time')


# 网站配置
@admin.register(SiteConfig)
class SiteConfigAdmin(admin.ModelAdmin):
    list_display = ('name', 'domain', 'title')


# 博主信息
@admin.register(Info)
class InfoAdmin(admin.ModelAdmin):
    list_display = ('position', 'company', 'location', 'email', 'qq', 'wechat')
