from django.db import models


# Create your models here.
class realtyInfo(models.Model):
    institutionName = models.CharField('机构名称', max_length=40)
    officeAddress = models.CharField('办公地址', max_length=40)
    lawPerson = models.CharField('法定代表人', max_length=10)
    vilidityDateStart = models.DateField('有效期开始')
    vilidityDateEnd = models.DateField('有效期结束')
    certificateText = models.CharField('证书经字', max_length=10)
    certificateNum = models.CharField('证书号', max_length=10)

    addedTime = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = '房地产经纪机构'
        verbose_name_plural = '房地产经纪机构'
    def __str__(self):
        return self.institutionName