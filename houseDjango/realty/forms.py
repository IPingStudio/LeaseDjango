from django import forms
from .models import realtyInfo

class realtyInfoForm(forms.ModelForm):
    class Meta:
        model = realtyInfo
        fields = '__all__'