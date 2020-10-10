from django.core import serializers
from house.models import houseInfo
import json

from dicts.models import dict, dictType


def queryLeaseByGet(Models, getData):
    queryContext = {}
    leaseStatus = getData.get('leaseStatus')
    # 处理查询字段
    if leaseStatus:
        if leaseStatus != '0' and leaseStatus != '-1':
            queryContext['leaseStatus'] = int(leaseStatus)

    houseID = getData.get('houseID')
    if houseID:
        house = houseInfo.objects.get(houseID=houseID)
        houseID = house.id
        # listID = []
        # for item in realtyInfo:
        #     listID.append(item.id)
        queryContext['houseInfo'] = houseID

    if queryContext:
        leaseInfos = Models.objects.filter(**queryContext)
    else:
        leaseInfos = Models.objects.filter()

    leaseInfos = json.loads(serializers.serialize('json', leaseInfos))
    for item in leaseInfos:
        houseInfoObj = houseInfo.objects.filter(id=item['fields']['house'])
        houseInfoJson = serializers.serialize('json', houseInfoObj)
        item['fields']['houseInfoJson'] = houseInfoJson
        item['fields']['id'] = item['pk']

    return json.dumps(leaseInfos)


def getDict():
    # 获取初始数据 Dict
    dicts = dict.objects.all()
    dictTypes = dictType.objects.all()
    returnDict = {}
    for item in dictTypes:
        dicts = dict.objects.filter(type__label=item.label)
        returnDict[item.sign] = []
        for itemD in dicts:
            tempDic = {"label": itemD.label, "id": itemD.id, "type": itemD.type.sign}
            returnDict[item.sign].append(tempDic)
    return returnDict


def getDictLableByID(id):
    dic = dict.objects.get(id=id)
    return dic.label
