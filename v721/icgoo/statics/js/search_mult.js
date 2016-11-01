function mult_info(obj,de){
    var infoCon = $(obj).parent('td');
    var thisTd =  infoCon.siblings("td[id^='info_']").children().children().children().find('td.dc_mult');
    //点击更多按钮时将页面中每个td中含有的<br>字符串替换掉
    //var re =　new RegExp("<br>","g");
    $(thisTd).each(function() {
      //  $(this).text($(this).text().replace(re," "));
        //判断如果当前批号中的数据内容不为空时，加入样式用于区分属于不同的供应商
        $(this).parent('tr').css('border-bottom','1px dotted #e3e3e3');
    });

    //点击更多按钮进入页面时判断数量对应的国内含税和香港交货（让其高亮显示）
    var oQty = infoCon.siblings('td.qty_frist').html();　　　　　　　　//获取你输入查询的数量
    var oTr = infoCon.next().find('.mult_con').find('tr');
    oTr.each(function() {
        var qtyAllLi = $(this).find('td.qty_mult').find('li');      //获取当前tr下的td(类qty_mult)下所有li
        qtyAllLi.each(function (index) {
            var nQty = parseInt($(this).find('span').html());                  //获取每个td下包含的所有数量(循环比较)
            if (oQty >= nQty) {
                $(this).addClass('bc').siblings('li').removeClass('bc');
                $(this).parents('.qty_mult').siblings('td.dlrmb_mult').find('li').eq(index).addClass('bc').siblings('li').removeClass('bc');
                $(this).parents('.qty_mult').siblings('td.hkusd_mult').find('li').eq(index).addClass('bc').siblings('li').removeClass('bc');
            }
        });
    });

    //点击更多按钮进入页面时比较所有的供应商总计（最优者高亮显示），且对应的当前供应商为已选状态
    var priceArr = [];
    var mpriceLi = oTr.find('td.total_mult');
    var pricePa = infoCon.siblings('td.total_frist');
    mpriceLi.each(function() {
        var priceText = parseFloat($.trim($(this).html()).substring(1));       //将￥符号截取掉得到数字
        priceArr.push(priceText);　　　　　　　　　　　　　//将得到的数字放入数组
    });
    priceArr.reverse();                               //数组倒序
    var minPrice = priceArr[priceArr.length-1];
    mpriceLi.each(function() {
        //判断哪个总计为最小值（高亮显示）
        if($.trim($(this).html()).substring(1) == minPrice) {
            $(this).addClass('mark');
        }
    });
    mpriceLi.each(function() {
        //判断哪个供应商已在列表中（更改状态）
        //***如果单纯只是判断总计可能会导致有几个成为已选，可以多加两个判断条件，如型号、供应商等
        if($.trim($(this).html()) == $.trim(pricePa.html())) {
            $(this).next().find('span.btn-check').css('display','block').siblings('.btn_s').hide();
        }else {
            $(this).next().find('input.btn_s').show().siblings('span.btn-check').hide();
        }
    });

    $windowHeight = $(window).height();
    $windowWidth = $(window).width();
    var $left = ($windowWidth - 1080)/2;
    var $left1 = (1024-$windowWidth)/2;
    var $top = ($windowHeight - 350)/2;
    var $top1 = ($windowHeight - 350)/2;
    $("#mask").css({
        //遮罩层的宽高自适应浏览器窗口的宽高（问题是：如果用户向下滚动下方就不会出现遮罩层）
        'width': '120%',
        'height': '130%'
    });
    $("#mask").show();
    if(screen.width > 1024) {
        $(".mult_info").css({
            'left': $left,
            'top': '80px'
        });
    }else {
        $(".mult_info").css({
            'left': '25px',
            'top': '20px'
        });
    }
    var icgoo = $(obj).attr('id').replace('more_', '');
    var info_id = "info_" + icgoo;
    $("#"+info_id).show();


    /* 左边导航栏效果(此模块暂时不需要) */
    var supStr = infoCon.next().find('ul#left_sup').find('li');
    supStr.css(
         {'width': '38px',
         　'left': '40px'
         }
    );
    supStr.each(function (index,element) {
        //遍历当前元素之后的所有元素
        for (var i = index + 1; i < supStr.length; i++) {
            //判断当前元素与其之后所有的元素依次比较是否相同
            if ($(this).find('a').text() == supStr.eq(i).find('a').text()) {
                supStr.eq(i).hide();
            }
        }
        lefton(element);
    });/* end */


    //输入框的数量加减
    var oInput = $(obj).parent().next().find('.qty_input');
    var oAdd = $(obj).parent().next().find('span#add');
    var oReduce = $(obj).parent().next().find('span#reduce');
    oAdd.on('click',function() {
        //判断每次点击加１
        var oQty = oInput.val(parseInt(oInput.val())+1);
        if(parseInt(oInput.val()) > 1) {
            oReduce.show();
        }
        //调用函数
        get_price(oQty, de);
        get_price1(oQty, de);
    });
    oReduce.on('click',function() {
        //判断每次点击减１
        var oQty = oInput.val(parseInt(oInput.val())-1);
        if(parseInt(oInput.val()) < 1) {
            oInput.val(1);
            oReduce.hide();
            //alert("输入数量至少为1");
        }
        get_price(oQty, de);
        get_price1(oQty, de);
    });
    oInput.change(function () {
        get_price(this, de);
        get_price1(this, de);
    });

    //调用阶梯价格隐藏函数
    init_price();

    /* 判断当前型号供应商列表中tr（即供应商的个数）,当数量不足３时高度自适应 */
    if(oTr.length <= 3) {
        $(obj).parent('td').next().find('.mult_con').css({
           height: 'auto'
        });
        $(obj).parent('td').next().find('.slimScrollDiv').css({
            height: 'auto'
        });
    }

    //默认模糊数据展开
    var oLi = $(obj).parent('td').next().find('.blur-info').find('#blur-data').find('li');
    oLi.each(function(index) {
        var thisHtml = $(this).find('a').html();
        for(var i = index+1;i < oLi.length;i++) {
            if(thisHtml == oLi.eq(i).find('a').html()) {
                oLi.eq(i).remove();
            }
        }
    });
    //进入更多页时滚动条都在最顶部
    $(document).scrollTop(0);
}

