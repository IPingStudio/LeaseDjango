from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .models import userProfile

# Register your models here.
# class userProfileAdmin(admin.ModelAdmin):
#     list_display = ('username', 'authority', 'telephone')
#     search_fields = ('username',)
#
#     def username(self, object):
#         return object.user.username


admin.site.register(userProfile, UserAdmin)
