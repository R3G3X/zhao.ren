$(document).ready(function(){
	
	$("#login-btn2").click(function(){
		$("#modal-login2").load();
	})
	
	
	$("#registerBtn").click(function(){
		// $("#login-header").addClass("hidden");
		// $("#register-header").removeClass("hidden");
		// $("#login-submit").addClass("hidden");
		// $("#register-submit").removeClass("hidden");
		// $("#registerBtn").addClass("hidden");
		// $("#loginBtn").removeClass("hidden");
		// $("#check-status").html("");
		location.href=getRootPath()+"/register.jsp";
	})
	$("#loginBtn").click(function(){
		$("#login-header").removeClass("hidden");
		$("#register-header").addClass("hidden");
		$("#login-submit").removeClass("hidden");
		$("#register-submit").addClass("hidden");
		$("#registerBtn").removeClass("hidden");
		$("#loginBtn").addClass("hidden");
		$("#check-status").html("");
	})
	$("#modal-login").on("hidden.bs.modal",function(e){
		$("#username").val("");
		$("#password").val("");
		$("#user-check").html("");
		$("#check-status").html("");
	});
})