//关闭
function close_all(obj) {
    $(obj).parents('td').hide();
    $('#mask').hide();
    $(obj).parents('li.right').siblings('li').find('#add').unbind('click');     //点击关闭后将事件删除（避免再次进去事件累积）
    $(obj).parents('li.right').siblings('li').find('#reduce').unbind('click');

    //调用关闭模糊型号函数
    //var oClose = $(obj).parents('.mult_tit').siblings('.blur-info').find('.close-blur');
    //close_blur(oClose);
}

function change_info(obj){
    var infoCon = $(obj).parents("td[id^='info_']");
    var thisTd = $(obj).parent('td');
    var thisInput = $(obj).parents('div.mult_con');
    var new_sup = thisTd.siblings('td.sup_mult').text();
    var new_mfr = thisTd.siblings('td.mfr_mult').text();
    var old_partno = infoCon.find('.mult_tit').find('.old-partno span').html();

    var new_dc = thisTd.siblings('td.dc_mult').html();
    var new_delvery = thisTd.siblings('td.delvery_mult').text();
    var new_stock = parseInt(thisTd.siblings('td.stock_mult').text());
    var new_min = thisTd.siblings('td.min_mult').text();
    var new_dlrmb = thisTd.siblings('td.dlrmb_mult').find('li.bc').text();
    var new_hkusd = thisTd.siblings('td.hkusd_mult').find('li.bc').text();
    var new_total = thisTd.siblings('td.total_mult').text();
    //var new_qty = thisTd.siblings('td.qty_mult').find('input').val();
    var new_qty = infoCon.find('input.qty_input').val();


    infoCon.siblings('td.partno_frist').text($.trim(old_partno));
    infoCon.siblings('td.mfr_frist').text($.trim(new_mfr));
    infoCon.siblings('td.sup_frist').text($.trim(new_sup));
    infoCon.siblings('td.dc_frist').html($.trim(new_dc));
    infoCon.siblings('td.stock_frist').text($.trim(new_stock));
    infoCon.siblings('td.min_frist').text($.trim(new_min));
    infoCon.siblings('td.qty_frist').text($.trim(new_qty));
    infoCon.siblings('td.dlrmb_frist').text($.trim(new_dlrmb));
    infoCon.siblings('td.hkusd_frist').text($.trim(new_hkusd));
    infoCon.siblings('td.total_frist').text($.trim(new_total));
    infoCon.siblings('td.delvery_frist').text(new_delvery);
    infoCon.hide();
    $("#mask").hide();
}

function delete_info(obj){
    var trParent = $(obj).parents('tr');
    reset_result()
    trParent.remove();
}

