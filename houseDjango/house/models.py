from django.db import models


from users.models import userProfile
# Create your models here.


def get_superUser():
    superUser = userProfile.objects.get(username='chengzhouyun')
    return superUser.id


class houseInfo(models.Model):
    # 房屋信息
    houseID = models.CharField('产籍号', max_length=20, help_text='产籍号')
    propertyID = models.CharField('产权证号', max_length=20, help_text='产权证号')
    houseOwner = models.CharField('产权人', max_length=20, help_text='产权人')
    ownerPhone = models.CharField('联系电话', max_length=20, help_text='联系电话', blank=True)
    IDType = models.IntegerField('证件类型', help_text='证件类型_Dict')
    IDNum = models.CharField('证件号码', max_length=20, help_text='证件号码')
    houseAdd = models.CharField('房屋坐落', max_length=30, help_text='房屋坐落')
    houseArea = models.FloatField('房屋面积', max_length=10, help_text='房屋面积')
    houseUse = models.IntegerField('房屋用途', help_text='房屋用途_Dict')
    houseStructure = models.IntegerField('房屋结构', help_text='房屋结构_Dict')
    landArea = models.FloatField('占地面积', max_length=10, help_text='占地面积')
    propertyType = models.IntegerField('产别', help_text='产别')
    addUser = models.ForeignKey(userProfile, on_delete=models.SET_DEFAULT, default=get_superUser)

    class Meta:
        db_table = 'house_info'
        verbose_name = '房屋信息'
        verbose_name_plural = '房屋信息'

    def __str__(self):
        return self.houseID + "  " + self.houseOwner



