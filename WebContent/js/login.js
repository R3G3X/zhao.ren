/*
* @Author: Ed_Strickland
* @Date:   2015-10-22 08:45:08
* @Last Modified by:   Ed_Strickland
* @Last Modified time: 2016-03-19 20:28:41
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
        $("#logout").removeClass("hidden");
        $("#user").removeClass("hidden");
        $("#personal-center-btn").removeClass("hidden");
        $("#avatar").removeClass("hidden");
        $("#project-add-btn").removeClass("hidden");
        $("#user-btn").removeClass("hidden");
        
    }
    $("#login-submit").attr("disabled",true);
    
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
//                    $("#login").addClass("hidden");
//                    $("#logout").removeClass("hidden");
//                    $("#user").removeClass("hidden");
//                    $("#personal-center-btn").removeClass("hidden");
//                    $("#avatar").removeClass("hidden");
//                    $("#project-add-btn").removeClass("hidden");
//                    $("#password").val("");
//                    $("#username").val("");
                    location.reload();
                })
            .error(function(data,status,e){
                $("#check-status").html("<font color='red'>登陆失败</font>");
            })
    }

    function goTo(a){
        var loc = encodeURIComponent(encodeURIComponent(a));
            loc =getRootPath()+"/html/projectlist/projectlist.jsp?pages=1&s="+loc;
            loc = loc +"&method=visits,id&crew=1000&cycle=1001";
        document.location = loc;
    }
    function goToCycle(a){
        var loc =getRootPath()+"/html/projectlist/projectlist.jsp?pages=1&s=";
        loc = loc +"&method=visits,id&crew=1000&cycle="+a;
        document.location = loc;
    }
    function goToCrew(a){
        var loc =getRootPath()+"/html/projectlist/projectlist.jsp?pages=1&s=";
        loc = loc +"&method=visits,id&crew="+a+"&cycle=1001";
        document.location = loc;
    }

    $('#modal-login').keydown(function(e){
        if(e.keyCode==13){
           loginPost();
        }
    });

    $("#login-submit").click(function(){
        // alert("a");
        loginPost();
    })


    $("#logout").click(function() {
        $.post(getRootPath()+"/jsp/doLogOut.jsp", function(data, status, xhr) {
            alert("登出成功");
        })
        $("#login").removeClass("hidden");
        $("#logout").addClass("hidden");
        $("#user").addClass("hidden");
        $("#personal-center-btn").addClass("hidden");
        $("#avatar").addClass("hidden");
        $("#project-add-btn").addClass("hidden");
        location.reload();
    })

    $(".select-type-list-item").hover(function(){
        $(this).children(".select-type-secondary-list").removeClass("hidden");
    },function(){
        $(this).children(".select-type-secondary-list").addClass("hidden");
    })

    $("#project-search").keydown(function(e){
        if(e.keyCode==13){
            goTo($("#project-search").val());
        }
    })

    $("#project-list-btn").click(function(){
        goTo($("#project-search").val());
    })
    $(".select-type-secondary-list-item").click(function(){
        var parent_id = $(this).parent().attr("id");
        if(parent_id == "cycle"){
            goToCycle($(this).children().text());
        }else if(parent_id == "crew"){
            goToCrew($(this).children().text());
        }else{
            goTo($(this).children().text());
        }
    })
    $("#message").click(function(){
        $(this).focus();
    })
})

var rDrag = {
    o:null,
    init:function(o){
        o.onmousedown = this.start;
    },
    start:function(e){
        var o;
        e = rDrag.fixEvent(e);
               e.preventDefault && e.preventDefault();
               rDrag.o = o = this;
        o.x = e.clientX - rDrag.o.offsetLeft;
                o.y = e.clientY - rDrag.o.offsetTop;
        document.onmousemove = rDrag.move;
        document.onmouseup = rDrag.end;
    },
    move:function(e){
        e = rDrag.fixEvent(e);
        var oLeft,oTop;
        oLeft = e.clientX - rDrag.o.x;
        oTop = e.clientY - rDrag.o.y;
        rDrag.o.style.left = oLeft + 'px';
        rDrag.o.style.top = oTop + 'px';
    },
    end:function(e){
        e = rDrag.fixEvent(e);
        rDrag.o = document.onmousemove = document.onmouseup = null;
    },
    fixEvent: function(e){
        if (!e) {
            e = window.event;
            e.target = e.srcElement;
            e.layerX = e.offsetX;
            e.layerY = e.offsetY;
        }
        return e;
    }
}
window.onload = function(){
        var obj = document.getElementById('chatroom');
    rDrag.init(obj);
}