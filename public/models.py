from django.db import models
from account.models import Sex


class DemoKind(models.Model):
    name = models.CharField('种族', max_length=30)

    class Meta:
        verbose_name = '示例种族'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class DemoUser(models.Model):
    username = models.CharField('用户名', max_length=30)
    kind = models.ForeignKey(DemoKind, verbose_name='种族', on_delete=models.CASCADE)
    sex = models.CharField('性别', max_length=1, choices=Sex.choices, default=Sex.men)
    birthday = models.DateField('生日', blank=True, null=True)
    height = models.IntegerField('身高', default=175)
    weight = models.IntegerField('体重', default=60)
    created_time = models.DateTimeField('创建时间', auto_now_add=True)

    class Meta:
        verbose_name = '示例数据'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username
