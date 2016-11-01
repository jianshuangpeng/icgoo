# coding=utf-8

from django.shortcuts import render
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from icgoo.common_fuc import creat_code, send_msg, http_basic_auth, send_sms
from .models import RegisterCode, UserExtraInfo, UserRegisterInfo
from .form import CaptchaTestForm, HiddenErrorList
from api.jy import get_stockpicking, get_stockpicking_self_al, \
    get_saleorderlineroute, get_orderlist, get_saleorderlist, get_saleorderlist_al,\
    get_stockpickinglineroute, get_CRM_info, get_tracking_number, check_stock_out_is_print,\
    organize_selfpick_code, get_sale, get_sf_route_info, get_route_list, get_stockpicking_number,\
    uploadimg2jy,get_attachment_links,uploadimg2jy1,get_icgoo_companyname_saler_in_jy,get_sale_post
from main.models import Pictures
from django.core.exceptions import ObjectDoesNotExist
from .WebCrawler import api_get_state_by_tracking_number
import re
import datetime
STATES = (
    (u'so_confirm', u'订单生效'),
    (u'po_confirm', u'已采购'),
    (u'po_checked', u'供应商已发货'),
    (u'po_done', u'货已到港'),
    (u'custom_done', u'报关完成'),
    (u'st_in_done', u'入库完成'),
    (u'st_out_done', u'出库完成'),
    (u'sign', u'已签收'),
    (u'cancel', u'取消'),
)

DESPS = (
    (u'so_confirm', u'订单已生效'),
    (u'po_confirm', u'确认采购数量'),
    (u'po_checked', u'供应商已经发货'),
    (u'po_done', u'货物已到香港'),
    (u'custom_done', u'正运往深圳库房，等待入库'),
    (u'st_in_done', u'入库数量'),
    (u'st_out_done', u'出库拍照已完成，正在包装'),
    (u'sign', u'已签收'),
    (u'cancel', u'取消'),
)

'''接收post请求，返回物流中心各项的订单数'''


@login_required
def user_get_order_num(request):
    partnerid = request.user.jyinfo.jy_partner_id
    if request.method == 'POST':
        state_detail = each_state_number_detail(partnerid, days=30)
        return JsonResponse(state_detail, safe=False)
    else:
        return render(request, "accounts/home.html")


#@login_required
def user_information(request):  # 基本资料
    try:
        user = request.user
        partnerid = request.user.jyinfo.jy_partner_id
        data = get_CRM_info(partnerid)
        login_name = request.user.username
        sale = get_sale(login_name)
        types = user.userinfo.type
        context = {'data': data, 'sale': sale[0],'type':types}
    except:
        notLogin = True
        context = {'notLogin':notLogin}      #注册后跳转到此页面提示待审核
    if request.method == 'POST':
        # TODO 其他资料修改和上传执照掺杂在一起是否合理？
        #修改资料
        email = request.POST.get('email',"")
        area_code = request.POST.get('area_code',"")#区号
        telephone = request.POST.get("telephone","")
        extensionnumber = request.POST.get('extensionnumber',"")#分机号
        company = request.POST.get("company",'')
        #files = request.POST.get("file","")
        #address = request.POST.get('address',"")
        user.email = email
        user.save()

        userregisterinfo = UserRegisterInfo.objects.get_or_create(user=user)[0]
        if area_code:
            userregisterinfo.area_code = area_code
        if telephone:
            userregisterinfo.telephone = telephone
        userregisterinfo.extensionnumber = extensionnumber
        if company:
            userregisterinfo.company_name = company
        #userregisterinfo.file_path = files
        userregisterinfo.is_changed = True#表示用户已经修改了资料

        if company and request.FILES and userregisterinfo.type == "personal":  # 如果满足这三个条件，表示客户要升级为企业
            userregisterinfo.update = "draft"
        userregisterinfo.save()

        if request.FILES:
            company_id = data['company_id']
            img = request.FILES['upload']
            if img.size / 1024 < 4096:
                # 如果名字中有中文则API调用不能通过佳友验证，
                # 而在佳友中上传中文名称图片则没问题，原因未知
                imgname = "/tmp/%s.%s" % (company_id, img.name.split('.')[-1])
                # 这里必须写入文件后再读取否则无法通过佳友表单验证
                with open(imgname, 'wb') as f:
                    f.write(img.read())
                    f.close()
                imgtemp = open(imgname, 'rb')
                files = {'attachment_file': (
                    imgname, imgtemp, img.content_type, {})}
                # 下面的ID需要公司的ID而不是个人的ID
                uploaddata = {'urltail': 'crm/partner/%s/' % company_id,
                              'files': files}
                uploadimg2jy(uploaddata)
                imgtemp.close()
                return JsonResponse(1,safe=False)
            else:
                # 文件大于4M
                return JsonResponse(0,safe=False)

    return render(request, "accounts/information.html", context)


@login_required
def user_headPortrait(request):  # 修改头像
    return render(request, "accounts/headPortrait.html")


@login_required
def user_invoice_info(request):  # 开票资料
    partnerid = request.user.jyinfo.jy_partner_id
    data = get_CRM_info(partnerid)
    return render(request, "accounts/invoice_info.html", {'data': data})


@require_http_methods(["POST"])
@login_required
def upload_contract(request):
    # 上传合同
    if request.FILES:
        so_id = request.POST['id']
        img = request.FILES['contract']
        if so_id and img.size / 1024 < 4096:
            # 如果名字中有中文则API调用不能通过佳友验证，
            # 而在佳友中上传中文名称图片则没问题，原因未知
            imgname = "/tmp/%s.%s" % (so_id, img.name.split('.')[-1])
            # 这里必须写入文件后再读取否则无法通过佳友表单验证
            with open(imgname, 'wb') as f:
                f.write(img.read())
                f.close()
            imgtemp = open(imgname, 'rb')
            files = {'attachment_file': (
                imgname, imgtemp, img.content_type, {})}
            uploaddata = {'urltail': 'sale/saleorder/%s/' % so_id,
                          'files': files}
            uploadimg2jy(uploaddata)
            imgtemp.close()
            status = 1
    else:
        status = 0
    # TODO 上传后返回哪个页面？
    return HttpResponse(status, content_type="text/plain") #兼容IE10以下


