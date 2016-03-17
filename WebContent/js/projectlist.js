$(document).ready(function(){
	$(".project-list-info").click(function(){
		location.href ="../../html/project/project.jsp?id="+$(this).parent().attr("id");
	})
})