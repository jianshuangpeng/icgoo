function validate(obj,str){
    var $name = $(obj).attr('name'),
        login = {'company':'请输入完整的公司名称','phone':'请输入正确的手机号码','password':'密码不能小于6位','password_again':'两次输入的密码不一致，请重新输入','file':'请上传您的营业执照','name':'请输入完整的姓名','email':'邮箱格式不正确(非必填)','telephone':'电话格式不对(非必填)'},
        forgetpwd = {'phone':'手机号码不正确','password':'密码不能小于6位','password_again':'密码不一致','pwd':'请输入密码'},//找回密码页面的验证提示
        kind = {'login':login,'forgetpwd':forgetpwd},
        type = kind[str];
    if($name == 'company')
    {
        if($(obj).val().length > 4 && $(obj).val().search('公司') != -1)
        {
            validate_sucess($name);
            return true;
        }
        else{
            validate_error($name,type[$name]);
            return false;
        }
    }
    else if($name == 'phone')
    {
        if(/^1[3|4|5|7|8]\d{9}$/.test($(obj).val()))
        {
            /*找回密码的时候验证用户名是否存在*/
            if(str == 'forgetpwd')
            {
              var bool;
              $.ajax({
                  url:'/accounts/checkusername',
                  async:false,
                  data:{
                      'username':$(obj).val()
                  },
                  success:function(res){
                      if(res)
                      {
                          validate_sucess($name);
                          bool = true;
                      }
                      else{
                          validate_error($name,'账号不存在');
                          bool = false;
                      }
                  }
              })
              return bool
            }
            else{
                validate_sucess($name);
                return true;
            }
        }
        else{
            validate_error($name,type[$name]);
            return false;
        }
    }
    else if($name == 'pwd') //修改密码页面
    {
        if($(obj).val())
        {
            validate_sucess($name);
            return true;
        }
        else{
            validate_error($name,type[$name]);
            return false;
        }
    }
    else if($name == 'password')
    {
        if($(obj).val().length > 5)
        {
            validate_sucess($name);
            return true;
        }
        else{
            validate_error($name,type[$name]);
            return false;
        }
    }
    else if($name == 'password_again')
    {
        if($(obj).val() == $("input[name='password']").val())
        {
            validate_sucess($name);
            return true;
        }
        else{
            validate_error($name,type[$name]);
            return false;
        }
    }
    else if($name == 'file')
    {
        if($(obj).val()!='')
        {
            validate_sucess($name);
            return true;
        }
        else{
            validate_error($name,type[$name]);
            return false;
        }
    }
    else if($name == 'surname' || $name == 'name')
    {
        if($("input[name='surname']").val()!='' && $("input[name='name']").val()!='')
        {
            validate_sucess('surname');
            return true;
        }
        else{
            validate_error('surname',type['name']);
            return false;
        }
    }
    else if($name == 'email')
    {
        if($(obj).val())
        {
          if(/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test($(obj).val()))
          {
            validate_sucess($name);
            return true;
          }
          else{
              validate_error($name,type[$name]);
              return false;
          }
        }
        else{
          return true;
        }
    }
    else if($name == 'area_code' || $name == 'telephone' || $name == 'extensionnumber')
    {
      var $area_code = $("input[name='area_code']").val(),
          $telephone = $("input[name='telephone']").val(),
          $extensionnumber = $("input[name='extensionnumber']").val();
      if($area_code || $telephone || $extensionnumber)  //用户输入了电话
      {
          if(!/\D/.test($area_code) && !/\D/.test($telephone) && $area_code && $telephone)  //区号和座机都是数字且不为空
          {
              if($extensionnumber)  //用户输入了转接电话
              {
                  if(!/\D/.test($extensionnumber))  //转接电话都是数字
                  {
                      validate_sucess('telephone');
                      return true
                  }
                  else{
                      validate_error('telephone',type['telephone']);
                      return false
                  }
              }
              else{
                  validate_sucess('telephone');
                  return true;
              }
          }
          else{
              validate_error('telephone',type['telephone']);
              return false;
          }
      }
      else{
          return true;
      }
    }
}
/* 验证通过　*/
function validate_sucess(name){
    $("input[name='"+name+"']").addClass('validated').parents("li").find('i').addClass('correct');
}
/* 验证失败　*/
function validate_error(name,des){
    if(!$("input[name='"+name+"']").hasClass('validated_error'))
    {
        $("input[name='"+name+"']").addClass('validated_error').parents("li").find('i').addClass('error').after("<p>"+des+"</p>");
    }
}
/*  检查之前是否验证  */
function check_status(obj){
    if($(obj).hasClass('validated'))
    {
        $(obj).removeClass('validated');
        $(obj).parents("li").find('i').prop('class','');
    }
    else if($(obj).hasClass('validated_error'))
    {
        $(obj).removeClass('validated_error');
        $(obj).parents("li").find('i').prop('class','').end().find("p").remove();
    }
}
/* 更换再次获取验证码倒计时的秒数　*/
function change_second(){
    $second--;
    if($second < 1)
    {
      $("#des").hide();
      clearInterval(count_down);
      $("#des b").text('60');
      flag = true;
    }
    else{
      $("#des b").text($second);
    }
}
/* 验证码 */
$(function(){
  flag = true;//用来判断是否不是正在获取验证码状态
  $("#btn_get").click(function(){
      var $type = $(".accounts").attr('type'),flag_phone;
      if($type) //注册页和忘记密码页有type属性
      {
          flag_phone = validate($("input[name='phone']"),$type);
          username = $("input[name='phone']").val();
      }
      else{
          flag_phone = true; //修改密码页面没有type属性
          username = $("#phone").text();
      }
      if(flag && flag_phone)
      {
          flag = false;
          URL = "/accounts/sendcode";
          $.ajax({
              url: URL,
              type: 'GET',
              data: { 'username': username}
          });
          /* 点击获取验证码显示倒计时　*/
          $("#des").css("display","inline-block");
          $second = parseInt($("#des b").text());
          count_down = setInterval('change_second()',1000)
      }
  });
})
