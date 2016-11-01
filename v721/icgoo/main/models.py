# coding=utf-8

from django.db import models

class Pictures(models.Model):
    name = models.CharField(u"图片名称",max_length=100)  # 图片名称
    POSITION_CHOICES = (('top', u'顶部通知'),
                        ('center', u'中间广告'),
                        ('logo', u'LOGO'),
                        ('small', u'小广告'))
    position = models.CharField(u"显示位置",max_length=10,choices=POSITION_CHOICES)  # 显示位置
    explain = models.CharField(u"图片描述",max_length=100,default="#")  # 图片描述
    href = models.CharField(u"图片连接",max_length=200,default="#")  # 图片连接
    uploaddate = models.DateField(u"上传时间",blank=True)  # 上传时间
    showdate = models.DateTimeField(u"图片显示时间",blank=True,null=True) #图片显示时间
    hidedate = models.DateTimeField(u"图片隐藏时间",blank=True,null=True) #图片隐藏时间
    imgpath = models.CharField(u"图片地址",max_length=200, blank=False)  # 图片地址
    show_id = models.IntegerField(u"显示顺序",default=999)  # 显示顺序
    show = models.BooleanField(u"正在显示",default=False)  # 正在显示

class Descript(models.Model):
    title = models.CharField(u"标题",max_length=50)       #标题
    content = models.CharField(u"内容",max_length=50)     #内容

    def __unicode__(self):
        return self.title
