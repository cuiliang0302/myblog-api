from itertools import chain
from django.db.models import Count
from django.utils import timezone
from loguru import logger
from rest_framework import viewsets, status
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import OrderingFilter
from rest_framework.permissions import IsAdminUser, AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_extensions.cache.mixins import CacheResponseMixin
from django.conf import settings
from public.tools import Yuque
from public.utils import MyPageNumber
from blog.models import Article, Category, Note, Catalogue, Section, Tag
from blog.serializers import CategorySerializer, NoteSerializer, SectionSerializer, TagSerializer, \
    ArticleListSerializer, ArticleRetrieveSerializer, CatalogueSerializer
from public.permissions import AdminAllOrGuestGet
from django.db.models.functions import TruncMonth


class ArticleModelViewSet(viewsets.ModelViewSet):
    """
    博客文章增删改查
    """
    permission_classes = (AdminAllOrGuestGet,)
    queryset = Article.objects.all()
    pagination_class = MyPageNumber
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    ordering_fields = ['is_recommend', 'created_time', 'view', 'comment', 'like', 'collect']
    filterset_fields = ('category', 'tags')

    # 重写get文章方法（阅读量+1）
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.view = instance.view + 1
        instance.save()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)

    # 重写序列化器方法
    def get_serializer_class(self):
        if self.action == 'list':
            return ArticleListSerializer
        else:
            return ArticleRetrieveSerializer


class CategoryModelViewSet(CacheResponseMixin, viewsets.ModelViewSet):
    """
    博客文章分类增删改查
    """
    queryset = Category.objects.all()
    serializer_class = CategorySerializer


class TagModelViewSet(CacheResponseMixin, viewsets.ModelViewSet):
    """
    博客文章标签增删改查
    """
    queryset = Tag.objects.all()
    serializer_class = TagSerializer


class NoteModelViewSet(viewsets.ModelViewSet):
    """
    笔记名称增删改查
    """
    queryset = Note.objects.all()
    serializer_class = NoteSerializer


class GuessLikeAPIView(APIView):
    """
    博客文章猜你喜欢
    """

    @staticmethod
    def get(request, article_id):
        article = Article.objects.get(id=article_id)
        article_tag = article.tags.all()
        guess = Article.objects.filter(is_release=True, tags__in=article_tag).order_by('?')[:4]
        result = []
        for i in guess:
            guess_article = Article.objects.get(id=i.id)
            article_dict = dict()
            article_dict['id'] = guess_article.id
            article_dict['title'] = guess_article.title
            article_dict['cover'] = guess_article.cover
            result.append(article_dict)
        return Response(result, status=status.HTTP_200_OK)


class LikeAPIView(APIView):
    """
    文章或笔记点赞
    """
    permission_classes = (AllowAny,)

    @staticmethod
    def post(request):
        like_id = request.data['id']
        kind = request.data['kind']
        if kind == 'article':
            # 文章点赞
            article = Article.objects.get(id=like_id)
            article.like = article.like + 1
            article.save()
            return Response({"msg": "文章点赞成功"}, status=status.HTTP_200_OK)
        else:
            section = Section.objects.get(id=like_id)
            section.like = section.like + 1
            section.save()
            return Response({"msg": "笔记点赞成功"}, status=status.HTTP_200_OK)


class CatalogueAPIView(APIView):
    """
    博客笔记目录
    """
    permission_classes = (AdminAllOrGuestGet,)

    @staticmethod
    def get(request, note_id):
        """
        获取指定ID笔记的目录结构
        """
        result = []
        catalogue_list = Catalogue.objects.filter(note=note_id).first().catalogue
        father_id = 0
        for i in range(len(catalogue_list)):
            # logger.error(catalogue_list[i])
            # 一级目录
            if catalogue_list[i]['type'] == 'TITLE':
                father = dict()
                father['id'] = catalogue_list[i]['uuid']
                father['name'] = catalogue_list[i]['title']
                father['child'] = []
                result.append(father)
                father_id = father_id + 1
            # 二级文章标题
            else:
                child = dict()
                child['id'] = catalogue_list[i]['uuid']
                child['name'] = catalogue_list[i]['title']
                child['section_id'] = catalogue_list[i]['doc_id']
                # logger.info(father_id-1)
                result[father_id - 1]['child'].append(child)
        return Response(result, status=status.HTTP_200_OK)


