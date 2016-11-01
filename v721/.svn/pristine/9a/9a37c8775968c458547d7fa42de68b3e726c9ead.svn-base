# coding=utf-8
import re
import string
from random import choice
from suds.client import Client
from django.core.mail import send_mail
from functools import wraps
from django.http import HttpResponseForbidden
from django.contrib.auth import authenticate, login

def http_basic_auth(func):
    '''定义httpbasicauth装饰器'''
    @wraps(func)
    def _decorator(request, *args, **kwargs):
        authorization = request.META.get('HTTP_AUTHORIZATION','')
        if authorization:
            authmeth, auth = authorization.split(' ', 1)
            if authmeth.lower() == 'basic':
                auth = auth.strip().decode('base64')
                username, password = auth.split(':', 1)
                user = authenticate(username=username, password=password)
                if user and user.is_superuser:
                    login(request, user)
                    return func(request, *args, **kwargs)
        return HttpResponseForbidden()
    return _decorator


def send_msg(target, msg):
    '''封装短信和邮件的区别,msg{"title":'','content':''}
    '''
    if is_email(target):
        send_mail(msg['title'], msg['content'], 'test@dzji.com',
                  [target], fail_silently=True)
    else:
        send_sms(target, msg['content'])


def creat_code(length=4):
    '''生成随机字符串,默认长度4'''
    chars = string.ascii_letters + string.digits
    return u''.join([choice(chars) for i in range(length)])


def is_email(email):
    if re.match(
            "^.+\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,3}|[0-9]{1,3})(\\]?)$", email) != None:
        return True
    return False


def send_sms(phone, content):
    # 发送短信接口
    url = 'http://ws.ic.net.cn/sms/OASMSService.asmx?wsdl'
    client = Client(url)
    client.service.Login('icgoo', 'A93A6786')
    client.service.SendSMSEx(phone, content, '')


if __name__ == '__main__':
    import logging
    logging.basicConfig(level=logging.INFO)
    logging.getLogger('suds.client').setLevel(logging.DEBUG)
    send('', '')
