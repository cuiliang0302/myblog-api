from collections import Counter
from datetime import datetime, timedelta

from django.db import transaction
from django.db.models import Count, Q
from django.utils import timezone
from loguru import logger
from rest_framework import status, viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_extensions.cache.decorators import cache_response
from account.models import UserInfo
from blog.models import Article, Section, Category, Note
from blog.serializers import ArticleListSerializer, SectionSerializer
from account.models import SearchKey
from public.permissions import AuthenticatedAllOrGuestGetPat, AdminAllOrGuestGetPutPost
from public.utils import MyPageNumber, get_user_id_from_token
from record.models import LeaveMessage, ArticleComment, SectionComment, ArticleHistory, SectionHistory
from record.serializers import SearchKeySerializer, ArticleCommentSerializer, SectionCommentSerializer, \
    ArticleHistorySerializer, SectionHistorySerializer, LeaveMessageListSerializer, LeaveMessageInfoSerializer


class SearchHotAPIView(APIView):
    """
    获取搜索排行
    """

    @cache_response()
    def get(self, request):
        result = []
        for i in SearchKey.objects.all().order_by('-count'):
            result.append(i.keys)
        return Response(result, status=status.HTTP_200_OK)


class searchHistoryAPIView(APIView):
    """
    获取用户搜索记录
    """

    @staticmethod
    def get(request):
        user_id = get_user_id_from_token(request)
        user = UserInfo.objects.get(id=user_id)
        result = []
        for i in user.search.all():
            # logger.info(i)
            result.append(i.keys)
        return Response(result, status=status.HTTP_200_OK)


class SearchAPIView(APIView):
    """
    搜索文章或笔记
    """

    @staticmethod
    def _search(queryset, key, order):
        """通用的搜索逻辑"""
        if order == 'view':
            return queryset.filter(
                Q(title__icontains=key) | Q(body__icontains=key)
            ).order_by('-view')
        return queryset.filter(
            Q(title__icontains=key) | Q(body__icontains=key)
        )

    @staticmethod
    def _update_user_search_history(user_id, key_id):
        """更新搜素词和用户的搜索历史"""
        # logger.info(user_id)
        # logger.info(key_id)
        # 获取或创建搜索关键词
        search_key, created = SearchKey.objects.get_or_create(keys=key_id)
        # 如果搜索关键词存在，更新其搜索次数
        if not created:
            search_key.count += 1
            search_key.save()
        if user_id:
            user = UserInfo.objects.get(id=user_id)
            # 将该搜索关键词添加到用户的搜索记录中
            user.search.add(search_key)
            user.save()

    def get(self, request):
        key = request.query_params.get('key')
        user_id = get_user_id_from_token(request)
        kind = request.query_params.get('kind')
        order = request.query_params.get('order')
        # 判断搜索内容是文章还是笔记
        if kind == 'article':
            searchResult = self._search(Article.objects.filter(is_release=1), key, order)
            searchSerializer = ArticleListSerializer(instance=searchResult, many=True)
        else:
            searchResult = self._search(Section.objects.all(), key, order)
            searchSerializer = SectionSerializer(instance=searchResult, many=True)

        if searchResult.exists():
            # 更新搜索关键词和用户搜索历史
            self._update_user_search_history(user_id, key)
            return Response(searchSerializer.data, status=status.HTTP_200_OK)
        else:
            return Response(
                {'msg': '查询记录为空，请更换关键字或切换为其他类型的搜索'},
                status=status.HTTP_400_BAD_REQUEST
            )


class LeaveMessageModelViewSet(viewsets.ModelViewSet):
    """
    留言增删改查
    """
    permission_classes = (AuthenticatedAllOrGuestGetPat,)
    pagination_class = MyPageNumber

    # 重写选择序列化器
    def get_serializer_class(self):
        if self.action == 'list':
            return LeaveMessageListSerializer
        else:
            return LeaveMessageInfoSerializer

    # 重写查询方法
    def get_queryset(self):
        if self.action == 'list':
            return LeaveMessage.objects.filter(father=None)
        else:
            return LeaveMessage.objects.all()

    # 重写创建方法
    def perform_create(self, serializer):
        # 如果没有传入 root，则设置 root 为当前对象的 id
        validated_data = serializer.validated_data
        root = validated_data.get('root', None)
        leave_message = serializer.save()
        if root is None:
            leave_message.root = leave_message.id
            leave_message.save()  # 更新 root 后再次保存
        return leave_message


class ArticleCommentModelViewSet(viewsets.ModelViewSet):
    """
    文章评论回复增删改查
    """
    permission_classes = (AuthenticatedAllOrGuestGetPat,)
    serializer_class = ArticleCommentSerializer

    # 重写查询方法
    def get_queryset(self):
        if self.action == 'list':
            article_id = self.request.query_params.get('article')
            user_id = get_user_id_from_token(self.request)
            if article_id:
                # 查询文章所有评论回复记录
                return ArticleComment.objects.filter(article=article_id).filter(father=None)
            elif user_id:
                # 查询用户所有评论回复记录
                return ArticleComment.objects.filter(user=user_id)
            else:
                # 查询指定id的评论信息
                return ArticleComment.objects.all()
        else:
            return ArticleComment.objects.all()

    # 重写create方法(重新统计对应文章评论数)
    def perform_create(self, serializer):
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            article = Article.objects.get(id=serializer.data.get('article_id'))
            article.comment = ArticleComment.objects.filter(article=serializer.data.get('article_id')).count()
            article.save()

    # 重写delete方法(重新统计对应文章评论数)
    def perform_destroy(self, instance):
        article_id = instance.article_id
        instance.delete()
        article = Article.objects.get(id=article_id)
        article.comment = ArticleComment.objects.filter(article=article_id).count()
        article.save()


