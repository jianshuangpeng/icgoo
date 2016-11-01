function getdata(url) {
    $.get(url, function(data, status) {
        if (data) {
            $("#loading").hide();
            html = $(data);
            sup = $(html[0]).attr("id");
            supps = $("#a_sups a").text();
            Sup = sup.replace(sup.charAt(0), sup.charAt(0).toUpperCase());
            if(Sup == 'Rs'){ Sup = 'RS'}
            link = "<a href='javascript:void(0)' onclick='reset_sup(this, 1)' class='"+sup+"'>"
                   + Sup + "<SUP>X</SUP></a>";
            leftLink = "<li onclick='reset_sup(this, 0)' class="
                       +sup+"><a href='javascript:void(0)' onmouseover='lefton(this)' onmouseout='leftout(this)' title='"
                       +Sup+"' >"+Sup.charAt(0)+"</a></li>";
            $("#topcontainer").append(html);
            $("#a_sups").append(link);
            $("#left_sup").append(leftLink);
            init_price(sup);
            init_dc();
            get_init_price(sup);
            sup_len = $("#a_sups a").length;
            $("#total_count").text(sup_len-1);
        }
    });
}

function getdata_grid(url){
    $.get(url, function(data, status) {
        if (data) {
            $("#loading").hide();
            html = $(data);
            sup = $(html[0]).val();
            supps = $("#a_sups a").text();
            $("#topcontainer").append(html);
            Sup = sup.replace(sup.charAt(0), sup.charAt(0).toUpperCase());
            link = "<a href='javascript:void(0)' onclick='find_sup(this)' class="+sup+">" + Sup + "<SUP>X</SUP></a>";
            leftLink = "<li onclick='find_sup(this)' class="
                       +sup+"><a href='javascript:void(0)' onmouseover='lefton(this)' onmouseout='leftout(this)' title='"
                       +Sup+"' >"+Sup.charAt(0)+"</a></li>";
            $("#a_sups").append(link);
            $("#left_sup").append(leftLink);
            sup_len = $("#a_sups a").length;
            $("#total_count").text(sup_len-1);
            var len = $(".grid").length;
            var loops = parseInt(len/4);
            if(loops > 0){
                for(i=1; i<=loops; i++){
                    divHtml = $("<div class='grid_div'></div>");
                    for(j=0; j<=3; j++){
                        $(".grid").eq(0).attr('class', 'grid_p').show().appendTo(divHtml)
                    }
                    divHtml.appendTo($("#topcontainer"));
                }
            }
            $(".grid").hide();
            get_grid_init_price(sup);
        }
        new_sup=parseInt($("input[name='sup_num']").val()) + 1
        $("input[name='sup_num']").val(new_sup);
        if(new_sup == 18){
            // 数据返回完成
            divHtml = $("<div class='grid_div'></div>");
            $(".grid").each(function(){
                $(this).attr('class', 'grid_p').show().appendTo(divHtml)
            })
            divHtml.appendTo($("#topcontainer"));
        }
    });
}

