/*
* @Author: Ed_Strickland
* @Date:   2016-01-06 00:39:17
* @Last Modified by:   Ed_Strickland
* @Last Modified time: 2016-01-07 07:53:37
*/


$(document).ready(function(){
    $("#register-submit").click(function(){
      $.post("jsp/register.jsp",
            {"username":$("#username1").val(),
              "password":$("#password1").val()},
            function(data, status, xhr){
                alert("注册成功！");
                $.cookie("userid",$("#username1").val(),{expire:60*60,path:"/"});
                location.reload();
            })
      .error(function(data,status,e){
      })
      return;
    })
})

function loginId(){
    var userid=$.cookie("userid");
    // alert(userid);
}
