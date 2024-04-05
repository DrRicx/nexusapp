from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    student_number = models.CharField(null=True, blank=True, max_length=11)
    middle_name = models.CharField(null=True, blank=True, max_length=100)

    def __str__(self):
        return f"{self.user.username} Profile"


from django.contrib.auth.models import User

class UserSession(models.Model):
    host = models.ForeignKey(User, on_delete=models.CASCADE, null = True)
    session_key = models.CharField(max_length=40, unique=True)
    room_name = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.host.username}'s session ({self.session_key})"
