# chat/views.py
from django.core.management.utils import get_random_secret_key
from django.http import JsonResponse, HttpResponse
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


def channels(request, channel_key):
    # Replace hyphens with spaces in channel_name
    channel = get_object_or_404(Channels, id=channel_key)
    subchannels = Subchannels.objects.filter(subchannel_root=channel)
    context = {'channel': channel, 'subchannel': subchannels}
    return render(request, 'chat/channel.html', context)


def subchannels_json(request, channel_id):
    if request.method == 'GET':
        # Assuming you have a ForeignKey relationship from Subchannels to Channels
        subchannels = Subchannels.objects.filter(channel_id=channel_id)
        subchannel_list = [{'id': sub.id, 'name': sub.name} for sub in subchannels]
        # Include the channel_id in the response
        response_data = {
            'channel_id': channel_id,
            'subchannels': subchannel_list
        }
        return JsonResponse(response_data, safe=False)
    else:
        return JsonResponse({'error': 'Method not allowed'}, status=405)


def subchannels(request, channel_key, sub_channel_key):
    # Replace hyphens with spaces in both channel_name and sub_channel_name
    channel = get_object_or_404(Channels, id=channel_key)
    subchannel = get_object_or_404(Subchannels, id=sub_channel_key)
    context = {
        'channel': channel,
        'subchannel': subchannel,
    }
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
            return redirect('index')
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


def channelCreation(request):
    form = ChannelNameForm()
    if request.method == 'POST':
        form = ChannelNameForm(request.POST)
        channel_encryption = get_random_secret_key()
        Channels.objects.create(
            host=request.user,
            channel_name=request.POST.get('channel_name'),
            channel_key=channel_encryption
        )
    context = {'form': form}
    return render(request, 'chat/channel_creation.html', context)

def channelDelete(request, channel_id):
    channel = Channels.objects.get(id=channel_id)
    if request.user != channel.host:
        return HttpResponse("Not allowed")
    if request.method == "POST":
        channel.delete()
        return redirect('index')
    return render(request, 'chat/channel-delete.html', {'obj':channel})

def addMember(request, channel_id, subchannel_id):
    channel = get_object_or_404(Channels, id=channel_id)
    subchannel = get_object_or_404(Subchannels, id=subchannel_id)
    if request.method == "POST":
        form = MemberAddtion(request.POST)
        if form.is_valid():
            user = form.cleaned_data['user']
            # Check if the user is not already a member of the subchannel
            if not ChannelMembership.objects.filter(user=user, subchannel_group=subchannel).exists():
                # Create a new ChannelMembership object
                ChannelMembership.objects.create(
                    user=user,
                    subchannel_group=subchannel
                )
            # Redirect or do something else
    else:
        form = MemberAddtion()
    context = {
        'channel': channel,
        'subchannel': subchannel,
        'form': form
    }
    return render(request, 'chat/add_member.html', context)

#def deleteMember(request, channel_id, subchannel_id):
#   channel = Channels.object.get(id=channel_id)
#   subchannel = Subchannels.object.get(id=subchannel_id)
