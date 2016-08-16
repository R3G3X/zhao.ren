  $(document).ready(function(){
    $(".text").click(function(){
      location.href ="/html/project/project.jsp?id="+$(this).parent().attr("id");
    })
  })

