from django.contrib import admin
from .models import dictType, dict
# Register your models here.

class dictTypeAdmin(admin.ModelAdmin):
    list_display = ('id', 'label', 'sign', 'addedDate')
    search_fields = ('sign',)

class dictAdmin(admin.ModelAdmin):
    list_display = ('id', 'label', 'type', 'addedDate')
    search_fields = ('type__label',)
admin.site.register(dictType, dictTypeAdmin)
admin.site.register(dict, dictAdmin)
