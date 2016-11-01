from django.conf.urls import include,url
from .views import *

urlpatterns = [
    url(r'^(?P<url>\w+)$',ad,name="ad"),
]
