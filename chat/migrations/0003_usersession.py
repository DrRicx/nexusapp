# Generated by Django 5.0.3 on 2024-04-05 02:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0002_rename_student_profile_profile_user_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserSession',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('session_key', models.CharField(max_length=255, unique=True)),
                ('username', models.CharField(max_length=255)),
                ('room_name', models.CharField(max_length=255)),
            ],
        ),
    ]