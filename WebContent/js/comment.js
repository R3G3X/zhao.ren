 $(document).ready(function(){
  var a = $(".project-comment-img");
  a.outerHeight(a.next().outerHeight());
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
	        	alert("评论失败！可能的原因\n评论过短\n没有登录");
	        })
 	})
 })
