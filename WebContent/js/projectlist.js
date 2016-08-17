$(document).ready(function(){
	$(".project-list-info").click(function(){
		location.href ="../../html/project/project.jsp?id="+$(this).parent().attr("id");
	})
  $("#search-box-btn").click(function(){
    Search();
  })
  $('#search-box-input').keydown(function(e){
      if(e.keyCode==13){
         Search();

      }
  });
  $(".sort-list-item").click(function(){
    $(this).parent().children(".sort-list-item-active").removeClass("sort-list-item-active");
    $(this).addClass("sort-list-item-active");
    Search();
  })
  function Search(){
  	var loc = encodeURIComponent(encodeURIComponent($('#search-box-input').val()));
    var method = $("#method>.sort-list-item-active").attr("id");
    var crew = $("#crew>.sort-list-item-active").attr("id");
    var cycle = $("#cycle>.sort-list-item-active").attr("id");
    var loc ="projectlist.jsp?pages=1&s="+loc+"&method="+method+"&crew="+crew+"&cycle="+cycle;
    location.href = loc;
  }
})
