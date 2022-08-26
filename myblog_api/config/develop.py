# 开发环境配置
import os
from myblog_api.settings import BASE_DIR

# 静态资源目录
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "static")
]
# DRF缓存扩展配置
REST_FRAMEWORK_EXTENSIONS = {
    # 默认缓存时间
    'DEFAULT_CACHE_RESPONSE_TIMEOUT': 0,
    # 缓存存储
    'DEFAULT_USE_CACHE': 'default'
}
