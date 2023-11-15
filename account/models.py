from django.contrib.auth.models import AbstractUser
from django.db import models


class UserSource(models.Model):
    name = models.CharField('来源', max_length=100)

    class Meta:
        verbose_name = '注册用户来源'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class SearchKey(models.Model):
    key = models.CharField('关键词', max_length=100)

    class Meta:
        verbose_name = '搜索关键词'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.key


# 性别枚举类型
class Sex(models.TextChoices):
    men = '1', '男'
    women = '2', '女'


class UserInfo(AbstractUser):
    source = models.ForeignKey(UserSource, verbose_name='用户来源', on_delete=models.CASCADE, default=1)
    phone = models.CharField(verbose_name='手机号', max_length=20, blank=True, null=True)
    sex = models.CharField(verbose_name='性别', max_length=1, choices=Sex.choices, default=Sex.men)
    web = models.URLField(verbose_name='个人网站', blank=True, null=True)
    signature = models.TextField(verbose_name='个性签名', max_length=200, default="这个人很懒，什么都没留下！")
    photo = models.URLField(verbose_name='头像', default='https://oss.cuiliangblog.cn/images/photo.jpg')
    area_code = models.CharField(verbose_name='地区编号', max_length=10, blank=True, null=True)
    area_name = models.CharField(verbose_name='地区名称', max_length=20, blank=True, null=True)
    birthday = models.DateField(verbose_name='生日', blank=True, null=True)
    is_flow = models.BooleanField('开启更新订阅', default=0)
    search = models.ManyToManyField(SearchKey, verbose_name='搜索记录')

    class Meta:
        verbose_name = '用户详细信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username


class OAuthId(models.Model):
    user = models.ForeignKey(UserInfo, verbose_name='用户ID', on_delete=models.CASCADE, default=1)
    source = models.ForeignKey(UserSource, verbose_name='用户来源', on_delete=models.CASCADE, default=1)
    openid = models.CharField(max_length=100, verbose_name='用户OAuthID')

    class Meta:
        verbose_name = '第三方登录用户ID'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.user.username
