from django.db import models
from dicts.models import dict
from house.models import houseInfo
from users.models import userProfile


# Create your models here.

class leaseInfo(models.Model):
    house = models.ForeignKey(houseInfo, on_delete=models.SET_NULL, null=True)
    acceptID = models.CharField('受理编号', max_length=20, help_text='受理编号', null=True, blank=True)
    # leaseHouseID = models.CharField(max_length=20, help_text='产籍号')
    # leaseHouseOwner = models.CharField(max_length=20, help_text='产权人')
    # ownerIDType = models.IntegerField(help_text='产权人证件类型_Dict')
    # ownerID = models.CharField(max_length=20, help_text='产权人证件号码')
    # ownerPhone = models.CharField(max_length=20, help_text='产权人联系电话')
    # leaseHouseArea = models.FloatField(max_length=10, help_text='房屋面积')
    leaseArea = models.CharField('租凭面积', max_length=10, help_text='租凭面积')
    leaseHolder = models.CharField('承租人', max_length=20, help_text='承租人')
    holderPhone = models.CharField('承租人电话', max_length=20, help_text='承租人电话', null=True, blank=True)
    holderIDType = models.IntegerField('承租人证件类型', help_text='承租人证件类型_Dict')
    holderID = models.CharField('承租人证件号码', max_length=20, help_text='承租人证件号码')
    leaseMoney = models.CharField('租凭金额', max_length=10, help_text='租凭金额')
    leasePayMoney = models.CharField('缴款金额', max_length=20, help_text='缴款金额', null=True, blank=True)
    leaseFineMoney = models.FloatField('罚款金额', max_length=10, help_text='罚款金额')
    leaseTime = models.IntegerField('租凭期限', help_text='租凭期限')
    leaseStartTime = models.DateField('租凭开始日期', help_text='租凭开始日期')
    leaseEndTime = models.DateField('租凭结束日期', help_text='租凭结束日期')
    placeName = models.CharField('场所名称', max_length=20, help_text='场所名称')
    manageWay = models.IntegerField('经营方式', help_text='经营方式_Dict')
    arbitrationUnits = models.CharField('仲裁单位', max_length=20, help_text='仲裁单位', null=True, blank=True)
    contractNum = models.IntegerField('合同数量', help_text='合同数量')

    quanZheng = models.BooleanField('权证是否相符', help_text='权证是否相符')
    chanQuanXianDing = models.BooleanField('产权有无限定条件', help_text='产权有无限定条件')
    zhengJianQiQuan = models.BooleanField('证件是否齐全', help_text='证件是否齐全')
    yiLiuWenTi = models.BooleanField('有无遗留问题', help_text='有无遗留问题')
    chanQuanJiuFen = models.BooleanField('有无产权纠纷', help_text='有无产权纠纷')
    gaiBianXingZhi = models.BooleanField('是否改变性质', help_text='是否改变性质')
    chengDanChengDan = models.BooleanField('乙方是否符合承担条件', help_text='乙方是否符合承担条件')
    qiYueGuiDing = models.BooleanField('契约签订是否符合规定', help_text='契约签订是否符合规定')
    shenHeWenTi = models.BooleanField('审核中有无发现问题', help_text='审核中有无发现问题')
    otherCondition = models.TextField('其他情况', max_length=50, help_text='其他情况')
    addUser = models.ForeignKey(userProfile, models.PROTECT)
    leaseStatus = models.IntegerField('状态', help_text='状态_Dict', null=True, blank=True)

    class Meta:
        db_table = 'lease_info'
        verbose_name = '租凭信息'
        verbose_name_plural = '租凭信息'
    def __str__(self):
        return self.house.houseID + ' ' + self.house.houseOwner + ' ' + self.leaseHolder
