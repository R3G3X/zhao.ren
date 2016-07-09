  $(document).ready(function(){
    $("#container-content").css("min-height",$(window).height()-$("#bottom").height()-$(".select-type").height()-$(".navbar").height());
    $("#content").css("min-height",$(window).height()-$("#bottom").height()-50);
    $(".register-box").parent().css("min-height",$(window).height()-$("#bottom").height()-$(".select-type").height()-$(".navbar").height());

    var t = $(window).scrollTop();
    $(window).scrollTop(0);
    $("img").each(function(){
      // alert($(this).attr("src"));
      $(this).parent().append($("#img-load"));
    });
    $("#img-load").removeClass("hidden").css("height",$(this).parent().height());
    var defereds = [];
    $("img").each(function(){
      var dfd = $.Deferred();

      $(this).load(dfd.resolve);
      // alert('load compeleted');
      $(this).parent().children("#img-load").addClass("hidden");
      defereds.push(dfd);
    });
    $.when.apply(null, defereds).done(function() {
      console.log('load compeleted');
    });
  })

