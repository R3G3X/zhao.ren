/*
* @Author: Ed_Strickland
* @Date:   2016-01-06 00:39:17
* @Last Modified by:   Ed_Strickland
* @Last Modified time: 2016-02-18 11:23:32
*/

$(document).ready(function(){
    $("#btn-for").click(function(){
      //登陆状态判断
        loginId();
        var username=$.cookie("userid");
        if (username != null && username != ""){
          $.post("../../jsp/vote.jsp",
                {"postStatus":"0",
                "username":username,
                  "courseId":$("#target-course").val()},
                function(data, status, xhr){
                  // alert("");
                  location.reload();
                })
          .error(function(data,status,e){
              if(data.status == 403){
                  alert("您已投过票")；
            }
          })
          return;
        }
        alert("请登陆");
    })
    $("#btn-post").click(function(){
      //登陆状态判断
        loginId();
        var username=$.cookie("userid");
        if(!confirm("你确定提交吗？"))
          return;
        if (username != null && username != ""){
            $.post("../../jsp/vote.jsp",
                  {"postStatus":"1",
                "username":username,
                  "courseId":$("#target-course").val()},
                  function(data, status, xhr){
                    // alert("成功评价");
                    location.reload();
                  })
            .error(function(data,status,e){
              if(data.status == 403){
                  alert("您已投过票")；
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
