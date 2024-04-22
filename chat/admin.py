# admin.py

from django.contrib import admin
from django.contrib.auth.models import User
from django.contrib.auth.admin import UserAdmin
from .models import *


class AccountInline(admin.StackedInline):
    model = Account
    can_delete = False
    verbose_name_plural = 'Accounts'


class CustomizeUserAdmin(UserAdmin):
    inlines = (AccountInline,)


admin.site.unregister(User)
admin.site.register(User, CustomizeUserAdmin)

admin.site.register(Channels)
admin.site.register(Subchannels)
admin.site.register(ChannelMembership)
