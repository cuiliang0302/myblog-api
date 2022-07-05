import re
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework import serializers
from account.models import UserInfo
from django.utils import timezone


class LoginSerializer(serializers.ModelSerializer):
    """
    用户登录序列化器
    """
    username = serializers.CharField()  # 重写 username , 否则会它会认为你想存数据

    class Meta:
        model = UserInfo
        fields = ['username', 'password']

    def validate(self, attrs):
        # username phone email  都可能是登录账户
        username = attrs.get('username')
        password = attrs.get('password')
        if re.match('^1[0-9]\d{9}$', username):
            # 手机号正则
            user = UserInfo.objects.filter(phone=username).first()
        elif re.match('^.+@.+$', username):
            # 邮箱登录正则
            user = UserInfo.objects.filter(email=username).first()
        else:
            # 用户名登录
            user = UserInfo.objects.filter(username=username).first()
        if user and user.check_password(password):
            # 如果登录成功,手动创建新令牌
            user.last_login = timezone.now()
            user.save()
            refresh = RefreshToken.for_user(user)
            token = str(refresh.access_token)
            # 视图类和序列化类之间通过context这个字典来传递数据
            self.context['token'] = token
            self.context['userid'] = user.id
            self.context['username'] = user.username
            return attrs
        else:
            raise serializers.ValidationError('账号或密码错误')


class UserInfoSerializer(serializers.ModelSerializer):
    """
    用户信息序列化器
    """
    # 性别显示文字
    sex_name = serializers.ReadOnlyField(source='get_sex_display')
    # 用户来源
    source = serializers.SerializerMethodField()

    class Meta:
        model = UserInfo
        fields = ['id', 'username', 'email', 'phone', 'sex', 'sex_name', 'web', 'signature', 'photo', 'is_flow',
                  'area_name', 'area_code', 'birthday', 'source']

    def get_source(self, obj):
        return obj.source.name
