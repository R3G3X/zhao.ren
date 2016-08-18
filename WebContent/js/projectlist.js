$(document).ready(function(){
  var variable ="";
  var totalWidth = 0;
  var count = 0;
  $('#search-box-input').keydown(function(e){
    var theEvent = e || event;
    if(e.keyCode ==186 || e.keyCode == 59){
      theEvent.returnValue = false;
      theEvent.preventDefault();
      count ++;
      if ($("#search-box-input").val() == "" || $("#search-box-input").val() == null){
        alert("标签不能为空");
        count --;
        return;
      }
      if ($("#search-box-input").val().length > 10){
        alert("标签太长");
        count --;
        return;
      }
      if (count > 5){
        alert("标签太多");
        count --;
        return;
      }
      var bool = variable.indexOf(' ' + $("#search-box-input").val().toString() + ' ');
      var bool1 = variable.indexOf($("#search-box-input").val().toString() + ' ');
      if(bool > 0 || bool1 == 0){
        $("#search-box-input").val("")
        count --;
        return;
      }
      theEvent.returnValue = false;
      theEvent.preventDefault();
      var temp = $("#search-box-input").val();
      var prependElm  = "<div class=\"tag-name\">"+temp+"</div>";
      $("#search-box-inside").prepend(prependElm);
      var width = $(".tag-name").slice(0,1).width() + 10;
      totalWidth += width;
      width = $("#search-box-input").width() - width;
      // alert(totalWidth);
      if (totalWidth >= 500){
        $("#search-box-inside").height($("#search-box-input").height() + Math.floor((totalWidth + 2) / 514) * 52);
        width = 502;
        $("#search-box-input").width(width);
      }else{
        $("#search-box-input").width(width);
      }
      variable += temp;
      variable += " ";
      $("#search-box-input").val("");
    }
  })
  $(document).on("dblclick",".tag-name",function(){
    var width = $(this).width() + 10;
    width = $("#search-box-input").width() + width;
    // if ((totalWidth - width) / 514 < totalWidth / 514){
    if (width > 514){

    }else{
      $("#search-box-input").width(width);
      totalWidth = totalWidth - width;
    }
    var str = ' ' + $(this).siblings(".tag-name").text() + ' ';
    variable = variable.replace(str, ' ');
    count --;
    $(this).remove();
  })
  $(document).on("click",".tag-name",function(){
    if($(this).hasClass("clicked")){
      $(this).removeClass("clicked");
      $("#search-box-input").width($("#search-box-input").width()+2);
    }
    else{
      $(this).addClass("clicked");
      $("#search-box-input").width($("#search-box-input").width()-2);
    }
  })

	$(".project-list-info").click(function(){
		location.href ="../../html/project/project.jsp?id="+$(this).parent().attr("id");
	})
  $("#search-box-btn").click(function(){
    Search();
  })
  $('#search-box-input').keydown(function(e){
      if(e.keyCode==13){
         Search();

      }
  });
  $(".sort-list-item").click(function(){
    $(this).parent().children(".sort-list-item-active").removeClass("sort-list-item-active");
    $(this).addClass("sort-list-item-active");
    Search();
  })
  function Search(){
  	var loc = encodeURIComponent(encodeURIComponent($('#search-box-input').val()));
    var method = $("#method>.sort-list-item-active").attr("id");
    var crew = $("#crew>.sort-list-item-active").attr("id");
    var cycle = $("#cycle>.sort-list-item-active").attr("id");
    var loc ="projectlist.jsp?pages=1&s="+loc+"&method="+method+"&crew="+crew+"&cycle="+cycle;
    location.href = loc;
  }
})