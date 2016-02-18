/*
* @Author: Ed_Strickland
* @Date:   2016-01-06 00:39:17
* @Last Modified by:   Ed_Strickland
* @Last Modified time: 2016-01-07 07:16:00
*/

$(document).ready(function(){
    $("#course-submit").click(function(){
      //登陆状态判断
          $.post("../../jsp/add.jsp",
                {"className":$("#class-submit").val(),
                  "teacherName":$("#teacher-submit").val(),
                  "describe":$("#describe-submit").val()},
                function(data, status, xhr){
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
