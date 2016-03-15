/*
* @Author: Ed_Strickland
* @Date:   2016-01-06 16:51:08
* @Last Modified by:   Ed_Strickland
* @Last Modified time: 2016-01-06 16:55:44
*/
  $(document).ready(function(){
    $(".text").click(function(){
      location.href ="html/project/project.jsp?courseId="+$(this).children("input").val();
    })
    $(".select-btn").click(function(){
      $("#target-course").val($(this).parent().prev().children("input").val());
      // alert($("#target-course").val());
      var title = "为"+ $(this).parent().prev().children("h3").text() +"投票";
      $("#vote-border").children("h3").text(title);
     })
   })