class SectionCommentModelViewSet(viewsets.ModelViewSet):
    """
    笔记评论回复增删改查
    """
    permission_classes = (AuthenticatedAllOrGuestGetPat,)
    serializer_class = SectionCommentSerializer

    # 重写查询方法
    def get_queryset(self):
        if self.action == 'list':
            section_id = self.request.query_params.get('section')
            user_id = get_user_id_from_token(self.request)
            if section_id:
                # 查询所有笔记评论回复记录
                return SectionComment.objects.filter(section=section_id).filter(father=None)
            elif user_id:
                # 查询所有用户评论回复记录
                return SectionComment.objects.filter(user=user_id)
            else:
                # 查询指定id的评论信息
                return SectionComment.objects.all()
        else:
            return SectionComment.objects.all()

    # 重写create方法(重新统计对应笔记评论数)
    def perform_create(self, serializer):
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            section = Section.objects.get(id=serializer.data.get('section_id'))
            section.comment = SectionComment.objects.filter(section=serializer.data.get('section_id')).count()
            section.save()

    # 重写delete方法(重新统计对应笔记评论数)
    def perform_destroy(self, instance):
        section_id = instance.section_id
        instance.delete()
        section = Section.objects.get(id=section_id)
        section.comment = SectionComment.objects.filter(section=section_id).count()
        section.save()


