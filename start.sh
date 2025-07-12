#! /bin/bash
mkdir logs
echo "正在启动后端API服务……"
nohup gunicorn DRF.asgi:application -k uvicorn.workers.UvicornWorker -c gunicorn_conf.py > logs/django.log 2>&1 &
sleep 5
echo "正在启动定时任务……"
nohup python manage.py crontab > logs/crontab.log 2>&1 &
sleep 5
echo "服务启动成功！"
tail -f logs/django.log
