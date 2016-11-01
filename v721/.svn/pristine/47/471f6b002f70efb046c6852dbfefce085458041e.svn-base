# coding=utf-8
from django import template

register = template.Library()

@register.filter(name='total')
def total(value, qty):
    total = value * int(qty)
    return total
