from django.contrib.syndication.views import Feed
from django.shortcuts import reverse
from blog.models import Article


class RssFeed(Feed):
    # 显示在聚合阅读器上的标题
    title = "崔亮的博客"

    # 通过聚合阅读器跳转到网站的地址
    link = "/"

    # 显示在聚合阅读器上的描述信息
    description = "崔亮的博客-专注devops自动化运维，传播优秀it运维技术文章"

    # 需要显示的内容条目
    def items(self):
        return Article.objects.filter(is_release=True).all()

    # 聚合器中显示的内容条目的标题
    def item_title(self, item):
        return item.title

    # 聚合器中显示的内容条目的描述
    def item_description(self, item):
        return item.abstract

    # 聚合器中显示的内容条目的发布时间
    def item_pubdate(self, item):
        return item.created_time

    # 聚合器中显示的内容条目的更新时间
    def item_updateddate(self, item):
        return item.modified_time

    # 聚合器中显示的内容条目的类别
    def item_categories(self, item):
        return item.category.name

    # 聚合器中显示的内容条目的作者名称
    def item_author_name(self, item):
        return item.author.username

    # 聚合器中显示的内容条目的作者邮箱
    def item_author_email(self, item):
        return item.author.email

    # 聚合器中显示的内容条目的路由
    def item_link(self, item):
        return reverse('article_link', args=(item.id,))
