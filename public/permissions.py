from rest_framework.permissions import BasePermission


class AdminAllOrGuestGet(BasePermission):
    """
    自定义权限管理(管理员全部权限，其他用户只能get读取)
    """

    def has_permission(self, request, view):
        # 匿名用户只允许get
        if request.method == 'GET':
            return True
        # 管理员允许所有
        elif request.user.username == 'admin':
            return True
        else:
            return False


class AdminAllOrGuestGetPost(BasePermission):
    """
    自定义权限管理(管理员全部权限，其他用户只能get读取和post提交)
    """

    def has_permission(self, request, view):
        # 匿名用户只允许get和post
        if request.method == 'GET' or request.method == 'POST':
            return True
        # 管理员允许所有
        elif request.user.username == 'admin':
            return True
        else:
            return False


class AdminAllOrGuestGetPut(BasePermission):
    """
    自定义权限管理(管理员全部权限，其他用户只能get读取和put修改)
    """

    def has_permission(self, request, view):
        # 匿名用户只允许get和post
        if request.method == 'GET' or request.method == 'PUT':
            return True
        # 管理员允许所有
        elif request.user.username == 'admin':
            return True
        else:
            return False


class AdminAllOrGuestGetPutPost(BasePermission):
    """
    自定义权限管理(管理员全部权限，其他用户只能get读取、patch部分修改、post添加)
    """

    def has_permission(self, request, view):
        # 匿名用户只允许get和post
        if request.method == 'GET' or request.method == 'PUT' or request.method == 'POST':
            return True
        # 管理员允许所有
        elif request.user.username == 'admin':
            return True
        else:
            return False


class AuthenticatedAllOrGuestGetPat(BasePermission):
    """
    自定义权限管理(通过认证用户全部权限，其他用户只能get读取和patch部分修改)
    """

    def has_permission(self, request, view):
        # 匿名用户只允许get和post
        if request.method == 'GET' or request.method == 'PATCH':
            return True
        # 认证用户允许所有
        elif request.user and request.user.is_authenticated:
            return True
        else:
            return False
