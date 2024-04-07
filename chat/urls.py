# chat/urls.py
from django.urls import path

from . import views

urlpatterns = [
    path("index/", views.index, name="index"),
    path("home/", views.home, name="home"),
    path("login/", views.loginPage, name="login"),
    path("register/", views.registerPage, name="register"),
    path("<str:channel_name>/", views.channels, name="channels"),
    path("<str:channel_name>/<str:sub_channel_name>/", views.subchannels, name="subchannels"),
]