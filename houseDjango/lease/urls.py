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
    re_path(r'^$', views.showLeases, name='leases'),
    re_path(r'^newLease$', views.addLease, name='newLease'),
    re_path(r'^editLease/(?P<leaseID>\d+)/$', views.editLease, name='editLease'),
    re_path(r'^deleteLease/(?P<leaseID>\d+)/$', views.deleteLease, name='deleteLease'),
    re_path(r'queryLeases/', views.queryLeaseInfos, name='queryLeases'),
    re_path(r'queryHouse/', views.queryHouseInfo, name='queryHouse'),
    re_path(r'shenPiLease', views.shenPiLease, name='shenPiLease')
]
