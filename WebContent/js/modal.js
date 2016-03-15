$(document).ready(function(){
	$("#registerBtn").click(function(){
		$("#login-header").text("注册到ZHAO.REN");
		$("#login-submit").text("注册").attr("id","register-submit");
		$("#registerBtn").attr("id","loginBtn").text("我有账号？");
		$("#check-status").html("");
		$("#username").attr("id","usernameR");
		$("#password").attr("id","passwordR");
	})
	
	$("#loginBtn").click(function(){
		$("#login-header").text("登录到ZHAO.REN");
		$("#login-submit").text("登录").attr("id","login-submit");
		$("#loginBtn").attr("id","registerBtn").text("没有账号？");
		$("#usernameR").attr("id","username");
		$("#passwordR").attr("id","password");
	})
})