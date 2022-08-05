from django.db import models
from mdeditor.fields import MDTextField
from account.models import UserInfo


class Category(models.Model):
    name = models.CharField('文章分类', max_length=100)

    class Meta:
        verbose_name = '文章分类'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Tag(models.Model):
    name = models.CharField('文章标签', max_length=100)

    class Meta:
        verbose_name = '文章标签'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Article(models.Model):
    title = models.CharField('标题', max_length=50)
    abstract = models.TextField('摘要', max_length=200, blank=True)
    category = models.ForeignKey(Category, on_delete=models.DO_NOTHING, verbose_name='分类', blank=True, null=True)
    # 使用外键关联分类表与分类是一对多关系
    tags = models.ManyToManyField(Tag, verbose_name='标签', blank=True)
    # 使用外键关联标签表与标签是多对多关系
    cover = models.URLField(verbose_name='文章封面', default='https://oss.cuiliangblog.cn/images/cover.jpg')
    body = MDTextField()
    author = models.ForeignKey(UserInfo, on_delete=models.CASCADE, verbose_name='作者', default=1)
    view = models.PositiveIntegerField('阅读量', default=0)
    like = models.PositiveIntegerField('点赞数', default=0)
    collect = models.PositiveIntegerField('收藏数', default=0)
    comment = models.PositiveIntegerField('评论数', default=0)
    created_time = models.DateTimeField('发布时间', auto_now_add=True)
    modified_time = models.DateTimeField('修改时间', auto_now=True)
    is_recommend = models.BooleanField('是否推荐显示', default=False)
    is_release = models.BooleanField('是否发布', default=True)

    class Meta:
        verbose_name = '文章内容'
        verbose_name_plural = verbose_name
        ordering = ("-created_time",)
        # 默认按创建时间倒序排列
        indexes = [models.Index(fields=['title', 'category', 'created_time'])]
        # 创建index索引

    def __str__(self):
        return self.title


class Note(models.Model):
    name = models.CharField('笔记名称', max_length=50)
    cover = models.URLField('笔记封面', default='https://oss.cuiliangblog.cn/images/cover.jpg')

    class Meta:
        verbose_name = '笔记名称'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Section(models.Model):
    title = models.CharField('笔记标题', max_length=50)
    note = models.ForeignKey(Note, on_delete=models.CASCADE, verbose_name='所属笔记')
    body = MDTextField()
    author = models.ForeignKey(UserInfo, on_delete=models.CASCADE, verbose_name='作者', default=1)
    view = models.PositiveIntegerField('阅读量', default=0)
    like = models.PositiveIntegerField('点赞数', default=0)
    collect = models.PositiveIntegerField('收藏数', default=0)
    comment = models.PositiveIntegerField('评论数', default=0)
    created_time = models.DateTimeField('发布时间', auto_now_add=True)
    modified_time = models.DateTimeField('修改时间', auto_now=True)
    is_release = models.BooleanField('是否发布', default=True)

    class Meta:
        verbose_name = '笔记内容'
        verbose_name_plural = verbose_name
        ordering = ("-created_time",)
        indexes = [models.Index(fields=['title', 'note', 'created_time'])]
        # 创建index索引

    def __str__(self):
        return self.title


class Catalogue(models.Model):
    note = models.ForeignKey(Note, on_delete=models.DO_NOTHING, verbose_name='笔记名称')
    name = models.CharField('标题名称', max_length=100)
    order = models.IntegerField('序号', default=1)
    level = models.IntegerField('等级', default=1)
    father = models.IntegerField('父目录ID', blank=True, null=True)
    section = models.ForeignKey(Section, on_delete=models.DO_NOTHING, verbose_name='笔记内容', blank=True, null=True)

    class Meta:
        verbose_name = '笔记目录'
        verbose_name_plural = verbose_name
        ordering = ("note", "level", "order")

    def __str__(self):
        return self.name
