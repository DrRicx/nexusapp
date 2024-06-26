# Generated by Django 5.0.3 on 2024-04-06 07:54

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0005_profile_groups_profile_user_permissions_and_more'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Account',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gender', models.CharField(choices=[('MALE', 'male'), ('FEMALE', 'female')], max_length=6)),
                ('student_number', models.CharField(blank=True, max_length=12, null=True)),
                ('middle_name', models.CharField(blank=True, max_length=12, null=True)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.DeleteModel(
            name='Profile',
        ),
    ]
