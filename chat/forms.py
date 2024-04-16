from django import forms
from django.contrib.auth.models import User
from .models import Account, Channels, Subchannels

class CombinedAccountCreationForm(forms.ModelForm):
    username = forms.CharField(max_length=150)
    email = forms.EmailField()
    password1 = forms.CharField(widget=forms.PasswordInput)
    # Additional fields from AccountCreationFormAdd
    gender = forms.CharField(max_length=6, widget=forms.Select(choices=[('MALE', 'male'), ('FEMALE', 'female')]))
    student_number = forms.CharField(max_length=12)
    middle_name = forms.CharField(max_length=12)

    class Meta:
        model = User
        fields = ['username', 'email', 'password1']

    def save(self, commit=True):
        user = super(CombinedAccountCreationForm, self).save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        if commit:
            user.save()
        # Save additional fields into Account model
        account = Account.objects.create(
            user=user,
            gender=self.cleaned_data['gender'],
            student_number=self.cleaned_data['student_number'],
            middle_name=self.cleaned_data['middle_name']
        )
        return user, account

class ChannelNameForm(forms.ModelForm):
    class Meta:
        model = Channels
        exclude = ['channel_key', 'host']

class MemberForm(forms.Form):
        member_id = forms.IntegerField(widget=forms.HiddenInput())