import environ

env = environ.Env()
env.read_env('envs/.env.key')

# sitemap txt文件地址
SITE_MAP_PATH = 'static/file/sitemap.txt'

# 默认背景图片地址
BGI_URL = 'https://oss.cuiliangblog.cn/image/bg-img.jpg'

# 邮件服务器配置
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_USE_SSL = True
EMAIL_HOST = 'smtp.qq.com'
EMAIL_PORT = 465
EMAIL_HOST_USER = env.str('EMAIL_HOST_USER')
EMAIL_HOST_PASSWORD = env.str('EMAIL_HOST_PASSWORD')

# 七牛OSS存储配置
QINIU_AK = env.str('QINIU_AK')
QINIU_SK = env.str('QINIU_SK')
QINIU_BUCKET = 'cuiliangoss'
QINIU_DOMAIN = 'https://oss.cuiliangblog.cn/'

# 百度统计token
BAIDU_START_DATE = '20201101'
BAIDU_USERNAME = env.str('BAIDU_USERNAME')
BAIDU_PASSWORD = env.str('BAIDU_PASSWORD')
BAIDU_ID = '16011900'
BAIDU_TOKEN = env.str('BAIDU_TOKEN')

# 云服务器厂商
ECS_MANUFACTURER = 'tencent'  # 可选aliyun tencent
# CDN厂商
CDN_MANUFACTURER = 'tencent'  # 可选tencent

# 云资产配置
CLOUD = {
    'ECS': {
        'ALIYUN': {
            'KEY': env.str('ALIYUN_ECS_SECRET_ID'),
            'SECRET': env.str('ALIYUN_ECS_SECRETKEY')
        },
        'TENCENT': {
            'KEY': env.str('TENCENT_ECS_SECRET_ID'),
            'SECRET': env.str('TENCENT_ECS_SECRETKEY')
        },
        'LOCATION': 'ap-shanghai',
        'INSTANCE': 'ins-oh33gjqn'
    },
    'CDN': {
        'ALIYUN': {
            'KEY': env.str('ALIYUN_ECS_SECRET_ID'),
            'SECRET': env.str('ALIYUN_ECS_SECRETKEY')
        },
        'TENCENT': {
            'KEY': env.str('TENCENT_CDN_SECRET_ID'),
            'SECRET': env.str('TENCENT_CDN_SECRETKEY')
        }
    }
}

# 第三方登录 Github
AUTH = {
    'WEIBO': {
        'PC': {
            'KEY': env.str('WEIBO_PC_KEY'),
            'SECRET': env.str('WEIBO_PC_SECRET'),
        },
        'M': {
            'KEY': env.str('WEIBO_M_KEY'),
            'SECRET': env.str('WEIBO_M_SECRET'),
        }
    },
    'QQ': {
        'PC': {
            'KEY': env.str('QQ_PC_KEY'),
            'SECRET': env.str('QQ_PC_SECRET'),
        },
        'M': {
            'KEY': env.str('QQ_M_KEY'),
            'SECRET': env.str('QQ_M_SECRET'),
        }
    },
    'PAY': {
        'PC': {
            'KEY': env.str('PAY_PC_KEY'),
            'SECRET': '',
            'PRIVATE_KEY': env.str('PAY_PC_PRIVATE_KEY'),
            'PUBLIC_KEY': env.str('PAY_PC_PUBLIC_KEY'),
        },
        'M': {
            'KEY': env.str('PAY_M_KEY'),
            'SECRET': '',
            'PRIVATE_KEY': env.str('PAY_M_PRIVATE_KEY'),
            'PUBLIC_KEY': env.str('PAY_M_PUBLIC_KEY'),
        }
    },
    'GITHUB': {
        'PC': {
            'KEY': env.str('GITHUB_PC_KEY'),
            'SECRET': env.str('GITHUB_PC_SECRET'),
        },
        'M': {
            'KEY': env.str('GITHUB_M_KEY'),
            'SECRET': env.str('GITHUB_M_SECRET'),
        }
    },
    'BAIDU': {
        'PC': {
            'KEY': env.str('BAIDU_PC_KEY'),
            'SECRET': env.str('BAIDU_PC_SECRET'),
        },
        'M': {
            'KEY': env.str('BAIDU_M_KEY'),
            'SECRET': env.str('BAIDU_M_SECRET'),
        }
    },
    'MICROSOFT': {
        'PC': {
            'KEY': env.str('MICROSOFT_PC_KEY'),
            'SECRET': env.str('MICROSOFT_PC_SECRET'),
        },
        'M': {
            'KEY': env.str('MICROSOFT_M_KEY'),
            'SECRET': env.str('MICROSOFT_M_SECRET'),
        }
    },
}
