# coding=utf-8

from django.db import models

class Supplier(models.Model):
    name = models.CharField(u'供应商名称',max_length=50,unique=True)
    desc = models.CharField(u'简介',max_length=50,default='')  # 简介
    info = models.CharField(u'优惠信息',max_length=50,default='')  # 优惠信息
    logo = models.CharField(u'logo名称',max_length=50,default='')  # 图片名
    is_good = models.BooleanField(u'是否推荐',default=True)  # 是否推荐
    is_active = models.BooleanField(u'是否有效',default=True)  # 是否有效
