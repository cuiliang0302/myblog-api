# Generated by Django 3.2 on 2022-09-03 05:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0005_section_blog_sectio_title_2d7f6a_idx'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='section',
            options={'ordering': ('-created_time',), 'verbose_name': '笔记内容', 'verbose_name_plural': '笔记内容'},
        ),
    ]