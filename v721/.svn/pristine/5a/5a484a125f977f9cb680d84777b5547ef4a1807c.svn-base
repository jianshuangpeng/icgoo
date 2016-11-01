# coding=utf-8
import json
import csv
from django.core.cache import cache
from django.shortcuts import render
from django.http import HttpResponse
from django.template import RequestContext
from django.core.urlresolvers import reverse
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods
from multiprocessing.dummy import Pool as ThreadPool
from api.dc import getmanydata_from_dc, getsingledata_from_dc, getpricepk_from_dc, \
    _convert_partno,getalldata_from_dc
from .models import Supplier
from main .models import Descript
from accounts .form import CaptchaTestForm, HiddenErrorList
from django.shortcuts import render_to_response
from django.template.response import TemplateResponse
from django.utils import timezone
import time
import random
import requests
import os
import operator


@require_http_methods(["GET", "HEAD"])
def search(request):
    partno = request.GET.get('partno','').strip()
    qty = request.GET.get('qty','1').strip()
    #如果此IP锁定
    locked,ip = _get_locked(request,partno)
    if locked:
        isValidate = request.GET.get('isValidate','')
        prompt = "您的搜索过于频繁，请注意劳逸结合哟！"
        #从验证码页跳转而来
        if isValidate:
            form = CaptchaTestForm(request.GET, error_class=HiddenErrorList)
            if form.is_valid():
                _unlock(ip)
                qty = int(qty) if qty.isdigit() else 1
                partno_view = partno  # 这个供显示用
                partno, sups = _creat_sups(partno)
                return render(request, "search/search.html", {
                    "partno": partno,
                    "qty": qty,
                    'partno_view': partno_view,
                    "sups": sups
                })
            else:
                partno=request.GET.get('partno')
                qty=request.GET.get('qty','1')
                qty = int(qty) if qty.isdigit() else 1
                return render(request,"search/validate.html",{"msg": u"验证码错误！","prompt":prompt,"capform": form,'partno':partno,'qty':qty,"action":"/search"})
        #非验证码页跳转而来
        else:
            form = CaptchaTestForm(error_class=HiddenErrorList)
            return render(request,"search/validate.html",{"capform": form,"prompt":prompt,'partno':partno,'qty':qty,"action":"/search"})
    else:
        _set_ipcache(request)
        from_icnet = request.GET.get("from_icnet", "").strip()
        if from_icnet:
            # 来源icnet页面的跳转参数是keyword
            partno = request.GET.get("keyword", "").strip()
        else:
            partno = request.GET.get("partno", "").strip()  # 这个供搜索用
        partno_view = partno  # 这个供显示用
        qty = request.GET.get('qty', '1')
        qty = int(qty) if qty.isdigit() else 1
        partno, sups = _creat_sups(partno)
        return render(request, "search/search.html", {
            "partno": partno,
            "partno_view": partno_view,
            "qty": qty,
            "sups": sups,
            "from_icnet": from_icnet
        })


@require_http_methods(["GET", "HEAD"])
def search_grid(request):
    _set_ipcache(request)
    partno = request.GET.get("partno", "").strip()  # 这个供搜索用
    locked,ip = _get_locked(request,partno)
    partno_view = request.GET.get("partno", "").strip()  # 这个供显示用
    qty = request.GET.get('qty', '1')
    qty = int(qty) if qty.isdigit() else 1
    partno, sups = _creat_sups(partno)
    #如果此IP锁定
    if locked:
        isValidate = request.GET.get('isValidate','')
        prompt = "您的搜索过于频繁，请注意劳逸结合哟！"
        #从验证码页跳转而来
        if isValidate:
            form = CaptchaTestForm(request.GET, error_class=HiddenErrorList)
            if form.is_valid():
                _unlock(ip)
                return render(request, "search/search_grid.html", {
                    "partno": partno,
                    "partno_view": partno_view,
                    "qty": qty,
                    "sups": sups})
            else:
                return render(request,"search/validate.html",{"msg": u"验证码错误！","prompt":prompt,"capform": form,'partno':partno,'qty':qty,"partno_view": partno_view,"sups": sups,"action":"/search/grid/"})
        #非验证码页跳转而来
        else:
            form = CaptchaTestForm(error_class=HiddenErrorList)
            return render(request,"search/validate.html",{"capform": form,"prompt":prompt,"partno": partno,"partno_view": partno_view,"qty": qty,"sups": sups,"action":"/search/grid/"})
    else:
        return render(request, "search/search_grid.html", {
            "partno": partno,
            "partno_view": partno_view,
            "qty": qty,
            "sups": sups})


