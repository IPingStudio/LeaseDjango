# Generated by Django 3.1.1 on 2020-09-26 16:06

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('lease', '0003_auto_20200926_1557'),
    ]

    operations = [
        migrations.RenameField(
            model_name='leaseinfo',
            old_name='houseInfo',
            new_name='house',
        ),
    ]