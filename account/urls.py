from django.urls import path
from rest_framework import routers
from account import views

app_name = "account"
urlpatterns = [
    path('login/', views.LoginAPIView.as_view()),
    # 用户登录
    path('register/', views.RegisterAPIView.as_view()),
    # 用户注册
    path('code/', views.CodeAPIView.as_view()),
    # 获取验证码
    path('setPassword/', views.SetPasswordAPIView.as_view()),
    # 重置密码
    path('changePassword/', views.ChangePasswordAPIView.as_view()),
    # 修改密码
    path('changeEmail/', views.ChangeEmailAPIView.as_view()),
    # 修改邮箱
    path('changePhone/<int:user_id>/', views.ChangePhoneAPIView.as_view()),
    # 修改手机
    path('OAuthID/', views.OAuthIDAPIView.as_view()),
    # 获取第三方客户端ID
    path('OAuthCallback/', views.OAuthCallbackAPIView.as_view()),
    # 第三方登录后回调
]
router = routers.DefaultRouter()
router.register('userinfo', views.UserInfoModelViewSet, 'userinfo')
# 用户信息增删改查
urlpatterns += router.urls