//精确数据价格对应关系
function get_price(obj, de) {
    // 对象自身、交货地
    // 获取购买数量的对应的价格区域
    var thisParent = $(obj).parents('div.mult_tit');
    var oTr = thisParent.next().find('tr');
    oTr.each(function() {
        var priceUl = $(this).find('.qty_mult');
        var qtyLi = priceUl.find('li');
        var minQty = parseInt(qtyLi.eq(0).children().text());　　　　　　//获取最小数量
        var maxQty = parseInt(qtyLi.eq(qtyLi.length - 1).children().text());　　　　　//获取最大数量
        qty = parseInt($(obj).val());
        var priceDl = 0;
        var priceHk = 0;
        var dl = $(this).find('.dlrmb_mult').find('li');
        var hk = $(this).find('.hkusd_mult').find('li');
        if (qty <= minQty) {
            //国内
            priceDl = $.trim(dl.eq(0).find('span').html());
            //香港
            priceHk = $.trim(hk.eq(0).find('span').html());
            priceDl = parseFloat(priceDl.replace('￥', ''));
            priceHk = parseFloat(priceHk.replace('$', ''));
            //数量
            qtyLi.eq(0).addClass('bc').siblings('li').removeClass('bc');
            //国内
            dl.eq(0).addClass('bc').siblings('li').removeClass('bc');
            //香港
            hk.eq(0).addClass('bc').siblings('li').removeClass('bc');
        } else if (qty > maxQty) {
            //国内
            priceDl = $.trim(dl.eq(dl.length - 1).find('span').html());
            //香港
            priceHk = $.trim(hk.eq(hk.length - 1).find('span').html());
            priceDl = parseFloat(priceDl.replace('￥', ''));
            priceHk = parseFloat(priceHk.replace('$', ''));
            //数量
            qtyLi.eq(qtyLi.length - 1).addClass('bc').siblings('li').removeClass('bc');
            //国内
            dl.eq(dl.length - 1).addClass('bc').siblings('li').removeClass('bc');
            //香港
            hk.eq(dl.length - 1).addClass('bc').siblings('li').removeClass('bc');
        } else {
            qtyLi.each(function (index) {
                var thisQty = parseInt($(this).find('span').html());
                if (qty >= thisQty) {
                    //国内
                    priceDl = $.trim(dl.eq(index).find('span').html());
                    //香港
                    priceHk = $.trim(hk.eq(index).find('span').html());
                    priceDl = parseFloat(priceDl.replace('￥', ''));
                    priceHk = parseFloat(priceHk.replace('$', ''));
                    //数量
                    $(this).addClass('bc').siblings('li').removeClass('bc');
                    //国内
                    $(this).parents('.qty_mult').siblings('td.dlrmb_mult').find('li').eq(index).addClass('bc').siblings('li').removeClass('bc');
                    //香港
                    $(this).parents('.qty_mult').siblings('td.hkusd_mult').find('li').eq(index).addClass('bc').siblings('li').removeClass('bc');
                }
            });
        }
        priceDl = priceDl || parseFloat(0.00);
        priceHk = priceHk || parseFloat(0.00);
        totalDl = (priceDl * qty).toFixed(2);
        totalHk = (priceHk * qty).toFixed(4);
        if (de == 'dl') {
            $(this).find('td.total_mult').text("￥" + totalDl);
        } else {
            $(this).find('td.total_mult').text("$" + totalHk);
        }
    });

    //判断库存数量是否充足
    var oStock = $(obj).parents('.mult_tit').next().find('td.stock_mult');
    oStock.each(function() {
        var oStock = $(this).find('span.stock-warning');
        var oTotal = $(this).siblings('.total_mult');
        var oqtyLi = $(this).siblings('.qty_mult').find('li');
        var thisVal = parseInt($(obj).val());
        var maxQty = parseInt(oqtyLi.eq(oqtyLi.length-1).children().text());
        var oPriDl = 0;
        var oPriHk = 0;
        var oDlr = $(this).siblings('.dlrmb_mult').find('li');
        var oHk = $(this).siblings('.hkusd_mult').find('li');
        var oHtml = parseInt($(this).html());
        if(oHtml < thisVal) {
            thisVal = oHtml;
            oStock.show();
            //setTimeout(function(){
              //  oStock.css('display','none');
            //},5000);
            if(thisVal > maxQty) {
                oPriDl = $.trim(oDlr.eq(oDlr.length - 1).find('span').html());
                oPriHk = $.trim(oHk.eq(oHk.length - 1).find('span').html());
                oPriDl = parseFloat(oPriDl.replace('￥', ''));
                oPriHk = parseFloat(oPriHk.replace('$', ''));
            }
            else {
                oqtyLi.each(function(index) {
                    var thisQty = parseInt($(this).find('span').html());
                    if (thisVal >= thisQty) {
                        //国内
                        oPriDl = $.trim(oDlr.eq(index).find('span').html());
                        //香港
                        oPriHk = $.trim(oHk.eq(index).find('span').html());
                        oPriDl = parseFloat(oPriDl.replace('￥', ''));
                        oPriHk = parseFloat(oPriHk.replace('$', ''));
                    }
                });
            }
            oTotDl = (thisVal * oPriDl).toFixed(2);
            oTotHk = (thisVal * oPriHk).toFixed(4);
            if (de == 'dl') {
                oTotal.text("￥" + oTotDl);
            } else {
                oTotal.text("$" + oTotHk);
            }
        }
        else {
            oStock.css('display','none');
        }
    });
}

