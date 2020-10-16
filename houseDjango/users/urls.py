"""houseDjango URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.urls import re_path
from . import views

urlpatterns = [
    re_path(r'^login/$', views.userLogin, name='login'),
    re_path(r'^logout/$', views.userLogout, name='logout'),
    re_path(r'^$', views.shouUserInfo, name='user'),
    re_path(r'^searchUser/$', views.searchUser, name='searchUser'),
    re_path(r'^newUser/$', views.addUser, name='newUser'),
    re_path(r'^editUser/(?P<userID>\d+)/$', views.editUser, name='editUser'),
    re_path(r'^deleteUser/(?P<userID>\d+)/$', views.deleteUser, name='deleteUser'),
]
