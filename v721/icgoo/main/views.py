# coding=utf-8
from django.shortcuts import render
from django.core.cache import cache
from django.http import HttpResponse
from .models import Pictures,Descript
import time
from django.utils import timezone

def main(request):
    #获取轮播图里的图片对象，并判断改对象是否显示
    
    Center = Pictures.objects.filter(position='center')
    for center in Center:
        compare(center)
    #获取首页头部提示的对象,并判断改对象是否显示
    Top = Pictures.objects.filter(position='top')
    for top in Top:
        compare(top)
    tops = Pictures.objects.filter(
        show=1, position='top').order_by('show_id').first()
    small = Pictures.objects.filter(
        show=1, position='small').order_by('show_id')
    centers = Pictures.objects.filter(
        show=1, position='center').order_by('-show_id')
    return render(request, "main/main.html", {"centers": centers, "small": small, "tops": tops})


def fuckspider(request):
    '''注意本函数对应的url!'''
    if 'HTTP_X_FORWARDED_FOR' in request.META:
        ip = request.META['HTTP_X_FORWARDED_FOR']
    else:
        ip = request.META['REMOTE_ADDR']
    ipcache = cache.get(ip)
    if ipcache == 1:
        # 如果经过了search页面才生效
        cache.set(str(ip), 2, 60 * 5)  # 5分钟内有效
    return HttpResponse("#searchpartnohide{display:none}", content_type='text/css')


def get_logo(request):
    '''获取logo的路径'''
    obj = Pictures.objects.get(name='logo')
    compare(obj)
    logo = Pictures.objects.filter(
        show=1, position='logo').order_by('show_id').first()
    service_phone = Descript.objects.get(title='售后服务电话')
    hot_line = Descript.objects.get(title='全国销售热线')
    return {'logo':logo,'service_phone':service_phone,'hot_line':hot_line}


def compare(obj):
    '''比较图片对象的开始显示时间，结束显示时间和当前时间，以确定该图片是否显示'''
    showTime = obj.showdate #获取开始显示logo的时间
    hideTime = obj.hidedate #获取结束显示logo的时间
    if showTime and hideTime:
        nowTimeStamp = get_timeStamp(timezone.now()) #获取当前时间的时间戳
        showTimeStamp = get_timeStamp(showTime)
        hideTimeStamp = get_timeStamp(hideTime)
        if showTimeStamp < nowTimeStamp and nowTimeStamp < hideTimeStamp:
            obj.show=1
        else:
            obj.show=0
    else:
        obj.show=0
    obj.save()


def get_timeStamp(Time):
    '''把datetime类型的时间转换为时间戳'''
    timeArray = time.strptime(Time.strftime('%Y-%m-%d %H:%M:%S'),"%Y-%m-%d %H:%M:%S")
    return time.mktime(timeArray)