tipIndex = 0;
function next(){
    tipIndex++;
    if(tipIndex > $("#load_waring li").length-1){
        tipIndex = 0;
    }
    change();
}
function change(){
    $("#load_waring ul").stop().animate({top:-tipIndex*25}, 400, function(){
        if(tipIndex == $("#load_waring li").length-1){
            $("#load_waring ul").css({ top: 0 });
            tipIndex = 0;
        }
    })
}
$("#load_waring li:eq(0)").clone(true).appendTo($("#load_waring ul"));

function convert_str(partno) {
    var result = partno.replace("%", "%25").replace("+", "%2B").replace(" ",
        "%20").replace("/", "%2F").replace("?", "%3F").replace("#", "%23").replace(
        "&", "%26").replace("=", "%3D");
    return result;
}


function other_pro(obj, par){
    // 批量查询没有信息的时候修改型号重新查询;
    theTr = $(obj).parents('tr');
    qty = $.trim($(obj).parents().parents().children('td').eq(1).text());
    thisClass = theTr.attr('class');
    inputE = '<input type="text" placeholder="请输入型号" onkeydown="text_change(this)" name="mult_partno" value="'+par+'" />';
    inputQ = '<input type="text" placeholder="采购数量" onkeydown="text_change(this)" style="width:60px;text-align:center" name="mult_qty" value="'+qty+'" />';
    inputS = "<input type='button' value='查询' class='check' onclick='test_search(this)'/>";
    newHtml = '<td colspan="5" style="text-align:left">' + inputE + inputQ + inputS + '</td><td colspan="6"></td><td></td>';
    theTr.html(newHtml);
}

//添加按钮可以查询新型号
function new_pro(obj){
    var theTr = $(obj).parents('tr');
    var inputE = '<input type="text" name="mult_partno" onkeydown="text_change(this)" placeholder="请输入型号" value="" />';
    var inputQ = '<input type="text" name="mult_qty" onkeydown="text_change(this)" style="width:60px;text-align:center" placeholder="采购数量" value="" />';
    var inputS = "<input type='button' value='查询' class='check' onclick='test_search(this)'/>";
    var newHtml = '<td colspan="5" style="text-align:left">' + inputE + inputQ + inputS + '</td><td colspan="6" style="padding-right:170px"></td><td></td>';
    theTr.html(newHtml);
    //点击添加型号查询会出现相应的查询框（可以不断添加以满足用户需求）
    if($(".img-flag").length == 0) {
        $("#mult_results").append('<tr><td colspan="12" style="text-align:left"><a href="javascript:void(0)" class="search_add" onclick="new_pro(this)"><span class="symbol">+</span>添加型号查询</a></td></tr>');
    }
}

function test_search(obj){
    url = '/search/mult_search/';
    var cls = $(obj).parents('tr').attr('class');
    var partno = $(obj).siblings('input[name="mult_partno"]').val();
    var qty = $(obj).siblings('input[name="mult_qty"]').val();
    var reg = new RegExp("[\\u4E00-\\u9FFF]+","g");
    reset_result();
    if($.trim(partno) == ''){
        $(obj).siblings('input[name="mult_partno"]').addClass("borderRed")
                                                    .focus();
    }else if (reg.test(partno)){
        $(obj).siblings('input[name="mult_partno"]').addClass("borderRed")
                                                  .focus();
    }else if(/[.]/.test(qty)){
        $(obj).siblings('input[name="mult_qty"]').addClass("borderRed")
                                                  .focus();
    }else if (/[A-z]/.test(qty)){
        $(obj).siblings('input[name="mult_qty"]').addClass("borderRed")
                                               .focus();
    }else if (!parseInt(qty)||parseInt(qty)<=0){
        $(obj).siblings('input[name="mult_qty"]').addClass("borderRed")
                                                 .focus();
    }else{
        url = url + '?partno='+convert_str(partno)+'&qty='+qty;
        loadimg = '<div style="height:20px;color:#666">查询中</div><img class="img-flag" src="/statics/img/loading_s1.gif" alt="数据加载中...">';
        $(obj).parent().parent().find('td').eq(1).html(loadimg);
        //$(obj).parent().parent().find('td').eq(2).html('<span class="tip">查询中......</span>');
        $.get(url, function(data, status){
            $(obj).parent().parent().html(data);
        });
        $(obj).attr("disabled","disabled");
    }
}

