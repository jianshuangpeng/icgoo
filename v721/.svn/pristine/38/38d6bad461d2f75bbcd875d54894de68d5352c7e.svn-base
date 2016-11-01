# coding=utf-8
from django import template

register = template.Library()

STATES = (
    (u'so_confirm',  u'订单生效'),
    (u'po_confirm',  u'已采购'),
    (u'po_checked',  u'供应商已发货'),
    (u'custom_done', u'报关完成'),
    (u'st_in_done',  u'入库完成'),
    (u'st_out_done', u'出库完成'),
    (u'sign',        u'已签收'),
    (u'cancel',      u'取消'),
)

DESP = (
    (u'so_confirm', u'订单已生效'),
    (u'po_confirm', u'确认采购数量'),
    (u'po_checked', u'供应商发货数量'),
    (u'custom_done',u'正运往深圳库房，等待入库'),
    (u'st_in_done', u'入库数量'),
    (u'st_out_done',u'出库拍照已完成，正在包装'),
    (u'sign',       u'已签收'),
    (u'cancel',     u'取消'),
)

@register.filter(name="trun_state")
def trun_state(val):
    states = dict(STATES)
    show_state = states[val]
    print show_state
    return show_state


@register.filter(name="turn_desp")
def turn_desp(val, qty):
    desps = dict(DESP)
    show_desp = desps[val]
    if val in ['po_confirm', 'po_checked', 'st_in_done']:
        show_desp = "%s:%s" % (show_desp ,qty)
    return  show_desp