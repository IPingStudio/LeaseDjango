from django.shortcuts import render, reverse, redirect
from django.http import HttpResponseRedirect, HttpResponse
from django.core import serializers
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt

from .models import leaseInfo
from .forms import leaseInfoForm
from dicts.models import dict, dictType
from house.models import houseInfo
from tools.query import getDict

from tools.query import queryLeaseByGet
import json
import logging
import time

# Create your views here.

logger = logging.getLogger('django')
queryHouseDic = {}
@login_required
def showLeases(request):
    leaseInfos = queryLeaseByGet(leaseInfo, request)

    logger.info('search leases!')
    context = {'leaseInfos': leaseInfos, "dicts": getDict()}
    # context = {'leaseInfos': getLeaseInfo(), "dicts": getDict()}
    return render(request, 'lease/index.html', context)
    # return redirect('lease/index.html')


@login_required
@csrf_exempt
def queryLeaseInfos(request):
    # 查询租凭信息
    leaseInfos = queryLeaseByGet(leaseInfo, request)

    context = {'leaseInfos': leaseInfos}
    return HttpResponse(json.dumps(context))


@login_required
def queryHouseInfo(request):
    global queryHouseDic
    queryHouseDic = {}
    keyStr = request.GET['keyStr']
    keyValue = request.GET['keyValue']
    if keyStr != "" and keyValue != "":
        queryHouseDic[keyStr] = keyValue
        houses = houseInfo.objects.filter(**queryHouseDic)
    else:
        return HttpResponse('nullValue')
    context = {"houseInfos": serializers.serialize('json', houses)}
    returnJson = json.dumps(context)
    return HttpResponse(returnJson)


@login_required
def addLease(request):
    if request.method != "POST":
        form = leaseInfoForm()
    else:
        form = leaseInfoForm(request.POST)
        house = houseInfo.objects.get(**queryHouseDic)
        dic = dict.objects.filter(type__label='租凭状态')
        # statusDic = dic.filter(label='未审批')
        if form.is_valid():
            leaseFrom = form.save(commit=False)
            leaseFrom.addUser = request.user
            leaseFrom.house = house
            leaseFrom.house_id = house.id
            # leaseFrom.leaseStatus = statusDic[0].id
            leaseFrom.save()
            context = {"status": 200}
            returnJson = json.dumps(context)
            return HttpResponse(returnJson)
            # return HttpResponseRedirect(reverse('leases:leases'))
        else:
            print(form.cleaned_data)
            print(form.errors)
            return HttpResponse('nullValue')

    context = {'form': form}
    return render(request, 'lease/index.html', context)


@login_required
def editLease(request, leaseID):
    # 编辑房屋信息
    tempLease = leaseInfo.objects.get(id=leaseID)
    if request.method != "POST":
        form = leaseInfoForm(instance=tempLease)
    else:
        form = leaseInfoForm(instance=tempLease, data=request.POST)
        if form.is_valid():
            form.save()
            context = {"status": 200}
            returnJson = json.dumps(context)
            return HttpResponse(returnJson)
        else:
            print(form.errors)
    return HttpResponse('nullValue')


@login_required
@csrf_exempt
def shenPiLease(request):
    # 编辑房屋信息
    try:
        requestJson = request.POST.get('json')
        requestStatus = request.POST.get('status')

        lease = json.loads(requestJson)
        lease = leaseInfo.objects.get(id=lease['id'])
        lease.leaseStatus = int(requestStatus)
        lease.save()
        context = {"status": 200}
        returnJson = json.dumps(context)
        return HttpResponse(returnJson)
    except:
        context = {"status": 300}
        returnJson = json.dumps(context)
        return HttpResponse(returnJson)


@login_required
def deleteLease(request, leaseID):
    # 删除房屋信息
    tempLease = leaseInfo.objects.get(id=leaseID)
    if tempLease:
        tempLease.delete()

    return HttpResponseRedirect(reverse('leases:leases'))



def getLeaseInfo():
    # 获取房屋信息
    leases = leaseInfo.objects.filter()
    data = serializers.serialize('json', leases)
    return data


def update_lease_status():
    print('ssss')