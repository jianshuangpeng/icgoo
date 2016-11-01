# coding=utf-8

from django.conf.urls import include, url
from .views import search, getdata, detail, pricepk,\
    search_grid, mult_search, mult_index, download_csv,printpdf

urlpatterns = [
    url(r'^$', search, name='search'),
    url(r'^grid/$', search_grid, name='search_grid'),
    url(r'^getdata/$', getdata, name='getdata'),
    url(r'^mult_index/$', mult_index, name='mult_index'),
    url(r'^mult_search/$', mult_search, name='mult_search'),
    url(r'^download_csv/$', download_csv, name='download_csv'),
    url(r'^pricepk/$', pricepk, name='pricepk'),
    url(r'^printpdf/$',printpdf,name='printpdf'),
    url(r'^(?P<supplier>\w+)/$', detail, name='product_detail'),
]