function find_sup(obj){
    var cur_supp = $(obj).text().toLowerCase().replace('x', '');//把点击的供应商名换成小写，把“x”换成”“
    var con = $("#" + cur_supp + '_1');        //第一个选择的供应商在展示区的id
    var conH = con.offset().top;              //第一个选择的供应商上方偏移的距离
    var objPar = $(obj).parent().attr('id'); //选择的供应商父级<p>的id，好像都是a_sups
    $(window).scrollTop(conH-100);          //把滚动条定位到选择的供应商的位置
    //如果是再次点击相同的供应商
    if(!($(obj).hasClass("active")||$(obj).parent("li").hasClass("active")))
    {
      $("#a_sups ." + cur_supp).addClass('active')//把供应商按钮添加红色背景，白色字体样式
                               .siblings('a')
                               .removeClass('active');//把其它的供应商的样式去掉
      $("#a_sups ." + cur_supp).find("sup").hide();
      $(".grid_p").removeClass('grid_active');                   //去掉选择的供应商在展示区的黄色边框
      $("div[id^='" + cur_supp + "']").addClass('grid_active');//把选择的供应商的所有结果加上黄色边框
      var preObj = $("#left_sup .active").find('a');         //左边已被选中的供应商按钮
      var leftActiveLen = $("#left_sup .active").length;     //左边按钮选中的个数
      if(leftActiveLen != 0){//如果左边按钮有被选中，取消供应商
          var preObj = $("#left_sup .active").find('a')//左边已被选中的供应商按钮
          var preText = preObj.text();//左边已被选中的供应商名
          var preTit = preObj.attr('title');//左边已被选中的供应商的标题，如:A
          preObj.text(preTit)//把已选中按钮的文本改成跟标题一样
          preObj.attr('title', preText)//把已选中按钮的标题改成跟之前的文本一样
          preObj.animate({width:'38px'}, 100)//已选供应商宽度逐渐缩小为普通样式
          $("#left_sup .active").removeClass('active')//把已选按钮的样式改为普通样式
      }
      leftSup = $("#left_sup ." + cur_supp)//在左边点击的按钮
      leftSup.addClass('active');//在左边点击的按钮添加选中样式
      aTit = leftSup.find('a').attr('title')
      aText = leftSup.find('a').text()
      if(objPar == 'a_sups'){
          leftSup.find('a').text(aTit)
          leftSup.find('a').attr('title', aText)
      }
      leftSup.find('a').animate({width:'90px'}, 300)
    }
}

function grid_detail(obj){
    var testPartent = $(obj).parents('div.grid_div');
    var thisParent = $(obj).parents('div.grid_p');
    var flag = thisParent.hasClass('active');
    var detailDiv = $(obj).parents('div.grid_p').find('div.detail_info');
    var detailH = detailDiv.outerHeight();
    var detailSj = testPartent.find('span.grid_sj')
    var parentL = thisParent.position().left;
    $("div.grid_p").removeClass('active');
    $("div.detail_info").hide();
    $("span.grid_sj").hide();
    $("div.grid_div").height(270);
    if(!flag){
        // 恢复至初始化
        sjL = parentL + 138;
        detailSj.css('left', sjL+'px');
        newHeight = detailH + 283;
        testPartent.height(newHeight);
        testPartent.animate({'height':newHeight+'px'}, 500)
        thisParent.addClass('active');
        detailSj.slideDown(500);
        detailDiv.slideDown(500);
    }
}

function lefton(obj){
    $(obj).siblings().stop();
    var thisSup = $(obj).attr('title');
    var thisText = $(obj).text();
    var isActive = $(obj).parents('li').hasClass('active')
    if(!isActive){
        $(obj).text(thisSup)
        $(obj).attr('title', thisText);
        $(obj).animate({width:'90px'}, 300)
    }
}
function leftout(obj){
    $(obj).siblings().stop();
    var thisSup = $(obj).attr('title');
    var thisText = $(obj).text();
    var isActive = $(obj).parents('li').hasClass('active')
    if(!isActive){
        $(obj).text(thisSup)
        $(obj).attr('title', thisText)
        $(obj).animate({width:'38px'}, 100)
    }
}

function show_detail(obj, word, url) {
    // 显示详细信息
    $("#partno_detail .word").find('p')
        .html(word);
    var curL = $(obj).offset().left;
    var curT = $(obj).offset().top;
    $("#partno_detail").css({
        'left': (curL + 10) + 'px',
        'top': (curT + 10) + 'px'
    }).show();
}

function hide_detail() {
    // 隐藏掉详细信息
    $("#partno_detail .word").find('p')
        .html('');
    $("#partno_detail").hide();
}