$(function(){
    setInterval(next, 3500);
});

/*　左侧导航功能（此块功能暂时不需要）　*/
function lefton(obj) {
    $(obj).siblings().stop();
    var supLi = $(obj).parents('li');
    var isActive = supLi.hasClass('active');      //判断当前元素是否处于触发状态（被点击）
    if(!isActive) {
        //遍历当前元素的父元素li
        supLi.each(function () {
            //获取当前元素a的title属性值
            var thisTit = $(this).find(obj).attr('title');
            $(this).find(obj).text(thisTit);
            if (!$(this).is(":animated")) {　　　　　　//判断是否在动画
                $(obj).parents('li').animate({
                    width: '78px',
                    left: 0
                }, 200);
            }
        });
    }
}

function leftout(obj) {
    $(obj).siblings().stop();                     //当前的兄弟元素的动画停止
    var supLi = $(obj).parents('li');
    var isActive = supLi.hasClass('active');      //判断当前元素是否处于触发状态（被点击）
    if(!isActive) {                               //当被点击后鼠标的移入移出事件则不会触发
        supLi.each(function () {
            var newTit = $(this).find(obj);
            newTit.html(newTit.text().charAt(0));　　　　//取当前元素值的第一个字符替换掉原来的值
            if (!$(this).is(":animated")) {　　　　　　　　//判断是否在动画
                $(obj).parents('li').animate({
                    width: '38px',
                    left: '40px'
                }, 30);
            }
        });
    }
}

function reset_sup(obj,flag) {
    var listCon = $(obj).parents('.left_filter').prev().find('.mult_con').find('td.sup_mult');
    //首先判断其对应的供应商是否隐藏（若隐藏则显示出来）
    if(listCon.parent().is(':hidden')) {
        listCon.parent().fadeIn(100);
    }
    $(obj).find('a.close-sup').show();         //显示关闭按钮
    $(obj).addClass('active').siblings().removeClass('active');　　　　　　　　　　//为当前被点击元素加入样式类
    var curText = $(obj).find('a').eq(0).text();
    var multCon = $(obj).parents('.left_filter').prev().find('.mult_con');
    var curIndex = $(obj).index();        //获取当前被点击元素索引值
    listCon.each(function (index) {
        var thisIndexText = $(this).text();
        if (curText == thisIndexText) {
            for (var i = 0; i < listCon.length; i++) {
                if ($(this).text() == listCon.eq(i).text() && i != index) {
                    var thisTd = listCon.eq(i < index ? i : index);
                    thisTd.attr('id', thisIndexText);
                    var leftVal = thisTd.text();
                    $(this).parents('div.mult_info').next().find(obj).find('a').attr('href', "#" + leftVal);
                    break;
                }
            }
            $(this).attr('id', thisIndexText);
            var leftVal = $(this).text();
            $(this).parents('div.mult_info').next().find(obj).find('a').attr('href', "#" + leftVal);
        }
    });
}

function close_sup(obj) {
    //阻止事件冒泡（防止同时触发其父元素的点击事件）－－不会阻止其默认行为
    var e = arguments.callee.caller.arguments[0] || event;    //兼容ＩＥ和Firefox
    if(e && e.stopPropagation) {
        e.stopPropagation();
    }else if(window.event) {
        window.event.cancelBubble = true;
    }

    $(obj).parents('li').removeClass('active');
    $(obj).hide();
    var objText = $(obj).parents('div.left_filter').prev().find('.mult_con').find('td.sup_mult');
    var sibText = $(obj).prev().text();
    objText.each(function() {          //遍历列表当中的供应商
       if(sibText == $(this).text()) {　　　　//判断是否与被点击的元素相同
           $(this).parent().fadeOut(200);　　　　　　//隐藏其父元素
       }
    });
}
/* End */


/* 阶梯价格隐藏 */
function init_price() {
    var liPri = $('.price');
    liPri.each(function() {
       var len = $(this).find('li').length;
        if(len > 3) {         //判断当前li的长度（大于３的li即隐藏）
            $(this).find('p.open').show();
            for(var i=3; i<len; i++) {
                $(this).find('li').eq(i).addClass('index').hide();
            }
        }else {
            $(this).find('p.open').hide();
            $(this).find('div.h15').hide();
        }
    });
}

