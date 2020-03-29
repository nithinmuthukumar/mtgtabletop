from random import shuffle

from django.contrib.auth.models import User
from django.forms import models
from rest_framework import serializers
from bookhub.models import Textbook, HubUser
from django.db import models
from django.core.mail import send_mail
import string



class TextbookSerializer(serializers.ModelSerializer):
    class Meta:
        model = Textbook
        fields = ['id', 'name', 'file', 'subject', 'grade']
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = HubUser

        fields = ['username','password','email']

    def create(self, validated_data):

        link=''
        token=shuffle(string.ascii_letters)
        send_mail(
            'Account Activation',
            'This is to activate your account\n'+link,
            'kathrikai30201094@gmail.com',
            [validated_data['email']],
            fail_silently=True,
        )
        return super().create(validated_data)

    def validate(self, attrs):
        return super().validate(attrs)


