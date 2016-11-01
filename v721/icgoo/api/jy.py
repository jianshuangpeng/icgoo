# coding=utf-8
# 调用jy的api
from webconfig.models import WebConfig
from django.core.cache import cache
import requests
import json


def get_CRM_info(partner_id):
    '''获取客户CRM信息'''
    urltail = "crm_info/?partner_id=%s" % (partner_id)
    result = _send_request(urltail)
    return result


def get_sale(login_name=''):
    '''获取销售信息'''

    key = "sale_info%s" % login_name
    salecache = cache.get(key)

    if salecache:
        return json.loads(salecache)
    else:
        if login_name:
            urltail = "getsales/?login_name=%s" % login_name
        else:
            urltail = "getsales/"
    result = _send_request(urltail, newapi=False)
    cache.set(key, json.dumps(result), 30)
    return result

def get_sale_post(login_name=''):
    """
    以post方式随机获取销售人员，因为在新注册用户中，随机分配销售人员后有个post提交表单的动作，并将其写入数据库
    """
    urltail = "get_jy_saler/"
    data = {'login_name':login_name}
    result = _send_request_post(urltail,data=data,new_api=True)

    return result


def get_sale_templates(request):
    '''获取销售信息并渲染在BASE模板中'''
    try:
        result = get_sale()
    except Exception as e:
        result = []
    return {"sales": result}


def get_stockpicking(partner_id, state, carrier_type, start_date, deliverytype, deliverycity, partno):
    '''根据partner_id获取出库单'''
    urltail = "stockpicking/?partner_id=%s&state=%s&carrier_type=%s&partno=%s&start_date=%s&deliverytype=%s&deliverycity=%s" % (
        partner_id, state, carrier_type, partno, start_date, deliverytype, deliverycity)
    result = _send_request(urltail)
    return result


def get_stockpicking_self_al(partner_id, state, carrier_type, start_date, deliverytype, deliverycity, partno):
    '''根据partner_id获取出库单'''
    urltail = "stockpicking/?partner_id=%s&state=%s&carrier_type=%s&partno=%s&start_date=%s&deliverytype=%s&deliverycity=%s" % (
        partner_id, state, carrier_type, partno, start_date, deliverytype, deliverycity)
    result = _send_request(urltail)
    return result


def get_saleorderlist(partner_id, partno, date_begin, date_end, deliverycity, carriertype):
    '''根据partner_id显示所有订单'''
    urltail = "sale_order_list/?partner_id=%s&partno=%s&date_begin=%s&date_end=%s&deliverycity=%s&carriertype=%s" % (
        partner_id, partno, date_begin, date_end, deliverycity, carriertype)
    result = _send_request(urltail)
    return result


def get_quoteorderlist(partner_id, days, partno, date):
    """根据partner_id显示所有报价单"""
    urltail = "quote_order_list/?partner_id=%s&days=%s&partno=%s&date=%s" % (
        partner_id, days, partno, date)
    result = _send_request(urltail)
    return result


def get_orderlist(ordertype, partner_id, days, partno, date, deliverycity, carriertype):
    """根据partner_id显示所有销售单/报价单"""
    urltail = 'order_list/?ordertype=%s&partner_id=%s&days=%s&partno=%s&date=%s&deliverycity=%s&carriertype=%s' % (
        ordertype, partner_id, days, partno, date, deliverycity, carriertype)
    result = _send_request(urltail)
    return result


def get_saleorderlist_al(partner_id, partno, date_begin, date_end, deliverycity, carriertype):
    '''根据partner_id显示所有订单'''
    urltail = "sale_order_history/?partner_id=%s&partno=%s&date_begin=%s&date_end=%s&deliverycity=%s&carriertype=%s" % (
        partner_id, partno, date_begin, date_end, deliverycity, carriertype)
    result = _send_request(urltail)
    return result


def get_stockpickinglineroute(saleorderline_id, partner_id):
    '''根据saleorderline_id获取子单状态'''
    # print 'api/jy.py line 47 saleorderline_id', saleorderline_id
    urltail = "sale_order_line_route/?sale_order_line_id=%s&partner_id=%s" % (
        saleorderline_id, partner_id)
    result = _send_request(urltail)
    return result


def get_saleorderlineroute(route_id, partner_id):
    '''根据saleorderline_id获取子单状态'''
    urltail = "get_all_state_by_route_id/?route_id=%s&partner_id=%s" % (
        route_id, partner_id)
    result = _send_request(urltail)
    return result


def get_saleorderlinestate(saleorderline_id, partner_id):
    '''根据saleorderline_id获取子单状态'''
    urltail = "get_all_state_by_sol_id/?sale_order_line_id=%s&partner_id=%s" % (
        saleorderline_id, partner_id)
    result = _send_request(urltail)
    return result


def get_tracking_number(saleorderline_id, partner_id):
    '''根据销售子单号，获取销售主单供应商的发货运单号'''
    urltail = 'get_tracking_number/?sale_order_line_id=%s&partner_id=%s' % (
        saleorderline_id, partner_id)
    result = _send_request(urltail)
    return result


def check_stock_out_is_print(stock_out_number, partner_id):
    '''根据出库单，判断出库单是否加入打单队列或者完成打单'''
    urltail = 'check_stock_out_is_print/?stock_out_number=%s&partner_id=%s' % (
        stock_out_number, partner_id)
    result = _send_request(urltail)
    return result