function close_price(obj) {
    var curClass = $(obj).attr('class');
    if(curClass == 'open') {
        /*$(obj).siblings('ul')*/$(obj).parents('.price').find('li:hidden').addClass('index').show();
        $(obj).parents('.price').siblings('td.price').find('li:hidden').addClass('index').show();
        $(obj).removeClass('open').addClass('to_close');
    }else {
        /*$(obj).siblings('ul')*/$(obj).parents('.price').find("li.index").hide();
        $(obj).parents('.price').siblings('td.price').find("li.index").hide();
        $(obj).removeClass('to_close').addClass('open');
    }
}

/* 更多页中选择供应商 */
function checkSupplier(obj) {
    $(obj).parents('th').addClass('thCss');
    $(obj).next().fadeIn(200);        //显示选择框
    var checkVal = $(obj).next().find('li').find('span');
    checkVal.each(function(index) {
        for(var i = index+1;i<checkVal.length;i++) {
            if($(this).html() == checkVal.eq(i).html()) {
                checkVal.eq(i).parents('li').hide();
            }
        }
    });
    //最优供应商不可隐藏
    var bestSup = $(obj).parents('.mult_tit').next().find('.total_mult');
    if (bestSup.hasClass('mark')) {
        var sup = $(obj).parents('.mult_tit').next().find('.sup_mult');
        checkVal.each(function () {
            if (sup.html() == $(this).html()) {
                $(this).prev().attr({'checked':'checked','disabled':'disabled'});     //最优供应商不可隐藏
                $(this).css('color', '#CC0000');
                $(this).append("<span style='color:#999'>（价格最优）</span>");
            }
        });
    }
}

/* 确定按钮显示勾选中的供应商 */
function confirmSup(obj) {
    $('.mult_con table tr').hide();
    $(obj).parents('th').removeClass('thCss');
    $(obj).parents('.supplier-check').fadeOut(100);
    var chkBox = $(obj).parent().siblings('ul').find('input[type=checkbox]:visible');
    chkBox.each(function() {
       if($(this).prop('checked')) {
           var thisHtml = $(this).siblings('span').attr('class');
           $('.mult_con table tr').each(function() {
              if($(this).find('.sup_mult').html().toLowerCase() == thisHtml) {
                  $(this).show();
              }
           });
       }
    });
}

/* 模糊查询结果功能js */
var flag = 0;   //定义全局变量
function toggleBlur(obj) {
    //滚动条回到顶部
    $(document).scrollTop(0);
    var blurRes = $(obj).parents('.blur-tit').next();
    flag++;　　　　　//每次点击自增１
    if(!blurRes.is(':animated')) {
        $(obj).parents('.blur-tit').next().slideToggle(300);
        if(flag % 2 == 1) {      //判断奇偶点击(改变文字)
            $(obj).html('- 展开');
        }else {
            $(obj).html('+ 收起');
        }
    }
}

function blur_info(obj) {
    var liIndex = $(obj).parents('li');
    var blurResW = parseInt($(obj).parents('.blur-res').width());
    var count = Math.floor(parseInt(blurResW/parseInt(liIndex.innerWidth())));     //innerWidth() --获取元素宽度包括内边距
    var curIndex = liIndex.index();        //获取当前被点击元素的索引值
    var i = parseInt(curIndex / count);
    $(obj).parents('#blur-data').next().css('top', 40 + parseInt(liIndex.innerHeight()) * i + 'px');
    var oLi = $(obj).parents('#blur-data').find('li').length;
    var num = oLi / count;    //模糊数据的行数
    $(obj).parents('#blur-data').next().find('#blur-con').css({
        height: '350px'
    });
    $(obj).parents('#blur-data').next().find('.slimScrollDiv').css({
        height: '350px'
    });
    //通过判断模糊型号数量决定供应商列表的高度
    if (num < 3) {
        $(obj).parents('.blur-res').css('height', '430px');
    } else {
        if (i < 3) {
            $(obj).parents('.blur-res').css('height', '392px');
        } else {
            $(obj).parents('.blur-res').css('height', '571px');
        }
    }

    var oblurBox = $(obj).parents('#blur-data').next();
    //点击空白遮罩层供应商列表消失
    $('#mask').on('click',function() {
        $(obj).removeClass('blur-active');
        oblurBox.hide();
        $(obj).parents('.blur-res').css('height','auto');

        //滚动条回到顶部
        $(document).scrollTop(0);
    });
    //被点击元素增加一个高亮类
    $(obj).addClass('blur-active').parents('li').siblings().find('a').removeClass('blur-active');
    if(screen.width > 1024) {
        $(obj).parents('#blur-data').next().find('.slimScrollDiv').css('width', '1080px');
    }else {
        $(obj).parents('#blur-data').next().find('.slimScrollDiv').css('width', '960px');
    }
    //显示模糊查询数据供应商列表
    var i = $(obj).parents('#blur-data').next();
    i.show();

    //窗口滚动条跳到指定位置
    $(document).scrollTop($(window).height()/2);
    //显示关闭按钮（模糊型号）
    $(obj).find('.close-blur').show();
}

