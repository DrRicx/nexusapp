from django.db import models
from django.contrib.auth.models import User


class Account(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    gender = models.CharField(
        max_length=6,
        choices=[('MALE', 'male'), ('FEMALE', 'female')]
    )
    student_number = models.CharField(max_length=12, null=True, blank=True)
    middle_name = models.CharField(max_length=12, null=True, blank=True)

    def __str__(self):
        return self.user.username


class Channels(models.Model):
    host = models.ForeignKey(User, on_delete=models.CASCADE)
    channel_name = models.CharField(max_length=12, null=True, blank=True)
    channel_key = models.CharField(max_length=50, blank=False, null=False, default='123456789101')  # No default value

    def __str__(self):
        return self.channel_name


class Subchannels(models.Model):
    subchannel_root = models.ForeignKey(Channels, on_delete=models.CASCADE)
    subchannel_name = models.CharField(max_length=12, null=True, blank=True)
    members = models.ManyToManyField(User, through="ChannelMembership")

    def __str__(self):
        return self.subchannel_name


class ChannelMembership(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    subchannel_group = models.ForeignKey(Subchannels, on_delete=models.CASCADE)

    class Meta:
        # Define a unique constraint across user and subchannel_group
        unique_together = ('user', 'subchannel_group')

    def __str__(self):
        return f"{self.user.username} - {self.subchannel_group.subchannel_name}"
