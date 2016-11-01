# coding=utf-8
from django.shortcuts import render
from django.http import HttpResponseRedirect, JsonResponse,HttpResponse
from api.ct import china_component,China_Capacitance
# Create your views here.

def user_homemarket(request):
    '''电阻部分'''
    edgl = '_'.join(request.GET.getlist('edgl',''))       #额定功率
    fzcc = '_'.join(request.GET.getlist('fzcc',''))       #封装尺寸
    dzwd = '_'.join(request.GET.getlist('dzwd',''))       #电阻温度
    dz = '_'.join(request.GET.getlist('dz',''))           #电阻
    dzwc = '_'.join(request.GET.getlist('dzwc',''))       #电阻误差
    packing = '_'.join(request.GET.getlist('packing','')) #包装
    page = request.GET.get('page','1')                    #当前是多少页
    '''电容部分'''
    drlx = '_'.join(request.GET.getlist('drlx',''))       #电容类型
    wkdm = '_'.join(request.GET.getlist('wkdm',''))       #外壳代码
    dr = '_'.join(request.GET.getlist('dr',''))           #电容
    eddy = '_'.join(request.GET.getlist('eddy',''))       #额定电压
    rc = '_'.join(request.GET.getlist('rc',''))           #容差
    jzzl = '_'.join(request.GET.getlist('jzzl',''))       #介质种类
    bz = '_'.join(request.GET.getlist('bz',''))           #包装
    page_C = request.GET.get('page_C','1')                    #当前是多少页

    data = china_component(edgl,fzcc,dzwd,dz,dzwc,packing,page)
    data['count'],pagecount = readydata(data,page)
    data['C'] = China_Capacitance(drlx,wkdm,jzzl,dr,rc,eddy,'',bz,page_C)
    data['count_C'],pagecount_C = readydata(data['C'],page_C)
    '''if len(data) == 0:                      #当地址栏page值很大时，应对后台返回空列表情况.
        data = {'count':0}

    totalrows = data['count']               #数据条数
    pagerows = 10                           #一页现实10条数据
    pagecount = 0                           #一共多少页
    if totalrows % pagerows == 0:
        pagecount = totalrows / pagerows
    else:
        pagecount = totalrows / pagerows + 1

    if int(page) > int(pagecount):
        data['count'] = 0'''

    fp = open('homemarket/dz.txt','r');    #取出温度数据
    dzdata = []
    allines = fp.readlines()
    fp.close()
    for line in allines:
        dzdata.append(line[:-1])            #依次从文件取出数据去掉换行符后放入列表

    data['pagecount'] = pagecount
    data['page'] = page
    data['dzdata'] = dzdata                 #设置温度列表
    data['edgl'] = edgl
    data['fzcc'] = fzcc
    data['dzwd'] = dzwd
    data['dz'] = dz
    data['dzwc'] = dzwc
    data['packing'] = packing
    '''电容部分'''
    data['pagecount_C'] = pagecount_C
    data['page_C'] = page_C
    data['drlx'] = drlx
    data['wkdm'] = wkdm
    data['dr'] = dr
    data['eddy'] = eddy
    data['rc'] = rc
    data['jzzl'] = jzzl
    data['bz'] = bz
    return render(request,'homemarket/component.html',data)

def readydata(data,page):
    if len(data) == 0:                      #当地址栏page值很大时，应对后台返回空列表情况.
        data = {'count':0}

    totalrows = data['count']               #数据条数
    pagerows = 10                           #一页现实10条数据
    pagecount = 0                           #一共多少页
    if totalrows % pagerows == 0:
        pagecount = totalrows / pagerows
    else:
        pagecount = totalrows / pagerows + 1
    if int(page) > int(pagecount):
        data['count'] = 0
    print data['count'],pagecount
    return data['count'],pagecount
