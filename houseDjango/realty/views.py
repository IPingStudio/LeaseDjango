from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, reverse
from .models import realtyInfo
from dicts.models import dict
from django.core import serializers

from tools.query import getDict
from .forms import realtyInfoForm

# Create your views here.
def showRealtyInfos(request):
    context = {'realtyInfos': getRealtyInfo(), 'dicts': getDict()}
    return render(request, 'realty/index.html', context)


def addRealtyInfo(request):
    if request.method != 'POST':
        form = realtyInfoForm()
    else:
        form = realtyInfoForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('realtys:realtys'))

    context = {'form': form}
    return render(request, 'realty/index.html', context)


def exitRealtyInfo(request, realtyID):
    realty = realtyInfo.objects.get(id=realtyID)
    if request.method != 'POST':
        form = realtyInfoForm(instance=realty)
    else:
        form = realtyInfoForm(instance=realty, data=request.POST)
        if form.is_valid():
            form.save()
        return HttpResponseRedirect(reverse('realtys:realtys'))


def deleteRealtyInfo(request, realtyID):
    realty = realtyInfo.objects.get(id=realtyID)
    if realty:
        realty.delete()
    return HttpResponseRedirect(reverse('realtys:realtys'))


def getRealtyInfo():
    # 获取房屋信息
    realty = realtyInfo.objects.filter()

    data = serializers.serialize('json', realty)
    return data
