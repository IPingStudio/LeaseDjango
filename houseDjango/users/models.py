from django.db import models
from django.contrib.auth.models import User, AbstractUser


# Create your models here.
class userProfile(AbstractUser):
    displayName = models.CharField('显示名称', max_length=150, blank=True)

    authority = models.CharField('用户权限', max_length=50, blank=True)

    telephone = models.CharField('联系电话', max_length=15, blank=True)

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = '用户信息'

    def __str__(self):
        return super().__str__()
