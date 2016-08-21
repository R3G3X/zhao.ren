$(document).ready(function () {
    var pages = 1;
    $("#switch").click(function () {
        $.ajax({
            url: getRootPath() + "/jsp/user_space.jsp?page=" + pages,
            type: 'post',
            success: function (response) {
                alert(response);
                pages++;
                $('#recent-move').html($('#recent-move').html() + response)
            }
        });
    })
})

/*$(document).ready(function(){
    var pages = 1;
    $("#switch").click(function(){
        pages ++;
        $.post(getRootPath() + "/jsp/user_space.jsp", {
                "page" : pages
            }, function(data, status, xhr) {
                alert(data);
                $('#recent-move').html($('#recent-move').html() + data)
            }
        )
            .error(function(){
                alert("错误！");
            })
    })
})*/