from django.contrib import admin

# Register your models here.
from bookhub.models import Textbook, HubUser

admin.site.register(Textbook)
admin.site.register(HubUser)
