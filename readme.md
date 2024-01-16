# 项目简介

本项目使用Python3.11+Django4.2+Django REST Framework3.14组合开发的博客系统API后端，后端使用MySQL存储+Redis缓存，使用docker构建镜像实现CICD，详细介绍可访问[崔亮的博客关于页](https://www.cuiliangblog.cn/about)

# 接口文档
* markdown接口文档下载地址：[API接口markdown文档](https://api.cuiliangblog.cn/static/myblog.md)
* swagger接口文档查看地址： [swagger接口文档](https://api.cuiliangblog.cn/)
* Apifox在线接口文档查看地址（推荐）：[Apifox在线接口文档](https://www.apifox.cn/apidoc/shared-1cf3e9c2-ea9a-4463-983f-7b97197dc725) 访问密码 : b7sWI26j 

# 功能模块
## 内容管理

* 博客文章
* 文章分类
* 文章标签
* 博客笔记
* 笔记目录
* 猜你喜欢
* 文章归档

## 网站管理
    
* 轮播图
* 关于页
* 友情链接
* 博主信息
* 网站配置
* 数据统计

## 用户管理

* 用户登录
* 用户注册
* 找回密码
* 修改密码
* 修改联系方式
* 第三方登录
* 用户信息修改

## 行为记录
    
* 搜索记录留言记录
* 文章评论记录
* 文章收藏记录
* 笔记评论记录
* 笔记收藏记录
* 数据统计

## 示例接口

* 省份信息增删改查
* 用户信息增删改查，支持分页、排序、模糊搜索、范围搜索

## 其他定制化功能

* 对接语雀实现博客笔记同步
* 对接邮件服务器实现邮件通知发送
* 对接七牛云对象存储实现图片上传
* 对接umami、百度统计实现用户访问流量统计 
* 对接腾讯或阿里云CDN实现资源自动刷新
* 对接腾讯或阿里云获取主机资源使用率信息
* 对接微博、QQ、支付宝、微软、百度账号实现第三方登录


# 关联项目
## 博客网站后端
    
    [gitee](https://gitee.com/cuiliang0302/myblog_api)

    [github](https://github.com/cuiliang0302/myblog_api)

## 博客网站桌面端前端

    [gitee](https://gitee.com/cuiliang0302/myblog_pc)

    [github](https://github.com/cuiliang0302/myblog_pc)

## 博客网站移动端前端

    [gitee](https://gitee.com/cuiliang0302/myblog_mobile)

    [github](https://github.com/cuiliang0302/myblog_mobile)

## 博客网站管理员后台

    [gitee](https://gitee.com/cuiliang0302/myblog_admin)

    [github](https://github.com/cuiliang0302/myblog_admin)

# 项目部署
## MySQL部署

```bash
[root@aliyun opt]# mkdir -p /opt/docker/mysql
[root@aliyun opt]# cd /opt/docker/mysql/
[root@aliyun mysql]# docker run -p 3306:3306 --name mysql -v $PWD/conf:/etc/mysql/conf.d -v $PWD/logs:/logs -v $PWD/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=XXXXX -d --restart=always mysql

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

## redis部署

```bash
[root@aliyun docker]# docker run --name redis -p 6379:6379 -d --restart=always redis --requirepass XXXX
fe24cb38242ed2f1c8c7340fa1ce05f39c8fc351a7a96506c43dff41ca0774bb
[root@aliyun docker]# docker exec -it redis redis-cli
127.0.0.1:6379> auth 123.com
OK
```

## 后端API部署
```bash
docker build -t myblog_api:v1 . 
docker run --name myblog_api -d -p 8888:8888 --restart always --link mysql --link redis myblog_api:v1
```

## NGINX部署
* ningx配置文件
```bash
server {
    listen       80;
    server_name  ~^.*$;
    location / {
          include uwsgi_params;
          uwsgi_pass drf:8888;
          uwsgi_ignore_client_abort on;
    }
}
```
* nginx容器启动
```bash
docker run --name nginx -d -p 80:80 -v $PWD/nginx.conf:/etc/nginx/conf.d/api.conf --restart always --link myblog_api nginx
```
# 注意事项

## 关于env以及密钥配置
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

* envs/.env.dev(存放开发模式下相关配置)
```bash
DEBUG=True
SECRET_KEY='django-insecure-************'
ALLOWED_HOSTS=*
# DATABASE_URL='sqlite:///db.sqlite3'
DATABASE_URL=mysql://mysql用户名:mysql密码@mysql地址:3306/数据库名称?charset=utf8mb4
CACHE_URL=rediscache://Redis地址:6379/9?client_class=django_redis.client.DefaultClient&password=Redis密码
# Redis缓存过期时间
DEFAULT_CACHE_RESPONSE_TIMEOUT=1
```

* envs/.env.dev(存放生产模式下相关配置)
```bash
DEBUG=False
SECRET_KEY='django-insecure-************'
ALLOWED_HOSTS=api.cuiliangblog.cn,127.0.0.1
DATABASE_URL=mysql://mysql用户名:mysql密码@mysql地址:3306/数据库名称?charset=utf8mb4
CACHE_URL=rediscache://Redis地址:6379/9?client_class=django_redis.client.DefaultClient&password=Redis密码
# Redis缓存过期时间
DEFAULT_CACHE_RESPONSE_TIMEOUT=3600
```

* envs/.env.key(存放密钥配置，如果不使用相关功能可将内容填写为'')
```bash
# 语雀密钥
YUQUE_TOKEN=''
# 邮件密钥
EMAIL_HOST_USER=''
EMAIL_HOST_PASSWORD=''
# 七牛云对象存储
QINIU_AK=''
QINIU_SK=''
# umami统计
UMAMI_USERNAME=''
UMAMI_PASSWORD=''
# 百度统计
BAIDU_USERNAME=''
BAIDU_PASSWORD=''
BAIDU_TOKEN=''
# 腾讯cdn
TENCENT_CDN_SECRET_ID=''
TENCENT_CDN_SECRETKEY=''
# 腾讯ecs
TENCENT_ECS_SECRET_ID=''
TENCENT_ECS_SECRETKEY=''
# 阿里云cdn
ALIYUN_CDN_SECRET_ID=''
ALIYUN_CDN_SECRETKEY=''
# 阿里云ecs
ALIYUN_ECS_SECRET_ID=''
ALIYUN_ECS_SECRETKEY=''
# 第三方登录
WEIBO_PC_KEY=''
WEIBO_PC_SECRET=''
WEIBO_M_KEY=''
WEIBO_M_SECRET=''
QQ_PC_KEY=''
QQ_PC_SECRET=''
QQ_M_KEY=''
QQ_M_SECRET=''
PAY_PC_KEY=''
PAY_PC_PRIVATE_KEY=''
PAY_PC_PUBLIC_KEY=''
PAY_M_KEY=''
PAY_M_PRIVATE_KEY=''
PAY_M_PUBLIC_KEY=''
GITHUB_PC_KEY=''
GITHUB_PC_SECRET=''
GITHUB_M_KEY=''
GITHUB_M_SECRET=''
BAIDU_PC_KEY=''
BAIDU_PC_SECRET=''
BAIDU_M_KEY=''
BAIDU_M_SECRET=''
MICROSOFT_PC_KEY=''
MICROSOFT_PC_SECRET=''
MICROSOFT_M_KEY=''
MICROSOFT_M_SECRET=''
```

## admin密码重置
```bash
docker exec -it myblog_api bash
python manage.py changepassword admin
```

## 更新admin静态资源文件
```bash
docker exec -it myblog_api bash
python manage.py collectstatic
```

## 数据库定时备份
* 创建备份目录
```bash
mkdir -p /opt/backup/myblog 
```
* 创建备份脚本
```bash
vim myblog-db-back.sh
#!/bin/bash

# 设置数据库连接信息
db_user="root"
db_password="123.com"
db_name="myblog"

# 设置备份文件的目录
backup_dir="/opt/backup/myblog"

# 设置备份文件的名称，格式为：backup-年月日-时分秒.sql
backup_file="myblog-$(date +"%Y%m%d-%H%M%S").sql"

# 使用 mysqldump 命令执行数据库备份
docker exec mysql mysqldump -u $db_user -p$db_password $db_name > $backup_dir/$backup_file

# 打印备份完成信息
echo "备份完成: $backup_file"

# 删除7天前的备份文件
find $backup_dir -type f -name "backup-*" -mtime +6 -exec rm {} \;

# 打印清理完成信息
echo "7天前备份文件清理完成"
```

* 授予运行权限
```bash
chmod u+x myblog-db-back.sh 
```

* 添加定时任务
```bash
crontab -e
0 1 * * * sh /opt/backup/myblog-db-back.sh 
```