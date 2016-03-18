<%@ page language="java" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<%@ include file="../frame/frame_head.jsp"%>
<link href="../../css/courses.css" rel="stylesheet" />
<%@ include file="../../jsp/course_load.jsp"%>
<script type="text/javascript" charset="utf-8">
  $(document).ready(function(){
    var inner = '<%=innerHtml%>';
    $("#content-width").html(inner);
    $(".text").click(function(){
      location.href ="../project/project.jsp?courseId="+$(this).children("input").val();
    })
    $(".select-btn").click(function(){
      $("#target-course").val($(this).parent().prev().children("input").val());
      // alert($("#target-course").val());
      var title = "为"+ $(this).parent().prev().children("h3").text() +"投票";
      $("#vote-border").children("h3").text(title);
    })
  })

</script>
<script type="text/javascript" src="../../js/pagination.js"></script>
<script type="text/javascript" src="../../js/login1.js"></script>
<script type="text/javascript" src="../../js/register1.js"></script>
<script type="text/javascript" src="../../js/voteClick1.js"></script>
</head>
<body>
  <%@ include file="../frame/frame_navbar.jsp"%>
  <div id="container-content">
    <div class="grey-3">
      <div class="container clearfix">
        <div class="white shadow">
          <div id="content" class="clearfix">
            <!-- CONTENT -->
            <input type="hidden" id="currentPage" />
            <input type="hidden" id="numPerPage" />
            <input type="hidden" id="target-course" />
            <div id="content-width" class="clearfix">
            </div>
            <!-- END-OF-CONTENT -->

            <!-- LIST -->
            <div id="content-list">
              <h3>您可能想要：</h3>
            </div>
            <!-- END-OF-LIST -->
            <div id="list">
              <ul id="paging">
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="../frame/frame_bottom.jsp"%>
</body>
</html>