def organize_selfpick_code(stockpicking_id, partner_id):
    '''根据出库单id，获取/组织新的自提验货码'''
    urltail = 'organize_selfpick_code/?stockpicking=%s&partner_id=%s' % (
        stockpicking_id, partner_id)
    result = _send_request(urltail)
    return result


def get_sf_route_info(num):
    """
    获取顺丰物流信息
    Args:
        num: 顺丰运单号

    Returns:

    """
    urltail = "sf_route/?num=%s" % num
    result = _send_request(urltail)
    return result


def get_route_list(partner_id, days):
    """
    获取满足条件的所有销售订单的route记录
    Args:
        partner_id:
        days:

    Returns:

    """
    urltail = "get_route_list/?partner_id=%(partner_id)s&days=%(days)s" % {
        'partner_id': partner_id, 'days': days}
    result = _send_request(urltail)
    return result


def get_stockpicking_number(partner_id):
    """
    获取用户未关闭的出库单信息
    Args:
        partner_id:

    Returns:

    """
    urltail = "get_stockpicking_number/?partner_id=%(partner_id)s" % {
        'partner_id': partner_id}
    result = _send_request(urltail)
    return result

def get_attachment_links(urltail):
    """
    获取附件地址
    营业执照url：http://xxxx/get_attachment_links/crm/partner/partnerid/
    上传合同url：http://xxxx/get_attachment_links/sale/saleorder/saleorderid/
    返回由图片链接构成的列表
    """
    return _send_request(urltail)

def get_icgoo_companyname_saler_in_jy(company_name):
    """
    获取icgoo公司名在jy里的销售人员，如果jy里没有该公司，返回空
    Args:
        company_name: 公司名

    Returns:

    """
    url = "check_icgoo_companyname_in_jy/"
    data = {'company_name':company_name}
    result = _send_request_post(url,data)
    return result


def _send_request(urltail, newapi=True):
    if newapi:
        jy_api_url = WebConfig.objects.get(key="JY_API_URL_NEW").value
        #jy_api_url = "http://192.168.0.33:8886/api_icgoo"
        jy_user = WebConfig.objects.get(key="JY_USER_NEW").value
        jy_pswd = WebConfig.objects.get(key="JY_PSWD_NEW").value

    else:
        jy_api_url = WebConfig.objects.get(key="JY_API_URL").value
        #jy_api_url = "http://192.168.0.33:8886/api"
        jy_user = WebConfig.objects.get(key="JY_USER").value
        jy_pswd = WebConfig.objects.get(key="JY_PSWD").value
    url = "%s/%s" % (jy_api_url, urltail)
    print url
    try:
        resp = requests.get(url, auth=(jy_user, jy_pswd), timeout=30)
        if resp.status_code == 200:
            x = resp.json()
            return x
        else:
            return []
    except Exception as e:
        return []

def _send_request_post(urltail,data,new_api=True):
    """
    以post方式查询jy里信息
    """
    if new_api:
        jy_host = WebConfig.objects.get(key="JY_API_URL_NEW").value
        #jy_host = "http://192.168.0.33:8886/api_icgoo"
        jy_user = WebConfig.objects.get(key="JY_USER_NEW").value
        jy_pswd = WebConfig.objects.get(key="JY_PSWD_NEW").value
    else:
        jy_host = WebConfig.objects.get(key='JY_API_USER').value
        jy_user = WebConfig.objects.get(key='JY_USER').value
        jy_pswd = WebConfig.objects.get(key='JY_PSWD').value

    url = "%s/%s"%(jy_host,urltail)
    try:
        resp = requests.post(url,auth=(jy_user,jy_pswd),data=data)
        if resp.status_code == 200:
            x = resp.json()
            return x
        else:
            return []
    except:
        return []

def uploadimg2jy(data):
    """
    上传图片到佳友
    营业执照url：http://xxxx/add_attachment/crm/partner/partnerid/
    上传合同url：http://xxxx/add_attachment/sale/saleorder/saleorderid/
    """
    jy_host = WebConfig.objects.get(key="JY_API_URL_NEW").value
    #jy_host = "http://192.168.0.33:8886/api_icgoo"
    jy_user = WebConfig.objects.get(key="JY_USER_NEW").value
    jy_pswd = WebConfig.objects.get(key="JY_PSWD_NEW").value
    url = '%s/add_attachment/%s' % (jy_host, data['urltail'])
    print url
    try:
        r = requests.post(url, auth=(jy_user, jy_pswd),
                          files=data['files'], timeout=30)
    except Exception as e:
        print e


def uploadimg2jy1(data):
    """
    刚刚注册的用户上传营业执照，此时尚未审批
    营业执照url：http://xxxx/add_attachment/crm/partner/phone/
    """
    jy_host = WebConfig.objects.get(key="JY_API_URL_NEW").value
    #jy_host = "http://192.168.0.33:8886/api_icgoo"
    #jy_host = "http://192.168.2.203:8000/api_icgoo"
    jy_user = WebConfig.objects.get(key="JY_USER_NEW").value
    jy_pswd = WebConfig.objects.get(key='JY_PSWD_NEW').value
    url = '%s/add_attachment_reg/%s' % (jy_host, data['urltail'])
    try:
        r = requests.post(url,auth=(jy_user,jy_pswd),files=data['files'],timeout=30)
    except Exception,e:
        print e
