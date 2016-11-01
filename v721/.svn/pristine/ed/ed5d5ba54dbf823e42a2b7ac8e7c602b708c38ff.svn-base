/**
 * Created by hzz on 15-11-20.
 */

var num = 0;
var len = $("#big > li").length;//获取图片的数量
//图片全部载入的时候,显示图片的容器
$("#big img").load(function(){
    num++;
    if(num == len){
        $("#big").show();
    }
});

$("#big li.active").show();//第一张图片显示

$("#icon a").click(function(){
    var index = $(this).attr('index');
    if (this.className.indexOf("active")!=-1) return;//如果改按钮的class="active",跳出函数
    $(this).siblings('li').removeClass('active');
    $(this).addClass('active');
    $("#big li.active").fadeOut().removeClass('active');//隐藏之前的轮播图
    $("#big li[index=" + index + "]").addClass('active').stop().fadeTo(100,1.0);//显示小按钮对应的大图
    $("#icon a[index=" + index + "]").siblings().removeClass('active');//还原之前的小按钮的样式
    $("#icon a[index=" + index + "]").addClass('active');//添加点击的小按钮的样式
});


var i = 1;
show();
function show(){
    var len = $("#icon a").length;//小按钮的数量
    if(i > len) i=1;
    //触发i对应的小按钮的单击时间
    $("#icon a").each(function(){
        if($(this).attr('index') == i){
            $(this).click();
        }
    });
    i++;
    setTimeout(show, 3000);
}
