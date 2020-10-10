from django.contrib import admin
from .models import leaseInfo


# Register your models here.
class leaseInfoAdmin(admin.ModelAdmin):
    list_display = ('houseID', 'acceptID', 'houseOwner', 'leaseHolder')
    search_fields = ('acceptID',)

    def houseID(self, obj):
        return u'%s' % obj.house.houseID


    def houseOwner(self, obj):
        return u'%s'%obj.house.houseOwner


admin.site.register(leaseInfo, leaseInfoAdmin)
