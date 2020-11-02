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
from django.contrib import admin
from django.urls import path, re_path, include
from django.views import static ##新增
from django.conf.urls.static import static as staticDef
from django.conf import settings ##新增
from django.conf.urls import url ##新增


urlpatterns = [
    path('admin/', admin.site.urls),
    re_path(r'^', include(('house.urls'))),
    re_path(r'^user/', include(('users.urls', 'user'), namespace='user')),
    re_path(r'^house/', include(('house.urls', 'houses'), namespace='houses')),
    re_path(r'^logging/', include(('loggings.urls', 'logging'), namespace='logging')),
    re_path(r'^lease/', include(('lease.urls', 'leases'), namespace='leases')),
    re_path(r'^print/', include(('print.urls', 'print'), namespace='print')),
    re_path(r'^realty/', include(('realty.urls', 'realtys'), namespace='realtys')),
    url(r'^static/(?P<path>.*)$', static.serve, {'document_root': settings.STATIC_ROOT}, name='static')
] + staticDef(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
