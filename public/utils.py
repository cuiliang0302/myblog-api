from loguru import logger
from rest_framework.pagination import PageNumberPagination
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.exceptions import AuthenticationFailed

class MyPageNumber(PageNumberPagination):
    """
    自定义分页器
    """
    page_size = 10  # 每页默认显示多少条
    page_size_query_param = 'size'  # URL中每页显示条数的参数
    page_query_param = 'page'  # URL中页码的参数
    max_page_size = None  # 最大页码数限制


def get_user_id_from_token(request):
    """
    根据token获取用户id
    """
    try:
        user_authenticator = JWTAuthentication()
        user, _ = user_authenticator.authenticate(request)
        if user and user.is_authenticated:
            return user.id
    except Exception as e:
        logger.error(e)
        return None
    return None


def log(func):
    """
    日志装饰器
    :param func:
    :return:
    """

    def wrapper(*args, **kwargs):
        res = func(*args, **kwargs)
        return res

    return wrapper()
