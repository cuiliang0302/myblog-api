from django.contrib import admin
from django.contrib.sites.models import Site

admin.site.site_header = Site.objects.get_current().name + '后台管理'  # 设置header
admin.site.site_title = '后台管理'  # 设置title
