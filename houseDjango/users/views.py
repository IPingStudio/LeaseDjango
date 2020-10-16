from django.contrib.auth import authenticate, logout, login
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render, reverse
from django.core import serializers

from tools.query import getDict

from .models import userProfile
from .forms import userProfileForm

import json
# Create your views here.


def userLogin(request):
    if request.method != "POST":
        return render(request, 'users/login.html')
    else:
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(username=username, password=password)

        if user and user.is_active:
            login(request, user)
            return HttpResponseRedirect(reverse('houses:houses'))
            # return render(request, reverse('houses:houses'), context)
        else:
            return HttpResponseRedirect(reverse('user:login'))

@login_required
def userLogout(request):
    logout(request)
    return HttpResponseRedirect(reverse('user:login'))

@login_required
def shouUserInfo(request):
    users = getUserInfo()
    dic = getDict()
    context = {'userInfos': users, 'dicts': dic}
    return render(request, 'users/index.html', context)


@login_required
def addUser(request):
    if request.method != "POST":
        form = userProfileForm()
    else:
        form = userProfileForm(request.POST)
        if form.is_valid():
            disName = form.cleaned_data['displayName']
            if disName == '':
                usrName = form.cleaned_data['username']
                currentForm = form.save(commit=False)
                currentForm.displayName = usrName
                currentForm.save()
            else:
                form.save()
                context = {'status': 200}
                return HttpResponse(json.dumps(context))
            return HttpResponseRedirect(reverse('user:user'))

    context = {'form': form}
    return render(request, 'house/index.html', context)


@login_required
def editUser(request, userID):
    # 编辑房屋信息
    tempUser = userProfile.objects.get(id=userID)
    if request.method != "POST":
        form = userProfileForm(instance=tempUser)
    else:
        form = userProfileForm(instance=tempUser, data=request.POST)
        if form.is_valid():
            currentPassword = request.POST.get('password')
            if not currentPassword == '':
                tempUser.set_password(currentPassword)

            disName = form.cleaned_data['displayName']
            if disName == '':
                usrName = form.cleaned_data['username']
                currentForm = form.save(commit=False)
                currentForm.displayName = usrName
                currentForm.save()
            else:
                form.save()
                context = {'status': 200}
                return HttpResponse(json.dumps(context))
            return HttpResponseRedirect(reverse('user:user'))
    return render(request, 'users/index.html', {'form': form})



@login_required
def deleteUser(request, userID):
    # 编辑房屋信息
    tempUser = userProfile.objects.get(id=userID)
    if tempUser:
        tempUser.delete()
        return HttpResponseRedirect(reverse('user:user'))
    else:
        pass


def searchUser(request):
    return HttpResponseRedirect(reverse("user:showUserInfo"))


def getUserInfo():
    # 获取房屋信息
    user = userProfile.objects.filter()

    data = serializers.serialize('json', user)
    return data
