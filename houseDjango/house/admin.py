from django.contrib import admin
from .models import houseInfo


# Register your models here.

class houseInfoAdmin(admin.ModelAdmin):
    list_display = ('houseID', 'propertyID', 'houseOwner', 'houseArea')
    search_fields = ('houseID',)


admin.site.register(houseInfo, houseInfoAdmin)