def each_state_number_detail(partner_id, days):
    """
    用户中心，每一个状态下销售订单的数量情况，返回一个字典值
    Args:
        partner_id:
        days:

    Returns:

    """
    result = {'po_checked': 0,  # 供应商已发货
              'po_done': 0,  # 货已到港
              'custom_done': 0,  # 报关完成
              'st_in_done': 0,  # 已入库
              'is_printed': 0,  # 正在备货，已经打单了的就是正在备货
              'st_out_done': 0,  # 已发货
              }
    data1 = get_route_list(partner_id, days=31)
    data2 = get_stockpicking_number(partner_id)
    # 对于‘name'与’state'相同的route,只能计算一次
    new_data1 = []
    new_data2 = []
    for one in data1:
        temp = {one['name']: one['state']}
        if temp not in new_data1:
            new_data1.append(temp)
            if one['state'] == "po_checked":
                result['po_checked'] += 1
            elif one['state'] == 'po_done':
                result['po_done'] += 1
            elif one['state'] == "custom_done":
                result['custom_done'] += 1
            else:
                pass
        else:
            pass

    # 对于出库单号相同的只计一次
    for one in data2:
        temp = {one['picking_name']: 1}
        if temp not in new_data2:
            new_data2.append(temp)
            if one['in'] == '1' and one['state'] == 'current':  # 未完成出库单，如果没有打单，则是已入库，如果打单，则是正在备货
                data = check_stock_out_is_print(
                    one['picking_name'], partner_id)
                if data['finished']:
                    result['is_printed'] += 1
                else:
                    result['st_in_done'] += 1
            elif one['state'] == 'finished':
                result['st_out_done'] += 1
            else:
                pass
        else:
            pass
    return result


def data_start_and_end(totalrows, pagerows, currentpage):
    """
    Args:
    totalrows: 一共有多少条记录
    pagerows: 每页显示多少条
    currentpage: 当前页数
    return: 返回当前页数数据的起始数和结束数
    """
    totalpage = totalrows / \
        pagerows if totalrows % pagerows == 0 else int(
            totalrows / pagerows) + 1  # 一共多少页
    if currentpage > totalpage:
        currentpage = totalpage
    start = (int(currentpage) - 1) * pagerows
    end = totalrows if currentpage == totalpage else int(
        currentpage) * pagerows
    return start, end, totalpage  # ,currentpage

# 未发货


@login_required
def user_stockpicking(request):
    partnerid = request.user.jyinfo.jy_partner_id
    if request.GET:
        partno = request.GET.get('search_prt', '')
        del_city = request.GET.get('del_city', 'None')
        stock_states = request.GET.get('stock_states', None)
        del_states = request.GET.get('del_states', None)
        del_type = request.GET.get('del_type', None)
        data = get_stockpicking(partnerid, 'current', 'express', partno)
        if del_city:
            data = [one for one in data if one['location'] == del_city]
        if del_type:
            data = [one for one in data if one['deliverytype'] == del_type]
    else:
        del_states = ''
        data = get_stockpicking(partnerid, 'current', 'express')

    dataArr1 = []
    for var1 in data:
        if del_states == '' or del_states == var1['state']:
            dataArr1.append(var1)
        elif del_states == 'not_available' and var1['state'] == 'assigned':
            dataArr1.append(var1)
    data = []
    for picking in dataArr1:
        if picking['lines_count'] > 0:
            data.append(picking)
    totalrows = len(data)
    return render(request, "accounts/stockpicking.html", {'data': data,
                                                          'partnerid': partnerid, 'totalrows': totalrows})

# 正在备货


@login_required
def user_alreadyinstorage_preparegoods(request):
    partnerid = request.user.jyinfo.jy_partner_id
    deliverytype = request.GET.get('deliverytype', '')  # 发货方式
    deliverycity = request.GET.get('deliverycity', '')  # 库房
    carrier_type = request.GET.get('carrier_type', '')
    partno = request.GET.get('partnoitem', '')

    #data = get_stockpicking(partnerid, 'current', '','')
    data = get_stockpicking(
        partnerid, 'current', carrier_type, '', deliverytype, deliverycity, partno)
    newdata = []
    for one in data:
        stoct_out_number = one['name']
        if one['lines_count'] > 0:
            dataarr = []  # 用来从新组织数据
            key = one['lines'].keys()[0]
            values = one['lines'].values()[0]
            for value in values:
                for state in value['latest_state']:
                    addnum = 0
                    if state['state'] == 'st_in_done':  # and value['ins']:
                        result = check_stock_out_is_print(
                            stoct_out_number, partnerid)
                        finished = result['finished']
                        if finished:  # 已入库但没有打印的，视为如入库，打印了大视为正在备货
                            dataarr.append(value)
                            addnum += 1
            one['lines'][key] = dataarr
            if dataarr:
                newdata.append(one)
    data = newdata
    for one in data:  # 计算还没入库数量
        arrivenum = 0  # 入库总量
        totalordernum = 0  # 采购总量
        # for key,values in one['lines'].items():
        key = one['lines'].keys()[0]
        values = one['lines'].values()[0]
        for value in values:
            totalordernum += int(value['order_qty'])
            for laststate in value['ins']:
                if laststate[1] == 'done':
                    arrivenum += int(laststate[0])
        one['notarrivenum'] = totalordernum - arrivenum
    totalrows = len(data)

    return render(request, "accounts/preparegoods.html", {'data': data, 'partnoitem': partno, 'totalrows': totalrows,
                                                          'deliverycity': deliverycity, 'deliverytype': deliverytype})

# 提货详情


