# chat/urls.py
from django.urls import path

from . import views

urlpatterns = [
    path("index/", views.index, name="index"),
    path("home/", views.home, name="home"),
    path("login/", views.loginPage, name="login"),
    path("register/", views.registerPage, name="register"),
    path("channel_form/", views.channelCreation, name="channelcreation"),
    path("member_add/<str:sub_channel_key>", views.subchannel_member_add, name="addMembers"),
    path("<str:channel_key>/", views.channels, name="channels"),
    path('chat/<str:channel_key>/<str:sub_channel_key>/', views.subchannels, name='subchannels'),
]
