from rest_framework import serializers
from management.models import Carousel, About, Link, Info, SiteConfig


class CarouselSerializer(serializers.ModelSerializer):
    """
    轮播图序列化器
    """

    class Meta:
        model = Carousel
        fields = "__all__"


class AboutSerializer(serializers.ModelSerializer):
    """
    关于序列化器
    """

    class Meta:
        model = About
        fields = "__all__"


class LinkSerializer(serializers.ModelSerializer):
    """
    友情链接序列化器
    """
    # 友链类型显示文字
    type_name = serializers.ReadOnlyField(source='get_type_display')

    class Meta:
        model = Link
        fields = "__all__"


class InfoSerializer(serializers.ModelSerializer):
    """
    博主信息序列化器
    """

    class Meta:
        model = Info
        fields = "__all__"


class SiteConfigSerializer(serializers.ModelSerializer):
    """
    网站配置序列化器
    """

    class Meta:
        model = SiteConfig
        fields = "__all__"
