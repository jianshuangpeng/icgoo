#coding=utf-8
"""
icgoo给jiayou用的api
"""
from django.contrib.auth.models import User
from accounts.models import UserRegisterInfo,UserExtraInfo
import datetime
from django.http import HttpResponse,JsonResponse
import json
from django.views.decorators.http import require_http_methods
from django.core.exceptions import ObjectDoesNotExist
import base64
from django.views.decorators.csrf import csrf_exempt

def view_or_basicauth(view,request,test_func,realm="",*args,**kwargs):
    if test_func(request.user):
        return view(request,*args,**kwargs)

    if 'HTTP_AUTHORIZATION' in request.META:
        auth =request.META['HTTP_AUTHORIZATION'].split(' ')
        if len(auth) == 2:
            if auth[0].lower() == 'basic':
                uname,passwd = base64.b64decode(auth[1]).split(':')
                if uname == 'icgoo' and passwd == '!@#123':
                    return view(request,*args,**kwargs)

    result = [{'error':"http authorization is wrong"}]
    result = json.dumps(result)
    response = HttpResponse(result)
    response.status_code = 401
    response['WWW-Authenticate'] = 'Basic realm="%s"'%realm
    return response

def http_basic_auth(realm=""):
    def view_decorator(func):
        def wrapper(request,*args,**kwargs):
            return view_or_basicauth(func,request,
                                     lambda u:u.is_authenticated(),
                                    realm,*args,**kwargs)
        return wrapper
    return view_decorator


@http_basic_auth('ICGOO')
def get_all_register_info(request):
    """
    获取所有注册用户的注册信息
    """
    company_name = request.GET.get('company_name','').strip()
    user_type = request.GET.get('type','')
    state = request.GET.get('state','')
    check = request.GET.get('check','')
    date_begin = request.GET.get('date_begin')
    date_end = request.GET.get('date_end')
    saler = request.GET.get('saler')
    is_changed = request.GET.get('is_changed')
    check = request.GET.get('check')


    result = api_get_all_register(company_name,user_type,state,date_begin,date_end,saler,is_changed,check)
    return HttpResponse(json.dumps(result))



@csrf_exempt
@http_basic_auth('ICGOO')
def save_register_info(request):
    """
    保存销售/客服修改的客户注册信息
    """

    if request.method == 'POST':
        data = request.POST
        username = data.get('username','')
        company_name = data.get('company_name')
        contact_person = data.get('contact_person')
        note = data.get('note')
        phone = data.get('phone')
        area_code = data.get('area_code')
        telephone = data.get('telephone')
        extensionnumber = data.get('extensionnumber')
        email = data.get('email')
        user_type = data.get('user_type')
        if username:
            try:
                user = User.objects.get(username=username)
            except ObjectDoesNotExist:
                return HttpResponse({'status':'fail','desc':'username maybe wrong'})

            userregisterinfo = UserRegisterInfo.objects.get(user=user)

            if company_name:
                userregisterinfo.company_name = company_name
            if contact_person:
                user.first_name = contact_person[0]#保存姓氏
                user.last_name = contact_person[1:]
            if note:
                userregisterinfo.note = note
            if phone:
                userregisterinfo.phone = phone
            if area_code:
                userregisterinfo.area_code = area_code
            if telephone:
                userregisterinfo.telephone = telephone
            if extensionnumber:
                userregisterinfo.extensionnumber = extensionnumber
            if email:
                user.email = email
            if user_type:
                userregisterinfo.type = user_type

            user.save()
            userregisterinfo.save()

            return JsonResponse({'status':'success'})
        else:
            return JsonResponse({'status':'fail','decs':"username is null"})
    else:
        return JsonResponse({'status':'fail','decs':'GET-method,it must be POST-method'})


@csrf_exempt
@require_http_methods(['POST'])
@http_basic_auth("ICGOO")
def saler_confirm_info(request):
    """
    销售初步审核信息
    """
    username = request.POST.get('username','')

    if username:
        try:
            user = User.objects.get(username=username)
            user_registerinfo = UserRegisterInfo.objects.get(user=user)
            user_registerinfo.saler_reviewed = True#销售通过初步审核
            user_registerinfo.save()
            return JsonResponse({'status':"sucess",'desc':u"该用户通过初步审核!"})
        except ObjectDoesNotExist:
            return JsonResponse({'status':'fail','desc':u'该用户不存在'})
    else:
        return JsonResponse({'status':'fail','desc':u'icgoo注册用户名不能为空'})


@require_http_methods(['POST'])
@csrf_exempt
@http_basic_auth("ICGOO")
def user_application_passed(request):
    """
     注册用户申请通过后，激活该账号，可以登录
    """
    username = request.POST.get('username','')
    jy_partner_id = request.POST.get('partner_id','')
    #print username,jy_partner_id,"hello"
    if username and jy_partner_id:#只有icgoo_number与jy_partnert_id调试存在才能激活账号
        try:
            user = User.objects.get(username=username)
            if not user.is_active:
                user.is_active = True#激活账号,用户可以登录
                user.save()

            userextrainfo = UserExtraInfo.objects.get_or_create(user=user)[0]
            userextrainfo.jy_partner_id = jy_partner_id#绑定jy_partner_id
            userextrainfo.save()

            return JsonResponse({"status": "sucess", "desc": u"该用户审核通过,账号已经激活!"})
        except ObjectDoesNotExist:
            return JsonResponse({"status":"fail",'desc':u"该用户不存在"})

    else:
        return JsonResponse({'status':"fail",'desc':u"icgoo注册用户名为空"})

