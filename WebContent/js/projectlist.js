$(document).ready(function(){
  var variable = "," + $("#variable").val().toString() + ",";
  if (variable == ",,")
    variable = ",";
  var totalWidth = 0;
  var count1 = 0;
  $('#search-box-input').keydown(function(e){
    var theEvent = e || event;
    if(e.keyCode ==188 && !e.shiftKey){
      theEvent.returnValue = false;
      theEvent.preventDefault();
      // alert(variable);
      count1 ++;
      if ($("#search-box-input").val() == "" || $("#search-box-input").val() == null){
        alert("标签不能为空");
        count1 --;
        return;
      }
      if ($("#search-box-input").val().length > 15){
        alert("标签太长");
        count1 --;
        return;
      }
      if (count1 > 5){
        alert("标签太多");
        count1 --;
        return;
      }
      var bool = variable.indexOf(',' + $("#search-box-input").val().toString() + ',');
      if(bool >= 0 ){
        $("#search-box-input").val("")
        count1 --;
        return;
      }
      var temp = $("#search-box-input").val();
      var prependElm  = "<div class=\"tag-name\">"+temp+"</div>";
      $("#search-box-inside").prepend(prependElm);
      var width = $(".tag-name").slice(0,1).width() + 10;
      totalWidth += width;
      width = $("#search-box-input").width() - width;
      if (totalWidth >= 500){
      	$("#search-box-inside").height($("#search-box-input").height() + Math.floor((totalWidth + 2) / 514) * 52);
      	width = 502;
      	$("#search-box-input").width(width);
      }else{
      	$("#search-box-input").width(width);
      }
      variable += temp;
      variable += ",";
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
    var str = ',' + $(this).text().toString() + ',';
    variable = variable.replace(str, ',');
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
    var loc = "";
    var words = encodeURIComponent(encodeURIComponent($('#search-box-input').val()));
    variable = variable.substring(0,variable.length-1);
    variable = variable.substring(0+1,variable.length);
    if (variable != null && variable != ""){
      loc += "[T]";
      loc += variable;
      if (words != null && words != ""){
        loc += "[W]";
        loc += words;
      }
    }else{
      loc = words;
    }

    var method = $("#method>.sort-list-item-active").attr("id");
    var crew = $("#crew>.sort-list-item-active").attr("id");
    var cycle = $("#cycle>.sort-list-item-active").attr("id");
    var loc ="projectlist.jsp?pages=1&s="+loc+"&method="+method+"&crew="+crew+"&cycle="+cycle;
    location.href = loc;
  }
})