# chat/views.py
from django.http import JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from .models import *
from .forms import *


def home(request):
    return render(request, "chat/splash-page.html")


def index(request):
    channels = Channels.objects.all()
    context = {'channels': channels}
    return render(request, 'chat/index.html', context)


def channels(request, channel_name):
    channel = get_object_or_404(Channels, channel_name=channel_name)
    subchannels = Subchannels.objects.all()
    context = {'channel': channel, 'subchannel': subchannels}
    return render(request, 'chat/channel.html', context)


def subchannels(request, channel_name, sub_channel_name):
    channel = get_object_or_404(Channels, channel_name=channel_name)
    subchannels = Subchannels.objects.filter(subchannel_name=sub_channel_name)
    context = {'subchannel': subchannels, 'channel_name': channel}
    return render(request, 'chat/subchannel.html', context)


def loginPage(request):
    page = 'login'

    context = {'page': page}

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
            return redirect('index')

    return render(request, 'chat/register_login.html', context)


def registerPage(request):
    if request.method == 'POST':
        form = CombinedAccountCreationForm(request.POST)
        if form.is_valid():
            form.save()
            # Redirect to a success page or login page
            return redirect('login')
        else:
            # Form is invalid, render back to the user with error messages
            for field, errors in form.errors.items():
                for error in errors:
                    messages.error(request, f"Error in {field}: {error}")
    else:
        form = CombinedAccountCreationForm()

    context = {'form': form}
    return render(request, 'chat/register_login.html', context)
