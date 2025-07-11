from DRF.config.simpleui import *
from DRF.config.log import *
from DRF.config.other import *
import datetime
import os
from pathlib import Path
import environ

BASE_DIR = Path(__file__).resolve().parent.parent
env = environ.Env()
# 如果PROJECT_ENV=prod,读取.env.prod文件，否则读取.env.dev文件。
env_name = env.str('PROJECT_ENV', 'dev')
env.read_env(str(BASE_DIR) + '/envs/.env.%s' % env_name)

INSTALLED_APPS = [
    'simpleui',  # admin UI
    'corsheaders',  # 允许跨域
    'django_apscheduler',  # 定时任务
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sites',
    'django.contrib.sitemaps',  # 网站地图
    'mdeditor',  # 使用markdown扩展
    'rest_framework',
    'rest_framework_simplejwt',
    'django_filters',
    'public',
    'blog',
    'account',
    'management',
    'record',
]

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'DRF.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                # 媒体资源
                'django.template.context_processors.media',
            ],
        },
    },
]

WSGI_APPLICATION = 'DRF.wsgi.application'

# 登录认证后端配置
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

SITE_ID = 1
LANGUAGE_CODE = 'zh-Hans'

TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# 静态文件存放位置
STATIC_URL = '/static/'

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# DRF认证
REST_FRAMEWORK = {
    # 全局认证
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.BasicAuthentication',  # 基本认证
        'rest_framework.authentication.SessionAuthentication',  # session认证
        'rest_framework_simplejwt.authentication.JWTAuthentication',  # POST请求的Token验证
    ),
    'DEFAULT_FILTER_BACKENDS': ['django_filters.rest_framework.DjangoFilterBackend'],
    # 全局默认权限
    'DEFAULT_PERMISSION_CLASSES': (
        'public.permissions.AdminAllOrGuestGet',  # 默认管理员拥有全部权限,所有用户允许GET请求，
    )
}

# JWT配置
SIMPLE_JWT = {
    # 访问令牌有效期，默认5分钟
    'ACCESS_TOKEN_LIFETIME': datetime.timedelta(days=15),
    # 刷新令牌有效期，默认14天
    'REFRESH_TOKEN_LIFETIME': datetime.timedelta(days=30),
    # 可选：每次刷新后生成新刷新令牌
    'ROTATE_REFRESH_TOKENS': True,
    # 可选：刷新后旧令牌加入黑名单
    'BLACKLIST_AFTER_ROTATION': True,
}
CORS_ALLOWED_ORIGINS = [
    'http://127.0.0.1:8000',
    'http://127.0.0.1:3000',
    'https://api.cuiliangblog.cn',
    'https://www.cuiliangblog.cn',
    'https://m.cuiliangblog.cn',
]
# CSRF 可信来源
CSRF_TRUSTED_ORIGINS = (
    'http://127.0.0.1:8000',
    'http://127.0.0.1:3000',
    'https://api.cuiliangblog.cn',
)
# 允许携带 cookie
CORS_ALLOW_CREDENTIALS = True

# 自定义user表扩展系统用户表
AUTH_USER_MODEL = 'account.UserInfo'

# 登录认证后端
AUTHENTICATION_BACKENDS = ('django.contrib.auth.backends.AllowAllUsersModelBackend',  # 创建用户不自动关联数据库的is_active
                           'django.contrib.auth.backends.ModelBackend',  # 指定Django的backend类
                           )

# 使用vue资源文件
TEMPLATES[0]['DIRS'] += (
    os.path.join(BASE_DIR, 'static', 'dist'),
)
# 设置redis存储django的session信息
SESSION_ENGINE = "django.contrib.sessions.backends.cache"
SESSION_CACHE_ALIAS = "default"
# 开发与生产环境变量
DEBUG = env.bool('DEBUG', False)
ALLOWED_HOSTS = env.list('ALLOWED_HOSTS')
SECRET_KEY = env.str('SECRET_KEY')

DATABASES = {
    'default': env.db_url('DATABASE_URL')
}
# 设置redis作为django的缓存设置
CACHES = {
    'default': env.cache(),
}

# 定时任务配置
APSCHEDULER_TIMEZONE = 'Asia/Shanghai'
APSCHEDULER_DATETIME_FORMAT = "N j, Y, f:s a"
APSCHEDULER_RUN_NOW_TIMEOUT = 300
# DRF缓存扩展配置
REST_FRAMEWORK_EXTENSIONS = {
    # 默认缓存时间
    'DEFAULT_CACHE_RESPONSE_TIMEOUT': env.int('DEFAULT_CACHE_RESPONSE_TIMEOUT'),
    # 缓存存储
    'DEFAULT_USE_CACHE': 'default'
}
# Django使用redis缓存配置
if env.cache(default=False):
    # 设置redis作为django的缓存设置
    CACHES = {
        'default': env.cache(),
    }
    # 设置redis存储django的session信息
    SESSION_ENGINE = "django.contrib.sessions.backends.cache"
    SESSION_CACHE_ALIAS = "default"
if env_name == 'dev':  # 开发环境
    # 静态资源目录
    STATICFILES_DIRS = [
        os.path.join(BASE_DIR, "static")
    ]
    # STATIC_ROOT = os.path.join(BASE_DIR, 'static')
else:  # 生产环境
    # 指定样式收集目录
    STATIC_ROOT = os.path.join(BASE_DIR, 'static')
