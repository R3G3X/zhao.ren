$(document).ready(function() {
	var count = 0;
	$(".project-create-post").click(function() {
		$("#check-project-status").html("<font color='red'>添加中...</font>");
		$.post(getRootPath() + "/jsp/doCreateProject.jsp", {
			"name" : $("#projectname").val(),
			"num" : $("#projectMenRequired").val(),
			"time" : $("#projectDevelopTime").val(),
			"intro" : $("#projectDescribe").val(),
			"detail" : $("#projectDescribeInDetails").val(),
		}, function(data, status, xhr) {
			alert("添加成功");
			location.href="../user/personalCenter-project.jsp";
		}).error(function(data, status, e) {
			$("#check-project-status").html("<font color='red'>添加失败！请检查信息是否有误</font>");
		})
	})
	$(".project-save-post").click(function() {
		$("#check-project-status").html("<font color='red'>添加中...</font>");
		$.post(getRootPath() + "/jsp/doEditProject.jsp", {
			"pid" : id,
			"name" : $("#projectname").val(),
			"num" : $("#projectMenRequired").val(),
			"time" : $("#projectDevelopTime").val(),
			"intro" : $("#projectDescribe").val(),
			"detail" : $("#projectDescribeInDetails").val(),
		}, function(data, status, xhr) {
			alert("修改成功");
			location.href="../user/personalCenter-project.jsp";
		}).error(function(data, status, e) {
			$("#check-project-status").html("<font color='red'>修改失败！请检查信息是否有误</font>");
		})
	})
	$(".lable").click(function(){
		if($(this).attr("id")=="0"){
			$(this).removeClass("label-default").addClass("label-primary").attr("id","1");
			count += Number($(this).parent().attr("id"));
		}else{
			$(this).removeClass("label-primary").addClass("label-default").attr("id","0");
			count -= Number($(this).parent().attr("id"));
		}
	})
})
