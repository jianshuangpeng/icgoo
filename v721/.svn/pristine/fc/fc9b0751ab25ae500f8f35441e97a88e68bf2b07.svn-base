# coding=utf-8

from django.conf.urls import include, url
from .views import *
urlpatterns = [
    url(r'^get_order_num/$', user_get_order_num, name='user_get_order_num'),
    url(r'^information/$', user_information, name='user_information'),#基本资料
    url(r'^headPortrait/$', user_headPortrait, name='user_headPortrait'),#修改头像
    url(r'^invoice_info/$',user_invoice_info,name='user_invoice_info'),#开票资料
    url(r'^login/$', user_login, name='user_login'),
    url(r'^logout/$', user_logout, name='user_logout'),
    url(r'^register/$', user_register, name='user_register'),
    url(r'^reg_success/$',user_reg_success,name='user_reg_success'),#注册成功
    url(r'^checkusername/$', user_checkusername, name='user_checkusername'),
    url(r'^resetpassword/$', user_resetpassword, name='user_resetpassword'),
    url(r'^ship/address/$', user_ship_address, name='user_ship_address'),
    url(r'^forgetpassword/$', user_forgetpassword, name='user_forgetpassword'),
    # url(r'^stockpicking/$', user_stockpicking, name='user_stockpicking'),未发货
    # url(r'^alreadyinstorage_tobeshipped/$', user_alreadyinstorage_tobeshipped, name='user_alreadyinstorage_tobeshipped'),
    url(r'^alreadyinstorage_preparegoods/$', user_alreadyinstorage_preparegoods, name='user_alreadyinstorage_preparegoods'),#正在备货
    url(r'^stockpicking/al/$', user_stockpicking_al, name='user_stockpicking_al'),
    # url(r'^stockpicking/self/$', user_stockpicking_self, name='user_stockpicking_self'),未自提
    url(r'^already_instorage/$', user_already_instorage, name='user_already_instorage'),
    url(r'^stockpicking/self/al/$', user_stockpicking_self_finished, name='user_stockpicking_self_finished'),
    url(r'^saleorderlist/$', user_saleorderlist, name='user_saleorderlist'),#报价单，当前订单
    # url(r'^quatationlist/$', user_quatationlist, name='user_quatationlist'),
    url(r'^supplier_already/$', user_supplier_already, name='user_supplier_already'),
    url(r'^goodsarriveport/$', user_goodsarriveport, name='user_goodsarriveport'),
    url(r'^customer_finish/$', user_customer_finish, name='user_customer_finish'),
    url(r'^saleorderlist/al/$', user_saleorderlist_al, name='user_saleorderlist_al'),
    url(r'^saleorderlineroute/$', user_saleorderlineroute, name='user_saleorderlineroute'),
    url(r'^tracegoods/$', user_tracegoods, name='user_tracegoods'),
    url(r'^stockpickinglineroute/$', user_stockpickinglineroute, name='user_stockpickinglineroute'),
    url(r'^detailsofdelivery/$', user_detailsofdelivery, name='user_detailsofdelivery'),
    url(r'^sendcode/$', send_code, name='send_code'),
    url(r'^bindingjy/$', binding_jy, name='binding_jy'),
    url(r'^sale_info/$', get_sale_info, name='sale_info'),
    url(r'^user_get_deliver_code',user_get_deliver_code,name='user_get_deliver_code'),
    url(r'^already_route/$',user_get_sf_route_info,name='already_route'),
    url(r'^upload_contract/$',upload_contract,name='upload_contract'),
    url(r'^download_url/$',download_url,name='download_url'),
]
