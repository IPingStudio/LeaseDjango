from django.contrib import admin
from .models import realtyInfo


# Register your models here.
class realtyInfoAdmin(admin.ModelAdmin):
    list_display = ('institutionName', 'lawPerson', 'officeAddress')
    search_fields = ('institutionName',)


admin.site.register(realtyInfo, realtyInfoAdmin)
