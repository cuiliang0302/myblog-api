#! /bin/bash
mkdir -p logs
echo "正在启动定时任务……"
nohup python manage.py crontab >> logs/crontab.log 2>&1 &
echo "正在启动后端API服务……"
# 使用 WSGI（sync worker），与 gunicorn_conf.py 中的 worker_class='sync' 一致
# 前台运行以便容器主进程为 gunicorn，便于接收信号和查看日志
exec gunicorn DRF.wsgi:application -c gunicorn_conf.py
