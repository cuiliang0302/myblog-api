from loguru import logger
import re
from rest_framework import status, viewsets, serializers
from rest_framework.exceptions import AuthenticationFailed
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from account.models import UserInfo
from account.serializers import LoginSerializer, UserInfoSerializer
from public.tools import AuthCode, OAuth
from django.conf import settings
from public.permissions import AdminAllOrGuestGetPost


class LoginAPIView(APIView):
    """
    用户登录
    """
    permission_classes = (AdminAllOrGuestGetPost,)

    @staticmethod
    def post(request):
        # 实例化得到一个序列化类的对象
        serializer = LoginSerializer(data=request.data)
        # 校验是否通过
        if not serializer.is_valid():
            # 如果验证失败，抛出自定义异常
            raise serializers.ValidationError({"message": "账号或密码错误"})
        # 如果通过,表示登录成功,返回手动签发的token
        token = serializer.context.get('token')
        user_id = serializer.context.get('userid')
        username = serializer.context.get('username')
        result = dict()
        result['token'] = token
        result['user_id'] = user_id
        result['username'] = username
        return Response(result, status=status.HTTP_200_OK)


class RegisterAPIView(APIView):
    """
    用户注册
    """
    permission_classes = (AdminAllOrGuestGetPost,)

    @staticmethod
    def get(request):
        """
        查询用户是否已注册
        """
        username = request.query_params.get('username')
        contact = request.query_params.get('contact')
        if username:
            if UserInfo.objects.filter(username=username).exists():
                return Response({'code': 1, 'msg': '用户名已存在'}, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({'msg': '用户名可使用'}, status=status.HTTP_200_OK)
        if contact:
            phone_rex = '^1[0-9]\d{9}$'
            email_rex = '^[0-9a-zA-Z_]{0,19}@[0-9a-zA-Z]{1,13}\.[com,cn,net]{1,3}$'
            if re.match(phone_rex, contact):
                # 手机号正则
                if UserInfo.objects.filter(phone=contact).first():
                    return Response({'code': 2, 'msg': '手机号已注册'}, status=status.HTTP_400_BAD_REQUEST)
            elif re.match(email_rex, contact):
                # 邮箱登录正则
                if UserInfo.objects.filter(email=contact).first():
                    return Response({'code': 3, 'msg': '邮箱号已注册'}, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({'code': 0, 'msg': '手机/邮箱格式错误'}, status=status.HTTP_400_BAD_REQUEST)
        return Response({'msg': '手机/邮箱可使用'}, status=status.HTTP_200_OK)

    @staticmethod
    def post(request):
        """
        用户注册
        """
        username = request.data.get('username')
        contact = request.data.get('contact')
        code = request.data.get('code')
        password = request.data.get('password')
        print(username, contact, code, password)
        auth = AuthCode(contact)
        if not auth.check_code(code):
            return Response({'msg': '验证码错误'}, status=status.HTTP_400_BAD_REQUEST)
        if re.match('^1[0-9]\d{9}$', contact):
            print("输入的是手机号")
            try:
                user = UserInfo.objects.create_user(username=username, password=password, phone=contact)
                print(user)
                return Response({'msg': '注册成功！'}, status=status.HTTP_200_OK)
            except Exception as e:
                print(e)
                return Response({'msg': '注册失败！'}, status=status.HTTP_400_BAD_REQUEST)
        elif re.match('^.+@.+$', contact):
            # 邮箱登录正则
            print("输入的是邮箱")
            try:
                UserInfo.objects.create_user(username=username, password=password, email=contact)
                return Response({'msg': '注册成功！'}, status=status.HTTP_200_OK)
            except Exception as e:
                print(e)
                return Response({'msg': '注册失败！'}, status=status.HTTP_400_BAD_REQUEST)


class CodeAPIView(APIView):
    """
    发送验证码
    """
    permission_classes = (AdminAllOrGuestGetPost,)

    @staticmethod
    def post(request):
        contact = request.data.get('contact')
        action = request.data.get('action')
        username = request.data.get('username')
        send = AuthCode(contact)
        send.make_code()
        print("联系方式:{} 验证码:{}".format(contact, send.code))
        logger.info("联系方式:{} 验证码:{}".format(contact, send.code))
        if re.match('^1[0-9]\d{9}$', contact):
            print("输入的是手机号")
            return Response({'msg': '手机号验证正在开发中！'}, status=status.HTTP_400_BAD_REQUEST)
        elif re.match('^.+@.+$', contact):
            # 邮箱登录正则
            print("发送邮件验证码")
            if not send.send_email(contact, username, action):
                return Response({'msg': '邮件发送失败，请重试'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({'msg': '手机/邮箱错误'}, status=status.HTTP_400_BAD_REQUEST)
        return Response({'msg': '验证码已发送'}, status=status.HTTP_200_OK)


class UserInfoModelViewSet(viewsets.ModelViewSet):
    """
    用户信息增删改查
    """
    permission_classes = (IsAuthenticated,)
    queryset = UserInfo.objects.all()
    serializer_class = UserInfoSerializer


class SetPasswordAPIView(APIView):
    """
    重置密码
    """
    permission_classes = (AdminAllOrGuestGetPost,)

    @staticmethod
    def post(request):
        contact = request.data.get('contact')
        code = request.data.get('code')
        password = request.data.get('password')
        auth = AuthCode(contact)
        if auth.check_code(code):
            if re.match('^1[0-9]\d{9}$', contact):
                print("输入的是手机号")
                user = UserInfo.objects.get(phone=contact)
            elif re.match('^.+@.+$', contact):
                print("输入的是邮箱号")
                user = UserInfo.objects.get(email=contact)
            else:
                return Response({'msg': '联系方式填写有误！'}, status=status.HTTP_400_BAD_REQUEST)
            user.set_password(password)
            user.save()
            return Response({'msg': '重置成功！'}, status=status.HTTP_200_OK)
        else:
            return Response({'msg': '验证码错误！'}, status=status.HTTP_400_BAD_REQUEST)


class ChangePasswordAPIView(APIView):
    """
    修改密码
    """
    permission_classes = (IsAuthenticated,)

    @staticmethod
    def put(request, user_id):
        oldPassword = request.data.get('oldPassword')
        newPassword = request.data.get('newPassword')
        user = UserInfo.objects.get(id=user_id)
        if user.check_password(oldPassword):
            user.set_password(newPassword)
            user.save()
            return Response({'msg': '修改成功！'}, status=status.HTTP_200_OK)
        else:
            return Response({'msg': '原始密码错误！'}, status=status.HTTP_400_BAD_REQUEST)


class ChangeEmailAPIView(APIView):
    """
    修改邮箱
    """
    permission_classes = (IsAuthenticated,)

    @staticmethod
    def put(request, user_id):
        newEmail = request.data.get('newEmail')
        code = request.data.get('code')
        print(newEmail, code)
        user = UserInfo.objects.get(id=user_id)
        auth = AuthCode(newEmail)
        if auth.check_code(code):
            user.email = newEmail
            user.save()
            return Response({'msg': '修改成功！'}, status=status.HTTP_200_OK)
        else:
            return Response({'msg': '验证码错误！'}, status=status.HTTP_400_BAD_REQUEST)


class ChangePhoneAPIView(APIView):
    """
    修改手机
    """
    permission_classes = (IsAuthenticated,)

    @staticmethod
    def put(request, user_id):
        newPhone = request.data.get('newPhone')
        code = request.data.get('code')
        print(newPhone, code)
        user = UserInfo.objects.get(id=user_id)
        auth = AuthCode(newPhone)
        if auth.check_code(code):
            user.phone = newPhone
            user.save()
            return Response({'msg': '修改成功！'}, status=status.HTTP_200_OK)
        else:
            return Response({'msg': '验证码错误！'}, status=status.HTTP_400_BAD_REQUEST)


class OAuthIDAPIView(APIView):
    """
    获取第三方登录应用ID
    """

    @staticmethod
    def get(request):
        platform = request.query_params.get('platform')
        kind = request.query_params.get('kind')
        try:
            result = {'clientId': settings.AUTH[platform.upper()][kind.upper()]['KEY']}
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response({'msg': '请求参数有误！'}, status=status.HTTP_200_OK)


class OAuthCallbackAPIView(APIView):
    """
    授权第三方登录后回调地址
    """
    permission_classes = (AdminAllOrGuestGetPost,)

    @staticmethod
    def post(request):
        platform = request.data.get('platform')
        kind = request.data.get('kind')
        code = request.data.get('code')
        redirect_uri = request.data.get('redirect_uri')
        logger.info(platform, code, redirect_uri, kind)
        auth = OAuth(platform, kind, code, redirect_uri)
        result = {}
        if platform == 'WEIBO':
            result = auth.weibo_login()
        elif platform == 'QQ':
            result = auth.qq_login()
        elif platform == 'PAY':
            result = auth.pay_login()
        elif platform == 'GITHUB':
            result = auth.github_login()
        elif platform == 'BAIDU':
            result = auth.baidu_login()
        elif platform == 'MICROSOFT':
            result = auth.microsoft_login()
        return Response(result, status=status.HTTP_200_OK)
