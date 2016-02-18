/*
* @Author: Ed_Strickland
* @Date:   2015-10-22 08:45:08
* @Last Modified by:   Ed_Strickland
* @Last Modified time: 2016-02-18 12:20:18
*/

$(document).ready(function(){
    //登陆状态判断
    loginId();
    var username=$.cookie("userid");
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
        if($("#username").val().length==0){
            $("#check-status").html("<font color='red'>用户名不能为空</font>");
            $("#user-login").attr("disabled",true);
        }
        else{
            $("#user-check").html("");
            if($("#password").val().length!=0){
                $("#login-submit").removeAttr("disabled");
            }
        }
    })
    $("#username").on('input',function(){
        if($("#password").val().length==0){
            $("#check-status").html("<font color='red'>密码不能为空</font>");
            $("#user-login").attr("disabled",true);
        }
        else{
            $("#pass-check").html("");
            if($("#username").val().length!=0){
                $("#user-login").removeAttr("disabled");
            }
        }
    })

// LOGIN-POST
    $("#login-submit").click(function(){
        // alert("a");
        $.post("jsp/login.jsp",
            {"username":$("#username").val(),
            "password":$("#password").val()},
            function(data, status, xhr){
                alert("成功登陆");
                $("#check-status").html("");
                $("#login").addClass("hidden");
                $(".dropdown").removeClass("hidden");
                $("#avatar").removeClass("hidden");
                // alert("a");
                $.cookie("userid",$("#username").val(),{expire:60*60,path:"/"});
                $("#password").val("");
                $("#username").val("");
                loginId();
                location.reload();
            })
        .error(function(data,status,e){
            if(data.status == 400){
                $("#check-status").html("<font color='red'>密码错误</font>");
            }
            else if(data.status == 401){
                $("#check-status").html("<font color='red'>用户名不存在</font>");
            }
        })
    })

    function loginId(){
        var userid=$.cookie("userid");
        // alert(userid);
    }


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

    $("#exit").click(function(){
            // alert("b");
            $(".dropdown").addClass("hidden");
            $("#avatar").addClass("hidden");
            $("#login").removeClass("hidden");
            $.cookie("userid","",{path:"/"});
            location.reload();
    })
})
