from django import forms
from .models import houseInfo


class HouseInfoForm(forms.ModelForm):
    houseID = forms.CharField(
        error_messages={'required': '产籍号不能为空'}
    )

    class Meta:
        model = houseInfo
        fields = ['id', 'houseID', 'propertyID', 'houseOwner', 'ownerPhone', 'IDType', 'IDNum', 'houseAdd', 'houseArea',
                  'houseUse', 'houseStructure', 'landArea', 'propertyType']
