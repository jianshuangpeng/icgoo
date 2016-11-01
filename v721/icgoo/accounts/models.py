# coding=utf-8
import datetime
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User


class RegisterCode(models.Model):

    '''注册时发送的验证码'''
    username = models.CharField(max_length=50)  # 接收验证码的手机号或邮箱
    code = models.CharField(max_length=8)  # 验证码
    used = models.BooleanField(default=False)
    send_time = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return self.code

    def need_resend(self):
        return self.send_time <= timezone.now() - datetime.timedelta(seconds=60)


class UserExtraInfo(models.Model):
    '''用户额外信息类，记录对应佳友id等'''
    user = models.OneToOneField(User, on_delete=models.CASCADE,related_name="jyinfo")
    jy_partner_id = models.CharField(
        u'jy_partner_id', null=True, blank=True, max_length=100)  # 如果没绑定则为null


class UserAddressInfo(models.Model):
    '''用户收货信息类，一个用户可以有多个收货地址、联系人等'''
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    address = models.CharField(u'收货地址', max_length=200, default='')
    name = models.CharField(u'收货人', max_length=50, default='')
    phone = models.CharField(u'收货人手机号', max_length=15, default='')
    isdefault = models.BooleanField(u'是否默认', default=False)

#注册类型
REGISTER_TYPE = (('personal',u"个人"),
                 ('company',u"企业"),
                 )

#个人升级为企业状态
UPDATE_TYPE = (('no',u'未申请升级'),
               ('draft',u'客户申请升级'),
               ('done',u'申请通过'),
               ('fail',u"申请不通过"),
               )
class UserRegisterInfo(models.Model):
    """
    存放用户注册时信息
    """
    user = models.OneToOneField(User,on_delete=models.CASCADE,related_name="userinfo")
    type = models.CharField(u"注册类型",choices=REGISTER_TYPE,default='company',max_length=25)
    company_name = models.CharField(u"公司名称",max_length=200)
    phone = models.CharField(u"手机号码",null=True,blank=True,max_length=20)
    area_code = models.CharField(u"固定电话区号",null=True,blank=True,max_length=10)
    telephone = models.CharField(u"固定电话号码",null=True,blank=True,max_length=15)
    extensionnumber = models.CharField(u"固定电话分机号",null=True,blank=True,max_length=10)
    file_path = models.CharField(u"营业执照存放位置",null=True,blank=True,max_length=100)
    saler = models.CharField(u"客服",null=True,blank=True,max_length=20)
    #is_passed = models.BooleanField(u"是否通过审核",default=False,null=False)
    note = models.CharField(u'备注',null=True,blank=True,max_length=100)
    is_changed = models.BooleanField(u'用户是否修改信息',default=False,blank=True)
    saler_reviewed = models.BooleanField(u"销售是否审核",default=False,blank=True)
    update = models.CharField(u"个人升级企业",choices=UPDATE_TYPE,default='no',max_length=25)

    class Meta:
        verbose_name_plural = u'用户注册信息'