function qty_dowm(min, stock, mult, obj, flag) {
    // 输入框左侧的减号按钮
    var qtyInput = $(obj).next('input')
    var curVal = qtyInput.val();
    var newVal = parseInt(curVal) - parseInt(mult);
    var stock = parseInt(stock);
    var min = parseInt(min);
    var mult = parseInt(mult);
    var thisVal = newVal;
    if (flag == 'false'){
        var tipObj = $(obj).parents('tr').find('span.stock_warning');
    }else{
        var tipObj = $("#stock_warning");
    }
    if (newVal < min) {
        thisVal = min;
        tipObj.text('最小起订量为' +　min).show()
        setTimeout(function(){
            tipObj.hide()
        },2000);
    }
    if (newVal > stock) thisVal = stock;
    if (thisVal % parseInt(mult) != 0) {
        var i = parseInt(thisVal / parseInt(mult));
        thisVal = parseInt(mult) * i;
    }
    if(stock<min) {
        tipObj.show()
        setTimeout(function(){
            tipObj.hide()
        },2000);
        return false
    }
    qtyInput.val(thisVal);
    if(flag == 'false'){
        get_price(obj, thisVal);
    }
}

function qty_up(min, stock, mult, obj, flag) {
    // 输入框右侧的加号按钮
    var qtyInput = $(obj).prev('input')
    var curVal = qtyInput.val();
    var stock = parseInt(stock);
    var min = parseInt(min);
    var mult = parseInt(mult);
    var newVal = parseInt(curVal) + parseInt(mult);
    var thisVal = newVal;
    if (flag == 'false'){
        var tipObj = $(obj).parents('tr').find('span.stock_warning');
    }else{
        var tipObj = $("#stock_warning");
    }
    if (newVal < min) thisVal = min;
    if (newVal > stock) {
        thisVal = stock;
        tipObj.text('库存为' + stock).show()
        setTimeout(function(){
            tipObj.hide()
        },2000);
    }
    if (thisVal % parseInt(mult) != 0) {
        var i = parseInt(thisVal / parseInt(mult));
        thisVal = parseInt(mult) * i;
    }
    if(stock < min) {
        tipObj.text('库存不足').show()
        setTimeout(function(){
            tipObj.hide()
        },2000);
        return false
    }
    qtyInput.val(thisVal);
    if(flag == 'false'){
        get_price(obj, thisVal);
    }
}

function check_qty(min, stock, mult, obj) {
    // 检测输入框的输入值和min， stock， mult的关系
    var thisVal = $(obj).val();
    var thisVal = parseInt(thisVal);
    thisVal = thisVal || 0;//当用户输入的字符串不能转换为数字的时候，把数量改为“0”
    var stock = parseInt(stock);
    var min = parseInt(min);
    var tipObj = $(obj).parents('tr').find('span.stock_warning');
    var tipLen = tipObj.length;
    if(tipLen == 0){
       tipObj = $("#stock_warning");
    }
    if (thisVal < parseInt(min)) {
        thisVal = min;
        tipObj.text('最小起订量为' +　min).show();
        setTimeout(function(){
            tipObj.hide()
        },2000);
    }
    if (thisVal > parseInt(stock)) {
        thisVal = stock;
        tipObj.text('库存为' + stock).show();
        setTimeout(function(){
            tipObj.hide()
        },2000);
    }
    if (thisVal % parseInt(mult) != 0) {
        var i = parseInt(thisVal / parseInt(mult));
        thisVal = parseInt(mult) * i;
    }
    get_price(obj, thisVal);
    $(obj).val(thisVal);

}

