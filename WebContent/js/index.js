  $(document).ready(function(){
    $(".text").click(function(){
      location.href ="html/project/project.jsp?id="+$(this).parent().attr("id");
    })
    $(".select-btn").click(function(){
      $("#target-course").val($(this).parent().prev().children("input").val());
      // alert($("#target-course").val());
      var title = "为"+ $(this).parent().prev().children("h3").text() +"投票";
      $("#vote-border").children("h3").text(title);
     })
   })

