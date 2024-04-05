from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from .models import Profile, UserSession


class ProfileInline(admin.StackedInline):
    model = Profile
    can_delete = False
    verbose_name_plural = 'Profile'


class CustomUserAdmin(UserAdmin):
    inlines = (ProfileInline,)


admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)


class ProfileAdmin(admin.ModelAdmin):
    list_display = ['user', 'middle_name']  # Display fields in the admin list view

admin.site.register(Profile, ProfileAdmin)

admin.site.register(UserSession)