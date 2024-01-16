from django.db import models
from account.models import Sex


class DemoProvince(models.Model):
    name = models.CharField('名称', max_length=30)
    code = models.CharField('编码', max_length=30)

    class Meta:
        verbose_name = '示例省份'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class DemoUser(models.Model):
    username = models.CharField('用户名', max_length=32)
    province = models.ForeignKey(DemoProvince, verbose_name='省份', on_delete=models.CASCADE)
    sex = models.CharField('性别', max_length=1, choices=Sex.choices, default=Sex.men)
    birthday = models.DateField('生日', blank=True, null=True)
    height = models.IntegerField('身高(cm)', default=175)
    weight = models.DecimalField('体重(kg)', max_digits=5, decimal_places=2)
    photo = models.URLField('头像', blank=True, null=True)
    created_time = models.DateTimeField('注册时间', auto_now_add=True)
    introduction = models.TextField('个人介绍', blank=True, null=True)

    class Meta:
        verbose_name = '示例用户'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username
