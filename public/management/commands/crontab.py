from apscheduler.schedulers.blocking import BlockingScheduler
from django.core.management.base import BaseCommand
from django_apscheduler import util
import re
import subprocess
from datetime import datetime
from apscheduler.triggers.cron import CronTrigger
from django.core.mail import EmailMultiAlternatives
from django_apscheduler.jobstores import DjangoJobStore
from django_apscheduler.models import DjangoJobExecution
from django.conf import settings
from loguru import logger
from account.models import UserInfo
from blog.models import Article, Section
from django.contrib.sites.models import Site


def sitemap_job():
    logger.info('定时生成sitemap任务开始执行')
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
    logger.info('定时生成sitemap任务执行完毕')


# def check_ssl_job():
#     """
#     网站ssl证书检查
#     :return:
#     """
#     logger.info('检查ssl证书任务开始执行')
#     domain = Site.objects.get_current().domain
#     # print(domain)
#     cmd = f"curl -Ivs https://{domain} --connect-timeout 10"
#     exitcode, output = subprocess.getstatusoutput(cmd)
#     # 证书开始日期
#     start_match = re.search('start date: (.*)', output)
#     # print(start_match)
#     start_date = datetime.strptime(start_match.group(1), "%b %d %H:%M:%S %Y GMT")
#     # print("证书开始日期：", start_date)
#     # 证书结束日期
#     end_match = re.search('expire date: (.*)', output)
#     end_date = datetime.strptime(end_match.group(1), "%b %d %H:%M:%S %Y GMT")
#     # print("证书结束日期：", end_date)
#     # 剩余天数
#     remain_day = (end_date - datetime.now()).days
#     # print("剩余天数：", remain_day)
#     if remain_day <= 3:
#         admin_email = UserInfo.objects.get(id=1).email
#         content = """
#         <body>
#             <h3>证书有效期提示</h3>
#             <table border="1">
#               <tr>
#                 <th>剩余天数：</th>
#                 <th>{0}天</th>
#               </tr>
#               <tr>
#                 <td>证书开始日期：</td>
#                 <td>{1}</td>
#               </tr>
#               <tr>
#                 <td>证书结束日期：</td>
#                 <td>{2}</td>
#               </tr>
#             </table>
#         </body>
#         """.format(remain_day, start_date, end_date)
#         subject = "[" + Site.objects.get_current().name + "] 管理员通知"
#         from_email = Site.objects.get_current().name + "<cuiliangblog@qq.com>"
#         msg = EmailMultiAlternatives(subject, content, from_email, [admin_email])
#         msg.content_subtype = "html"
#         msg.send()
#     logger.info('ssl证书检查完成，还剩{0}天，执行时间：{1}'.format(remain_day, datetime.now()))


@util.close_old_connections
def delete_old_job_executions(max_age=604_800):
    DjangoJobExecution.objects.delete_old_job_executions(max_age)


class Command(BaseCommand):
    help = "Runs APScheduler."

    def handle(self, *args, **options):
        scheduler = BlockingScheduler(timezone=settings.TIME_ZONE)
        scheduler.add_jobstore(DjangoJobStore(), "default")

        scheduler.add_job(
            sitemap_job,
            trigger=CronTrigger(hour="02", minute="00"),  # Every 10 seconds
            id="sitemap_job",  # The `id` assigned to each job MUST be unique
            max_instances=5,
            replace_existing=True,
            misfire_grace_time=60
        )
        logger.info("添加sitemap_job任务成功")

        # scheduler.add_job(
        #     check_ssl_job,
        #     trigger=CronTrigger(hour="01", minute="00"),  # Every 10 seconds
        #     # trigger=CronTrigger(second='*/10'),  # Every 10 seconds
        #     id="check_ssl_job",  # The `id` assigned to each job MUST be unique
        #     max_instances=5,
        #     replace_existing=True,
        #     misfire_grace_time=60
        # )
        # logger.info("添加check_ssl_job任务成功")

        scheduler.add_job(
            delete_old_job_executions,
            trigger=CronTrigger(
                day_of_week="mon", hour="00", minute="00"
            ),  # Midnight on Monday, before start of the next work week.
            id="delete_old_job_executions",
            max_instances=1,
            replace_existing=True
        )
        logger.info("添加delete_old_job_executions任务成功")

        try:
            logger.info("scheduler开始执行...")
            scheduler.start()
        except KeyboardInterrupt:
            logger.info("scheduler停止执行...")
            scheduler.shutdown()
            logger.info("Scheduler成功停止!")
