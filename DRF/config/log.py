import os.path
from pathlib import Path
from loguru import logger

LOG_DIR = os.path.join(Path(__file__).resolve().parent.parent.parent, 'logs')
info_log = os.path.join(LOG_DIR, "info.log")
error_log = os.path.join(LOG_DIR, "error.log")
# logger配置
config = {
    "rotation": "00:00",  # 每天00点生成新文件
    "encoding": "utf-8",
    "retention": "7 days",
    "backtrace": True,  # 异常回溯
    "diagnose": True
}
# logger打印sql
# LOGGING = {
#     'version': 1,
#     'disable_existing_loggers': False,
#     'handlers': {
#         'console': {
#             'level': 'DEBUG',
#             'class': 'logging.StreamHandler',
#         },
#     },
#     'loggers': {
#         'django.db.backends': {
#             'handlers': ['console'],
#             'propagate': True,
#             'level': 'DEBUG',
#         },
#     }
# }
logger.add(info_log, level='INFO', **config)
logger.add(error_log, level='ERROR', **config)
