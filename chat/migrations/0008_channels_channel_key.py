# Generated by Django 5.0.3 on 2024-04-15 12:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0007_channels_subchannels'),
    ]

    operations = [
        migrations.AddField(
            model_name='channels',
            name='channel_key',
            field=models.CharField(default='123456789101', max_length=50),
        ),
    ]
