# 项目base镜像文件
FROM python:3.13
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone  \
    && pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ \
    && pip install --no-cache-dir uv
COPY . /app
WORKDIR /app
RUN uv add gunicorn uvicorn && uv pip install --system -r pyproject.toml
EXPOSE 8000
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
