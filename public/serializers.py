from rest_framework import serializers
from public.models import DemoUser


class DemoUserSerializer(serializers.ModelSerializer):
    """
    示例数据序列化器
    """
    kind = serializers.CharField(read_only=True)
    kind_id = serializers.IntegerField()
    sex_name = serializers.ReadOnlyField(source='get_sex_display')

    class Meta:
        model = DemoUser
        fields = "__all__"
