$(document).ready(function(){
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
    function Search(){
        location.href ="projectlist.jsp?pages=1&s="+toUnicode($('#search-box-input').val());
    }
    function toUnicode(str) {
      var temp,
      i = 0,
      r = '',
      len = str.length;
      for (; i < len; i++) {
      temp = str.charCodeAt(i).toString(16);
      while ( temp.length < 4 )
      temp = '0' + temp;
      r += '\\u' + temp;
      };
      return r;
    }
})
