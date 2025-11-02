# 项目base镜像文件
FROM python:3.13
USER root
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime  \
    && echo 'Asia/Shanghai' >/etc/timezone
ADD . /opt/DRF/
RUN pip install -r /opt/DRF/requirements.txt && pip install uwsgi
WORKDIR /opt/DRF/
# 开发环境
#EXPOSE 8000
#CMD ["python","manage.py","runserver","0.0.0.0:8000"]
# 测试环境
#EXPOSE 8000
#ENV PROJECT_ENV prod
#CMD ["python","manage.py","runserver","0.0.0.0:8000"]
# 线上环境
EXPOSE 8000
ENV PROJECT_ENV=prod
ENV DJANGO_SETTINGS_MODULE=DRF.settings
CMD ["sh","start.sh"]
