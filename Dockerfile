# 项目dockerfile镜像文件
#FROM python:3.10
FROM registry.cn-hangzhou.aliyuncs.com/myblog_env/myblog_env:latest
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone && pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
ADD . /opt/myblog_api/
RUN pip install -r /opt/myblog_api/requirements.txt && pip install uwsgi
WORKDIR /opt/myblog_api/
# 开发环境
#EXPOSE 8000
#CMD ["python","manage.py","runserver","0.0.0.0:8000"]
# 测试环境
#EXPOSE 8000
#CMD ["PROJECT_ENV=prod","python","manage.py","runserver","0.0.0.0:8000"]
# 线上环境
EXPOSE 8888
ENV PROJECT_ENV prod
ENV DJANGO_SETTINGS_MODULE myblog_api.settings
CMD ["sh","start.sh"]
