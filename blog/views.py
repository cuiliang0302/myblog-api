import random
from PIL import Image
from django.contrib.sites.models import Site
from django.utils import timezone
from loguru import logger
from rest_framework import viewsets, status
from django_filters.rest_framework import DjangoFilterBackend
import qrcode
from rest_framework.permissions import IsAdminUser
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_extensions.cache.mixins import CacheResponseMixin
from django.conf import settings
from public.tools import Yuque
from public.utils import MyPageNumber
from blog.models import Article, Category, Note, Catalogue, Section, Tag
from blog.serializers import CategorySerializer, NoteSerializer, SectionSerializer, TagSerializer, \
    ArticleListSerializer, ArticleRetrieveSerializer, CatalogueSerializer
from public.permissions import AdminAllOrGuestGetPat, AdminAllOrGuestGet


class ArticleModelViewSet(viewsets.ModelViewSet):
    """
    博客文章增删改查
    """
    permission_classes = (AdminAllOrGuestGetPat,)
    queryset = Article.objects.all()
    pagination_class = MyPageNumber
    filter_backends = [DjangoFilterBackend]
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


class NoteModelViewSet(CacheResponseMixin, viewsets.ModelViewSet):
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
    permission_classes = (AdminAllOrGuestGetPat,)
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
        date = request.query_params.get('month')
        if date:
            year = date.split("-")[0]
            month = date.split("-")[1]
            articles = Article.objects.filter(created_time__year=year).filter(created_time__month=month). \
                values('id', 'title', 'created_time')
            return Response(articles, status=status.HTTP_200_OK)
        else:
            date_list_all = []  # 建立一个列表用来存放所有日期
            date_obj = Article.objects.filter(is_release=True).values('created_time')
            for date in date_obj:
                date = date['created_time'].strftime('%Y-%m')
                date_list_all.append(date)
            date_list_count = []
            # 日期去重
            for i in date_list_all:
                date_list_count.append(date_list_all.count(i))
            date_list_sum = zip(date_list_all, date_list_count)
            date_list = []
            result = []
            for (i, j) in date_list_sum:
                if (i, j) not in date_list:
                    info = dict()
                    info['month'] = i
                    info['count'] = j
                    date_list.append((i, j))
                    result.append(info)
            return Response(result, status=status.HTTP_200_OK)


class QRcodeAPIView(APIView):
    """
    生成文章笔记二维码
    """

    @staticmethod
    def get(request):
        url = request.query_params.get('url')
        logo = './static/file/logo.png'
        QRcode = './static/file/QRcode.png'
        qr = qrcode.QRCode(
            version=2,
            error_correction=qrcode.constants.ERROR_CORRECT_H,
            box_size=8,
            border=1
        )
        qr.add_data(url)
        qr.make(fit=True)
        # 互动二Image实例并把颜色模式转换成RGBA
        img = qr.make_image()
        img = img.convert("RGBA")
        icon = Image.open(logo)  # 打开logo文件
        img_w, img_h = img.size
        factor = 4
        # 计算logo尺寸
        size_w = int(img_w / factor)
        size_h = int(img_h / factor)
        # 比较并重新设置logo文件的尺寸
        icon_w, icon_h = icon.size
        if icon_w > size_w:
            icon_w = size_w
        if icon_h > size_h:
            icon_h = size_h
        icon = icon.resize((icon_w, icon_h), Image.ANTIALIAS)
        # 计算logo的位置，并且复制到二维码中
        w = int((img_w - icon_w) / 2)
        h = int((img_h - icon_h) / 2)
        icon = icon.convert("RGBA")
        img.paste(icon, (w, h), icon)
        img.save(QRcode)  # 保存二维码qr.png
        return Response({'url': Site.objects.get_current().domain + '/static/file/QRcode.png'},
                        status=status.HTTP_200_OK)


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
        # logger.info(note_id)
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
            Note.objects.filter(id=note_id).update(updated_time=timezone.now())
            return Response({'msg': '笔记内容同步成功'}, status=status.HTTP_200_OK)
        except Exception as e:
            logger.error(e)
            return Response({'msg': '笔记内容同步失败'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
