from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings

urlpatterns = [
    url(r'^$', 'main.views.main', name='mainpage'),
    url(r'^css/main_page.css$', 'main.views.fuckspider', name='fuckspider'),
    url(r'^search/', include('search.urls', namespace="search")),
    # url(r'^carts/', include('carts.urls', namespace="carts")),
    url(r'^accounts/', include('accounts.urls', namespace="accounts")),
    url(r'^homemarket/', include('homemarket.urls',namespace='homemarket')),
    url(r'^help/', include('help.urls', namespace="help")),
    url(r'^supplier/', include('supplier_ad.urls', namespace="supplier")),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^icgoo_admin/', include(admin.site.urls)),
    url(r'^ueditor/',include('DjangoUeditor.urls')),
    url(r'^ad/',include('ad.urls')),
    url(r'^api/',include('api.urls')),
]

if settings.DEBUG:
    from django.conf.urls.static import static
    urlpatterns += static(
        settings.MEDIA_URL,document_root=settings.MEDIA_ROOT
    )
