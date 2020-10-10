# Generated by Django 3.1.1 on 2020-09-24 10:44

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='houseInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('houseID', models.CharField(help_text='产籍号', max_length=20)),
                ('propertyID', models.CharField(help_text='产权证号', max_length=20)),
                ('houseOwner', models.CharField(help_text='产权人', max_length=20)),
                ('ownerPhone', models.CharField(help_text='联系电话', max_length=20)),
                ('IDType', models.IntegerField(help_text='证件类型_Dict')),
                ('IDNum', models.CharField(help_text='证件号码', max_length=20)),
                ('houseAdd', models.CharField(help_text='房屋坐落', max_length=30)),
                ('houseArea', models.FloatField(help_text='房屋面积', max_length=10)),
                ('houseUse', models.IntegerField(help_text='房屋用途_Dict')),
                ('houseStructure', models.IntegerField(help_text='房屋结构_Dict')),
                ('landArea', models.FloatField(help_text='占地面积', max_length=10)),
                ('propertyType', models.IntegerField(help_text='产别')),
            ],
            options={
                'verbose_name': '房屋信息',
                'verbose_name_plural': '房屋信息',
                'db_table': 'house_info',
            },
        ),
    ]
