  $(document).ready(function(){
    $(".text").click(function(){
      location.href =getRootPath()+"/html/project/project.jsp?id="+$(this).parent().attr("id");
    })
  })

