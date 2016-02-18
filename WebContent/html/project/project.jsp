<%@ page language="java" pageEncoding="UTF-8"%>
<html lang="en">
<head>
  <%@ include file="../frame/frame_head.jsp"%>
  <link href="../../css/user.css" rel="stylesheet" />
  <%@ include file="../../jsp/project_load.jsp"%>
  <script type="text/javascript" src="../../js/login1.js"></script>
  <script type="text/javascript" src="../../js/agreeClick.js"></script>
  <script type="text/javascript" src="../../js/commentClick.js"></script>
  <script type="text/javascript" src="../../js/register1.js"></script>
</head>
<body>
  <%@ include file="../frame/frame_navbar.jsp"%>
  <div id="container-content">
    <!-- BASICS -->
    <div class="grey-2">
      <div class="container">
        <div class="white shadow">
          <div class="clearfix" style="background:url(../../img/background-img.jpg) no-repeat fixed center center / cover;">
            <div id="user-box">
              <img src="../../img/wang.png" class="img-circle big-avatar" />
            </div>
            <div id="comment">
              <input id="courseId" type="hidden" value="<%=courseId%>" />
              <h2 style="padding-bottom:3px;border-bottom:1px solid #fff;"> <%=courseName%> </h2>
              <h4><%=teacherName%></h4>
              <p><%=describe%></p>
              <p style="float:right">
                EVAL评分为：<a id="score"><%=evalVal%> </a>分
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END-OF-BASICS -->

    <!-- COMMENT -->
    <div class="grey-3">
      <div class="container">
        <div id="width" class="white shadow clearfix">
          <div id="comment-text">
    <%
    int i = 0;
    rs = stmt.executeQuery("select * from comment where class_id = '"+courseId+"'order by agree desc");%>
    <%while(rs.next()){
        i ++;
        String content = rs.getString("content");
        String user_name=rs.getString("user_name");
        String commentId=rs.getString("comment_id");
        String date= (rs.getString("time"));
        int agree=Integer.parseInt(rs.getString("agree"));
        int disagree=Integer.parseInt(rs.getString("disagree"));
    %>
            <div class="comment-item">
              <div class="comment-title clearfix">
                <h5 class="username"><%=user_name %></h5>
                <h5 class="time"><%=date %></h5>
              </div>
              <p class="comment-content">
                <%=content %>
              </p>
              <div class="clearfix">
                <input type="hidden" id="commentId" value="<%=commentId%>"/>
                <a class="thumbs da-btn">踩(<%=disagree%>)</a>
                <input type="hidden" id="disagree<%=i%>" value=""/>
                <a class="thumbs ag-btn">赞(<%=agree%>)</a>
                <input type="hidden" id="agree<%=i%>" value=""/>
              </div>
            </div>
            <script type="text/javascript" charset="utf-8" async defer>
              $(document).ready(function(){
                $("#agree<%=i%>").val("<%=agree%>");
                $("#disagree<%=i%>").val("<%=disagree%>");
              })
            </script>
<%
}
%>
            <input id="target-comment" type="hidden" value="" />
            <div>
              <textarea id="comment-context"></textarea>
              <a id="comment-submit">评论</a>
            </div>
          </div>
          <div id="recommend">
            <h3 style="margin-bottom:30px">这个老师还上过</h3>
            <%
            ResultSet rs1 = stmt
            .executeQuery("select * from class where teacher = '"
            +teacherName+"'");

            while(rs1.next()){
                String className=rs1.getString("class_name");
                String eval=rs1.getString("good_eval");
                String id = rs1.getString("class_id");
                %>
              <div class="recommend-item clearfix">
              <a class="recommend-name" href="user.jsp?courseId=<%=id%>"><%=className %></a>
              <h5 class="recommend-score">EVAL评分为：<a class="score"><%=eval %></a> 分</h5>
            </div>

            <%
            }
            %>

          </div>
        </div>
      </div>
    </div>
    <!-- COMMENT -->
  </div>
  <%@ include file="../frame/frame_bottom.jsp"%>
</body>
</html>
