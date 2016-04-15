 $(document).ready(function(){
 	$(".project-comment-content-reply").click(function(){
 		$("#project-comment-reply-content>textarea").val("回复"+$(this).attr("id")+"楼:");
 	})
 	$("#project-comment-reply-btn>a").click(function(){
 		$.post("../../jsp/doCreateComment.jsp",
                {"msg":$("#project-comment-reply-content>textarea").val(),
                "pid":$("#pid").val()},
                function(data, status, xhr){
                	alert("评论成功！");
                    location.reload();
                })
	        .error(function(data,status,e){
	        	alert("请先登录！");
	        })
 	})
 })