class ArticleHistoryAPIView(APIView):
    """
    文章浏览记录
    """
    permission_classes = (AdminAllOrGuestGetPutPost,)

    @staticmethod
    def get(request):
        user_id = get_user_id_from_token(request)
        article_id = request.query_params.get('article')
        if article_id:
            # 获取指定文章信息
            article_history = ArticleHistory.objects.filter(article=article_id).filter(user=user_id).first()
            serializer = ArticleHistorySerializer(instance=article_history)
        else:
            # 获取用户所有文章信息
            article_history = ArticleHistory.objects.filter(user=user_id)
            serializer = ArticleHistorySerializer(instance=article_history, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    @staticmethod
    def post(request):
        serializer = ArticleHistorySerializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            article_id = request.data.get('article_id')
            user_id = request.data.get('user')
            history = ArticleHistory.objects.filter(article=article_id).filter(user=user_id).first()
            if history:
                # 找到记录，更新时间
                history.time = timezone.localtime()
                history.save()
            else:
                # 未找到，创建记录
                serializer.save()
            return Response({'msg': '浏览记录添加成功！'}, status=status.HTTP_200_OK)
        else:
            return Response({'msg': '浏览记录添加失败！'}, status=status.HTTP_400_BAD_REQUEST)

    @staticmethod
    def put(request):
        serializer = ArticleHistorySerializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            article_id = request.data.get('article_id')
            user_id = request.data.get('user')
            is_collect = request.data.get('is_collect')
            article_history = ArticleHistory.objects.filter(article=article_id).filter(user=user_id).first()
            article_history.is_collect = is_collect
            article_history.time = timezone.localtime()
            article_history.save()
            return Response({'is_collect': article_history.is_collect, 'msg': '文章收藏更新成功！'},
                            status=status.HTTP_200_OK)
        else:
            return Response({'msg': '文章收藏更新失败！'}, status=status.HTTP_400_BAD_REQUEST)


class SectionHistoryAPIView(APIView):
    """
    笔记浏览记录
    """
    permission_classes = (AdminAllOrGuestGetPutPost,)

    @staticmethod
    def get(request):
        user_id = get_user_id_from_token(request)
        section_id = request.query_params.get('section')
        if section_id:
            # 查询指定笔记记录
            section_history = SectionHistory.objects.filter(section=section_id).filter(user=user_id).first()
            serializer = SectionHistorySerializer(instance=section_history)
        else:
            # 查询所有笔记记录
            section_history = SectionHistory.objects.filter(user=user_id)
            serializer = SectionHistorySerializer(instance=section_history, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    @staticmethod
    def post(request):
        serializer = SectionHistorySerializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            section_id = request.data.get('section_id')
            user_id = request.data.get('user')
            history = SectionHistory.objects.filter(section=section_id).filter(user=user_id).first()
            if history:
                # 找到记录，更新时间
                history.time = timezone.localtime()
                history.save()
            else:
                # 未找到，创建记录
                serializer.save()
            return Response({'msg': '浏览记录添加成功！'}, status=status.HTTP_200_OK)
        else:
            return Response({'msg': '浏览记录添加失败！'}, status=status.HTTP_400_BAD_REQUEST)

    @staticmethod
    def put(request):
        serializer = SectionHistorySerializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            section_id = request.data.get('section_id')
            user_id = request.data.get('user')
            is_collect = request.data.get('is_collect')
            section_history = SectionHistory.objects.filter(section=section_id).filter(user=user_id).first()
            section_history.is_collect = is_collect
            section_history.time = timezone.localtime()
            section_history.save()
            return Response({'is_collect': section_history.is_collect, 'msg': '文章收藏更新成功！'},
                            status=status.HTTP_200_OK)
        else:
            return Response({'msg': '文章收藏更新失败！'}, status=status.HTTP_400_BAD_REQUEST)


class StatisticsAPIView(APIView):
    """
    用户数据统计
    """
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        user_id = get_user_id_from_token(self.request)
        if user_id:
            result = dict()
            result['article_history'] = ArticleHistory.objects.filter(user=user_id).count()
            result['article_collect'] = ArticleHistory.objects.filter(user=user_id).filter(is_collect=True).count()
            result['article_comment'] = ArticleComment.objects.filter(user=user_id).count()
            result['section_history'] = SectionHistory.objects.filter(user=user_id).count()
            result['section_collect'] = SectionHistory.objects.filter(user=user_id).filter(is_collect=True).count()
            result['section_comment'] = SectionComment.objects.filter(user=user_id).count()
            return Response(result, status=status.HTTP_200_OK)
        else:
            return Response({'msg': '用户ID不能为空'}, status=status.HTTP_400_BAD_REQUEST)


class UserEchartsAPIView(APIView):
    """
    用户echarts数据接口
    """

    permission_classes = (IsAuthenticated,)

    def get(self, request):
        user_id = get_user_id_from_token(self.request)
        chart = request.query_params.get('chart')
        if user_id and chart:
            # 用户浏览趋势图
            if chart == 'trend':
                result = []
                for i in range(6, -1, -1):
                    info = dict()
                    date = datetime.now().date() - timedelta(i)
                    info['date'] = date
                    info['article_view'] = ArticleHistory.objects.filter(user=user_id).filter(time__date=date).count()
                    info['article_collect'] = ArticleHistory.objects.filter(user=user_id).filter(
                        time__date=date).filter(
                        is_collect=1).count()
                    info['article_comment'] = ArticleComment.objects.filter(user=user_id).filter(
                        time__date=date).count()
                    info['section_view'] = SectionHistory.objects.filter(user=user_id).filter(time__date=date).count()
                    info['section_collect'] = SectionHistory.objects.filter(user=user_id).filter(
                        time__date=date).filter(
                        is_collect=1).count()
                    info['section_comment'] = SectionComment.objects.filter(user=user_id).filter(
                        time__date=date).count()
                    result.append(info)
                return Response(result, status=status.HTTP_200_OK)
            # 用户浏览时间分布
            if chart == 'time':
                result = []
                article_list = []
                section_list = []
                # 查询文章记录
                for article in ArticleHistory.objects.filter(user=user_id):
                    article_list.append(article.time.astimezone().hour)
                # 查询笔记记录
                for section in SectionHistory.objects.filter(user=user_id):
                    section_list.append(section.time.astimezone().hour)
                article_count = Counter(article_list)
                section_count = Counter(section_list)
                # 初始化返回数据结构体
                for i in range(0, 24):
                    info = dict()
                    info['time'] = i
                    info['article'] = 0
                    info['section'] = 0
                    result.append(info)
                # 修改文章数统计
                for j in article_count.keys():
                    result[j]['article'] = article_count[j]
                # 修改笔记数统计
                for k in section_count.keys():
                    result[k]['section'] = section_count[k]
                return Response(result, status=status.HTTP_200_OK)
            # 用户浏览文章分布
            if chart == 'article':
                result = []
                query_data = Category.objects.filter(article__articlehistory__user=user_id).annotate(
                    count=Count('article__articlehistory__user_id'))
                query_list = []
                for i in query_data:
                    query_list.append(i.name)
                category_all = Category.objects.all()
                for category in category_all:
                    info = dict()
                    if category.name in query_list:
                        info['value'] = query_data.filter(name=category.name).first().count
                        info['name'] = category.name
                    else:
                        info['value'] = 0
                        info['name'] = category.name
                    result.append(info)
                return Response(result, status=status.HTTP_200_OK)
            # 用户浏览笔记分布
            if chart == 'note':
                result = []
                query_data = Note.objects.filter(section__sectionhistory__user=user_id).annotate(
                    count=Count('section__sectionhistory__user'))
                query_list = []
                for i in query_data:
                    query_list.append(i.name)
                for note in Note.objects.all():
                    info = dict()
                    info['name'] = note.name
                    info['max'] = SectionHistory.objects.filter(user=user_id).count()
                    if note.name in query_list:
                        info['data'] = query_data.filter(name=note.name).first().count
                    else:
                        info['data'] = 0
                    result.append(info)
                return Response(result, status=status.HTTP_200_OK)
        else:
            return Response({'msg': '请求参数错误'}, status=status.HTTP_400_BAD_REQUEST)
