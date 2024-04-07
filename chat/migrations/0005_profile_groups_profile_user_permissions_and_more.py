# Generated by Django 5.0.3 on 2024-04-06 04:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
        ('chat', '0004_remove_usersession_username_usersession_host_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='groups',
            field=models.ManyToManyField(related_name='profile_set', to='auth.group'),
        ),
        migrations.AddField(
            model_name='profile',
            name='user_permissions',
            field=models.ManyToManyField(related_name='profile_set', to='auth.permission'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='middle_name',
            field=models.CharField(blank=True, max_length=12, null=True),
        ),
        migrations.AlterField(
            model_name='profile',
            name='student_number',
            field=models.CharField(blank=True, max_length=12, null=True),
        ),
        migrations.DeleteModel(
            name='UserSession',
        ),
    ]
