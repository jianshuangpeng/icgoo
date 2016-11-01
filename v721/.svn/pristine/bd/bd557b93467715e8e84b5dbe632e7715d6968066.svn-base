from django.contrib import admin
from .models import WebConfig

class ConfigAdmin(admin.ModelAdmin):
    list_display = ('key', 'value')

admin.site.register(WebConfig, ConfigAdmin)
