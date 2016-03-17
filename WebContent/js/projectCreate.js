$(document).ready(function(){
	$("#project-create-post").click(function(){
		$.post(getRootPath() + "/jsp/doCreateProject.jsp", {
			"username" : $("#username").val(),
			"password" : $("#password").val()
		}, function(data, status, xhr) {
			alert("注册成功！");
			location.reload();
		}).error(function(data, status, e) {
			$("#check-status").html("<font color='red'>用户名已存在或密码为空</font>");
		})
	})
})