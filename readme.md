## 项目简介

### 项目概述
本项目使用Python3.10+Django3.2+Django REST Framework3.13组合开发的博客系统API后端，后端使用MySQL存储+Redis缓存，使用docker构建镜像实现自动发布，详细介绍可访问[崔亮的博客关于页](https://www.cuiliangblog.cn/about)

### 接口文档
* markdown文档下载地址：[API接口markdown文档](https://api.cuiliangblog.cn/static/myblog.md)
* 在线接口文档：链接: https://www.apifox.cn/apidoc/shared-1cf3e9c2-ea9a-4463-983f-7b97197dc725  访问密码 : b7sWI26j 

### 功能模块
* 内容管理
    
    包含博客文章详细内容查看、文章分类、文章标签、博客笔记、笔记目录、猜你喜欢、文章归档等功能。
* 网站管理
    
    包含轮播图、关于页、友情链接、博主信息、网站配置、数据统计等功能。
* 用户管理
    
    包含用户登录、用户注册、找回密码、修改密码、修改联系方式、第三方登录、用户信息修改等功能。
* 行为记录
    
    包含搜索记录、留言记录、文章评论记录、文章收藏记录、笔记评论记录、笔记收藏记录、数据统计等功能

### 关联项目
* 博客网站后端
    
    [gitee](https://gitee.com/cuiliang0302/myblog_api)

    [github](https://github.com/cuiliang0302/myblog_api)

* 博客网站桌面端前端

    [gitee](https://gitee.com/cuiliang0302/myblog_pc)

    [github](https://github.com/cuiliang0302/myblog_pc)

* 博客网站移动端前端

    [gitee](https://gitee.com/cuiliang0302/myblog_mobile)

    [github](https://github.com/cuiliang0302/myblog_mobile)

* 博客网站管理员后台

    [gitee](https://gitee.com/cuiliang0302/myblog_admin)

    [github](https://github.com/cuiliang0302/myblog_admin)

## 项目部署
### MySQL部署

```bash
[root@aliyun opt]# mkdir -p /opt/docker/mysql
[root@aliyun opt]# cd /opt/docker/mysql/
[root@aliyun mysql]# docker run -p 3306:3306 --name mysql -v $PWD/conf:/etc/mysql/conf.d -v $PWD/logs:/logs -v $PWD/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123.com -d --restart=always mysql

# 创建数据库
mysql> CREATE DATABASE myblog DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
Query OK, 1 row affected, 2 warnings (0.01 sec)

mysql> show databases;
# 导入数据
mysql> use myblog;
Database changed
mysql> source /root/myblog.sql;
mysql> show tables;
```

### redis部署

```bash
[root@aliyun docker]# docker run --name redis -p 6379:6379 -d --restart=always redis --requirepass 123.com
fe24cb38242ed2f1c8c7340fa1ce05f39c8fc351a7a96506c43dff41ca0774bb
[root@aliyun docker]# docker exec -it redis redis-cli
127.0.0.1:6379> auth 123.com
OK
```

### 后端API部署
```bash
docker build -t myblog_api:v1 . 
docker run --name myblog_api -d -p 8888:8888 --restart always --link mysql --link redis myblog_api:v1
```

### NGINX部署
* ningx配置文件
```bash
user root;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;
# Load dynamic modules. See /usr/share/doc/nginx/README.dynamic.
include /usr/share/nginx/modules/*.conf;
events {
    worker_connections 1024;
}
http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';
    access_log  /var/log/nginx/access.log  main;
    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;
    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;
    include /etc/nginx/conf.d/*.conf;
    server {
        listen       80;
        server_name  ~^.*$;
        location / {
              include uwsgi_params;
              uwsgi_pass drf:8888;
              uwsgi_ignore_client_abort on;
        }
    }
}
```
* nginx容器启动
```bash
docker run --name nginx -d -p 80:80 -v $PWD/nginx.conf:/etc/nginx/nginx.conf --restart always --link myblog_api nginx
```
## 注意事项

### 关于env以及密钥配置
本项目使用django-environ开发与生产环境、代码与密钥拆分，在启动项目时，需要在项目myblog_api根目录下手动创建envs目录
```bash
(venv) ➜  myblog_api git:(master) ✗ ls
Dockerfile       __pycache__      account          api              blog             envs             logs             manage.py        management       myblog_api       public           readme.md        record           requirements.txt static           templates        uwsgi.ini        venv
(venv) ➜  myblog_api git:(master) ✗ cd envs/                       
(venv) ➜  envs git:(master) ✗ ls -la
total 32
-rw-r--r--   1 cuiliang  staff   373 May 22 18:00 .env.dev
-rw-r--r--   1 cuiliang  staff  5403 May 22 11:23 .env.key
-rw-r--r--   1 cuiliang  staff   580 May 22 17:24 .env.prod
```

* .env.dev(存放开发模式下相关配置)
```bash
DEBUG=True
SECRET_KEY='django-insecure-************'
ALLOWED_HOSTS=*
# DATABASE_URL='sqlite:///db.sqlite3'
DATABASE_URL=mysql://mysql用户名:mysql密码@mysql地址:3306/数据库名称?charset=utf8mb4
CACHE_URL=rediscache://Redis地址:6379/9?client_class=django_redis.client.DefaultClient&password=Redis密码
DEFAULT_CACHE_RESPONSE_TIMEOUT=1
```

* .env.dev(存放生产模式下相关配置)
```bash
DEBUG=False
SECRET_KEY='django-insecure-************'
ALLOWED_HOSTS=api.cuiliangblog.cn,127.0.0.1
DATABASE_URL=mysql://mysql用户名:mysql密码@mysql地址:3306/数据库名称?charset=utf8mb4
CACHE_URL=rediscache://Redis地址:6379/9?client_class=django_redis.client.DefaultClient&password=Redis密码
DEFAULT_CACHE_RESPONSE_TIMEOUT=3600
```

* .env.key(存放密钥配置)
```bash
EMAIL_HOST_USER=邮箱用户名
EMAIL_HOST_PASSWORD=邮箱密码
QINIU_AK=七牛对象存储AK
QINIU_SK=七牛对象存储SK
BAIDU_USERNAME=百度统计用户名
BAIDU_PASSWORD=百度统计密码
BAIDU_TOKEN=百度统计token
TENCENT_SECRETID=腾讯云ID
TENCENT_SECRETKEY=腾讯云密钥
ALIYUN_KEYID=阿里云ID
ALIYUN_SECRET=阿里云密钥
WEIBO_PC_KEY=微博手机端OAuth登录key
WEIBO_PC_SECRET=微博手机端OAuth登录secret
WEIBO_M_KEY=
WEIBO_M_SECRET=
QQ_PC_KEY=QQ
QQ_PC_SECRET=
QQ_M_KEY=
QQ_M_SECRET=
PAY_PC_KEY=支付宝
PAY_PC_PRIVATE_KEY=
PAY_PC_PUBLIC_KEY=
PAY_M_KEY=
PAY_M_PRIVATE_KEY=
PAY_M_PUBLIC_KEY=
GITHUB_PC_KEY=github
GITHUB_PC_SECRET=
GITHUB_M_KEY=
GITHUB_M_SECRET=
BAIDU_PC_KEY=百度
BAIDU_PC_SECRET=
BAIDU_M_KEY=
BAIDU_M_SECRET=
MICROSOFT_PC_KEY=微软
MICROSOFT_PC_SECRET=
MICROSOFT_M_KEY=
MICROSOFT_M_SECRET=
```

### admin密码重置
```bash
docker exec -it myblog_api bash
python manage.py changepassword admin
```

### 更新admin静态资源文件
```bash
docker exec -it myblog_api bash
python manage.py collectstatic
```