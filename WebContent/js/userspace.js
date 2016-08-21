$(document).ready(function(){
    var pages = 1;
    $("#switch").click(function(){
        pages ++;
        $.post(getRootPath() + "/jsp/user_space.jsp", {
            "page" : pages
            }, function(data, status, xhr) {
                alert(data);
            }
        )
        .error(function(){
            alert("错误！");
        })
    })
})