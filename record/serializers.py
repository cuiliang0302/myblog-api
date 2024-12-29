from loguru import logger
from rest_framework import serializers
from rest_framework_recursive.fields import RecursiveField
from account.models import UserInfo
from account.models import SearchKey
from record.models import LeaveMessage, ArticleComment, SectionComment, ArticleHistory, SectionHistory


class SearchHistorySerializer(serializers.ModelSerializer):
    """
    用户搜索记录(热门搜索)序列化器
    """
    keys = serializers.SerializerMethodField()

    # 查询多对多搜索关键词
    def get_keys(self, obj):
        keys = []
        for i in obj.search.all():
            keys.append(i.key)
        return keys

    class Meta:
        model = UserInfo
        fields = ("keys", "search")


class SearchKeySerializer(serializers.ModelSerializer):
    """
    搜索词(所有搜索记录)序列化器
    """

    class Meta:
        model = SearchKey
        fields = ("key",)


class LeaveMessageListSerializer(serializers.ModelSerializer):
    """
    留言记录列表序列化器
    """
    username = serializers.ReadOnlyField(source='user.username')
    photo = serializers.ReadOnlyField(source='user.photo')
    child_count = serializers.SerializerMethodField()
    father_name = serializers.ReadOnlyField(source='get_father_name')

    class Meta:
        model = LeaveMessage
        fields = "__all__"

    def get_child_count(self, obj):
        # 返回子回复个数
        return LeaveMessage.objects.filter(root=obj.id).count() - 1


class LeaveMessageInfoSerializer(serializers.ModelSerializer):
    """
    留言记录列表序列化器
    """
    username = serializers.ReadOnlyField(source='user.username')
    photo = serializers.ReadOnlyField(source='user.photo')
    child = serializers.ListField(source='get_child', child=RecursiveField(), read_only=True)
    father_name = serializers.ReadOnlyField(source='get_father_name')

    class Meta:
        model = LeaveMessage
        fields = "__all__"


class ArticleCommentSerializer(serializers.ModelSerializer):
    """
    文章评论回复记录序列化器
    """
    article = serializers.CharField(read_only=True)
    article_id = serializers.IntegerField()
    username = serializers.ReadOnlyField(source='user.username')
    photo = serializers.ReadOnlyField(source='user.photo')
    child = serializers.ListField(source='get_child', child=RecursiveField(), read_only=True)
    father_name = serializers.ReadOnlyField(source='get_father_name')

    class Meta:
        model = ArticleComment
        fields = "__all__"


class SectionCommentSerializer(serializers.ModelSerializer):
    """
    笔记评论回复记录序列化器
    """
    section = serializers.CharField(read_only=True)
    section_id = serializers.IntegerField()
    username = serializers.ReadOnlyField(source='user.username')
    photo = serializers.ReadOnlyField(source='user.photo')
    child = serializers.ListField(source='get_child', child=RecursiveField(), read_only=True)
    father_name = serializers.ReadOnlyField(source='get_father_name')

    class Meta:
        model = SectionComment
        fields = "__all__"


class ArticleHistorySerializer(serializers.ModelSerializer):
    """
    文章浏览记录序列化器
    """
    # 获取外键文章id和name
    article = serializers.CharField(read_only=True)
    article_id = serializers.IntegerField()

    class Meta:
        model = ArticleHistory
        fields = "__all__"


class SectionHistorySerializer(serializers.ModelSerializer):
    """
    笔记浏览记录序列化器
    """
    # 获取外键笔记id和name
    section = serializers.CharField(read_only=True)
    section_id = serializers.IntegerField()

    class Meta:
        model = SectionHistory
        fields = "__all__"
