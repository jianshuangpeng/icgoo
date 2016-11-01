# coding=utf-8
from django import forms
from captcha.fields import CaptchaField
from django.forms.utils import ErrorList


class HiddenErrorList(ErrorList):
    '''自定义类用于隐藏Form的错误信息'''

    def __unicode__(self):
        return ''


class CaptchaTestForm(forms.Form):
    captcha = CaptchaField(label="")
