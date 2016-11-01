# coding=utf-8

from django.conf.urls import include, url
from .views import *

urlpatterns = patterns('',
    url(r'^list/$', carts_list, name='carts_list'),
    url(r'^add/$', carts_add, name='carts_add'),
    url(r'^del/$', carts_del, name='carts_del'),
    url(r'^modify/$', carts_modify, name='carts_modify'),
)