//关闭当前相似型号
function close_blur(obj) {
    //阻止事件冒泡（防止同时触发其父元素的点击事件）－－不会阻止其默认行为
    var e = arguments.callee.caller.arguments[0] || event;    //兼容ＩＥ和Firefox
    if(e && e.stopPropagation) {
        e.stopPropagation();
    }else if(window.event) {
        window.event.cancelBubble = true;
    }
    $(obj).hide();
    $(obj).parent().removeClass('blur-active');
    $(obj).parent().parents('#blur-data').next().hide();
    $(obj).parents('.blur-res').css('height','auto');
    $(document).scrollTop(0);
}

//模糊数据替换供应商函数
function change_info1(obj) {
        var infoCon = $(obj).parents("td[id^='info_']");
        var thisTd = $(obj).parent('td');
        var thisInput = $(obj).parents('div.mult_con');
        var new_partno = $(obj).parents('#blur-con').parents('.blur-box').prev().find('li');
        var blurInfoCon = $(obj).parents('.blur-info').parents("td[id^='info_']");
        new_partno.each(function() {
            if($(this).find('a').hasClass('blur-active')) {     //判断哪个型号是被点击状态
                var partnoText = $(this).find('a').find('span').eq(0).text();
                blurInfoCon.siblings('td.partno_frist').text($.trim(partnoText));　　　//替换当前型号
            }
        });
        var new_sup = thisTd.siblings('td.sup_mult').text();
        var new_mfr = thisTd.siblings('td.mfr_mult').text();

        var new_dc = thisTd.siblings('td.dc_mult').html();        //必须用.html()获取内容（以便转换<br>字符）
        var new_delvery = thisTd.siblings('td.delvery_mult').text();
        var new_stock = parseInt(thisTd.siblings('td.stock_mult').text());
        var new_min = thisTd.siblings('td.min_mult').text();
        var new_dlrmb = thisTd.siblings('td.dlrmb_mult').find('li.bc').text();
        var new_hkusd = thisTd.siblings('td.hkusd_mult').find('li.bc').text();
        var new_total = thisTd.siblings('td.total_mult').text();
        //var new_qty = thisTd.siblings('td.qty_mult').find('input').val();
        var new_qty = infoCon.find('input.qty_input').val();


        infoCon.siblings('td.mfr_frist').text($.trim(new_mfr));
        infoCon.siblings('td.sup_frist').text($.trim(new_sup));
        infoCon.siblings('td.dc_frist').html($.trim(new_dc));
        infoCon.siblings('td.stock_frist').text($.trim(new_stock));
        infoCon.siblings('td.min_frist').text($.trim(new_min));
        infoCon.siblings('td.qty_frist').text($.trim(new_qty));
        infoCon.siblings('td.dlrmb_frist').text($.trim(new_dlrmb));
        infoCon.siblings('td.hkusd_frist').text($.trim(new_hkusd));
        infoCon.siblings('td.total_frist').text($.trim(new_total));
        infoCon.siblings('td.delvery_frist').text(new_delvery);
        infoCon.hide();
        $("#mask").hide();
}

