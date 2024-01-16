from django_filters import FilterSet, CharFilter, DateFromToRangeFilter, RangeFilter, DateTimeFromToRangeFilter

from public.models import DemoUser


class DemoUserFilter(FilterSet):
    """
    用户名模糊查询
    """
    username = CharFilter(field_name='username', lookup_expr='icontains')  # icontains，包含且忽略大小写
    province_id = CharFilter(field_name='province_id')
    sex = CharFilter(field_name='sex')
    birthday = DateFromToRangeFilter(field_name='birthday')
    height = RangeFilter(field_name='height')
    created_time = DateTimeFromToRangeFilter(field_name='created_time')

    class Meta:
        # 指定模型
        models = DemoUser
        fields = ['username', 'sex', 'birthday', 'height', 'province_id', 'created_time']
