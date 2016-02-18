/*
* @Author: Ed_Strickland
* @Date:   2016-01-06 00:39:17
* @Last Modified by:   Ed_Strickland
* @Last Modified time: 2016-01-07 19:43:11
*/

$(document).ready(function(){
    $(".ag-btn").click(function(){
      //登陆状态判断
        loginId();
        var username=$.cookie("userid");
        if (username != null && username != ""){
          $("#target-comment").val($(this).parent().children("input:eq(2)").index("input"));
          $.post("../../jsp/agree.jsp",
                {"postStatus":"0",
                  "commentId":$(this).parent().children("input:eq(0)").val()},
                function(data, status, xhr){
                  var a = parseInt($("input:eq("+$("#target-comment").val()+")").val())+1;
                  $("input:eq("+$("#target-comment").val()+")").val(a);
                  var b = $("#target-comment").val();
                  $("input").eq($("#target-comment").val()).parent().children("a:eq(1)").text("赞("+$("input").eq($("#target-comment").val()).val()+")");
                })
          .error(function(data,status,e){
              // if(data.status == 400){
              //     $("#check-status").html("<font color='red'>密码错误</font>");
              // }
              // else if(data.status == 401){
              //     $("#check-status").html("<font color='red'>用户名不存在</font>");
              // }
          })
          return;
        }
        alert("请登陆");
    })
    $(".da-btn").click(function(){
      //登陆状态判断
        loginId();
        var username=$.cookie("userid");
        if (username != null && username != ""){
            $("#target-comment").val($(this).parent().children("input:eq(1)").index("input"));
            $.post("../../jsp/agree.jsp",
                {"postStatus":"1",
                  "commentId":$(this).parent().children("input:eq(0)").val()},
                function(data, status, xhr){
                  var a = parseInt($("input:eq("+$("#target-comment").val()+")").val())+1;
                  $("input:eq("+$("#target-comment").val()+")").val(a);
                  var b = $("#target-comment").val();
                  $("input").eq($("#target-comment").val()).parent().children("a:eq(0)").text("踩("+$("input").eq($("#target-comment").val()).val()+")");
                })
            .error(function(data,status,e){
            if(data.status == 400){
                alert("a");
            }
            else if(data.status == 401){
                alert("b");
            }
            })
            return;
        }
        alert("请登陆");
    })
})

function loginId(){
    var userid=$.cookie("userid");
    // alert(userid);
}