def user_detailsofdelivery(request):
    # stockpicking = request.GET.get('stockpicking',None)
    # return
    # render(request,"accounts/detailsofdelivery.html",{'stockpicking':stockpicking})
    """ 自提方式查看提货码
    由于提货码规则变了，由以前的“获取新的提货码”变成“查看提货码”
    """
    partnerid = request.user.jyinfo.jy_partner_id
    stockpicking = request.GET.get('stockpicking', '')  # 获取出库单
    stockpicking_id = re.findall(r'(\w*[0-9]+)\w*', stockpicking)[0]  # 获取出库id号
    code = organize_selfpick_code(stockpicking_id, partnerid)
    return render(request, "accounts/detailsofdelivery.html", {"code": code})

# 已发货


@login_required
def user_stockpicking_al(request):
    partnerid = request.user.jyinfo.jy_partner_id
    deliverytype = request.GET.get('deliverytype', '')
    deliverycity = request.GET.get('deliverycity', '')  # 库房
    # carrier_type = request.GET.get('carrier_type', '')
    partno = request.GET.get('partnoitem', '')  # 型号
    date = request.GET.get('date', '')  # 日期
    currentpage = request.GET.get('currentpage', '1')  # 当前页

    #data = get_stockpicking(partnerid,'finished','express',partno)
    data = get_stockpicking(partnerid, 'finished', '',
                            date, deliverytype, deliverycity, partno)

    newdata = []
    for one in data:
        lines = one['lines'].values()
        addnum = 0
        one['lines_count'] = 0
        lines = iter(lines)
        while 1:
            try:
                for line in lines.next():

                    line['order_qty'] = int(line['order_qty'])
                    out_qty = 0  # 发货数量
                    for state in line['latest_state']:
                        if state['state'] in ['st_out_done', 'sign']:
                            out_qty += state['qty']
                        # print state['qty']
                    line['out_qty'] = out_qty
                    if line['out_qty'] != 0:
                        one['lines_count'] += 1
                    routes = line['latest_state']
                    if routes and addnum == 0 and one['lines_count'] != 0:
                        newdata.append(one)
                        addnum += 1
            except StopIteration:
                break

    data = newdata
    totalrows = len(data)

    return render(request, "accounts/stockpicking_al.html", {'data': data, 'partnoitem': partno, 'date': date,
                                                             'totalrows': totalrows, 'deliverycity': deliverycity})

# 已入库


@login_required
def user_already_instorage(request):
    partnerid = request.user.jyinfo.jy_partner_id

    partno = request.GET.get('partnoitem', '')  # 型号
    deliverycity = request.GET.get('deliverycity', '')  # 交货地
    carrier_type = request.GET.get('carrier_type', '')  # 收货方式
    data = get_stockpicking(partnerid, 'current',
                            carrier_type, '', '', deliverycity, partno)

    newdata = []
    for one in data:
        stoct_out_number = one['name']
        if one['lines_count'] > 0:
            dataarr = []  # 用来从新组织数据
            key = one['lines'].keys()[0]
            values = one['lines'].values()[0]
            for value in values:
                in_qty = 0
                in_time = one['so_confirmed_time']
                for state in value['latest_state']:
                    addnum = 0
                    if state['state'] == 'st_in_done':  # and value['ins']:
                        result = check_stock_out_is_print(
                            stoct_out_number, partnerid)
                        finished = result['finished']
                        if finished == False:  # 已入库但没有打印的，视为如入库，打印了大视为正在备货
                            in_qty += int(state['qty'])
                            in_time = state['time']
                            dataarr.append(value)
                            addnum += 1
                value['in_qty'] = in_qty  # 入库数量
                value['in_time'] = in_time  # 入库时间
            one['lines'][key] = dataarr
            one['lines_count'] = len(dataarr)
            if dataarr:
                newdata.append(one)
    data = newdata
    for one in data:  # 计算还没入库数量
        arrivenum = 0  # 入库总量
        totalordernum = 0  # 采购总量
        values = one['lines'].values()[0]
        for value in values:
            totalordernum += int(value['order_qty'])
            for laststate in value['ins']:
                if laststate[1] == 'done':
                    arrivenum += int(laststate[0])
        one['notarrivenum'] = totalordernum - arrivenum
    # print data
    totalrows = len(data)
    return render(request, "accounts/already_instorage.html",
                  {'data': data, 'partnoitem': partno, 'deliverycity': deliverycity,
                   'carrier_type': carrier_type, 'totalrows': totalrows})


# 已签收
@login_required
def user_stockpicking_self_finished(request):
    partnerid = request.user.jyinfo.jy_partner_id
    deliverytype = request.GET.get('deliverytype', '')
    deliverycity = request.GET.get('deliverycity', '')  # 交货地
    carrier_type = request.GET.get('carrier_type', '')
    partno = request.GET.get('partnoitem', '')  # 型号
    date = request.GET.get('date', '')  # 日期

    #data = get_stockpicking(partnerid, 'finished', '', partno)
    data = get_stockpicking(
        partnerid, 'finished', carrier_type, date, deliverytype, deliverycity, partno)
    newdata = []
    for one in data:
        one['lines_count'] = 0  # 总条目数
        lines = one['lines'].values()
        for line in lines[0]:
            line['iscontainsign'] = False
            line['sign_qty'] = 0  # 总发货数量
            routes = line['latest_state']
            if routes:
                for route in routes:
                    if route['state'] == 'sign':
                        one['lines_count'] += 1
                        line['sign_time'] = route['time']
                        line['sign_qty'] += route['qty']
                        line['iscontainsign'] = True
                        newdata.append(one)

    data = newdata
    for one in data:
        # for key,values in one['lines'].items():
        key = one['lines'].keys()[0]
        values = one['lines'].values()[0]
        arr = []
        for value in values:
            if value['iscontainsign']:
                money_type = value['price'][0:1]
                value['totalprice'] = float(
                    value['order_qty']) * float(value['price'][1:])
                value['totalprice'] = money_type + str(value['totalprice'])
                arr.append(value)
        one['lines'][key] = arr

    # 清除重复的出库单
    arr = []
    for one in data:
        flag = True
        if len(arr) != 0:
            for two in arr:
                if one['name'] == two['name']:
                    flag = False
            if flag:
                arr.append(one)
                flag = True
        else:
            arr.append(one)
    data = arr
    totalrows = len(data)
    return render(request, "accounts/stockpicking_self_al.html", {'data': data, 'partnoitem': partno, 'date': date,
                                                                  'totalrows': totalrows, 'deliverycity': deliverycity})

