$(document).ready(function() {
	$("#project-create-post").click(function() {
		$("#check-project-status").html("<font color='red'>添加中...</font>");
		$.post(getRootPath() + "/jsp/doCreateProject.jsp", {
			"name" : $("#projectname").val(),
			"num" : $("#projectMenRequired").val(),
			"time" : $("#projectDevelopTime").val(),
			"intro" : $("#projectDescribe").val(),
			"detail" : $("#projectDescribeInDetails").val(),
		}, function(data, status, xhr) {
			alert("添加成功");
			location.reload();
		}).error(function(data, status, e) {
			$("#check-project-status").html("<font color='red'>添加失败！请检查信息是否有误</font>");
		})
	})
})