class SectionModelViewSet(viewsets.ModelViewSet):
    """
    笔记内容增删改查
    """
    permission_classes = (AdminAllOrGuestGet,)
    queryset = Section.objects.all()
    serializer_class = SectionSerializer

    # 重写get文章方法（阅读量+1）
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.view = instance.view + 1
        instance.save()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)


class ContextAPIView(APIView):
    """
    博客文章笔记上下篇
    """

    @staticmethod
    def get(request, content_id):
        kind = request.query_params.get('kind')
        result = dict()
        if kind == 'section':
            # print(content_id)
            note_id = Section.objects.get(id=content_id).note_id
            catalogue_list = Catalogue.objects.get(note_id=note_id).catalogue
            # print(catalogue_list)
            # 查找指定文档的序号
            section_order = 0
            for i in range(len(catalogue_list)):
                if catalogue_list[i]['doc_id'] == content_id:
                    # logger.error("找到了，是第%s个" % i)
                    section_order = i
                    break
            # print(section_order)
            # 查找上一篇
            last = dict()
            last_item = catalogue_list[section_order - 1]
            # 上一篇是目录
            if last_item['doc_id'] is None:
                # print("上一篇是目录")
                last_item = catalogue_list[section_order - 2]
            # print(last_item)
            last['id'] = last_item['doc_id']
            last['title'] = last_item['title']
            # print(last)
            result['last'] = last
            # 第一篇文章
            if section_order == 1:
                # print("第一篇文章")
                result['last'] = None
            # 查找下一篇
            next = dict()
            try:
                next_item = catalogue_list[section_order + 1]
                # 下一篇是目录
                if next_item['doc_id'] is None:
                    next_item = catalogue_list[section_order + 2]
                # print(next_item)
                next['id'] = next_item['doc_id']
                next['title'] = next_item['title']
                # print(next)
                result['next'] = next
            except IndexError:
                # 最后一篇文章
                result['next'] = None
        else:
            article = Article.objects.get(id=content_id)
            last_article = Article.objects.filter(category=article.category).filter(
                created_time__gt=article.created_time)[:1]
            next_article = Article.objects.filter(category=article.category).filter(
                created_time__lt=article.created_time)[:1]
            if last_article:
                result['last'] = {
                    'id': last_article.first().id,
                    'title': last_article.first().title
                }
            if next_article:
                result['next'] = {
                    'id': next_article.first().id,
                    'title': next_article.first().title
                }
        return Response(result, status=status.HTTP_200_OK)


class ClassifyAPIView(APIView):
    """
    博客文章归档
    """

    @staticmethod
    def get(request):
        query_month = request.query_params.get('month')
        # logger.error(query_month)
        if query_month and query_month:
            year, month = map(int, query_month.split('-'))
            # 查询指定月份的 Article 和 Section
            articles = Article.objects.filter(
                created_time__year=year,
                created_time__month=month
            ).values('id', 'title', 'created_time')

            sections = Section.objects.filter(
                created_time__year=year,
                created_time__month=month
            ).values('id', 'title', 'created_time')
            # 标记来源并合并结果
            articles = [{"type": "article", **article} for article in articles]
            sections = [{"type": "section", **section} for section in sections]

            # 合并列表并按时间从近到远排序
            combined_list = sorted(
                chain(articles, sections),
                key=lambda x: x['created_time'],
                reverse=True
            )
            return Response(combined_list, status=status.HTTP_200_OK)
        else:
            # 按月份统计 Article
            article_counts = (
                Article.objects.annotate(month=TruncMonth('created_time'))
                .values('month')
                .annotate(count=Count('id'))
                .order_by('month')
            )
            # 按月份统计 Section
            section_counts = (
                Section.objects.annotate(month=TruncMonth('created_time'))
                .values('month')
                .annotate(count=Count('id'))
                .order_by('month')
            )
            # 合并统计结果
            monthly_counts = {}

            for article in article_counts:
                month_str = article['month'].strftime('%Y-%m')  # 转为 "YYYY-MM" 格式
                if month_str not in monthly_counts:
                    monthly_counts[month_str] = {"article": 0, "section": 0}
                monthly_counts[month_str]["article"] = article["count"]

            for section in section_counts:
                month_str = section['month'].strftime('%Y-%m')
                if month_str not in monthly_counts:
                    monthly_counts[month_str] = {"article": 0, "section": 0}
                monthly_counts[month_str]["section"] = section["count"]

            # 返回按时间从近到远排序的结果
            sorted_monthly_counts = dict(sorted(monthly_counts.items(), key=lambda x: x[0], reverse=True))

            return Response(sorted_monthly_counts, status=status.HTTP_200_OK)


