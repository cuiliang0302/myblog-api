from django.db import models
from account.models import UserInfo
from blog.models import Section, Article


class ArticleHistory(models.Model):
    article = models.ForeignKey(Article, on_delete=models.CASCADE, verbose_name='文章名')
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, verbose_name='用户名')
    time = models.DateTimeField(auto_now_add=True, verbose_name='浏览时间')
    is_collect = models.BooleanField(verbose_name='是否收藏', default=False)

    class Meta:
        ordering = ('-time',)
        verbose_name = '文章浏览记录'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.article.title


class SectionHistory(models.Model):
    section = models.ForeignKey(Section, on_delete=models.CASCADE, blank=True, null=True, verbose_name='笔记标题')
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, blank=True, null=True, verbose_name='用户名')
    time = models.DateTimeField(auto_now_add=True, verbose_name='浏览时间')
    is_collect = models.BooleanField(verbose_name='是否收藏', default=False)

    class Meta:
        ordering = ('-time',)
        verbose_name = '笔记浏览记录'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.section.title


class LeaveMessage(models.Model):
    content = models.TextField(verbose_name='留言内容', )
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, verbose_name='用户名')
    time = models.DateTimeField(auto_now_add=True, verbose_name='留言时间')
    like = models.IntegerField(verbose_name='留言点赞数', default=0)
    father = models.ForeignKey('self', verbose_name='父留言', on_delete=models.CASCADE, blank=True, null=True,
                               related_name='sub')

    class Meta:
        ordering = ('-time',)
        verbose_name = '留言回复记录'
        verbose_name_plural = verbose_name

    # 获取子回复
    def get_child(self):
        return self.sub.all()

    # 获取留言用户名
    def get_father_name(self):
        if self.father:
            return self.father.user.username
        return

    def __str__(self):
        return self.content


class ArticleComment(models.Model):
    article = models.ForeignKey(Article, on_delete=models.CASCADE, verbose_name='文章')
    content = models.TextField(verbose_name='评论内容', )
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, verbose_name='用户名')
    time = models.DateTimeField(auto_now_add=True, verbose_name='评论时间')
    like = models.IntegerField(verbose_name='评论点赞数', default=0)
    father = models.ForeignKey('self', verbose_name='父评论', on_delete=models.CASCADE, blank=True, null=True,
                               related_name='sub')

    class Meta:
        ordering = ('-time', 'article')
        verbose_name = '文章评论回复记录'
        verbose_name_plural = verbose_name

    # 获取子回复
    def get_child(self):
        return self.sub.all()

    # 获取留言用户名
    def get_father_name(self):
        if self.father:
            return self.father.user.username
        return

    def __str__(self):
        return self.content


class SectionComment(models.Model):
    section = models.ForeignKey(Section, on_delete=models.CASCADE, verbose_name='笔记')
    content = models.TextField(verbose_name='评论内容', )
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, verbose_name='用户名')
    time = models.DateTimeField(auto_now_add=True, verbose_name='评论时间')
    like = models.IntegerField(verbose_name='评论点赞数', default=0)
    father = models.ForeignKey('self', verbose_name='父评论', on_delete=models.CASCADE, blank=True, null=True,
                               related_name='sub')

    class Meta:
        ordering = ('-time', 'section')
        verbose_name = '笔记评论回复记录'
        verbose_name_plural = verbose_name

    # 获取子回复
    def get_child(self):
        return self.sub.all()

    # 获取留言用户名
    def get_father_name(self):
        if self.father:
            return self.father.user.username
        return

    def __str__(self):
        return self.content