@require_http_methods(["GET", "HEAD"])
def detail(request, supplier):
    icgoo_num = request.GET.get('icgoo_num', '')
    protno = request.GET.get('partno', '')
    qty = request.GET.get('qty', '1')
    data = getsingledata_from_dc(supplier, protno, icgoo_num, qty)
    data["new_price_calc"] = ''
    try:
        data["new_price_calc"] = json.dumps(data["price_calc"])
    except Exception as e:
        print e, "search.view:82"
    protno = protno.upper()
    supplier = supplier.capitalize()
    sups = ",".join(
        [one.name for one in Supplier.objects.filter(is_active=1, is_good=1)])
    return render(request, "search/detail.html", {"protno": protno,
                                                  "supplier": supplier,
                                                  'data': data,
                                                  'sups': sups,
                                                  'qty': qty})


@require_http_methods(["GET", "HEAD"])
def getdata(request):
    ipcache = _get_ipcache(request)
    if ipcache is None or ipcache != 2:
        # 如果没触发fuckspider函数则不返回数据
        print ipcache, "search.view:getdata"
        return HttpResponse('')
    partno = request.GET.get("partno", "").strip()
    locked,ip = _get_locked(request,partno)
    if locked:
        return HttpResponse('')
    qty = request.GET.get('qty', 1)
    sup = request.GET.get("sup", "")
    s_type = request.GET.get("type", "")
    flag = True if s_type == 'grid' else False
    result = []
    # 注意下面的供应商其实是要搜索多家供应商
    if sup == 'element14':
        sups = [('element14', partno, qty), ('element14_sh', partno, qty)]
        result = _mult_getdata(sups)
    elif sup == 'rs':
        sups = [('rs_hk', partno, qty), ('rs_china', partno, qty)]
        result = _mult_getdata(sups)
    elif sup == 'arrow':
        sups = [('arrow', partno, qty), ('arrow_hk', partno, qty)]
        result = _mult_getdata(sups)
    elif sup == 'avnet':
        sups = [('avnet', partno, qty), ('avnet_hk', partno, qty),
                ('avnet_ebv', partno, qty),
                ('avnet_memec_silica', partno, qty),
                ('avnet_abacus', partno, qty)]
        result = _mult_getdata(sups)
    elif sup == 'heilind':
        sups = [('heilind', partno, qty), ('heilind_asia', partno, qty)]
        result = _mult_getdata(sups)
    elif sup == 'rochester':
        sups = [('rochester', partno, qty),
                ('rochester_hot', partno, qty),
                ('rochester_promotion', partno, qty)
                ]
        result = _mult_getdata(sups)
    elif sup == 'other':
        # 这家供应商不让明显展示，而且只显示库存文件的型号
        result = getmanydata_from_dc(('waldom_hot', partno, qty))
    else:
        result = getmanydata_from_dc((sup, partno, qty))
    if result:
        supobj = Supplier.objects.get(name=sup)
        sup_logo = "img/supplier/%s" % supobj.logo
        sup_desc = supobj.desc
        sup_info = supobj.info
        for one in result:
            new_partno = one['partno'].replace(
                partno.upper(), "<span class='rc'>%s</span>" % partno.upper())
            one['new_partno'] = new_partno
            one['datecode'] = one['datecode'].replace(u',数量:', '|')
            one['datecode'] = one['datecode'].split('<br>')
            one['new_dc'] = ''
            one['new_price_calc'] = ''
            new_dc = []
            if one['datecode']:
                for dc in one['datecode']:
                    dc = dc.split('|')
                    new_dc.append(dc)
                one['new_dc'] = _merge_datecode(new_dc)
            count = 0
            if one['sup'] == 'fenghuagaoke':
                sup = u"风华高科"
            price_calc_temp = one.get('price_calc', [])
            # 有些时候没有price_calc这个字段
            for i, temp in enumerate(price_calc_temp):
                if int(qty) < int(temp['quantity']):
                    break
                else:
                    count = i
                    continue
            one['new_price_calc'] = price_calc_temp[count:count + 3]
        if flag:
            return render(request, "search/part_grid.html", {"sup": sup,
                                                             "sup_logo": sup_logo,
                                                             "sup_desc": sup_desc,
                                                             "sup_info": sup_info,
                                                             "result": result,
                                                             "qty": qty})
        else:
            return render(request, "search/part.html", {"sup": sup,
                                                        "sup_logo": sup_logo,
                                                        "sup_desc": sup_desc,
                                                        "sup_info": sup_info,
                                                        "result": result,
                                                        "qty": qty})
    else:
        return HttpResponse('')


