# chat/views.py
from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import *
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User


def home(request):
    return render(request, "chat/splash-page.html")


def index(request):
    return render(request, "chat/index.html")


def loginPage(request):
    page = 'login'

    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        # Authenticate the user with the provided username and password
        user = authenticate(username=username, password=password)

        if user is None:
            # Display an error message if authentication fails (invalid password)
            messages.error(request, "Invalid Password")
            return redirect('login')
        else:
            # Log in the user and redirect to the home page upon successful login
            login(request, user)
            return redirect('home')

    context = {'page': page}

    return render(request, "chat/register_login.html", context)


def registerPage(request):
    if request.method == 'POST':
        first_name = request.POST.get('first_name')
        middle_name = request.POST.get('middle_name')  # Retrieve middle name field
        last_name = request.POST.get('last_name')
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = User.objects.create_user(
            first_name=first_name,
            last_name=last_name,
            username=username
        )

        profile = Profile.objects.create(
            user=user,
            middle_name=middle_name
        )

        user.set_password(password)
        user.save()

        return redirect('login')

    return render(request, 'chat/register_login.html')


def room(request, room_name):
    return render(request, "chat/room.html", {"room_name": room_name})
