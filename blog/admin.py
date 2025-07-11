from .models import Category, Tag, Article, Note, Section, Catalogue
from django.contrib import admin

admin.site.site_header = '博客后台管理'  # 设置header
admin.site.site_title = '博客管理'  # 设置title


# 文章内容
@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    # 标签多对多显示
    def tag(self, obj):
        return [tag for tag in obj.tags.all()]

    list_display = (
        'id', 'category', 'title', 'tag', 'view', 'like', 'comment', 'created_time', 'is_recommend', 'is_release')
    # 文章列表里显示想要显示的字段
    list_per_page = 30
    # 满50条数据就自动分页
    ordering = ('-created_time',)
    # 后台数据列表排序方式
    list_display_links = ('id', 'title')
    # 设置哪些字段可以点击进入编辑界面
    search_fields = ('title', 'body')
    # 搜索字段


# 文章分类
@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')


# 文章标签
@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')


# 笔记列表
@admin.register(Note)
class NoteAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'namespace', 'description', 'items_count', 'updated_time')
    search_fields = ('name', 'namespace')
    ordering = ('-updated_time',)


# 笔记内容
@admin.register(Section)
class SectionAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'slug', 'note', 'title', 'view', 'like', 'comment', 'collect', 'created_time', 'modified_time')
    list_display_links = ('id', 'title', 'note')
    search_fields = ('title', 'id')
    list_filter = ['note']


# 笔记目录
@admin.register(Catalogue)
class CatalogueAdmin(admin.ModelAdmin):
    list_display = ('id', 'note')
    list_display_links = ('id', 'note')
