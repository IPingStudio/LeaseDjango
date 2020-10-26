from django.shortcuts import render, reverse
from .models import houseInfo
from .forms import HouseInfoForm
from django.http import HttpResponseRedirect, HttpResponse
from django.core import serializers
from django.contrib.auth.decorators import login_required
from django.contrib.admin.options import ModelAdmin
from dicts.models import dict, dictType
from tools.query import getDict

import logging
import json


# Create your views here.
@login_required
def showHouses(request):
    logger = logging.getLogger('log')

    # logger.info('请求成功！ response_code:{}；response_headers:{}；response_body:{}')
    #
    # logger.error('请求出错：{}')
    currentHouseInfo = getHouseInfo(request.user)
    currentDic = getDict()
    context = {'houseInfos': currentHouseInfo, 'dicts': currentDic}
    return render(request, 'house/index.html', context)


@login_required
def addHouse(request):

    if request.method != "POST":
        form = HouseInfoForm()
    else:
        form = HouseInfoForm(request.POST)
        houseID = request.POST.get('houseID')
        propertyID = request.POST.get('propertyID')
        if houseInfo.objects.filter(houseID=houseID).exists():
            context = {'status': 300, 'message': '产籍号重复'}
            return HttpResponse(json.dumps(context))
        if houseInfo.objects.filter(propertyID=propertyID).exists():
            context = {'status': 300, 'message': '产权证号重复'}
            return HttpResponse(json.dumps(context))
        if form.is_valid():
            currentForm = form.save(commit=False)
            currentForm.addUser = request.user
            currentForm.save()
            ModelAdmin.log_addition(request, currentForm, '添加房屋信息')
            return HttpResponseRedirect(reverse('houses:houses'), status=200)
        else:
            error = form.errors
            context = {'error': error}
            return HttpResponse(json.dumps(context))

    context = {'form': form}
    return render(request, 'house/index.html', context)


@login_required
def editHouse(request, houseID):
    # 编辑房屋信息
    tempHouse = houseInfo.objects.get(id=houseID)
    if request.method != "POST":
        form = HouseInfoForm(instance=tempHouse)
    else:
        houseID = request.POST.get('houseID')
        propertyID = request.POST.get('propertyID')
        if tempHouse.houseID != houseID and houseInfo.objects.filter(houseID=houseID).exists():
            context = {'status': 300, 'message': '产籍号重复'}
            return HttpResponse(json.dumps(context))
        if tempHouse.propertyID != propertyID and houseInfo.objects.filter(propertyID=propertyID).exists():
            context = {'status': 300, 'message': '产权证号重复'}
            return HttpResponse(json.dumps(context))
        form = HouseInfoForm(instance=tempHouse, data=request.POST)
        if form.is_valid():
            form.save()
    return HttpResponseRedirect(reverse('houses:houses'))


@login_required
def deleteHouse(request, houseID):
    # 删除房屋信息
    tempHouse = houseInfo.objects.get(id=houseID)
    if tempHouse:
        tempHouse.delete()

    return HttpResponseRedirect(reverse('houses:houses'))


def queryHouseInfo(request, keyStr, keyValue):
    if keyStr != "" and keyValue != "":
        houses = houseInfo.objects.filter(keyStr + "=" + keyValue)
    else:
        return HttpResponse('未找到指定字段')
    context = {"houseInfos": houses}
    return HttpResponse(context)


def getHouseInfo(currentUser):
    # 获取房屋信息
    houses = houseInfo.objects.filter(addUser__id=currentUser.id)

    data = serializers.serialize('json', houses)
    print(data)
    return data