function get_price(obj, qty) {
    // 获取购买数量的对应的价格区域
    var priceUl = $(obj).parents('tr').find('td.price ul');
    var priceOp = $(obj).parents('tr').find('td.price p');
    var curId = $(obj).parents('div.supplier').attr('id');
    var qtyLi = priceUl.find("li");
    var minQty = parseInt(qtyLi.eq(0).find('span').eq(0).html());
    var maxQty = parseInt(qtyLi.eq(qtyLi.length - 1).find('span').eq(0).html());
    qty = parseInt(qty);
    var priceDl = 0;
    var priceHk = 0;
    if (qty <= minQty) {
        priceDl = $.trim(qtyLi.eq(0).find('span').eq(2).html());
        priceHk = $.trim(qtyLi.eq(0).find('span').eq(1).html());
        priceDl = parseFloat(priceDl.replace('￥', ''));
        priceHk = parseFloat(priceHk.replace('$', ''));
        price = [priceDl, priceHk];
        qtyLi.eq(0).addClass('rc').siblings('li').removeClass('rc');
        qtyLi.eq(0).addClass('bold').siblings('li').removeClass('bold')
    } else if (qty > maxQty) {
        priceDl = $.trim(qtyLi.eq(qtyLi.length - 1).find('span').eq(2).html());
        priceHk = $.trim(qtyLi.eq(qtyLi.length - 1).find('span').eq(1).html());
        priceDl = parseFloat(priceDl.replace('￥', ''));
        priceHk = parseFloat(priceHk.replace('$', ''));
        price = [priceDl, priceHk];
        qtyLi.eq(qtyLi.length - 1).addClass('rc').siblings('li').removeClass('rc');
        qtyLi.eq(qtyLi.length - 1).addClass('bold').siblings('li').removeClass('bold');

    } else {
        qtyLi.each(function() {
            var thisQty = parseInt($(this).find('span').eq(0).html());
            if (qty >= thisQty) {
                priceDl = $.trim($(this).find('span').eq(2).html());
                priceHk = $.trim($(this).find('span').eq(1).html());
                priceDl = parseFloat(priceDl.replace('￥', ''));
                priceHk = parseFloat(priceHk.replace('$', ''));
                $(this).addClass('rc').siblings('li').removeClass('rc');
                $(this).addClass('bold').siblings('li').removeClass('bold')
            }
        })
    }
    priceDl = priceDl || parseFloat(0.00);
    priceHk = priceHk || parseFloat(0.00);
    totalDl = (priceDl * qty).toFixed(2);
    totalHk = (priceHk * qty).toFixed(4);
    var rcLen = priceUl.find("li.rc").length;
    if(rcLen == 1){
        var rcIndex = priceUl.find("li.rc").index();
        if(rcIndex > 2){
            qtyLi.show();
            priceOp.removeClass('open').addClass('to_close');
        }
    }
    $(obj).parents('td').find('span.priceDl').html('￥'+totalDl);
    $(obj).parents('td').find('span.priceHk').html('$'+totalHk)
}

var srcH = $(".container").offset().top;

$(window).scroll(function() {
    // 搜索框的浮动显示
    var winH = $(document).scrollTop();
    if (winH > srcH) {
        $("#search_float").slideDown(500);
        $(".left_filter").css('top', '80px').show();
    } else {
        $("#search_float").slideUp();
        $(".left_filter").hide();
    }
});

function get_init_price(sup) {
    // 搜索结果返回时显示最初数量的价格区域
    var thisPar = $("#"+sup);
    thisPar.find("input[name='buy_qty']").each(function() {
        var thisVal = $(this).val();
        get_price(this, thisVal);
    })
}

function get_grid_init_price(sup) {
    // 搜索结果返回时显示最初数量的价格区域
    var thisPar = $("div[id^='"+sup+"']");
    thisPar.each(function(){
        $(this).find("input[name='buy_qty']").each(function(){
            var thisVal = $(this).val();
            get_price(this, thisVal);
        })
    });
}


function check_count(){
    $("#topcontainer .supplier").each(function(){
        var len = $(this).find("tr:visible").length;
        if(len == 1){
            $(this).hide();
            var curId = $(this).attr('id');
            curId = curId.replace(curId.charAt(0), curId.charAt(0).toUpperCase());
            $("#a_sups a:contains(" + curId + ")").hide();
        }
    })
}

