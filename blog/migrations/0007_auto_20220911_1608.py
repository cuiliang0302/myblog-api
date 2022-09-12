# Generated by Django 3.2 on 2022-09-11 08:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0006_alter_section_options'),
    ]

    operations = [
        migrations.AddField(
            model_name='note',
            name='description',
            field=models.CharField(blank=True, max_length=100, null=True, verbose_name='描述'),
        ),
        migrations.AddField(
            model_name='note',
            name='document_count',
            field=models.IntegerField(default=0, verbose_name='文档数'),
        ),
        migrations.AddField(
            model_name='note',
            name='namespace',
            field=models.CharField(default=1, max_length=50, verbose_name='笔记名称空间'),
            preserve_default=False,
        ),
    ]
