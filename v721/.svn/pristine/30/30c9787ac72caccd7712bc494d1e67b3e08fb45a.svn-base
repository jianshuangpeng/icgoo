# coding=utf-8
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseBadRequest
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from .models import ShoppingCart


@login_required
@require_http_methods(["GET"])
def carts_list(request):
    carts = ShoppingCart.objects.filter(user=request.user,status__in=[0,3]) #只显示正常和失效状态的
    result = [one.unpack_price() for one in carts] #转换pickel为列表
    return render(request, "carts/cart_list.html",{"result":result})


@login_required
@require_http_methods(["POST"])
def carts_add(request):
    user = request.user
    qty = request.POST.get("qty", "")
    partno = request.POST.get("partno", "")
    supplier = request.POST.get("supplier", "")
    icg_partno = request.POST.get("icg_partno", "")
    cart = ShoppingCart()
    if cart.add_data(user, partno, supplier, icg_partno, qty):
        return HttpResponse('sucess')
    else:
        # 直接返回400
        return HttpResponseBadRequest('')


@login_required
@require_http_methods(["POST"])
def carts_del(request):
    check_ids = request.POST.getlist("check_id", "")
    carts = ShoppingCart.objects.filter(user=request.user,pk__in=check_ids)
    for one in carts:
        one.delete_data()


@login_required
@require_http_methods(["POST"])
def carts_modify(request):
    #用户修改数量
    check_id = request.POST.getlist("check_id", "")
    qty = request.POST.getlist("qty", "")
    cart = ShoppingCart.objects.get(user=request.user,pk=check_id)
    cart.qty = qty
    cart.save()


@login_required
@require_http_methods(["POST"])
def carts_commit(request):
    #提交订单到佳友
    check_id = request.POST.getlist("check_id", "")
    carts = ShoppingCart.objects.filter(user=request.user,pk__in=check_id)
    #调用Jy接口,是循环内调用还是一起调用呢?
    for one in carts:
        one.commit_data()


@login_required
@require_http_methods(["GET"])
def carts_refresh(request):
    check_id = request.POST.getlist("check_id", "")
    cart = ShoppingCart.objects.filter(user=request.user,pk=check_id)
    cart.refresh_data()
    newdata = cart.unpack_price()
    return httpResponse('')
