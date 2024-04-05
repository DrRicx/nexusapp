# chat/urls.py
from django.urls import path, re_path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("home/", views.home, name="home"),
    path("login/", views.loginPage, name="login"),
    path("register/", views.registerPage, name="register"),
    path("<str:room_name>/", views.room, name="room"),
]