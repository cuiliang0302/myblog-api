from rest_framework import serializers
from public.models import DemoUser, DemoProvince


class DemoProvinceSerializer(serializers.ModelSerializer):
    """
    示例省份数据序列化器
    """

    class Meta:
        model = DemoProvince
        fields = "__all__"


class DemoUserSerializer(serializers.ModelSerializer):
    """
    示例用户数据序列化器
    """
    province = serializers.CharField(read_only=True)
    province_id = serializers.IntegerField()
    province_code = serializers.ReadOnlyField(source='province.code')
    sex_name = serializers.ReadOnlyField(source='get_sex_display')

    class Meta:
        model = DemoUser
        fields = "__all__"
