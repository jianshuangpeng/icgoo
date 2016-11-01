# coding=utf-8
from webconfig.models import WebConfig
from django.core.cache import cache
import requests
import json

'''电阻'''
def china_component(edgl,fzcc,dzwd,dz,dzwc,packing,page):
    urltail = '/?edgl=%s&fzcc=%s&dzwd=%s&dz=%s&dzwc=%s&packing=%s&page=%s' \
    % (edgl,fzcc,dzwd,dz,dzwc,packing,page)
    result = _send_request(urltail)
    return result

'''电容'''
def China_Capacitance(cpmc,cc,jzzl,bcrl,rlwc,eddy,dtcl,packing,page):
    urltail = '2/?cpmc=%s&cc=%s&jzzl=%s&bcrl=%s&rlwc=%s&eddy=%s&dtcl=%s&packing=%s&page=%s' \
    % (cpmc,cc,jzzl,bcrl,rlwc,eddy,dtcl,packing,page)
    result = _send_request(urltail)
    return result

def _send_request(urltail):
    cn_ct_api = WebConfig.objects.get(key="CN_CT_API").value
    cn_ct_user = WebConfig.objects.get(key="CN_CT_USER").value
    cn_ct_pswd = WebConfig.objects.get(key="CN_CT_PSWD").value
    print cn_ct_api
    url = "%s%s" % (cn_ct_api, urltail)
    print 'url:',url
    try:
        resp = requests.get(url, auth=(cn_ct_user, cn_ct_pswd), timeout=30)
        if resp.status_code == 200:
            x = resp.json()
            return x
        else:
            print 'error'
            return []
    except Exception as e:
        return []
