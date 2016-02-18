<%@ page language="java" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<%@ include file="../frame/frame_head.jsp"%>
<link href="../../css/courses.css" rel="stylesheet" />
<link href="../../css/manager.css" rel="stylesheet" />
<%@ include file="../../jsp/manager_load.jsp"%>
<script type="text/javascript" charset="utf-8">
  $(document).ready(function(){
    var username=$.cookie("userid");
    if(username != "admin"){
      alert("username_error!");
      location.assign("../../index.jsp");
    }
    var inner = '<%=innerHtml%>';
    $("#content-width").html(inner);
    $(".text").click(function(){
      location.href ="../user/user.jsp?courseId="+$(this).children("input").val();
    })
  })
</script>
<script type="text/javascript" src="../../js/pagination.js"></script>
<script type="text/javascript" src="../../js/login1.js"></script>
<script type="text/javascript" src="../../js/deleteClick.js"></script>
<script type="text/javascript" src="../../js/addClick.js"></script>
<script type="text/javascript" src="../../js/register1.js"></script>
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
            <div id="content-width" class="clearfix">
            </div>
            <!-- END-OF-CONTENT -->

            <!-- LIST -->
            <div id="content-list">
              <h3>您可能想要：</h3>
              <a id="add-btn" type="button" data-toggle="modal" data-target="#modal-add">添加课程</a>
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
