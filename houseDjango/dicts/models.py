from django.db import models

# Create your models here.
class dictType(models.Model):
    # 字典类型
    label = models.CharField(max_length=20)
    sign = models.CharField(max_length=20)
    addedDate = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = '字典类型'
        verbose_name_plural = '字典类型'
        db_table = 'dict_type'
    def __str__(self):
        return self.label

class dict(models.Model):
    # 字典
    type = models.ForeignKey(dictType, models.PROTECT)
    label = models.CharField(max_length=20)
    addedDate = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'dict'
        verbose_name = '字典'
        verbose_name_plural = '字典'
    def __str__(self):
        return self.label