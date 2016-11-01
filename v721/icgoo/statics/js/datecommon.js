$(function(){
    laydate.skin('dahong');
    laydate({
        elem: '#demo',
        event:'click',
        istoday:'false'
    });
    $('.laydate_body .laydate_table td').removeClass('laydate_click');

    //通过调用点击事件加载laydata时间控件代码
    document.getElementById("demo").click();
    document.getElementById('laydate_ys').click();
    document.getElementById("laydate_today").click();

    $("#demo").click(function(){
      marchDateColor();
      $('#laydate_ok').css('display','none')
    });
    $("#laydate_m").prev().click(function(){
      marchDateColor();
    });
    $("#laydate_m").next().next().click(function(){
      marchDateColor();
    });
    $("#laydate_ms span").click(function(){
      marchDateColor();
    });

    $("#laydate_y").prev().click(function(){
      marchDateColor();
    });
    $("#laydate_y").next().next().click(function(){
      marchDateColor();
    });
    $("#laydate_clear").click(function(){
      marchDateColor();
    });
    $("#laydate_today").click(function(){
      marchDateColor();
    });
    $("#laydate_ok").click(function(){
      marchDateColor();
    });
    $("#laydate_y").click(function(){
      setTimeout(function(){
        $("#laydate_ys li").each(function(){
          $(this).click(function(){
            marchDateColor();
          });
        });
      },100);
    })

    $("#laydate_y").next().click(function(){
      setTimeout(function(){
        $("#laydate_ys li").each(function(){
          $(this).click(function(){
            marchDateColor();
          });
        });
      },100);
    })
});
