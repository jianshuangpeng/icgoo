from django.contrib import admin

from .models import Pictures

from .models import Descript


class PictureAdmin(admin.ModelAdmin):
    list_display = ('name', 'position', 'imgpath', 'show_id', 'showdate','hidedate')

admin.site.register(Pictures, PictureAdmin)
admin.site.register(Descript)
