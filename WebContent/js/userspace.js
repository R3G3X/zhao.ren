$(document).ready(function(){
    var pages = 1;
    $.post(getRootPath() + "/jsp/user_space.jsp", {
            "page" : 1,
            "id" : $("#userID").val()
        }, function(data, status, xhr) {
            $("#recent-move").html($("#recent-move").html()+data);
        }
    ).error(function(){
        //alert("错误！");
    })

    $(document).scroll(function(){
        if($(window).scrollTop() == $(document).height() - $(window).height()){
            $("#scroll-target").css("visibility","visible");
            pages ++;
            $.post(getRootPath() + "/jsp/user_space.jsp", {
                    "page" : pages,
                    "id" : $("#userID").val()
                }, function(data, status, xhr) {
                    $("#recent-move").html($("#recent-move").html()+data);
                    $("#scroll-target").css("visibility","hidden");
                }
            )
            .error(function(){
                $("#scroll-target").children("img").remove();
                $("#scroll-target").children("p").text("—————— 底部分割线 ——————");
            })
        }
    })
})