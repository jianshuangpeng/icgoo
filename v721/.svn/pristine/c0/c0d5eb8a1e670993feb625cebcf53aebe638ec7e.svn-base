/**
 * Created by hzz on 15-11-19.
 */

function init(x, y){
    $('#tbox').css('right', '0px');
    $('#tbox').css('bottom',y + 'px');
}

//价格折叠
function init_price(sup){
    var parDiv = $("#" + sup);
    var priveDivs = parDiv.find('.price');
    priveDivs.each(function(){
        var len = $(this).find('li').length;
        if(len > 3){
            $(this).find('p.open').show();
            for(i=3; i<len; i++){
                $(this).find('li').eq(i).addClass('index').hide();
            }
        }
    })
}

// 批号dc折叠
function init_dc(){
    $(".dc").each(function(){
        var len = $(this).find('li').length;
        if(len > 3){
            $(this).find('p.open').show();
            for(i=3; i<len; i++){
                $(this).find('li').eq(i).hide();
            }
        }
    })
}

function close_price(obj){
    var curClass = $(obj).attr('class');
    if(curClass == 'open'){
        $(obj).siblings('ul').find('li:hidden').addClass('index').show();
        $(obj).removeClass('open').addClass('to_close');
    }else{
        $(obj).siblings('ul').find("li.index").hide();
        $(obj).removeClass('to_close').addClass('open');
    }
}

$(function(){
    init(10,150);
    $("#gotop").click(function(){
        $('body,html').animate({
            scrollTop: 0
        }, 500)
    });
    //    搜索结果页面
    var len = $(".price li").length;

    $("input[name='partno']").focus(function(){
        if($(this).val() == '请输入产品型号'){
            $(this).val('');
        }
    }).blur(function(){
        if($(this).val() == ''){
            $(this).val('请输入产品型号');
        }
    });

    $("input[name='qty']").focus(function(){
        if($(this).val() == '采购数量'){
            $(this).val('');
        }
    }).blur(function(){
        if($(this).val() == ''){
            $(this).val('采购数量');
        }
    });
});
