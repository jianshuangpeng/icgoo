# coding=utf-8

from django.conf.urls import include, url
from .views import *

urlpatterns = [
    url(r'^$', user_homemarket, name='user_homemarket'),
]