function for_filter(partno, qty, obj) {
    var is_checked = $(obj).is(":checked");
    var partno = $.trim(partno);
    var curName = $(obj).attr('name');
    var qty = parseInt(qty);
    if(is_checked){
        if(curName == 'for_all'){
            $("input[name='for_all']").prop('checked', true);
            $("#topcontainer table tbody tr:has('td')").each(function() {
                partno = partno.toUpperCase();
                var thisVal = $.trim($(this).find('td').eq(0).find('p').eq(0).text())
                if (partno != thisVal) {
                    if ($(this).is(":visible")) {
                        $(this).addClass('not_all').hide();
                    }
                }
            });
            check_count();
        }
        if(curName == 'for_stock'){
            $("input[name='for_stock']").prop('checked', true);
            $("#topcontainer table tbody tr:has('td')").each(function() {
                var stock = $.trim($(this).find('td').eq(2).text()) || 0;
                var min = $(this).find('td:last').prev('td').find('p').eq(0).html().split(
                    "：")[1];
                var mult = $(this).find('td:last').prev('td').find('p').eq(1).html().split(
                    "：")[1];
                stock = parseInt(stock);
                min = parseInt(min);
                min = parseInt(min);
                mult = parseInt(mult);
                if (stock < qty || min > qty || qty % mult != 0) {
                    if ($(this).is(":visible")) {
                        $(this).addClass('not_for_stock').hide();
                    }
                }
            })
            check_count();
        }
    }else{
        if(curName == 'for_all'){
            $("input[name='for_all']").prop('checked', false);
            $("#topcontainer .supplier:hidden").show();
            $("#a_sups a:hidden").show();
            $("#topcontainer table tbody tr.not_all").removeClass('not_all').show();
            check_count();
        }
        if(curName == 'for_stock'){
            $("input[name='for_stock']").prop('checked', false);
            $("#topcontainer .supplier:hidden").show();
            $("#a_sups a:hidden").show();
            $("#topcontainer table tbody tr.not_for_stock").removeClass(
            'not_for_stock').show();
            check_count();
        }
    }
}

function reset_sup(obj, typ){
    // 搜索页面供应商的定位
    var is_select = $(obj).attr('class').indexOf('active') != -1;
    var cur_supp = $(obj).text().toLowerCase().replace('x', '');
    var curLen = $("#a_sups a.active").length;
    var is_all = $('#a_sups a').eq(0).attr('class').indexOf('active') != -1;
    if(typ){
        var curIndex = $(obj).index();
        if(curIndex == 0){
            // 全部按钮
            if(curLen == 0){
                return
            }else{
                $(obj).addClass('active')
                      .siblings('a').removeClass('active');
                $("#topcontainer div.supplier").show();
                $("#left_sup .active").each(function(){
                    tTit = $(this).find('a').attr('title');
                    tTxt = $(this).find('a').text();
                    $(this).find('a').attr('title', tTxt);
                    $(this).find('a').text(tTit);
                    $(this).find('a').animate({width:'38px'}, 300);
                    $(this).removeClass('active');
                })
                check_count();
            }
        }else{
            var thisVal = $(obj).text().replace('X', '').toLowerCase();
            var atit = $("#left_sup ." + thisVal).find('a').attr('title');
            var atxt = $("#left_sup ." + thisVal).find('a').text();
            if(is_select){
                if(curLen == 1){
                    $(obj).removeClass('active');
                    $('#a_sups a').eq(0).addClass('active');
                    $("#topcontainer div.supplier").show();
                }else{
                    $(obj).removeClass('active');
                    $("#" + cur_supp).hide();
                }
                $("#left_sup ." + thisVal).find('a').text(atit);
                $("#left_sup ." + thisVal).find('a').attr('title', atxt);
                $("#left_sup ." + thisVal).find('a').animate({width:'38px'}, 300);
                $("#left_sup ." + thisVal).removeClass('active')
            }else{
                if(is_all){
                    $('#a_sups a').eq(0).removeClass('active');
                    $("#topcontainer div.supplier").hide();
                }
                $(obj).addClass('active');
                $("#left_sup ." + thisVal).find('a').text(atit);
                $("#left_sup ." + thisVal).find('a').attr('title', atxt);
                $("#left_sup ." + thisVal).find('a').animate({width:'90px'}, 300);
                $("#left_sup ." + thisVal).addClass('active');
                $("#topcontainer").prepend($("#" + cur_supp));
                $("#" + cur_supp).show();
            }
        }
    }else{
        var leftVal = $(obj).find('a').text().toLowerCase();
        if(is_select){
            $(obj).removeClass('active');
            $("#a_sups a." + leftVal).removeClass('active');
            if(curLen == 1){
                $('#a_sups a').eq(0).addClass('active');
                $("#topcontainer div.supplier").show();
            }else{
                $("#" + leftVal).hide();
            }
        }else{
            $(obj).addClass('active');
            if($(".topall").hasClass('active')){
                $(".topall").removeClass('active');
                $("#topcontainer div.supplier").hide();
            }
            $('#a_sups a.' + leftVal).addClass('active');
            $("#topcontainer").prepend($("#" + leftVal));
            $("#" + leftVal).show();
            $(window).scrollTop(280);
        }
    }
}

