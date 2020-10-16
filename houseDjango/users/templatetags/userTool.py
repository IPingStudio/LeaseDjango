from django import template
from dicts.models import dict

register = template.Library()


@register.simple_tag
def strIndexOf(str, Instr):
    return str + Instr


@register.filter
def authorityIndexOf(authority, typeStr):
    returnBoolean = False
    typeStr = typeStr + ''
    userAuth = dict.objects.filter(type__label='用户权限')
    dicID = []
    for userAuthItem in userAuth:
        if typeStr in userAuthItem.label:
            dicID.append(userAuthItem.id)
    for dicIDItem in dicID:
        dicIDItem = str(dicIDItem)
        if dicIDItem in authority:
            returnBoolean = True
            break
    return returnBoolean
