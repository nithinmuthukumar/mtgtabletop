from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.shortcuts import render
from django.http import Http404
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.decorators import api_view, action
from rest_framework.response import Response
from rest_framework import status, viewsets
from django.http import JsonResponse
from django.core import serializers
from django.conf import settings
import json

from bookhub.models import HubUser
from bookhub.serializers import UserSerializer
from . import serializers
from . import models

class TextbookViewSet(viewsets.ModelViewSet):
    queryset=models.Textbook.objects.all()
    serializer_class= serializers.TextbookSerializer
class UserViewSet(viewsets.ModelViewSet):
    queryset = HubUser.objects.all()
    serializer_class = UserSerializer

def verify(request,token):
    for v in models.HubUser.objects.filter('verified'):
        if token==v.token:
            v.verified=True
            return Response('{verified:true}')













