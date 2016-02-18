/*
* @Author: Ed_Strickland
* @Date:   2016-01-06 00:39:17
* @Last Modified by:   Ed_Strickland
* @Last Modified time: 2016-01-07 07:23:43
*/

$(document).ready(function(){
    $("#comment-submit").click(function(){
      //登陆状态判断
        loginId();
        var username=$.cookie("userid");
        var d = new Date();
        var vYear = d.getFullYear();
        var vMon = d.getMonth() + 1;
        var vDay = d.getDate();
        var time = vYear+"-"+(parseInt(vMon)<10?"0"+vMon:vMon)+"-"+(parseInt(vDay)<10?"0"+vDay:vDay);
        if (username != null && username != ""){
          $.post("../../jsp/comment.jsp",
                {"classId":$("#courseId").val(),
                  "comment":$("#comment-context").val(),
                  "username":username,
                  "time":time},
                function(data, status, xhr){
                    location.reload();
                })
          .error(function(data,status,e){
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
