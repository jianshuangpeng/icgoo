function about_contract(){
    /* 在合同相关里，点击选择文件 */
    $(".btn_file").each(function(){
        $(this).on('click',function(){
            $(this).parent().next().click();
        })
    })
    /* 选择文件的时候，文件名赋给对应文本框 */
    $("input[type='file']").each(function(){
        $(this).on('change',function(){
            $(this).parent().find("input[type='text']").val($(this).val());
        })
    })
    /* 显示合同部分 */
    $(".btn_contract").each(function(){
        $(this).on('click',function(){
            $("#shade").show();
            $(this).css({'background':'#fff','border-left':'1px solid #ccc','position':'relative'}).addClass('open') //为了兼容IE7，用js只设置当前点击按钮的position
                   .find(".contract_border").show();
        })
    })
    /* 隐藏合同部分 */
    $("#shade").on('click',function(){
        $(".open").find(".prompt").html(" ");
        $(".open").find(".prompt").attr("style","");
        $(".open").css({'background':'#fffeef','border-left':'none','position':'static'}).removeClass('open').find(".contract_border").hide();
    })
    /* 异步上传文件 */
    $(".upload_contract").each(function(){
        var $prompt = $(this).find(".prompt");
        $(this).submit(function(){
            $(this).ajaxSubmit({
              dataType:'json',
              beforeSubmit:function(){$prompt.html('正在上传...').css('color','#333')}, //上传之前的回调函数
              success:function(res){  //提交成功
                  if(res)
                  {
                      $prompt.html('上传成功!').css('color','green');
                  }
                  else{
                      $prompt.html('上传失败!').css('color','#c00');
                  }
              }
            });
        return false; //阻止表单默认提交
        })
    })
    /* 下载合同 */
    $(".btn_download").each(function(){
        $(this).on('click',function(){
            var old = $(this).hasClass('old')?true:false,
                urltail;
            $.ajax({
                url:'/accounts/download_url',
                data:{
                    'id':$(this).attr('num')
                },
                success:function(res){
                    if(old)
                    {
                        //原始合同下载
                        urltail = res[res.length-1];
                    }
                    else{
                        urltail = res[0];
                    }
                    url = 'http://192.168.2.203/site_media/'+urltail;
                    window.open(url);
                }
            })
        })
    })
}
