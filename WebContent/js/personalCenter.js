/*
* @Author: Ed_Strickland
* @Date:   2016-03-20 20:56:16
* @Last Modified by:   Ed_Strickland
* @Last Modified time: 2016-03-20 23:41:54
*/

$(document).ready(function() {
  var count = 0;
  var n = 0;
  for(var i = 0; i < $(".label").length - 1; i ++){
    count=count+1;
    count = count*10;
  }
  count = count/10;
  $("#info-save").click(function() {
    //alert(count);
    $.post(getRootPath() + "/jsp/doSaveInfo.jsp", {
      "username" : $("#username-change").val(),
      "pre-pass" : $("#pre-password-change").val(),
      "now-pass" : $("#now-password-change").val(),
      "name" : $("#name-change").val(),
      "describe" : $("#describe-change").val(),
      "phone" : $("#phone-change").val(),
      "mail" : $("#mail-change").val(),
      "major" : $("#major-change").val(),
      "tech-info":$("#tech-info-change").val(),
    }, function(data, status, xhr) {
      alert("修改成功");
      location.reload();
    }).error(function(data, status, e) {
    	alert("修改失败！可能的原因\n用户名重复\n密码错误\n数据不合法");
    })
  })
  $(".label").click(function(){
    if (n == 0)
      return ;
    // alert("a");
    if($(this).attr("id")=="0"){
      // alert("b");
      $(this).removeClass("label-default").addClass("label-primary").attr("id","1");
      count += Number($(this).parent().attr("id"));
    }else{
      // alert("a");
      $(this).removeClass("label-primary").addClass("label-default").attr("id","0");
      count -= Number($(this).parent().attr("id"));
    }
  })
  $("#info-change").click(function(){
    $("#target").addClass("pass")
    $("#info-save").removeClass("hidden");
    $("#info-change").addClass("hidden");
    $(".personal-center-right-item-right").removeClass("hidden");
    $("#username-change").val($("#username-info").text());
    $("#name-change").val($("#name").text());
    $("#describe-change").val($("#describe").text());
    $("#phone-change").val($("#phone").text());
    $("#mail-change").val($("#mail").text());
    $("#major-change").val($("#major").text());
    $("#tech-info-change").val($("#tech-info").text());
    $("#pre-password-change").val("");
    $("#now-password-change").val("");
    n = 1;
  })
})