//模糊数据价格对应关系
function get_price1(obj, de) {
    // 对象自身、交货地
    // 获取购买数量的对应的价格区域
    var thisParent = $(obj).parents('div.mult_tit');
    var oTr = thisParent.siblings('.blur-info').find('#blur-con').find('tr');
    oTr.each(function() {
        var priceUl = $(this).find('.qty_mult');
        var qtyLi = priceUl.find('li');
        var minQty = parseInt(qtyLi.eq(0).children().text());　　　　　　//获取最小数量
        var maxQty = parseInt(qtyLi.eq(qtyLi.length - 1).children().text());　　　　　//获取最大数量
        qty = parseInt($(obj).val());
        var priceDl = 0;
        var priceHk = 0;
        var dl = $(this).find('.dlrmb_mult').find('li');
        var hk = $(this).find('.hkusd_mult').find('li');
        if (qty <= minQty) {
            //国内
            priceDl = $.trim(dl.eq(0).find('span').html());
            //香港
            priceHk = $.trim(hk.eq(0).find('span').html());
            priceDl = parseFloat(priceDl.replace('￥', ''));
            priceHk = parseFloat(priceHk.replace('$', ''));
            //数量
            qtyLi.eq(0).addClass('bc').siblings('li').removeClass('bc');
            //国内
            dl.eq(0).addClass('bc').siblings('li').removeClass('bc');
            //香港
            hk.eq(0).addClass('bc').siblings('li').removeClass('bc');
        } else if (qty > maxQty) {
            //国内
            priceDl = $.trim(dl.eq(dl.length - 1).find('span').html());
            //香港
            priceHk = $.trim(hk.eq(hk.length - 1).find('span').html());
            priceDl = parseFloat(priceDl.replace('￥', ''));
            priceHk = parseFloat(priceHk.replace('$', ''));
            //数量
            qtyLi.eq(qtyLi.length - 1).addClass('bc').siblings('li').removeClass('bc');
            //国内
            dl.eq(dl.length - 1).addClass('bc').siblings('li').removeClass('bc');
            //香港
            hk.eq(dl.length - 1).addClass('bc').siblings('li').removeClass('bc');
        } else {
            qtyLi.each(function (index) {
                var thisQty = parseInt($(this).find('span').html());
                if (qty >= thisQty) {
                    //国内
                    priceDl = $.trim(dl.eq(index).find('span').html());
                    //香港
                    priceHk = $.trim(hk.eq(index).find('span').html());
                    priceDl = parseFloat(priceDl.replace('￥', ''));
                    priceHk = parseFloat(priceHk.replace('$', ''));
                    //数量
                    $(this).addClass('bc').siblings('li').removeClass('bc');
                    //国内
                    $(this).parents('.qty_mult').siblings('td.dlrmb_mult').find('li').eq(index).addClass('bc').siblings('li').removeClass('bc');
                    //香港
                    $(this).parents('.qty_mult').siblings('td.hkusd_mult').find('li').eq(index).addClass('bc').siblings('li').removeClass('bc');
                }
            });
        }
        priceDl = priceDl || parseFloat(0.00);
        priceHk = priceHk || parseFloat(0.00);
        totalDl = (priceDl * qty).toFixed(2);
        totalHk = (priceHk * qty).toFixed(4);
        if (de == 'dl') {
            $(this).find('td.total_mult').text("￥" + totalDl);
        } else {
            $(this).find('td.total_mult').text("$" + totalHk);
        }
    });

    //判断库存数量是否充足
    var oStock = $(obj).parents('.mult_tit').siblings('.blur-info').find('#blur-con').find('td.stock_mult');
    oStock.each(function() {
        var oStock = $(this).find('span.stock-warning');
        var oTotal = $(this).siblings('.total_mult');
        var oqtyLi = $(this).siblings('.qty_mult').find('li');
        var thisVal = parseInt($(obj).val());
        var maxQty = parseInt(oqtyLi.eq(oqtyLi.length-1).children().text());
        var oPriDl = 0;
        var oPriHk = 0;
        var oDlr = $(this).siblings('.dlrmb_mult').find('li');
        var oHk = $(this).siblings('.hkusd_mult').find('li');
        var oHtml = parseInt($(this).html());
        if(oHtml < thisVal) {
            thisVal = oHtml;
            oStock.show();
            if(thisVal > maxQty) {
                oPriDl = $.trim(oDlr.eq(oDlr.length - 1).find('span').html());
                oPriHk = $.trim(oHk.eq(oHk.length - 1).find('span').html());
                oPriDl = parseFloat(oPriDl.replace('￥', ''));
                oPriHk = parseFloat(oPriHk.replace('$', ''));
            }
            else {
                oqtyLi.each(function(index) {
                    var thisQty = parseInt($(this).find('span').html());
                    if (thisVal >= thisQty) {
                        //国内
                        oPriDl = $.trim(oDlr.eq(index).find('span').html());
                        //香港
                        oPriHk = $.trim(oHk.eq(index).find('span').html());
                        oPriDl = parseFloat(oPriDl.replace('￥', ''));
                        oPriHk = parseFloat(oPriHk.replace('$', ''));
                    }
                });
            }
            oTotDl = (thisVal * oPriDl).toFixed(2);
            oTotHk = (thisVal * oPriHk).toFixed(4);
            if (de == 'dl') {
                oTotal.text("￥" + oTotDl);
            } else {
                oTotal.text("$" + oTotHk);
            }
        }
        else {
            oStock.css('display','none');
        }
    });
}

//如果用户修改批量查询的结果，则重新获取结果
function reset_result(){
  var $label = $("#pdf_form").find("label"),
      className = 'hi';
  if($label.hasClass(className))
  {
      $label.removeClass(className);
      $("#pdf_form").find("input[type='hidden']").remove();
  }
}