function grid_filter(partno, qty, obj){
    var is_checked = $(obj).is(":checked");
    var partno = $.trim(partno).toUpperCase();
    var curName = $(obj).attr('name');
    var qty = parseInt(qty);
    if(is_checked){
        if(curName == 'for_all'){
            $("input[name='for_all']").prop('checked', true);
            $(".grid_p").each(function(){
                var cur_partno = $.trim($(this).find('p').eq(0).text());
                if($(this).hasClass('grid_for_stock')){
                }else{
                    if(cur_partno != partno){
                        var positon = $(this).position();
                        var pTop = positon.top;
                        var pLeft = positon.left;
                        $(this).find('div.grid_no').css({
                            'top': '0px',
                            'left': (pLeft + 30) + 'px',
                            'opacity': '0.5'
                        });
                        $(this).find('div.grid_no').show();
                        $(this).addClass('grid_not_all');
                    }
                }
            })
        }
        if(curName == 'for_stock'){
            $("input[name='for_stock']").prop('checked', true);
            $(".grid_p").each(function(){
                var cur_qty = $.trim($(this).find('p.stock_p span').eq(0).text());
                var min = $.trim($(this).find('p.stock_p span').eq(1).text());
                var mult = $.trim($(this).find('p.stock_p span').eq(2).text());
                stock = parseInt(cur_qty.split(":")[1]);
                min = parseInt(min);
                mult = parseInt(mult);
                if($(this).hasClass('grid_not_all')){
                }else{
                    if (stock < qty || min > qty || qty % mult != 0) {
                        var positon = $(this).position();
                        var pTop = positon.top;
                        var pLeft = positon.left;
                        $(this).find('div.grid_no').css({
                            'top': '0px',
                            'left': (pLeft + 30) + 'px',
                            'opacity': '0.5'
                        });
                        $(this).find('div.grid_no').show();
                        $(this).addClass('grid_for_stock');
                    }
                }
            })
        }
    }else{
        if(curName == 'for_all'){
            $("input[name='for_all']").prop('checked', false);
            $(".grid_not_all").each(function(){
                var cur_partno = $.trim($(this).find('p').eq(0).text());
                if(cur_partno != partno){
                    $(this).children('div.grid_no').hide();
                    $(this).removeClass('grid_not_all');
                }
            })
        }
        if(curName == 'for_stock'){
            $("input[name='for_stock']").prop('checked', false);
            $(".grid_for_stock").each(function(){
                var cur_qty = $.trim($(this).find('p.stock_p span').eq(0).text());
                stock = parseInt(cur_qty.split(":")[1]);
                thisMin = parseInt($(this).find("input[name='thisMin']").val());
                thisMult = parseInt($(this).find("input[name='thisMult']").val());
                if (stock < qty || thisMin > qty || qty % thisMult != 0) {
                    $(this).children('div.grid_no').hide();
                    $(this).removeClass('grid_for_stock');
                }
            })
        }
    }
}
function grid_all(obj){
    $("#a_sups .active").removeClass("active");
    $(obj).addClass("active");
    var preObj = $("#left_sup .active").find('a')//左边已被选中的供应商按钮
    var preText = preObj.text();//左边已被选中的供应商名
    var preTit = preObj.attr('title');//左边已被选中的供应商的标题，如:A
    preObj.text(preTit)//把已选中按钮的文本改成跟标题一样
    preObj.attr('title', preText)//把已选中按钮的标题改成跟之前的文本一样
    preObj.animate({width:'38px'}, 100)//已选供应商宽度逐渐缩小为普通样式
    $("#left_sup .active").removeClass('active')//把已选按钮的样式改为普通样式
    $(".grid_div").find(".grid_active").removeClass("grid_active");
}
$(function(){
    $("input[name='for_all']").prop('checked', false);
    $("input[name='for_stock']").prop('checked', false);
})
