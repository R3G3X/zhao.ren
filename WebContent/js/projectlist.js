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
    function Search(){
        var loc ="projectlist.jsp?pages=1&s="+$('#search-box-input').val();
        location.href = encodeURI(encodeURI(loc));
    }
})
