from django.db import models

# Create your models here.


class LogInfo(models.Model):
    modelName = models.CharField('模块名称', max_length=20)
    type = models.IntegerField('类型')


