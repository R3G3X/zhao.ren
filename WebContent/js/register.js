/*
 * @Author: Ed_Strickland
 * @Date:   2016-01-06 00:39:17
 * @Last Modified by:   Ed_Strickland
 * @Last Modified time: 2016-01-07 07:53:37
 */

$(document).ready(function() {
	$("#register-submit").click(function() {
		$.post(getRootPath() + "/jsp/doRegister.jsp", {
			"username" : $("#username").val(),
			"password" : $("#password").val()
		}, function(data, status, xhr) {
			alert("注册成功！");
			location.reload();
		}).error(function(data, status, e) {
			$("#check-status").html("<font color='red'>用户名已存在或密码为空</font>");
		})
		return;
	})
})
