# Generated by Django 5.0.3 on 2024-04-21 02:23

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0009_subchannels_channelmembership'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.RemoveField(
            model_name='channelmembership',
            name='channel',
        ),
        migrations.RemoveField(
            model_name='channelmembership',
            name='member',
        ),
        migrations.AddField(
            model_name='channelmembership',
            name='subchannel_group',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='chat.subchannels'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='channelmembership',
            name='user',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='subchannels',
            name='members',
            field=models.ManyToManyField(through='chat.ChannelMembership', to=settings.AUTH_USER_MODEL),
        ),
    ]