# 报价单，当前订单


@login_required
def user_saleorderlist(request):
    t1 = datetime.datetime.now()
    cur_user = request.user
    partnerid = cur_user.jyinfo.jy_partner_id
    days = request.GET.get('days', 30)  # 默认查询30天内的数据
    partno = request.GET.get('partnoitem', '')  # 型号
    date = request.GET.get('date', '')  # 日期
    newdate = date
    deliverycity = request.GET.get(
        'deliverycity', '')  # 交货地[hk:香港，sz:深圳,bj:北京]
    carriertype = request.GET.get('carriertype', '')  # 收货方式[自提，邮寄]
    # 标记是当前订单还是报价单(order:当前订单，quote:报价单)
    orderflag = request.GET.get('orderflag', '')
    currentpage = request.GET.get('currentpage', 1)  # 当前页，默认为1
    if orderflag == 'quote' and date:
        date = datetime.datetime.strptime(
            date, "%Y-%m-%d").strftime("%m/%d/%Y")
    # print
    # 'orderflag:',orderflag,'partnerid:',partnerid,'days:',days,'partno:',partno,'date:',date,'deliverycity:',deliverycity,'carriertype:',carriertype
    data = get_orderlist(orderflag, partnerid, days, partno,
                         date, deliverycity, carriertype)
    date = newdate
    latest_state_zhs = dict(STATES)
    for one in data:
        total_sale_unit_price = 0
        for sol in one['sols']:
            sol['total'] = '%.2f' % (
                float(sol['product_qty']) * float(sol['sale_unit_price']))
            total_sale_unit_price += float(sol['total'])
            one['total_sale_unit_price'] = total_sale_unit_price
            if orderflag == 'order':
                for state in sol['latest_state']:
                    state['state'] = latest_state_zhs[state['state']]
    totalrows = len(data)
    if orderflag == 'order':
        return render(request, "accounts/saleorderlist.html", {'data': data, 'date': date, 'deliverycity': deliverycity,
                                                               'partnoitem': partno, 'carriertype': carriertype, 'totalrows': totalrows})  # 当前订单
    else:
        # 报价单
        return render(request, "accounts/quatationlist.html", {'data': data, 'partnoitem': partno, 'date': date, 'totalrows': totalrows})

# 供应商已发货


@login_required
def user_supplier_already(request):
    cur_user = request.user
    partnerid = cur_user.jyinfo.jy_partner_id
    ordertype = 'order'
    currentpage = request.GET.get('currentpage', '1')
    days = request.GET.get('days', 30)
    partno = request.GET.get('partnoitem', '')
    date = request.GET.get('date', '')
    deliverycity = request.GET.get('deliverycity', '')
    carriertype = request.GET.get('carriertype', '')
    #data = get_saleorderlist(partnerid,days,partno,date,deliverycity,carriertype)
    data = get_orderlist(ordertype=ordertype, partner_id=partnerid, days=days,
                         partno=partno, date=date, deliverycity=deliverycity, carriertype=carriertype)
    latest_state_zhs = dict(STATES)
    newdata = []
    for one in data:
        total_sale_unit_price = 0
        countnum = 0
        for sol in one['sols']:
            sol['iscontainsupplier'] = False
            sol['total'] = '%.2f' % (
                float(sol['product_qty']) * float(sol['sale_unit_price']))
            total_sale_unit_price += float(sol['total'])
            one['total_sale_unit_price'] = total_sale_unit_price
            for state in sol['latest_state']:
                state['state'] = latest_state_zhs[state['state']]
                if(state['state'] == u'供应商已发货'):
                    sol_id = sol['sol_id']
                    trackingnumber = get_tracking_number(sol_id, partnerid)
                    tracking_number = trackingnumber['tracking_number']
                    if trackingnumber['tracking_number']:
                        tracking_number = tracking_number.encode('utf-8')
                        lists = re.split(',|_|:|;|；|，|：| ',
                                         tracking_number)  # 混合分割
                        lists = sorted(lists, reverse=True)
                        tracking_express = lists[0]  # 快递公司名
                        number = lists[1]
                        sol['tracking_number'] = tracking_express + ':' + number

                    else:
                        sol['tracking_number'] = u'没有相关运单号信息！'
                    sol['iscontainsupplier'] = True
                    countnum += 1
                    if(countnum == 1):
                        newdata.append(one)
    data = newdata
    for one in data:
        newarray = []
        total_sale_unit_price = 0
        for sol in one['sols']:
            if sol['iscontainsupplier'] == True:
                newarray.append(sol)
        for price in newarray:
            total_sale_unit_price += float(price['total'])
        one['sols'] = newarray
        one['sol_num'] = len(one['sols'])
        one['total_sale_unit_price'] = total_sale_unit_price
    totalrows = len(data)
    # currentpage = int(currentpage)
    # start, end,totalpage = data_start_and_end(totalrows=totalrows, pagerows=10, currentpage=currentpage)
    # data = data[start:end]

    return render(request, "accounts/supplier_already.html", {
        'data': data,
        'date': date,
        'partnoitem': partno,
        'deliverycity': deliverycity,
        'carriertype': carriertype,
        'totalrows': totalrows,
    })


