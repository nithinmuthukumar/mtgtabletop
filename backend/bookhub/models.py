from django.contrib.auth.models import AbstractUser
from django.db import models

# Create your models here.



class Card(models.Model):
    name = models.CharField(max_length=200)
    version = models.CharField(max_length=15)

class Deck(models.Model):
    name = models.CharField(max_length=30)
    cards = models.ForeignKey(Card,on_delete=models.CASCADE)
    class Meta:
        ordering = ['decks']

class Player():

    decks=models.ManyToManyField(Deck, blank=True)
    email = models.EmailField()
    username = models.CharField(max_length=100)
    played=models.IntegerField()


















