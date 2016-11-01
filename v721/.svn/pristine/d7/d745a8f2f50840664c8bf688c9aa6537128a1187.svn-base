# coding=utf-8
from django.http import HttpResponse
from .models import Ad
from django.template import loader
from django.utils.safestring import mark_safe
DEFAULT_TEMPLATE = 'ad/ad.html'
# Create your views here.
def ad(request,url):
    ad = Ad.objects.get(url = url)
    template = loader.get_template(DEFAULT_TEMPLATE)
    ad.title = mark_safe(ad.title)
    ad.content = mark_safe(ad.content)
    response = HttpResponse(template.render({'ad': ad}, request))
    return response