# 货已到港
@login_required
def user_goodsarriveport(request):
    cur_user = request.user
    partnerid = cur_user.jyinfo.jy_partner_id
    ordertype = "order"
    days = request.GET.get('days', 30)
    partno = request.GET.get('partnoitem', '')
    date = request.GET.get('date', '')
    deliverycity = request.GET.get('deliverycity', '')
    carriertype = request.GET.get('carriertype', '')
    #data = get_saleorderlist(partnerid,days,partno,date,deliverycity,carriertype)
    data = get_orderlist(ordertype=ordertype, partner_id=partnerid, days=days,
                         partno=partno, date=date, deliverycity=deliverycity, carriertype=carriertype)
    currentpage = request.GET.get('currentpage', '1')
    latest_state_zhs = dict(STATES)
    newdata = []
    for one in data:
        total_sale_unit_price = 0
        countnum = 0
        for sol in one['sols']:
            sol['isarriveport'] = False
            sol['total'] = '%.2f' % (
                float(sol['product_qty']) * float(sol['sale_unit_price']))
            total_sale_unit_price += float(sol['total'])
            one['total_sale_unit_price'] = total_sale_unit_price
            for state in sol['latest_state']:
                state['state'] = latest_state_zhs[state['state']]
                if(state['state'] == u'货已到港'):
                    sol['isarriveport'] = True
                    countnum += 1
                    if(countnum == 1):
                        newdata.append(one)
    data = newdata
    for one in data:
        newarray = []
        total_sale_unit_price = 0
        one['sol_num'] = 0  # 条目数
        for sol in one['sols']:
            if sol['isarriveport'] == True:
                one['sol_num'] += 1
                newarray.append(sol)
        for price in newarray:
            total_sale_unit_price += float(price['total'])
        one['sols'] = newarray
        one['total_sale_unit_price'] = total_sale_unit_price
    totalrows = len(data)
    # currentpage = int(currentpage)
    # start, end, totalpage = data_start_and_end(totalrows=totalrows, pagerows=10, currentpage=currentpage)
    # data = data[start:end]
    # print data[0:2]

    return render(request, "accounts/goodsarriveport.html", {'data': data, 'partnoitem': partno, 'totalrows': totalrows,
                                                             'date': date, 'deliverycity': deliverycity})

# 报关完成


@login_required
def user_customer_finish(request):
    cur_user = request.user
    partnerid = cur_user.jyinfo.jy_partner_id
    ordertype = 'order'
    days = request.GET.get('days', 30)
    partno = request.GET.get('partnoitem', '')
    date = request.GET.get('date', '')
    deliverycity = request.GET.get('deliverycity', '')
    carriertype = request.GET.get('carriertype', '')
    #data = get_saleorderlist(partnerid,days,partno,date,deliverycity,carriertype)
    data = get_orderlist(ordertype=ordertype, partner_id=partnerid, days=days,
                         partno=partno, date=date, deliverycity=deliverycity, carriertype=carriertype)

    latest_state_zhs = dict(STATES)
    newdata = []
    for one in data:
        total_sale_unit_price = 0
        countnum = 0
        for sol in one['sols']:
            sol['iscontainconsumer'] = False
            sol['total'] = '%.2f' % (
                float(sol['product_qty']) * float(sol['sale_unit_price']))
            total_sale_unit_price += float(sol['total'])
            one['total_sale_unit_price'] = total_sale_unit_price
            for state in sol['latest_state']:
                state['state'] = latest_state_zhs[state['state']]
                if(state['state'] == u'报关完成'):
                    sol['iscontainconsumer'] = True
                    countnum += 1
                    if(countnum == 1):
                        newdata.append(one)
    data = newdata
    for one in data:
        newarray = []
        total_sale_unit_price = 0
        for sol in one['sols']:
            if sol['iscontainconsumer'] == True:
                newarray.append(sol)
        for price in newarray:
            total_sale_unit_price += float(price['total'])
        one['sols'] = newarray
        one['sol_num'] = len(newarray)
        one['total_sale_unit_price'] = total_sale_unit_price
    totalrows = len(data)
    # currentpage = int(currentpage)
    # start, end, totalpage = data_start_and_end(totalrows=totalrows, pagerows=10, currentpage=currentpage)
    # data = data[start:end]
    return render(request, "accounts/customer_finish.html", {'data': data, 'partnoitem': partno, 'date': date, 'totalrows': totalrows,
                                                             'deliverycity': deliverycity, 'carriertype': carriertype})

# 历史订单


@login_required
def user_saleorderlist_al(request):
    partnerid = request.user.jyinfo.jy_partner_id
    #days = request.GET.get('days',30)
    date_begin = request.GET.get('date_begin', '')
    date_end = request.GET.get('date_end', '')
    partno = request.GET.get('partnoitem', '')
    #date = request.GET.get('date','')
    deliverycity = request.GET.get('deliverycity', '')
    carriertype = request.GET.get('carriertype', '')
    data = get_saleorderlist_al(
        partnerid, partno, date_begin, date_end, deliverycity, carriertype)
    # print 'partnerid:',partnerid,'partno:',partno,'date_begin:',date_begin,'date_end:',date_end,'deliverycity:',deliverycity,'carriertype:',carriertype
    # data = get_orderlist(ordertype=ordertype, partner_id=partnerid, days=days, partno=partno
    #                      , date=date, deliverycity=deliverycity, carriertype=carriertype)
    currentpage = request.GET.get('currentpage', '1')
    latest_state_zhs = dict(STATES)
    new_data = []
    for one in data:
        total_sale_unit_price = 0
        for sol in one['sols']:
            sol['out_qty'] = 0
            sol['total'] = '%.2f' % (
                float(sol['product_qty']) * float(sol['sale_unit_price']))
            total_sale_unit_price += float(sol['total'])
            one['total_sale_unit_price'] = total_sale_unit_price
            for state in sol['latest_state']:
                state['state'] = latest_state_zhs[state['state']]
                # print state['state']
                if state['state'] == u'已签收':
                    sol['out_qty'] += int(state['qty'])
        new_data.append(one)

    data = new_data
    totalrows = len(data)
    # print totalrows
    # currentpage = int(currentpage)
    # start, end, totalpage = data_start_and_end(totalrows=totalrows, pagerows=10, currentpage=currentpage)
    # data = data[start:end]
    # print data[0]

    return render(request, "accounts/saleorderlist_al.html", {'data': data, 'partnoitem': partno, 'date_begin': date_begin, 'date_end': date_end, 'totalrows': totalrows,
                                                              'deliverycity': deliverycity, 'carriertype': carriertype})


