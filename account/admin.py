from django.contrib import admin
from .models import UserInfo, UserSource, OAuthId
from django.contrib.auth.admin import UserAdmin


# 用户详细信息
@admin.register(UserInfo)
class UserInfoAdmin(UserAdmin):
    list_display = ('id', 'username', 'phone', 'email', 'sex', 'last_login', 'date_joined', 'source')
    # 文章列表里显示想要显示的字段
    list_display_links = ('username', 'phone', 'email')
    # 设置哪些字段可以点击进入编辑界面
    search_fields = ('username',)


# 用户来源
@admin.register(UserSource)
class UserSourceAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')
    # 文章列表里显示想要显示的字段
    list_display_links = ('id', 'name')
    # 设置哪些字段可以点击进入编辑界面


# 第三方登录用户ID
@admin.register(OAuthId)
class OAuthIdAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'source', 'openid')
    # 文章列表里显示想要显示的字段
    list_display_links = ('id', 'user', 'source')
    # 设置哪些字段可以点击进入编辑界面
