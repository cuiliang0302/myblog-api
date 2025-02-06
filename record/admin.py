from django.contrib import admin
from record.models import ArticleHistory, SectionHistory, ArticleComment, SectionComment, LeaveMessage
from account.models import SearchKey


# 用户博文浏览记录
@admin.register(ArticleHistory)
class ArticleHistoryAdmin(admin.ModelAdmin):
    list_display = ('article', 'user', 'time', 'is_collect')
    # 文章列表里显示想要显示的字段
    list_display_links = ('article', 'user', 'is_collect')
    # 设置哪些字段可以点击进入编辑界面


# 用户笔记浏览记录
@admin.register(SectionHistory)
class SectionHistoryAdmin(admin.ModelAdmin):
    list_display = ('section', 'user', 'time', 'is_collect')
    # 文章列表里显示想要显示的字段
    list_display_links = ('section', 'user', 'is_collect')
    # 设置哪些字段可以点击进入编辑界面


# 用户留言记录
@admin.register(LeaveMessage)
class LeaveMessageAdmin(admin.ModelAdmin):
    list_display = ('id', 'content', 'user', 'time', 'like', 'father', 'root')
    list_display_links = ('content', 'user')


# 博文评论记录
@admin.register(ArticleComment)
class ArticleCommentAdmin(admin.ModelAdmin):
    list_display = ('id', 'article', 'content', 'user', 'time', 'like', 'father')
    list_display_links = ('content', 'user')


# 笔记评论记录
@admin.register(SectionComment)
class SectionCommentAdmin(admin.ModelAdmin):
    list_display = ('id', 'section', 'url', 'content', 'user', 'time', 'like', 'father')
    list_display_links = ('section', 'user')


# 搜索关键词
@admin.register(SearchKey)
class SearchKeyAdmin(admin.ModelAdmin):
    list_display = ('id', 'key', 'count')
    list_display_links = ['key']
    search_fields = ['key']
