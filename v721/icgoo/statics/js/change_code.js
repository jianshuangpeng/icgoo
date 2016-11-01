var n = 0,rotate;
$('#js-captcha-refresh').click(function(){
    var noCache = Date(); //解决IE对getJSON的缓存
    $.getJSON('/captcha/captcha-refresh/',{"noCache":noCache},function(data) {
        $('#captcha_img').attr("src",data.image_url);
        $('#id_captcha_0').attr("value",data.key);
    })
    return false;
});
//小图标旋转
$('#js-captcha-refresh').on('click',function(){
    clearInterval(rotate)
    rotate = setInterval("change_deg()",10);
});
function change_deg(){
  n+=10;
  $('#js-captcha-refresh img').css({'transform':'rotate('+n+'deg)','-ms-transform':'rotate('+n+'deg)','-webkit-transform':'rotate('+n+'deg)','-moz-transform':'rotate('+n+'deg)'});
  if(n == 180)
  {
    clearInterval(rotate);
    n = 0;
  }
}
