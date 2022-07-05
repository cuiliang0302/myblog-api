from rest_framework.pagination import PageNumberPagination


class MyPageNumber(PageNumberPagination):
    """
    自定义分页器
    """
    page_size = 10  # 每页默认显示多少条
    page_size_query_param = 'size'  # URL中每页显示条数的参数
    page_query_param = 'page'  # URL中页码的参数
    max_page_size = None  # 最大页码数限制


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
