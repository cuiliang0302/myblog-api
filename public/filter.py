from django_filters import FilterSet, CharFilter, DateFromToRangeFilter, RangeFilter

from public.models import DemoUser


class DemoUserFilter(FilterSet):
    """
    用户名模糊查询
    """
    name = CharFilter(field_name='username', lookup_expr='icontains')  # icontains，包含且忽略大小写
    birthday = DateFromToRangeFilter(field_name='birthday')
    height = RangeFilter(field_name='height')

    class Meta:
        # 指定模型
        models = DemoUser
        fields = ['username', 'birthday', 'height']
