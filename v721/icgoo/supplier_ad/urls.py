# coding=utf-8

from django.conf.urls import include, url
from django.views.generic import TemplateView

urlpatterns = [
    url(r'^rochester/$', TemplateView.as_view(template_name="supplier_ad/roch.html"), name="rochester"),
    url(r'^rochester-ad/$', TemplateView.as_view(template_name="supplier_ad/rochester.html"), name="rochester-ad"),
]
