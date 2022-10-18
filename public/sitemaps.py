from django.contrib.sitemaps import Sitemap
from blog.models import Article, Section


class ArticleSitemap(Sitemap):
    changefreq = "never"  # 可选,指定每个对象的更新频率
    priority = 1.0  # 可选,指定每个对象的优先级,默认0.5

    def items(self):  # 返回对象的列表.这些对象将被其他方法或属性调用
        return Article.objects.all()

    def lastmod(self, obj):  # 可选,该方法返回一个datetime,表示每个对象的最后修改时间
        return obj.modified_time

    def location(self, obj):  # 可选.返回每个对象的绝对路径.如果对象有get_absolute_url()方法,可以省略location
        return "/detail/article/" + str(obj.id)


class SectionSitemap(Sitemap):
    changefreq = "never"  # 可选,指定每个对象的更新频率
    priority = 0.5  # 可选,指定每个对象的优先级,默认0.5

    def items(self):  # 返回对象的列表.这些对象将被其他方法或属性调用
        return Section.objects.all()

    def lastmod(self, obj):  # 可选,该方法返回一个datetime,表示每个对象的最后修改时间
        return obj.modified_time

    def location(self, obj):  # 可选.返回每个对象的绝对路径.如果对象有get_absolute_url()方法,可以省略location
        return "/detail/section/" + str(obj.id)