# chat/urls.py
from django.urls import path

from . import views

urlpatterns = [
    path("index/", views.index, name="index"),
    path("home/", views.home, name="home"),
    path("login/", views.loginPage, name="login"),
    path("register/", views.registerPage, name="register"),
    path("channel_form/", views.channelCreation, name="channelcreation"),
    path("add/<str:channel_id>/<str:subchannel_id>", views.addMember, name="add"),
    path("delete/<str:channel_id>/", views.channelDelete, name="deleteChannel"),
    path("<str:channel_key>/", views.channels, name="channels"),
    path('chat/<str:channel_key>/<str:sub_channel_key>/', views.subchannels, name='subchannels'),
]
