from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from django.contrib.admin.models import LogEntry, CHANGE
from django.contrib.admin.options import get_content_type_for_model

from house.models import houseInfo
from users.models import userProfile

import json
# Create your views here.

@login_required
def searchLoginByHouse(request):
    house = houseInfo.objects.get(id=1)
    adminUser = userProfile.objects.get(username='chengzhouyun')
    log_entries = LogEntry.objects.filter(
        user_id=adminUser.id,
        # content_type_id=get_content_type_for_model(house).pk,
        # object_id=house.id,
    )
    context = {'log': log_entries}
    HttpResponse(json.dumps(context))


@login_required
def showLogging():
    return
