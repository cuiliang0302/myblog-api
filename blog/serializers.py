from rest_framework import serializers
from blog.models import Article, Category, Note, Section, Tag, Catalogue


class ArticleListSerializer(serializers.ModelSerializer):
    """
    博客文章列表序列化器
    """
    # 获取外键文章id和name
    category = serializers.CharField(read_only=True)
    category_id = serializers.IntegerField()

    class Meta:
        model = Article
        exclude = ['body']


class ArticleRetrieveSerializer(serializers.ModelSerializer):
    """
    博客文章内容序列化器
    """
    # 获取外键文章id和name
    category = serializers.CharField(read_only=True)
    category_id = serializers.IntegerField()
    tags = serializers.SerializerMethodField()

    class Meta:
        model = Article
        fields = "__all__"

    def get_tags(self, obj: Article):
        return [
            {'id': i['id'], 'name': i['name']}
            for i in obj.tags.all().values('id', 'name')
        ]


class CategorySerializer(serializers.ModelSerializer):
    """
    博客文章分类序列化器
    """

    class Meta:
        model = Category
        fields = "__all__"


class TagSerializer(serializers.ModelSerializer):
    """
    博客文章标签序列化器
    """

    class Meta:
        model = Tag
        fields = "__all__"


class NoteSerializer(serializers.ModelSerializer):
    """
    笔记名称序列化器
    """

    class Meta:
        model = Note
        fields = "__all__"


class SectionSerializer(serializers.ModelSerializer):
    """
    笔记内容序列化器
    """
    # 获取笔记名称外键id和name
    note = serializers.CharField(read_only=True)
    note_id = serializers.IntegerField()

    class Meta:
        model = Section
        fields = "__all__"


class CatalogueSerializer(serializers.ModelSerializer):
    """
    笔记目录序列化器
    """

    class Meta:
        model = Catalogue
        fields = "__all__"