@login_required
def user_saleorderlineroute(request):
    route_id = request.GET.get('rid')
    sol_id = request.GET.get('rid')
    bgcolor = request.GET.get('bgcolor')
    partner_id = request.user.jyinfo.jy_partner_id
    data = get_saleorderlineroute(route_id, partner_id)
    state_zhs = dict(STATES)
    states = state_zhs.keys()
    desps = dict(DESPS)
    new_data = []
    for one in data:
        if one['state'] in states:
            one['desp'] = desps[one['state']]
            one['state'] = state_zhs[one['state']]
            new_data.append(one)
    new_data.reverse()
    return render(request,
                  "accounts/saleorderlineroute.html", {'data': new_data,
                                                       "sol_id": sol_id, 'bgcolor': bgcolor})


# 对应供应商已发货模块“货物追踪”
def user_tracegoods(request):
    partnerid = request.user.jyinfo.jy_partner_id
    tracking = request.GET.get('tracking', None)
    # print 'yy=',tracking
    sol_id = request.GET.get('sol_id', None)

    tracking_number = request.GET.get('tracking_number', None)

    packets = api_get_state_by_tracking_number(sol_id, partnerid)

    if tracking == 'fedex' or tracking == "FEDEX":

        packets = packets['TrackPackagesResponse'][
            'packageList'][0]['scanEventList']
        if packets[0]['date'] != '' and packets[0]['date'] != None:
            has_error = False  # 在获取运单号错误，错误运单号时为True
        else:
            has_error = True

        return render(request,
                      "accounts/tracegoods_fedex.html", {
                          'packets': packets,
                          'has_error': has_error,
                      })

    elif tracking == 'dhl' or tracking == "DHL":

        if packets.has_key('results') == True:

            packets = packets['results'][0]['checkpoints']
            has_error = False  # 在获取运单号错误，错误运单号时为True
        else:
            has_error = True
        return render(request,
                      "accounts/tracegoods_DHL.html", {
                          'packets': packets,
                          'has_error': has_error,
                      })

    elif tracking == 'ups' or tracking == "UPS":
        # print 'll',packets
        new_data = []
        for one in packets:
            if one:
                new_data.append(one)
        packets = new_data
        if packets[0].has_key('error'):
            has_error = True
        else:
            has_error = False
        return render(request,
                      "accounts/tracegoods_ups.html", {
                          'packets': packets,
                          'has_error': has_error,
                      })


# 自提方式，获取新的自提码
"""
@login_required
def user_get_deliver_code(request):
    #自提方式，用户获取新的提货码
    partnerid = request.user.jyinfo.jy_partner_id
    stockpicking = request.GET.get('stockpicking','')#获取出库单
    stockpicking_id = re.findall(r'(\w*[0-9]+)\w*',stockpicking)[0]#获取出库id号
    phone = request.GET.get('phone','')#获取电话号码
    code = organize_selfpick_code(stockpicking_id,partnerid)
    #短信内容
    content = (u'尊敬的客户您好，您的货物已经到库，提取货物的验证码为%s,请牢记此验证码并'
                   u'在提取货物时出示此验证码,我们的工作时间:8:50--17:50,我们的地址:'
                   u'深圳福田区福虹路世贸广场A座501B.'
                   u'(温馨提示:周一、周二库房繁忙,为了节省您取货等待的时间,'
                   u'请在这两天提货的客户尽量在下午15:00~17:30前往.)') % code['code']
    send_sms(phone,content)
    return HttpResponse('短信发送成功!')
    # return render(request,
    #               "accounts/detailsofdelivery.html", {
    #                   'phone': phone,
    #                   'content': content,
    #                   'message':u"短信发送成功！",
    #               })
"""


@login_required
def user_get_deliver_code(request):
    """ 自提方式查看提货码
    由于提货码规则变了，由以前的“获取新的提货码”变成“查看提货码”
    """
    partnerid = request.user.jyinfo.jy_partner_id
    stockpicking = request.GET.get('stockpicking', '')  # 获取出库单
    stockpicking_id = re.findall(r'(\w*[0-9]+)\w*', stockpicking)[0]  # 获取出库id号
    code = organize_selfpick_code(stockpicking_id, partnerid)
    return render(request, "accounts/detailsofdelivery.html", {"code": code})


@login_required
def user_get_sf_route_info(request):
    """
    跟踪顺丰物流信息
    """
    num = request.GET.get('num', '')
    data = get_sf_route_info(num)
    return render(request, "accounts/already_route.html", {'data': data})


@login_required
def user_stockpickinglineroute(request):
    route_id = request.GET.get('rid')
    sol_id = request.GET.get('sol')
    bgcolor = request.GET.get('bgcolor')
    partner_id = request.user.jyinfo.jy_partner_id
    data = get_stockpickinglineroute(sol_id, partner_id)
    state_zhs = dict(STATES)
    states = state_zhs.keys()
    desps = dict(DESPS)
    new_data = []
    for one in data:
        if one['state'] in states:
            one['desp'] = desps[one['state']]
            one['state'] = state_zhs[one['state']]
            new_data.append(one)
    new_data2 = []
    for one in new_data:
        if one['state'] == u'出库完成':
            new_data2.append(one)
            break
    new_data = new_data2
    return render(request,
                  "accounts/saleorderlineroute.html", {'data': new_data,
                                                       "sol_id": sol_id, 'bgcolor': bgcolor})