class CatalogueModelViewSet(viewsets.ModelViewSet):
    """
    笔记目录增删改查
    """
    queryset = Catalogue.objects.all()
    serializer_class = CatalogueSerializer


class SyncNoteListAPIView(APIView):
    """
    同步语雀笔记列表
    """
    permission_classes = (IsAdminUser,)

    @staticmethod
    def post(request):
        yuque = Yuque(settings.YUQUE_TOKEN)
        try:
            yuque.get_repo_list()
            repo_list = yuque.repo_list
            for item in repo_list:
                content = {
                    "id": item['id'],
                }
                Note.objects.update_or_create(defaults=item, **content)
            return Response({'msg': '笔记列表同步成功'}, status=status.HTTP_200_OK)
        except Exception as e:
            logger.error(e)
            return Response({'msg': '笔记列表同步失败'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class SyncNoteContentAPIView(APIView):
    """
    同步语雀笔记内容
    """

    permission_classes = (IsAdminUser,)

    @staticmethod
    def post(request):
        note_id = request.data.get('note_id')
        namespace = Note.objects.get(id=note_id).namespace
        logger.info("开始获取%s笔记内容" % namespace)
        yuque = Yuque(settings.YUQUE_TOKEN)
        try:
            # 获取笔记目录
            yuque.get_repo_catalogue(namespace)
            catalogue_list = yuque.repo_catalogue
            # 获取笔记内容
            for i in catalogue_list:
                if i['slug']:
                    yuque.get_repo_content(namespace, i['slug'])
            content_list = yuque.repo_content
            logger.info('笔记内容获取完成')
            # 遍历数据库对比接口，删除失效的文档
            content_id_list = []
            for j in content_list:
                content_id_list.append(j['id'])
            for k in Section.objects.filter(note_id=note_id):
                if k.id not in content_id_list:
                    Section.objects.get(id=k.id).delete()
            logger.info('过期笔记清理完成')
            # 笔记内容入库
            for item in content_list:
                # logger.error(item)
                item['note_id'] = note_id
                item['created_time'] = item['created_at']
                item['modified_time'] = item['content_updated_at']
                del item['created_at'], item['content_updated_at']
                # logger.error(item)
                content = {
                    "id": item['id'],
                }
                Section.objects.update_or_create(defaults=item, **content)
            logger.info('笔记入库完成')
            # 笔记目录入库
            catalogue = dict()
            catalogue['catalogue'] = catalogue_list
            catalogue['note_id'] = note_id
            content = {
                "note_id": catalogue['note_id'],
            }
            Catalogue.objects.update_or_create(defaults=catalogue, **content)
            logger.info('目录入库完成')
            # 更新笔记信息
            note = Note.objects.get(id=note_id)
            note.updated_time = timezone.now()
            note.items_count = Section.objects.filter(note=note_id).count()
            note.save()
            return Response({'msg': '笔记内容同步成功'}, status=status.HTTP_200_OK)
        except Exception as e:
            logger.error(e)
            return Response({'msg': '笔记内容同步失败'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
