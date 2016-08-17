/*
 * @Author: Ed_Strickland
 * @Date:   2016-01-06 00:39:17
 * @Last Modified by:   Ed_Strickland
 * @Last Modified time: 2016-01-07 07:53:37
 */

$(document).ready(function() {
	$("#register-submitR").click(function() {
		var username = $("#usernameR").val();
		var password = $("#passwordR").val();
		var passcheck = $("#pass-confirmR").val();
		var email = $("#emailR").val();
		if(username == "" || username == null || password == "" || password == null || passcheck == "" || passcheck == null || email == "" || email == null){
			$("#check-statusR").html("<font color='red'>关键信息为空</font>");
			return;
		}if (password != passcheck){
			$("#check-statusR").html("<font color='red'>密码输入不一致</font>");
			return;
		}
		var reg = /^(\w)+@(\w)+((\.\w+)+)$/;
  		var r = email.match(reg);
		if(r==null) {
			$("#check-statusR").html("<font color='red'>邮箱格式不正确</font>");
		return;
		}
		$.post(getRootPath() + "/jsp/doRegister.jsp", {
			"username" : username,
			"password" : password,
			"email" : email
		}, function(data, status, xhr) {
			alert("注册成功！");
			$.post(getRootPath() + "/jsp/doValidateMail.jsp", {
				"username" : username,
				"password" : pawssword,
				"email" : email
			},function(data,status, xhr){
				alert("请查收验证邮件");
			}).error(function(){
				alert("邮箱信息错误！");
			})
		}).error(function(data, status, e) {
			$("#check-statusR").html("<font color='red'>用户名已存在或密码为空</font>");
			return;
		})
	})
})