@require_http_methods(["GET", "POST"])
def user_register(request):
    if request.method == 'GET':
        form = CaptchaTestForm(error_class=HiddenErrorList)
        return render(request, "accounts/register.html", {"capform": form})
    else:
        types = request.POST.get('type', "")  # 类型，公司还是个人
        company = request.POST.get('company', "")  # 公司名
        surname = request.POST.get('surname', "")  # 联系人姓氏
        name = request.POST.get('name', "")  # 联系人名字
        phone = request.POST.get('phone', "")  # 电话号码,也是登录的用户名
        #username = request.POST.get("username", "")
        password1 = request.POST.get("password", "")
        password2 = request.POST.get("password_again", "")
        code = request.POST.get("code", "")  # 手机验证码
        codeobj = RegisterCode.objects.filter(
            username=phone, used=False, code=code).order_by('-send_time')
        captcha_1 = request.POST.get('captcha_1', '')  # 验证码
        files_path = request.POST.get("file", "")
        email = request.POST.get('email', "")
        area_code = request.POST.get('area_code', "")  # 区号
        telephone = request.POST.get('telephone', "")  # 座机号码
        extensionnumber = request.POST.get('extensionnumber', "")  # 分机号
        clause = request.POST.get('clause', "")

        #if codeobj and password1 and password2 and password1 == password2 and captcha_1 and clause:        --为了方便测试，暂时注释掉手机验证码验证
        if password1 and password2 and password1 == password2 and captcha_1 and clause:
            new_user = User.objects.create_user(phone, '', password1)
            new_user.email = email
            new_user.first_name = surname
            new_user.last_name = name
            new_user.is_active = False  # 注册时,默认new_user是０,只有通过审批才会变成１，才能够登录成功
            new_user.save()

            if request.FILES:

                img = request.FILES['upload']
                if img.size / 1024 < 4096:
                    ids = new_user.id + 1000000
                    ids = str(ids)
                    #对于刚刚注册但是还未绑定的用户，我们默认1000000+icgoo_user_auth_id为其"company_id",待绑定后再修改该值
                    imgname = "/tmp/%s.%s" % (ids, img.name.split('.')[-1])
                    with open(imgname, 'wb') as f:
                        f.write(img.read())
                        f.close()
                    imgtemp = open(imgname, 'rb')
                    files = {'attachment_file': (
                        imgname, imgtemp, img.content_type, {})}


                    uploaddata = {'urltail': 'crm/partner/%s/' % ids,
                                  'files': files}
                    #print uploaddata
                    uploadimg2jy1(uploaddata)
                    imgtemp.close()


            user_registerinfo = UserRegisterInfo()  # 同时创建user_registerinfo注册信息
            user_registerinfo.user = new_user
            user_registerinfo.phone = phone
            user_registerinfo.company_name = company
            user_registerinfo.area_code = area_code
            user_registerinfo.telephone = telephone
            user_registerinfo.extensionnumber = extensionnumber
            user_registerinfo.type = types
            user_registerinfo.file_path = files_path
            user_registerinfo.update = 'no'
            user_registerinfo.save()

            user_extra = UserExtraInfo()  # 创建用户的同时创建user_extrainfo
            user_extra.user = new_user
            user_extra.save()

            #codeobj[0].used = True　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　--为了方便测试，暂时注释掉手机验证码验证
            #codeobj[0].save()                                                          --为了方便测试，暂时注释掉手机验证码验证
            # 这里是否需要生成对应的userextrainfo呢？目前是绑定时才生成。
            # return JsonResponse({"status": "sucess", "desc": u""})
            # return HttpResponseRedirect(reverse("accounts:user_login"))
            return render(request, "accounts/reg_success.html", {"result": "success", 'username': phone,
                                                                 'company_name':company,})
        else:
            return render(request, "accounts/register_result.html", {"result": "failed"})
            # return JsonResponse({"status": "error",
            #                      "desc": u"注册失败！请检查密码或验证码是否正确！"})


@require_http_methods(["GET", "POST"])
def user_reg_success(request):
    if request.method == "GET":
        return render(request, 'accounts/reg_success.html')
    else:
        username = request.POST.get('username', "")
        saler = request.POST.get('saler', '').strip()
        company_name = request.POST.get('company_name','').strip()
        try:
            user = User.objects.get(username=username)
            user_registerinfo = UserRegisterInfo.objects.get(user=user)
            if username and user and user_registerinfo and saler :
                # 如果username存在且专属客服saler也填了，按正常流程走
                user_registerinfo.saler = saler
                user_registerinfo.save()

                return render(request, 'accounts/information.html', {'notLogin': True})
            elif username and user and user_registerinfo and not saler:
                #如果username存在，但是saler没填或者说没有专属客服
                #这就要分两种情况，一是根据公司名去佳友里查，如果查到了，自动帮它填上专属客服
                #如果在佳友里没查到，那就是新客户，就随机分配销售，然后写进数据库中
                saler = get_icgoo_companyname_saler_in_jy(company_name)
                saler = saler['saler']
                if saler:
                    saler = saler
                else:
                    salers = get_sale_post()
                    #print "saler",salers
                    if salers:
                        saler = salers[0]['name']
                    else:
                        saler = u"admin"#如果为admin，则说明随机分配没有成功，可能需要人工分配

                user_registerinfo.saler = saler
                user_registerinfo.save()
                return render(request, 'accounts/information.html', {'notLogin': True})
            else:
                return render(request, 'accounts/reg_success.html')

        except ObjectDoesNotExist:
            return render(request, 'accounts/reg_success.html')