def mult_index(request):
    #如果此IP锁定
    locked,ip = _get_locked(request,'none')
    if locked:
        isValidate = request.GET.get('isValidate','')
        prompt = "查询尽量不要过于频繁，请注意劳逸结合哟！"
        #从验证码页跳转而来
        if isValidate:
            form = CaptchaTestForm(request.GET, error_class=HiddenErrorList)
            if form.is_valid():
                _unlock(ip)
                return render(request, "search/mult_index.html", {})
            else:
                return render(request,"search/validate.html",{"msg": u"验证码错误！","prompt":prompt,"capform": form,"action":"/search/mult_index/"})
        #非验证码页跳转而来
        else:
            form = CaptchaTestForm(error_class=HiddenErrorList)
            return render(request,"search/validate.html",{"capform": form,"prompt":prompt,"action":"/search/mult_index/"})
    else:
        return render(request, "search/mult_index.html", {})


@require_http_methods(["GET", "POST"])
@csrf_exempt
def mult_search(request):
    '''批量查询功能，本质上就是查询+价格对比'''
    de_city = 'dl'
    if request.method == "POST":
        _set_ipcache(request)
        sups = request.POST.getlist('supplier')
        sups_str = '-'.join(sups)#这里不能用,防止冲突
        de_city = request.POST.get('de_city')
        flag = request.POST.get('flag')
        if flag == 'txt':
            partnos = request.POST.getlist('mult_par')
            qtys = request.POST.getlist('mult_qty')
            data = [[p, qtys[i]] for i, p in enumerate(partnos) if p]
            partnos = [p.upper() for p in partnos if p]

        else:
            info = request.POST.get('partno_info')
            data = [one.split('\t')
                    for one in info.split('\r\n') if len(one) > 0]
            # 过滤掉非\t分割的数据
        partnos = [one[0].upper() for one in data if len(one) > 1]
        qtys = [one[1].upper() for one in data if len(one) > 1]
        partnos_qtys = [[p, qtys[i]] for i, p in enumerate(partnos) if p]
        mult_search_url = reverse("search:mult_search")  # 这里只负责构造url给前端触发
        urls = ["%s?partno=%s&qty=%s&de=%s&sups=%s" %
                    (mult_search_url, _convert_partno(p), q or 1, de_city,sups_str) for p, q in data]
        form = CaptchaTestForm(error_class=HiddenErrorList)
        return render(request, "search/search_mult.html", {"urls": ",".join(urls),
                                                           "de_city": de_city,
                                                           "partnos": partnos,
                                                           "partnos_qtys":partnos_qtys,
                                                           "capform": form})
    else:
        # ipcache = _get_ipcache(request)
        # if ipcache is None or ipcache != 2:
        #     # 如果没触发fuckspider函数则不返回数据
        #     return HttpResponse('')
        partno = request.GET.get("partno", "").strip()
        locked,ip = _get_locked(request,partno)
        qty = request.GET.get('qty', 1)
        de_city = request.GET.get('de', 'dl')
        sups = request.GET.get('sups', '')
        if locked:
            data1 = []
            result = []
            similar = []
            errmsg = "查询过于频繁,请重新点<a style='text-decoration:underline;color:#c00' href='/search/mult_index/'>批量查询</a>"
        else:
            errmsg = ''
            #if sups:
            #    suplist = [(one, partno, qty)
            #                for one in sups.split('-')]
            #else:
            #    suplist = [(one.name, partno, qty)
            #                for one in Supplier.objects.filter(is_active=1)]
            #_mult_getdata(suplist)  # 这里触发查询即可
            #result = getpricepk_from_dc('', partno, qty)
            alldata = getalldata_from_dc(sups,partno,qty)
            result = []
            similar = []
            for one in alldata:
                if one['partno'].upper() == partno.upper():
                    result.append(one)
                else:
                    similar.append(one)
            data1 = result[0] if result else '' #获取最便宜的第一条

        html = render(request,
                      "search/_ajax_get_mult_data.html",
                      {'data1': data1,
                       'qty': qty,
                       'data': result,
                       'similar_data': similar,
                       'de_city': de_city,
                       'partno': partno,
                       'errmsg':errmsg,
                       })
        return html


