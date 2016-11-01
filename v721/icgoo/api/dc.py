# coding=utf-8
# 调用dc的api

from webconfig.models import WebConfig
from urllib import quote_plus
import requests


def getmanydata_from_dc(args):
    '''根据供应商和型号从dc获取数据'''
    sup, partno, qty = args
    partno = _convert_partno(partno)
    urltail = "%s/%s/?qty=%s" % (sup, partno, qty)
    result = _send_request(urltail)
    if result and result['data']:
        return result['data']
    else:
        return []


def getalldata_from_dc(sups, partno, qty):
    '''批量询价专用'''
    partno = _convert_partno(partno)
    sups = sups.replace('-', ',')  # 把前端构造的-替换成DC需要的，
    urltail = "alldata/%s/?qty=%s&sups=%s" % (partno, qty, sups)
    result = _send_request(urltail)
    if result and result['data']:
        return result['data']
    else:
        return []


def getsingledata_from_dc(sup, partno, icgnum, qty):
    '''根据供应商和icgnumber从dc获取数据,防止恶意修改数据,
       加入购物车时使用。
    '''
    partno = _convert_partno(partno)
    #urltail = "%s/%s_s/%s/?qty=%s" % (icgnum, sup, partno, qty)
    urltail = "%s_single/%s/?qty=%s&icgnum=%s" % (sup, partno, qty, icgnum)
    result = _send_request(urltail)
    if result and result['data']:
        return result['data']
    else:
        return {}


def getpricepk_from_dc(sup, partno, qty):
    '''获取满足库存的、精确匹配的其他供应商的一条满足阶梯的最优惠价格'''
    partno = _convert_partno(partno)
    urltail = "pricepk/?partno=%s&qty=%s&sup=%s" % (partno, qty, sup)
    result = _send_request(urltail)
    if result and result['data']:
        return result['data']
    else:
        return []


def _convert_partno(partno):
    partno = partno.strip()
    partno = _strQ2B(partno)
    if isinstance(partno, unicode):
        partno = str(partno)
    partno = quote_plus(partno)  # 注意编码
    partno = partno.replace("+", "%20")  # 上面把空格转成了+，所以手动转成%20
    return partno


def _send_request(urltail):
    dc_api_url = WebConfig.objects.get(key="DC_API_URL").value
    dc_user = WebConfig.objects.get(key="DC_USER").value
    dc_pswd = WebConfig.objects.get(key="DC_PSWD").value
    url = "%s/%s" % (dc_api_url, urltail)
    try:
        resp = requests.get(url, auth=(dc_user, dc_pswd), timeout=30)
        if resp.status_code == 200:
            x = resp.json()
            return x
        else:
            return ''
    except Exception as e:
        return ''


def _strQ2B(ustring):
    """全角转半角"""
    rstring = ""
    for uchar in ustring:
        inside_code = ord(uchar)
        if inside_code == 12288:  # 全角空格直接转换
            inside_code = 32
        elif (inside_code >= 65281 and inside_code <= 65374):  # 全角字符（除空格）根据关系转化
            inside_code -= 65248
        rstring += unichr(inside_code)
    return rstring
