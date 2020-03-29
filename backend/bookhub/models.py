from django.contrib.auth.models import AbstractUser
from django.db import models

# Create your models here.







class Textbook(models.Model):
    name=models.CharField(max_length=40)
    file=models.FileField(upload_to='', null=True, blank=True)
    subject=models.CharField(max_length=40)
    grade=models.IntegerField()
    class Meta:
        ordering = ['grade']
    def __str__(self):
        return self.name

class HubUser(AbstractUser):
    models.ManyToManyField(Textbook, blank=True)
    models.ManyToManyField(Textbook, blank=True)
    email = models.EmailField()















