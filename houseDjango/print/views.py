import time

from django.contrib.auth.decorators import login_required
from django.shortcuts import render, reverse
from django.http import HttpResponseRedirect
from django.core import serializers

# Create your views here.
from django.views.decorators.csrf import csrf_exempt
from lease.models import leaseInfo
from realty.models import realtyInfo
from tools.query import getDictLableByID


@csrf_exempt
@login_required
def printLease(request):
    leaseID = request.POST.get('leaseID')
    printType = request.POST.get('printType')
    templateID = request.POST.get('templateID')
    lease = leaseInfo.objects.get(id=leaseID)
    # realtyInfo = houseInfo.objects.get(id=lease.houseInfo.id)
    localDate = time.localtime()
    # localDate = time.strftime('%Y {y} %m {m} %d {d}', localDate).format(y='年', m='月', d='日')

    houseIf = lease.house
    houseUse = getDictLableByID(houseIf.houseUse)


    context = {'lease': lease, 'house': lease.house, 'houseUse': houseUse, 'localDate': localDate}
    return render(request, 'printLease/houseLeaseCard.html', context)
    # return HttpResponseRedirect(reverse('printLease:printLease', kwargs=context))


@csrf_exempt
@login_required
def printRealty(request):
    realtyID = request.POST.get('realtyID')
    printType = request.POST.get('printType')
    templateID = request.POST.get('templateID')
    realty = realtyInfo.objects.get(id=realtyID)
    # realtyInfo = houseInfo.objects.get(id=realty.houseInfo.id)
    localDate = time.localtime()
    # localDate = time.strftime('%Y {y} %m {m} %d {d}', localDate).format(y='年', m='月', d='日')

    context = {'realty': realty, 'localDate': localDate}
    return render(request, 'printLease/realtyCard.html', context)
    # return HttpResponseRedirect(reverse('printLease:printLease', kwargs=context))