@require_http_methods(["GET", "HEAD"])
def pricepk(request):
    '''价格对比功能，如果传了sup则排除这家供应商'''
    partno = request.GET.get("partno", "").strip()
    qty = request.GET.get('qty', 1)
    sup = request.GET.get("sup", "")
    result = getpricepk_from_dc(sup, partno, qty)[:5]
    return render(request, "search/_ajax_good_price.html",
                  {'data': result, 'qty': qty})


@require_http_methods(["POST"])
@csrf_exempt
def download_csv(request):
    '''下载csv表格'''
    cons = request.POST.getlist('cons[]', [])
    phone_number = request.POST.get('phone_number','')#页面右侧固定定位的联系电话的第一个
    qq_number = request.POST.get('qq_number','')#页面右侧固定定位的联系QQ的第一个
    if cons:
        response = HttpResponse(content_type='text/csv')
        response['Content-Disposition'] = 'attachment; filename="result.csv"'
        writer = csv.writer(response)
        writer.writerow(['','','','','icgoo.net报价单'])
        writer.writerow(['型号名',
                         '采购数量',
                         '制造商',
                         '供应商',
                         '批号',
                         '库存',
                         '倍数/最小起定量',
                         '国内交货价格',
                         '香港交货价格',
                         '总计',
                         '货期'])
        for one in cons:
            data = [x.replace("\n", "").encode('utf-8')
                    for x in one.split('^')]
            writer.writerow(data)
        writer.writerow(['*注:以上报价为参考报价，实际报价以销售确认的为主','','联系电话:',phone_number,'联系QQ:',qq_number])
        return response
    else:
        return HttpResponse('')


def printpdf(request):
    cons = request.GET.getlist('cons','')
    data=[]
    for one in cons:
        datum = [x.replace("\n", "").encode('utf-8')
                for x in one.split('^')]
        data+=datum
    col = 12 #列数为12
    row = (len(data)-1)/col
    data[0:12]
    table = [[],[],[],[],[],[],[],[],[],[]]
    for i in range(row):
        table[i] = data[col*i:col*(i+1)]
    now = timezone.now().strftime('%Y-%m-%d %H:%M:%S')
    context = RequestContext(request, {
        'table': table,
        'now':now,
        })
    t = TemplateResponse(request,'search/printPdf.html',context)
    t.render()
    code_list = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M',
    'N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
    code = ''
    for i in range(6):
        code += "%s" % random.choice(code_list)
    filename = '/tmp/%s' %code
    f = open('%s.html' %filename ,'w')
    html = f.write(t.content)
    f.close()

    return create_pdf('%s.html' %filename, '%s.pdf' %filename)

