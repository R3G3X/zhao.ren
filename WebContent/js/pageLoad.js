  $(document).ready(function(){
    $("#container-content").css("min-height",$(window).height()-$("#bottom").height());
    $("#content").css("min-height",$(window).height()-$("#bottom").height()-50);
    var t = $(window).scrollTop();
    $(window).scrollTop(0);
  })

