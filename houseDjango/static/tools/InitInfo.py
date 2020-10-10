def initDict(info, DictTypeLabel):
    # info 初始化数据 str <''/''/''.....>,
    # DictTypeLabel 初始化字典类型label str

    from dicts.models import dict, dictType

    dicType = dictType.objects.get(label=DictTypeLabel)
    list = info.split('/')

    for item in list:
        dic = dict(label=item, type=dicType)
        dic.save()

    return dict.objects.filter(type=dicType)

def initDictType(info):
    # info 初始化数据 str <'type','label'/'type','label'....>
    from dicts.models import dictType
    list = info.split('/')
    for item in list:
        typeList = item.split(',')
        dicType = dictType(label=typeList[1], sign=typeList[0])
        dicType.save()
    return dictType.objects.all()