def create_pdf(url,filename):
    command = 'wkhtmltopdf %s %s' % (url, filename)
    os.system(command)
    #f = open(filename, 'rb')
    #pdf = f.read()
    #f.close()
    #os.remove(filename)
    with open(filename,'rb') as pdf:
        response = HttpResponse(pdf.read(), content_type='application/pdf')
        response['Content-Disposition'] = 'attachment; filename=result.pdf'
        return response

def _merge_datecode(datecode_list):
    '''合并roch的批次
       原始数据如：
       [[u'2500', u'2500'], [u'1135', u'6'], [u'1135', u'1292'], [u'MIX 12+', u'2500']]
    '''
    result = []
    temp = {}
    for one in datecode_list:
        if one[0] == '':
            continue  # 过滤掉空值
        elif len(one) == 2 and one[0] != '9999' and one[0].isdigit() and len(one[0]) == 4:
            year = one[0][:2]  # 前两位为年份
            year_num = temp.get(year, 0)
            temp[year] = year_num + int(one[1])
        else:
            result.append(one)  # 特殊的不进行合并，比如9999批次不详的，包含字母的，不是4位数字的
    for k, v in temp.iteritems():
        result.append(["%s+" % k, str(v)])
    result.sort()
    return result


def _mult_getdata(alist):
    '''开启多线程获取数据
       alist = [(supname,partno,qty),(supname,partno,qty)...]
    '''
    pool = ThreadPool()
    temp = pool.map(getmanydata_from_dc, alist)
    pool.close()
    pool.join()
    result = []
    for one in temp:
        if one:
            result.extend(one)
    result = sorted(result, key=operator.itemgetter('sup'))
    return result


def _creat_sups(partno):
    '''对partno转码并生成对应的sup'''
    try:
        partno = _convert_partno(partno)
        if partno:
            sups = ",".join(
                [one.name for one in Supplier.objects.filter(is_active=1)])
        else:
            sups = ""  # 如果partno为空则不进行查询
    except Exception as e:
        sups = ""  # 如果转码失败则不进行任何查询,比如型号名中包含汉字的
    return partno, sups


def _set_ipcache(request):
    '''防爬虫第一步，必须经过search页面'''
    if 'HTTP_X_FORWARDED_FOR' in request.META:
        ip = request.META['HTTP_X_FORWARDED_FOR']
    else:
        ip = request.META['REMOTE_ADDR']
    ipcache = cache.get(ip)
    if ipcache and ipcache != 1:
        pass
    else:
        cache.set(str(ip), 1, 60 * 5)  # 5分钟内有效


def _get_ipcache(request):
    if 'HTTP_X_FORWARDED_FOR' in request.META:
        ip = request.META['HTTP_X_FORWARDED_FOR']
    else:
        ip = request.META['REMOTE_ADDR']
    return cache.get(ip)

def _get_locked(request,partno):
    '''获取IP关于是否锁定的状态，0：未锁定；1：锁定'''
    #获取用户的IP地址
    if request.META.has_key('HTTP_X_FORWARDED_FOR'):
        ip =  request.META['HTTP_X_FORWARDED_FOR']
    else:
        ip = request.META['REMOTE_ADDR']

    # TODO DEBUG
    #return  0, ip

    urltail = "/verify/?partno=%s&ip=%s" % (partno,ip)
    url = "http://192.168.2.199"+urltail
    try:
        result = requests.get(url)
        resultData = result.json()
    except:
        return 0, ip
    return resultData['locked'],ip

def _unlock(ip):
    '''验证码输入正确之后，提交IP'''
    urltail = "/verify_success/?ip=%s" % (ip)
    url = "http://192.168.2.199"+urltail
    requests.get(url)