@require_http_methods(["GET", "POST"])
def user_login(request):
    if request.method == 'GET':
        form = CaptchaTestForm(error_class=HiddenErrorList)
        return render(request, "accounts/login.html", {"capform": form})
    else:
        form = CaptchaTestForm(request.POST, error_class=HiddenErrorList)
        ajax_login = request.POST.get('ajax_login', '')
        if ajax_login:  # 判断是否为批量查询结果页的ajax登录
            if form.is_valid():
                username = request.POST.get("username", "")
                password = request.POST.get("password", "")
                user = authenticate(username=username, password=password)
                if (user is not None) and user.is_active:
                    login(request, user)
                    return JsonResponse(username, safe=False)
            else:
                error = 'error'
                return JsonResponse(error, safe=False)
        else:
            if form.is_valid():
                username = request.POST.get("username", "")
                password = request.POST.get("password", "")
                next_page = request.GET.get("next", "/")
                user = authenticate(username=username, password=password)
                if (user is not None) and user.is_active:
                    login(request, user)
                    return HttpResponseRedirect(next_page)
                else:
                    msg = '您输入的密码和账户名不匹配，是否<a href="/accounts/forgetpassword/">忘记密码</a>'
            else:
                msg = '验证码错误'
            return render(request, "accounts/login.html", {"msg": msg,
                                                           "capform": form})


@login_required
@require_http_methods(["GET"])
def user_logout(request):
    logout(request)
    return HttpResponseRedirect('/')


@login_required
@require_http_methods(["POST"])
def user_resetpassword(request):
    user = request.user

    old = request.POST.get("pwd", "")
    new = request.POST.get("password", "")
    code = request.POST.get('code',"")
    codeobj = RegisterCode.objects.filter(username=user,used=0,code=code).order_by('-send_time')

    if codeobj and user.check_password(old):
        user.set_password(new)
        user.save()
        codeobj[0].used = 1
        codeobj[0].save()
        #logout(request)#设置成功后返回重新登录页面
        return JsonResponse(1,safe=False)# 密码修改成功，返回1给ajax
    else:
        return JsonResponse(0,safe=False)



@require_http_methods(["GET", "POST"])
def user_ship_address(request):
    if request.method == 'GET':
        return render(request, "accounts/ship_address.html", {})


@require_http_methods(["GET"])
def user_checkusername(request):
    '''检测用户名是否存在'''
    username = request.GET.get("username", "")
    try:
        User.objects.get(username=username)
        return JsonResponse(1,safe=False)
    except Exception as e:
        return JsonResponse(0,safe=False)


@require_http_methods(["GET", "POST"])
def user_forgetpassword(request):
    if request.method == 'GET':
        return render(request, "accounts/forgetpswd.html", {})
    else:
        username = request.POST.get("phone", "")
        code = request.POST.get("code", "")
        password = request.POST.get('password',"")
        password_again = request.POST.get('password_again',"")
        codeobj = RegisterCode.objects.filter(
            username=username, used=False, code=code).order_by('-send_time')
        user = User.objects.get(username=username)

        if user and codeobj and password == password_again and user.is_active:
            if user.is_active:
                user.set_password(password)
                user.save()
                codeobj[0].used = 1
                codeobj[0].save()
                person = authenticate(username=username, password=password)     #密码找回成功后，登录并跳转到用户中心
                login(request,person)
                return render(request, "accounts/information.html")
            else:
                codeobj[0].used = 1
                codeobj[0].save()
                return render(request, "accounts/forgetpswd.html", {'msg': '该账号尚未通过审批,请耐心等待!'})
        else:
            return render(request, "accounts/forgetpswd.html",{'msg':'验证码错误'})


@require_http_methods(["GET"])
def send_code(request):
    # 应该设置为3分钟失效并重新生成防止暴力破解,不过先这样,有空再改--xsy20151022
    username = request.GET.get("username", "")
    obj = RegisterCode.objects.filter(
        username=username, used=False).order_by('-send_time')
    msg = {'title': u'ICGOO网站注册验证码',
           'content': u"尊敬的用户,您的ICGOO验证码为:%s"}
    if obj:
        if obj[0].need_resend():
            msg['content'] = msg['content'] % obj[0].code
            send_msg(obj[0].username, msg)
            obj[0].save()  # 刷新发送时间
    else:
        obj = RegisterCode(username=username, code=creat_code())
        obj.save()
        msg['content'] = msg['content'] % obj.code
        send_msg(obj.username, msg)  # 用户名只能为手机或者邮箱
    return JsonResponse({"status": "sucess", "desc": u"验证码已发送！"})


@require_http_methods(["POST"])
@http_basic_auth
@csrf_exempt
def binding_jy(request):
    '''jy发送请求和icgoo用户绑定,认证用户必须是超级管理员否则403
       requests.post("http://127.0.0.1:8080/accounts/bindingjy/",
       auth=('superuser','password'),
       data={"username":"icgoo","jy_partner_id":"1"})
       解绑行为就是不要传递jy_partner_id参数
    '''
    username = request.POST.get("username", "")
    jy_partner_id = request.POST.get("jy_partner_id", None)
    try:
        user = User.objects.get(username=username)
    except Exception as e:
        return JsonResponse({"status": "error", "desc": u"用户名不存在"})
    if jy_partner_id:
        jyinfo, created = UserExtraInfo.objects.get_or_create(user=user)
        jyinfo.jy_partner_id = jy_partner_id
        jyinfo.save()
        return JsonResponse({"status": "sucess", "desc": u"绑定成功"})
    else:
        jyinfo = UserExtraInfo.objects.get(user=user)
        jyinfo.jy_partner_id = None
        jyinfo.save()
        # UserExtraInfo.objects.get(user=user).delete()
        return JsonResponse({"status": "sucess", "desc": u"解绑成功"})


def get_sale_info(request):
    login_name = request.user.username
    sale = get_sale(login_name)
    return JsonResponse({'data': sale})

def download_url(request):
    partnerid = request.GET.get('id')
    urltail = 'get_attachment_links/sale/saleorder/{}'.format(partnerid)
    link = get_attachment_links(urltail)
    return JsonResponse(link,safe=False)


def check_phone_has_registered(request):
    """
    判断一个手机号是否已经注册过
    """
    phone = request.GET.get('phone','').strip()
    if phone:
        try:
            user = User.objects.get(username=phone)
            if user:
                return True
            else:
                return False
        except:
            return False
    else:
        return False
