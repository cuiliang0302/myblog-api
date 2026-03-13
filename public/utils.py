import hashlib
import json

from loguru import logger
from rest_framework.pagination import PageNumberPagination
from rest_framework_extensions.key_constructor.bits import (
    QueryParamsKeyBit,
    KwargsKeyBit,
    KeyBitBase,
)
from rest_framework_extensions.key_constructor.constructors import DefaultKeyConstructor
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.exceptions import AuthenticationFailed


def cache_key(scope, *parts):
    """
    生成带作用域前缀的 Redis/缓存键名，便于按函数/视图管理。
    scope: 建议用视图类名或函数名，如 'BackgroundImageAPIView'、'AuthCode'
    parts: 业务键部分，如 'img_url'、'verify'、contact 等
    示例: cache_key('BackgroundImageAPIView', 'img_url') -> 'BackgroundImageAPIView:img_url'
          cache_key('AuthCode', 'verify', contact) -> 'AuthCode:verify:user@example.com'
    """
    segs = [str(scope)] + [str(p) for p in parts if p is not None and p != ""]
    return ":".join(segs)


class ViewNameKeyBit(KeyBitBase):
    """将视图/方法名加入缓存 key，便于在 Redis 中按接口区分和管理。"""

    def get_data(self, params, view_instance, view_method, request, args, kwargs):
        # drf-extensions 要求签名: (self, params, view_instance, view_method, request, args, kwargs)
        if view_instance is not None:
            name = view_instance.__class__.__name__
            if view_method is not None:
                name = f"{name}.{view_method.__name__}"
            return name
        if view_method is not None:
            return view_method.__name__
        return "view"


class MyPageNumber(PageNumberPagination):
    """
    自定义分页器
    """
    page_size = 10  # 每页默认显示多少条
    page_size_query_param = 'size'  # URL中每页显示条数的参数
    page_query_param = 'page'  # URL中页码的参数
    max_page_size = None  # 最大页码数限制


class CustomKeyConstructor(DefaultKeyConstructor):
    """
    自定义缓存策略：按视图名、params、path 缓存。
    重写 prepare_key，使 Redis 中的 key 带可读的视图/函数名前缀，便于管理。
    """
    view_name = ViewNameKeyBit()  # 键名包含视图类名.方法名，便于管理
    query_params = QueryParamsKeyBit()  # 按 Params 参数缓存
    kwargs = KwargsKeyBit()  # 按 Path 参数缓存

    def prepare_key(self, key_dict):
        """生成带可读前缀的缓存键，例如 ArticleListView.list:abc12def34，便于在 Redis 中按接口管理。"""
        readable = key_dict.get("view_name") or key_dict.get("unique_method_id", "cache")
        if isinstance(readable, str) and "views." in readable:
            readable = readable.split("views.")[-1]
        raw = json.dumps(key_dict, sort_keys=True, default=str)
        suffix = hashlib.md5(raw.encode("utf-8")).hexdigest()[:12]
        return f"{readable}:{suffix}"


def _build_cache_key_from_key_func_args(*args, **kwargs):
    """
    从 drf-extensions 的 key_func 参数还原出 (view_instance, view_method, request, args, kwargs)。
    可能被以「仅关键字」或「绑定方法 + 关键字」方式调用，故只从 kwargs 取参，避免 multiple values。
    """
    if kwargs:
        return CustomKeyConstructor()(
            view_instance=kwargs["view_instance"],
            view_method=kwargs["view_method"],
            request=kwargs["request"],
            args=kwargs["args"],
            kwargs=kwargs["kwargs"],
        )
    (view_instance, view_method, request, req_args, req_kwargs) = args
    return CustomKeyConstructor()(
        view_instance=view_instance,
        view_method=view_method,
        request=request,
        args=req_args,
        kwargs=req_kwargs,
    )


def default_object_cache_key_func(*args, **kwargs):
    """供 drf-extensions 用作 DEFAULT_OBJECT_CACHE_KEY_FUNC，使 retrieve 接口缓存生效且 key 可读。"""
    return _build_cache_key_from_key_func_args(*args, **kwargs)


def default_list_cache_key_func(*args, **kwargs):
    """供 drf-extensions 用作 DEFAULT_LIST_CACHE_KEY_FUNC，使 list 接口缓存生效且 key 可读。"""
    return _build_cache_key_from_key_func_args(*args, **kwargs)


def get_user_id_from_token(request):
    """
    根据token获取用户id
    """
    try:
        user_authenticator = JWTAuthentication()
        user, _ = user_authenticator.authenticate(request)
        if user and user.is_authenticated:
            logger.info(f"查询用户id:{user.id}")
            return user.id
    except Exception as e:
        logger.error(f"查询用户未登录，信息{e}")
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
