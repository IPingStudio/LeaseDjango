from django import forms
from .models import leaseInfo

class leaseInfoForm(forms.ModelForm):
    # houseInfo = forms.ChoiceField(required=False)
    # acceptID = forms.CharField(required=False)
    # leasePayMoney = forms.CharField(required=False)
    # leaseStatus = forms.IntegerField(required=False)
    # addUser = forms.ChoiceField(required=False)

    class Meta:
        model = leaseInfo
        fields = ['acceptID', 'leaseArea', 'leaseHolder', 'holderPhone', 'holderIDType', 'holderID', 'leaseMoney', 'leasePayMoney', 'leaseFineMoney',
                  'leaseTime', 'leaseStartTime', 'leaseEndTime', 'placeName', 'manageWay', 'arbitrationUnits', 'contractNum', 'quanZheng',
                  'chanQuanXianDing', 'zhengJianQiQuan', 'yiLiuWenTi', 'chanQuanJiuFen', 'gaiBianXingZhi', 'gaiBianXingZhi', 'chengDanChengDan',
                  'qiYueGuiDing', 'shenHeWenTi', 'otherCondition', 'leaseStatus']
        # 'addUser',