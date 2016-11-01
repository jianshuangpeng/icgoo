$(function(){
    showMessage();
    $("#demo").val('');

    //点击搜索按钮开始搜索.
    $('.btn_smt').click(function(){
      var value = $('input[name="partnoitem"]').val()
      if(value == '请输入产品型号'){
        $('input[name="partnoitem"]').val('');
      }
    });

  //型号输入框获得焦点后显示提醒数据
  $("#partno").focus(function(){
    if($(this).val() != ''){
      $(".marchDiv").show();
    }
  });

  //点击marchDiv区域之外隐藏该div
  $(document).bind("click",function(e){
    var target = $(e.target);
    if(target.closest(".marchDiv").length == 0 && target.closest("#partno").length == 0){
      $(".marchDiv").hide();
    }
    if($('.marchDiv ul li').length == 1){
      $("#partno").val($('.marchDiv ul li:first').text());
    }
  })
});

//选中提醒列表中的值后开始查询
function partnoSearch(obj){
  var text = $(obj).text().trim();
  $("#partno").val(text);
  $(".marchDiv").hide();
}

//进入界面时初始化分页显示
function initPage(contract){
    var str = '',
        contract = arguments[0] ? arguments[0] : false; //contract默认值为false，这里不同于其它语言的函数默认值
    if(pagecount == 0){
      return
    }
    if(pagecount <= 3){
          if(currentpage == 1){
              str += '<div class="pagecommon preventpage lb" onclick="preventpage(this,'+contract+')"></div>'
          }else{
              str += '<div class="pagecommon preventpage lh" onclick="preventpage(this,'+contract+')"></div>'
          }
              +  '<div class="numdiv">'
                  for(var i=1;i<=pagecount;i++){
                    if(i == currentpage){
              str +=      '<div class="pagecommon currentpage" onclick="numpage(this,'+contract+')">'+i+'</div>'
                  }else{
              str +=     '<div class="pagecommon" onclick="numpage(this,'+contract+')">'+i+'</div>'
                  }
                }
              +  '</div>'
          if(currentpage == pagecount){
              str +=   '<div class="pagecommon nextpage rb" onclick="nextpage(this,'+contract+')"></div>'
          }else{
              str +=   '<div class="pagecommon nextpage rh" onclick="nextpage(this,'+contract+')"></div>'
          }
    }else{
      if(currentpage == 1){
        str += '<div class="pagecommon preventpage lb" onclick="preventpage(this,'+contract+')"></div>'
            +  '<div class="numdiv">'
            +  '<div class="pagecommon currentpage" onclick="numpage(this,'+contract+')">1</div>'
            +  '<div class="pagecommon" onclick="numpage(this,'+contract+')">2</div>'
            +  '<div class="pagecommon" onclick="numpage(this,'+contract+')">3</div>'
            +  '</div>'
            if(currentpage == pagecount){
              str +=  '<div class="pagecommon nextpage rb" onclick="nextpage(this,'+contract+')"></div>'
            }else{
              str +=  '<div class="pagecommon nextpage rh" onclick="nextpage(this,'+contract+')"></div>'
            }
      }else if(currentpage == pagecount){
        str += '<div class="pagecommon preventpage lh" onclick="preventpage(this,'+contract+')"></div>'
            +  '<div class="numdiv">'
            +  '<div class="pagecommon" onclick="numpage(this,'+contract+')">'+(currentpage-2)+'</div>'
            +  '<div class="pagecommon" onclick="numpage(this,'+contract+')">'+(currentpage-1)+'</div>'
            +  '<div class="pagecommon currentpage" onclick="numpage(this,'+contract+')">'+currentpage+'</div>'
            +  '</div>'
            +  '<div class="pagecommon nextpage rb" onclick="nextpage(this,'+contract+')"></div>'
      }else{
          str += '<div class="pagecommon preventpage lh" onclick="preventpage(this,'+contract+')"></div>'
              +  '<div class="numdiv">'
              +  '<div class="pagecommon" onclick="numpage(this,'+contract+')">'+(currentpage-1)+'</div>'
              +  '<div class="pagecommon currentpage" onclick="numpage(this,'+contract+')">'+currentpage+'</div>'
              +  '<div class="pagecommon" onclick="numpage(this,'+contract+')">'+(currentpage+1)+'</div>'
              +  '</div>'
              +  '<div class="pagecommon nextpage rh" onclick="nextpage(this,'+contract+')"></div>'
      }
    }
    $(".pagewrap").html(str);
}

//点击数字后根据数字进行分页
function numpage(obj,contract){
  $(obj).addClass('currentpage').siblings().removeClass('currentpage');
  currentpage = $(obj).text();
  if(currentpage == 1){
    $('.preventpage').removeClass('lh').addClass('lb');
  }else{
    $('.preventpage').removeClass('lb').addClass('lh');
  }
  if(currentpage == pagecount){
    $('.nextpage').removeClass('rh').addClass('rb');
  }else{
    $('.nextpage').removeClass('rb').addClass('rh');
  }
  showMessage();
  if(contract)
  {
      about_contract(); //如果带有“合同相关”，准备“合同相关”部分的事件
  }
}

//显示前一页数据
function preventpage(obj,contract){
  if(currentpage > 1){
    currentpage --;
    initPage();
  }else{
    return;
  }
  showMessage();
  if(contract)
  {
      about_contract();
  }
}
//显示下一页数据
function nextpage(obj,contract){
  if(currentpage == pagecount){
    return;
  }else{
    currentpage ++;
    initPage();
  }
  showMessage();
  if(contract)
  {
      about_contract();
  }
}
