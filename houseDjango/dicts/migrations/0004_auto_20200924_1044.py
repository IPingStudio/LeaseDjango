# Generated by Django 3.1.1 on 2020-09-24 10:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('dicts', '0003_auto_20200916_0915'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='dict',
            options={'verbose_name': '字典', 'verbose_name_plural': '字典'},
        ),
        migrations.AlterModelOptions(
            name='dicttype',
            options={'verbose_name': '字典类型', 'verbose_name_plural': '字典类型'},
        ),
    ]
