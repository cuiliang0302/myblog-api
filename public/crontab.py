import re
import subprocess
from datetime import datetime
from apscheduler.schedulers.background import BackgroundScheduler
from apscheduler.triggers.cron import CronTrigger
from django.core.mail import EmailMultiAlternatives
from django_apscheduler.jobstores import DjangoJobStore
from django_apscheduler.models import DjangoJobExecution
from django.conf import settings
from loguru import logger
import logging
from account.models import UserInfo
from blog.models import Article, Section
from django.contrib.sites.models import Site


def sitemap_job():
    """
    生成网站地图
    :return:
    """
    print("生成sitemap执行时间：", datetime.now())
    logger.info('定时生成sitemap任务执行时间：{}'.format(datetime.now()))
    domain = Site.objects.get_current().domain
    url_list = []
    # 生成文章链接
    articles = Article.objects.all()
    for article in articles:
        article_url = domain + "/detail/article/" + str(article.id)
        url_list.append(article_url)
    # 生成笔记链接
    sections = Section.objects.all()
    for section in sections:
        section_url = domain + "/detail/section/" + str(section.id)
        url_list.append(section_url)
    with open(settings.SITE_MAP_PATH, 'w') as file_object:
        for i in range(len(url_list)):
            file_object.write(url_list[i] + '\n')
        file_object.write(domain + '/')
    file_object.close()
    print("sitemap生成完成！")
    logger.info('sitemap生成完成，执行时间：{}'.format(datetime.now()))


def check_ssl_job():
    """
    网站ssl证书检查
    :return:
    """
    print("检查ssl证书执行时间：", datetime.now())
    logger.info('检查ssl证书执行时间：{}'.format(datetime.now()))
    domain = Site.objects.get_current().domain
    cmd = f"curl -Ivs {domain} --connect-timeout 10"
    exitcode, output = subprocess.getstatusoutput(cmd)
    # 证书开始日期
    start_match = re.search('start date: (.*)', output)
    # print(start_match)
    start_date = datetime.strptime(start_match.group(1), "%b %d %H:%M:%S %Y GMT")
    # print("证书开始日期：", start_date)
    # 证书结束日期
    end_match = re.search('expire date: (.*)', output)
    end_date = datetime.strptime(end_match.group(1), "%b %d %H:%M:%S %Y GMT")
    # print("证书结束日期：", end_date)
    # 剩余天数
    remain_day = (end_date - datetime.now()).days
    # print("剩余天数：", remain_day)
    if remain_day <= 3:
        admin_email = UserInfo.objects.get(id=1).email
        content = """
        <body>
            <h3>证书有效期提示</h3>
            <table border="1">
              <tr>
                <th>剩余天数：</th>
                <th>{0}天</th>
              </tr>
              <tr>
                <td>证书开始日期：</td>
                <td>{1}</td>
              </tr>
              <tr>
                <td>证书结束日期：</td>
                <td>{2}</td>
              </tr>
            </table>
        </body>
        """.format(remain_day, start_date, end_date)
        subject = "[" + Site.objects.get_current().name + "] 管理员通知"
        from_email = Site.objects.get_current().name + "<cuiliangblog@qq.com>"
        msg = EmailMultiAlternatives(subject, content, from_email, [admin_email])
        msg.content_subtype = "html"
        msg.send()
    print("ssl证书检查完成！，还剩", remain_day, "天")
    logger.info('ssl证书检查完成，还剩{0}天，执行时间：{1}'.format(remain_day, datetime.now()))


def delete_old_job_executions(max_age=604_800):
    # 清理过期任务
    """This job deletes all apscheduler job executions older than `max_age` from the database."""
    DjangoJobExecution.objects.delete_old_job_executions(max_age)
    logger.info('定时清理任务执行时间：{}'.format(datetime.now()))


# 实例化调度器
scheduler = BackgroundScheduler(timezone=settings.TIME_ZONE)
# 调度器使用DjangoJobStore()
scheduler.add_jobstore(DjangoJobStore(), "default")
# 设置定时任务，选择方式为interval，时间间隔为10s
scheduler.add_job(
    sitemap_job,
    trigger=CronTrigger(hour="02", minute="00"),  # Every day
    id="sitemap_job",  # The `id` assigned to each job MUST be unique
    max_instances=5,
    replace_existing=True,
    misfire_grace_time=900,
)
scheduler.add_job(
    check_ssl_job,
    trigger=CronTrigger(hour="01", minute="00"),  # Every day
    id="check_ssl_job",  # The `id` assigned to each job MUST be unique
    max_instances=5,
    replace_existing=True,
    misfire_grace_time=900,
)
print("成功添加任务")
scheduler.add_job(
    delete_old_job_executions,
    trigger=CronTrigger(
        day_of_week="mon", hour="00", minute="00"
    ),  # Midnight on Monday, before start of the next work week.
    id="delete_old_job_executions",
    max_instances=1,
    replace_existing=True,
)
print("成功添加周期任务: 'delete_old_job_executions'")
try:
    print("开始执行调度任务...")
    scheduler.start()
    logger.info('开始执行调度任务：{}'.format(datetime.now()))
except (KeyboardInterrupt, SystemExit):
    print("停止执行调度任务...")
    scheduler.shutdown()
    logger.info('停止执行调度任务：{}'.format(datetime.now()))
logging.basicConfig()
logging.getLogger('apscheduler').setLevel(logging.DEBUG)
