from django.db import models
from mdeditor.fields import MDTextField


# 轮播图
class Carousel(models.Model):
    img = models.URLField('轮播图')
    url = models.URLField('链接地址')
    title = models.CharField('图片标题', max_length=50, blank=True, null=True)
    is_show = models.BooleanField('是否显示', default=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = '轮播图管理'
        verbose_name_plural = '轮播图管理'
        ordering = ("-id",)


# 友链种类枚举类型
class Type(models.TextChoices):
    link = '1', '友情链接'
    recommend = '2', '强烈推荐'


# 友情链接
class Link(models.Model):
    name = models.CharField('网站名称', max_length=25)
    logo = models.URLField('网站logo')
    url = models.URLField('网址')
    describe = models.CharField('站点简介', max_length=100, blank=True, null=True)
    type = models.CharField(verbose_name='类型', max_length=1, choices=Type.choices, default=Type.link)
    is_activate = models.BooleanField('是否启用', default=False)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '友情链接'
        verbose_name_plural = '友情链接'


# 关于
class About(models.Model):
    title = models.CharField('关于标题', max_length=20)
    body = MDTextField('内容')
    time = models.DateTimeField('更新时间', auto_now=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = '关于页'
        verbose_name_plural = '关于页'


# 网站配置
class SiteConfig(models.Model):
    logo = models.URLField('网站logo', default='https://oss.cuiliangblog.cn/images/logo.png')
    icon = models.URLField('icon图标', default='https://oss.cuiliangblog.cn/image/favicon.ico')
    name = models.CharField('网站名称', max_length=20)
    domain = models.URLField('网站域名')
    title = models.CharField('首页标题', max_length=50)
    keywords = models.CharField('META关键词', max_length=200, blank=True, null=True)
    describe = models.CharField('META描述', max_length=300, blank=True, null=True)
    copyright = models.CharField('版权信息', max_length=100)
    icp_num = models.CharField('ICP备案号', max_length=100, blank=True, null=True)
    icp_url = models.URLField('ICP备案链接', blank=True, null=True)
    police_num = models.CharField('公安备案号', max_length=100, blank=True, null=True)
    police_url = models.URLField('公安备案链接', blank=True, null=True)
    sitemap = models.URLField('网站地图链接', blank=True, null=True)
    photo = models.URLField('默认头像', default='https://oss.cuiliangblog.cn/images/photo.jpg')
    cover = models.URLField('默认封面', default='https://oss.cuiliangblog.cn/image/cover.jpg')

    class Meta:
        verbose_name = '网站配置'
        verbose_name_plural = '网站配置'


# 博主信息
class Info(models.Model):
    position = models.CharField('职位', max_length=10)
    company = models.CharField('单位', max_length=20)
    location = models.CharField('地址', max_length=10)
    email = models.EmailField('邮箱', max_length=50)
    github = models.URLField('GitHub')
    gitee = models.URLField('码云')
    vx_public = models.URLField('微信公众号二维码')
    rss = models.URLField('RSS订阅地址')
    qq = models.CharField('QQ', max_length=15)
    qq_img = models.URLField('QQ二维码')
    wechat = models.CharField('微信', max_length=20)
    wechat_img = models.URLField('微信二维码')
    wechat_pay = models.URLField('微信收款码')
    ali_pay = models.URLField('支付宝收款码')

    class Meta:
        verbose_name = '博主信息'
        verbose_name_plural = '博主信息'
