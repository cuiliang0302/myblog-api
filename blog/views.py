import random
from PIL import Image
from django.contrib.sites.models import Site
from rest_framework import viewsets, filters, status
from django_filters.rest_framework import DjangoFilterBackend
import qrcode
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_extensions.cache.mixins import CacheResponseMixin
from public.utils import MyPageNumber
from blog.models import Article, Category, Note, Catalogue, Section, Tag
from blog.serializers import CategorySerializer, NoteSerializer, SectionSerializer, TagSerializer, \
    ArticleListSerializer, ArticleRetrieveSerializer, CatalogueSerializer
from django.db.models import Max, Min
from public.permissions import AdminAllOrGuestGetPat, AdminAllOrGuestGet


class ArticleModelViewSet(viewsets.ModelViewSet):
    """
    博客文章增删改查
    """
    permission_classes = (AdminAllOrGuestGetPat,)
    queryset = Article.objects.all()
    pagination_class = MyPageNumber
    filter_backends = [DjangoFilterBackend, filters.OrderingFilter]
    ordering_fields = ['is_recommend', 'created_time', 'view', 'comment', 'like', 'collect']
    filter_fields = ['category', 'tags']

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
        guess1 = Article.objects.filter(is_release=True).filter(tags=article.tags.all()[0]).exclude(id=article_id)
        guess2 = Article.objects.filter(is_release=True).filter(tags=article.tags.all()[1]).exclude(id=article_id)
        guess_all = []
        for i in guess1:
            guess_all.append(i.id)
        for j in guess2:
            guess_all.append(j.id)
        guess = random.sample(set(guess_all), 4)
        result = []
        for k in guess:
            guess_article = Article.objects.get(id=k)
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
        catalogueFather = Catalogue.objects.filter(note=note_id).filter(level=1)
        catalogue = []
        for father in catalogueFather:
            catalogue_father = dict()
            catalogue_father['id'] = father.id
            catalogue_father['name'] = father.name
            catalogueChild = Catalogue.objects.filter(note=note_id).filter(father=father.id)
            child_list = []
            for child in catalogueChild:
                catalogue_child = dict()
                catalogue_child['id'] = child.id
                catalogue_child['name'] = child.name
                catalogue_child['section_id'] = child.section.id
                child_list.append(catalogue_child)
            catalogue_father['child'] = child_list
            catalogue.append(catalogue_father)
        return Response(catalogue, status=status.HTTP_200_OK)

    @staticmethod
    def put(request, note_id):
        """
        编排指定ID笔记的目录结构
        """
        catalogue_data = request.data['value']
        if catalogue_data:
            Catalogue.objects.filter(note_id=note_id).delete()
            for i in range(len(catalogue_data)):
                father = Catalogue.objects.create(note_id=note_id, name=catalogue_data[i]['name'], level=1, order=i)
                section_list = []
                for j in range(len(catalogue_data[i]['children'])):
                    section_list.append(
                        Catalogue(note_id=note_id, name=catalogue_data[i]['children'][j]['name'], order=j, level=2,
                                  father=father.id, section_id=catalogue_data[i]['children'][j]['section_id']))
                Catalogue.objects.bulk_create(section_list)
            return Response({'msg': '目录编排成功'}, status=status.HTTP_200_OK)
        else:
            return Response({'msg': '请求参数异常'}, status=status.HTTP_400_BAD_REQUEST)


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

    # # 重新create方法，关联笔记目录
    # def perform_create(self, serializer):
    #     print(serializer.data)
    #     # serializer.save()


class ContextAPIView(APIView):
    """
    博客文章笔记上下篇
    """

    @staticmethod
    def get(request, content_id):
        kind = request.query_params.get('kind')
        result = dict()
        if kind == 'section':
            child = Catalogue.objects.get(section=content_id)
            child_min = Catalogue.objects.filter(father=child.father).aggregate(Min('order'))["order__min"]
            child_max = Catalogue.objects.filter(father=child.father).aggregate(Max('order'))["order__max"]
            father = Catalogue.objects.get(id=child.father)
            father_min = Catalogue.objects.filter(note=child.note).filter(level=1).aggregate(Min('order'))["order__min"]
            father_max = Catalogue.objects.filter(note=child.note).filter(level=1).aggregate(Max('order'))["order__max"]
            if child.order == child_min:
                if father.order == father_min:
                    # 第一篇文章
                    last_section = None
                else:
                    # 上一篇找上一章最后一篇
                    last_father = Catalogue.objects.filter(note=child.note).filter(level=1).filter(
                        order=father.order - 1)
                    last_child_max = Catalogue.objects.filter(father=last_father[0].id).aggregate(Max('order'))[
                        "order__max"]
                    last_section = Catalogue.objects.filter(father=last_father[0].id).filter(order=last_child_max)[0]
                next_section = Catalogue.objects.filter(father=father.id).filter(order=child.order + 1)[0]
            elif child.order == child_max:
                if father.order == father_max:
                    # 最后一篇文章
                    next_section = None
                else:
                    # 下一篇找上一章第一篇
                    next_father = Catalogue.objects.filter(note=child.note).filter(level=1).filter(
                        order=father.order + 1)
                    next_child_min = Catalogue.objects.filter(father=next_father[0].id).aggregate(Min('order'))[
                        "order__min"]
                    next_section = Catalogue.objects.filter(father=next_father[0].id).filter(order=next_child_min)[0]
                last_section = Catalogue.objects.filter(father=father.id).filter(order=child.order - 1)[0]
            else:
                last_section = Catalogue.objects.filter(father=father.id).filter(order=child.order - 1)[0]
                next_section = Catalogue.objects.filter(father=father.id).filter(order=child.order + 1)[0]
            if last_section:
                result['last'] = {
                    'id': last_section.section_id,
                    'title': last_section.section.title
                }
            if next_section:
                result['next'] = {
                    'id': next_section.section_id,
                    'title': next_section.section.title
                }
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
