/*
* @Author: Ed_Strickland
* @Date:   2015-10-22 08:45:08
* @Last Modified by:   Ed_Strickland
* @Last Modified time: 2016-02-18 12:20:18
*/
function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
}

$(document).ready(function(){
    //登陆状态判断
    var username=$.cookie("zhao_ren_token");
    if (username != null && username != ""){
        $("#login").addClass("hidden");
        $(".dropdown").removeClass("hidden").text(username);
        $("#avatar").removeClass("hidden");
        if(username == "admin"){
            $("#manage").removeClass("hidden");
        }
    }
    $("#login-submit").attr("disabled",true);
    // $("#project-add > a").click(function(){
    //         // alert(" ");
    //         $("#page-add").css("display", "block")
    // })
    // $("#page-add > a").click(function(){
    //         // alert(" ");
    //         $("#page-add").css("display", "none")
    // })

// LOGIN-CHECK
    $("#password").on('input',function(){
        $("#user-check").html("");
        if($("#password").val().length!=0){
            $("#login-submit").removeAttr("disabled");
        }
    })
    $("#username").on('input',function(){
            $("#pass-check").html("");
        if($("#username").val().length!=0){
            $("#user-login").removeAttr("disabled");
        }
    })

// LOGIN-POST
    
    function loginPost(){
    	if($("#username").val().length==0){
            $("#check-status").html("<font color='red'>用户名为空</font>");
            $("#user-login").attr("disabled",true);
            return;
        }
    	if($("#password").val().length==0){
            $("#check-status").html("<font color='red'>密码为空</font>");
            $("#user-login").attr("disabled",true);
        }
    	$.post(getRootPath()+"/jsp/doLogin.jsp",
                {"username":$("#username").val(),
                "password":$("#password").val()},
                function(data, status, xhr){
                    //alert("成功登陆");
                    $("#check-status").html("");
                    $("#login").addClass("hidden");
                    $(".dropdown").removeClass("hidden");
                    $("#avatar").removeClass("hidden");
                    // alert("a");
                    //$.cookie("userid",$("#username").val(),{expire:60*60,path:"/"});
                    $("#password").val("");
                    $("#username").val("");
                    loginId();
                    location.reload();
                })
            .error(function(data,status,e){
            	$("#check-status").html("<font color='red'>用户名或密码错误</font>");
            })
    }

    $('#modal-login').keydown(function(e){
		if(e.keyCode==13){
		   loginPost();
		   alert("asdf")
		}
	}); 
    
    $("#login-submit").click(function(){
        // alert("a");
    	loginPost();
    })

    // $("#change-save").click(function(){
    //             function(data){
    //                 if (data==1){
    //                     alert("0");
    //                 }$.post("hellof.jsp",
    //             {"project-name":$("#project-name").val(),
    //             "founder-name":$("#founder-name").val(),
    //             "brief":$("#brief").val()},
    //                 else{
    //                     alert("0");
	//                 }
	//             })
	// })

	$("#exit").click(function() {
		$.post(getRootPath()+"/jsp/doLogOut.jsp", function(data, status, xhr) {
			alert("登出成功");
		})
		$(".dropdown").addClass("hidden");
		$("#avatar").addClass("hidden");
		$("#login").removeClass("hidden");
		location.reload();
	})
})
