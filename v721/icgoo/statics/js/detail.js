var unitPrice = $("#unit_price");
var totalPrice = $("#total_price");
var deliveryDay = $("#delivery_day");
var allPrice = $("input[name='all_price']").val();
var buyQtyInput = $("input[name='buy_qty_d']");
var buyQty = $("input[name='buy_qty_d']").val();
var delvery_hk = $("input[name='delvery_hk']").val();
var delvery_dl = $("input[name='delvery_dl']").val();
var stockQty = $("input[name='stock_qty']").val();
var minQty = $("input[name='min_qty']").val();
var location_dl = $("input[id='location_dl']");
var delicity = $("input[name='location']");
var deliveryday = delvery_dl;
var downBtn = $("#buy_qty_down");
var upBtn = $("#buy_qty_up");
var supplier = $("input[name='supplier']").val()
var partno = $("input[name='cur_partno']").val()
var moneyType = '￥';

buyQty = parseInt(buyQty);
stockQty = parseInt(stockQty);
minQty = parseInt(minQty);

function thePrice(buyQty){
    price = []
    // price = [price_hkhkd, price_dlrmb, price_hkrmb, price_hkusd]
    if(allPrice!='[]'){
        jsonObj1 = $.parseJSON(allPrice);
        var minQty = parseInt(jsonObj1[0]['quantity'])
        var maxQty = parseInt(jsonObj1[jsonObj1.length-1]['quantity'])
        if(buyQty < minQty){
            price = [jsonObj1[0]['price_hkhkd'], jsonObj1[0]['price_dlrmb'], jsonObj1[0]['price_hkrmb'], jsonObj1[0]['price_hkusd']]
        }
        else if(buyQty > maxQty){
            price = [jsonObj1[jsonObj1.length-1]['price_hkhkd'], jsonObj1[jsonObj1.length-1]['price_dlrmb'], jsonObj1[jsonObj1.length-1]['price_hkrmb'], jsonObj1[0]['price_hkusd']]
        }else{
            for(i=0; i<jsonObj1.length; i++){
                var iQty = parseInt(jsonObj1[i]['quantity'])
                if(buyQty >= iQty){
                    price = [jsonObj1[i]['price_hkhkd'], jsonObj1[i]['price_dlrmb'], jsonObj1[i]['price_hkrmb'], jsonObj1[i]['price_hkusd']]
                }
            }
        }
        if(moneyType == '$') return price[3]
        if(moneyType == '￥') return price[1]
    }else{
        $("#buy_btn").val('询价');
        //return parseFloat('0.0')
        return 'none'
    }
}

function theTotal(unit_price, qty){
    var the_Total = parseFloat(unit_price) * qty;
    the_Total = the_Total.toFixed(4);
    return the_Total
}

function init(){
    $("input[id='location_dl']").prop('checked', 'true');
    price = thePrice(buyQty)
    if(price == 'none')
    {
        var the_price = '暂无价格信息!';
        var the_total = '暂无价格信息!';
    }
    else{
        var the_price = '￥' + price;
        var the_total = '￥' + theTotal(price, buyQty)
    }
    unitPrice.text(the_price);
    totalPrice.text(the_total);
    deliveryDay.text(delvery_dl);
}

function update_info(buyQty, delicityVal){
    deliveryday = delicityVal == 'hk' ?delvery_hk : delvery_dl;
    moneyType = delicityVal == 'hk' ?'$' : '￥';
    price = thePrice(buyQty)
    the_price = moneyType + price;
    the_total = moneyType + theTotal(price, buyQty)
    unitPrice.text(the_price);
    totalPrice.text(the_total);
    deliveryDay.text(deliveryday);
}

function get_other_supps(buyQty, partno, supplier){
    $.ajax({
        url: '/search/pricepk/',
        type: 'GET',
        data: {'sup': supplier, 'partno':partno, 'qty': buyQty},
        success: function(data){
            $("#goodprice").html(data)
        },
        error: function(){
            console.log('error')
        }
    })
}

$(function(){
    init();
    get_other_supps(buyQty, partno, supplier);
    if(allPrice != '[]')
    {
      if(stockQty>0 && stockQty > $.parseJSON(allPrice)[0]['quantity']){
          buyQtyInput.change(function(){
              buyQty = parseInt($(this).val())
              delicityVal = delicity.filter(":checked").val();
              update_info(buyQty, delicityVal);
              $("#goodprice_qty").text(buyQty);
              get_other_supps(buyQty, partno, supplier)
          });
          delicity.change(function(){
              update_info(buyQty, $(this).val());
          })
          downBtn.click(function(){
              buyQty = parseInt(buyQtyInput.val());
              delicityVal = delicity.filter(":checked").val();
              update_info(buyQty, delicityVal);
          })
          upBtn.click(function(){
              buyQty = parseInt(buyQtyInput.val());
              delicityVal = delicity.filter(":checked").val();
              update_info(buyQty, delicityVal);
          })
      }
    }
    else{
        unitPrice.text('0.0');
        totalPrice.text('0.0');
        buyQtyInput.attr('disabled', 'disabled')
    }
    $("#buy_btn").click(function(){
        var qqHerf = $("#server").next('ul').find('a').eq(0).attr('href');
        window.open(qqHerf);
    })
})
