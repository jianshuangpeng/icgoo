from django.contrib import admin
from .models import Supplier


class SupplierAdmin(admin.ModelAdmin):
    list_display = ('name', 'desc', 'info', 'logo', 'is_active', 'is_good')

admin.site.register(Supplier, SupplierAdmin)
