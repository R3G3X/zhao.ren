/*
* @Author: Ed_Strickland
* @Date:   2016-01-06 00:39:17
* @Last Modified by:   Ed_Strickland
* @Last Modified time: 2016-01-07 07:16:39
*/

$(document).ready(function(){
    $(".delete-btn").click(function(){
      //登陆状态判断
        if(!confirm("你确定提交吗？"))
          return;
        var d = new Date();
        var vYear = d.getFullYear();
        var vMon = d.getMonth() + 1;
        var vDay = d.getDate();
        var time = vYear+"-"+(parseInt(vMon)<10?"0"+vMon:vMon)+"-"+(parseInt(vDay)<10?"0"+vDay:vDay);
        $.post("../../jsp/delete.jsp",
              {"className":$(this).parent().prev().children("h3").text()},
              function(data, status, xhr){
                  location.reload();
              })
        .error(function(data,status,e){
        })
    })
})

function loginId(){
    var userid=$.cookie("userid");
    // alert(userid);
}