@require_http_methods(['POST'])
@csrf_exempt
@http_basic_auth("ICGOO")
def agree_customer_modify_info(request):
    """
    批准客户修改资料通过
    """
    icgoo_user_id = request.POST.get('icgoo_user_id')
    is_agreed = request.POST.get('is_agreed')
    print icgoo_user_id,is_agreed
    if icgoo_user_id:
        try:
            user = User.objects.get(pk=icgoo_user_id)
            userregisterinfo = UserRegisterInfo.objects.get(user=user)
            userregisterinfo.is_changed = False
            if userregisterinfo.update == 'draft':#如果是个人升级为企业
                if is_agreed:
                    userregisterinfo.update = 'done'#个人升级为企业申请通过
                    userregisterinfo.type = 'company'
                else:
                    userregisterinfo.update = 'fail'#个人升级为企业申请不通过

            else:#普通修改
                pass
            userregisterinfo.save()
            return JsonResponse({'status': "sucess", 'desc': u"该用户通过初步审核!"})
        except ObjectDoesNotExist:
            return JsonResponse({'status': 'fail', 'desc': u'该用户不存在'})
    else:
        return JsonResponse({'status': 'fail', 'desc': u'icgoo注册用户名不能为空'})


def api_get_all_register(company_name,user_type,state,date_begin,date_end,saler=None,is_changed=None,check=None):
    """
    获取所有注册用户信息
    Args:
        company_name: 公司名称
        state: 状态，是否通过审批
        date_begin: 起始日期
        date_end: 截止日期
        saler:销售人员
        is_changed:用户是否自己修改过资料

    Returns:

    """

    users = User.objects.all()
    userregisterinfos = UserRegisterInfo.objects.all()
    print type(check),'fffffff'
    if company_name:
        userregisterinfos = userregisterinfos.filter(company_name__icontains=company_name)
        try:
            user_ids = [one.user.id for one in userregisterinfos]
        except:
            user_ids = [one.user_id for one in userregisterinfos]
        users = users.filter(pk__in=user_ids)
        #users = users.filter(company_name__icontains=company_name)
    if user_type:
        userregisterinfos = userregisterinfos.filter(type=user_type)
        try:
            user_ids = [one.user.id for one in userregisterinfos]
        except:
            user_ids = [one.user_id for one in userregisterinfos]
        users = users.filter(pk__in=user_ids)
    if state:
        #state是从佳友中传过来的，有三种值，分别为：'','0','1'
        state = int(state)
        users = users.filter(is_active=state)
    if check:
        check = int(check)
        userregisterinfos = userregisterinfos.filter(saler_reviewed=check)
        user_ids = [one.user_id for one in userregisterinfos]
        users = users.filter(pk__in=user_ids)
    if date_begin:
        date_begin = datetime.datetime.strptime(date_begin,'%Y-%m-%d')
        date_begin = date_begin.replace(hour=0,minute=0,second=0,microsecond=0)
        users = users.filter(date_joined__gte=date_begin)
    if date_end:
        date_end = datetime.datetime.strptime(date_end,'%Y-%m-%d')
        date_end = date_end.replace(hour=23,minute=59,second=59)
        users = users.filter(date_joined__lte=date_end)
    if saler:
        userregisterinfos = userregisterinfos.filter(saler=saler)
        try:
            user_ids = [one.user.id for one in userregisterinfos]
        except:
            user_ids = [one.user_id for one in userregisterinfos]
        users = users.filter(pk__in=user_ids)
    if is_changed:
        userregisterinfos = userregisterinfos.filter(is_changed=1)
        try:
            user_ids = [one.user.id for one in userregisterinfos]
        except:
            user_ids = [one.user_id for one in userregisterinfos]
        users = users.filter(pk__in=user_ids)
    if check:
        check = int(check)
        userregisterinfos = userregisterinfos.filter(saler_reviewed=check)
        try:
            user_ids = [one.user.id for one in userregisterinfos]
        except Exception:
            user_ids = [one.user_id for one in userregisterinfos]

        users = users.filter(pk__in=user_ids)

    def _check_has_userinfo(user):
        """
        检测user对象有没有userinfo与之对应
        """
        try:
            userinfo = user.userinfo
            is_have = True
        except:
            is_have = False
        return is_have

    result = [
                {
                'icgoo_user_id':one.id,
               'username':one.username,
               'types':one.userinfo.type,#用户类型
               'company_name':one.userinfo.company_name if one.userinfo.company_name else '',
               'contact_person':one.get_full_name() if one.get_full_name() else '',
               'date_joined':one.date_joined.strftime("%Y-%m-%d"),
               'phone':one.userinfo.phone if one.userinfo.phone else one.username,
               #'path':one.userinfo.file_path if one.userinfo.file_path else '',
               'area_code':one.userinfo.area_code if one.userinfo.area_code else '',
               'telephone':one.userinfo.telephone if one.userinfo.telephone else '',
               'extensionnumber':one.userinfo.extensionnumber if one.userinfo.extensionnumber else '',
               'email':one.email if one.email else '',
               'state':one.is_active,
               'check':one.is_staff,
                'saler':one.userinfo.saler if one.userinfo.saler else "",
                'saler_reviewed':one.userinfo.saler_reviewed,#销售是否审批
                'is_changed':one.userinfo.is_changed,
                'note':one.userinfo.note,
                'jy_partner_id':one.jyinfo.jy_partner_id if one.jyinfo.jy_partner_id else '',
                'update':one.userinfo.update if one.userinfo.update else ''
               } for one in users if _check_has_userinfo(one)]

    return result
