from django.forms import ModelForm, inlineformset_factory
from django.contrib.auth.models import User
from .models import *


class profileForm(ModelForm):
    class Meta:
        model = Profile
        fields = '__all__'


class userForm(ModelForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email']
