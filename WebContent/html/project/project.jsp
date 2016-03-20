<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<%@ include file="/jsp/frame.jsp"%>
<%@ include file="/html/frame/frame_head.jsp"%>
<%@ include file="/jsp/project_info.jsp"%>

<link href="../../css/project.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/js/markdown.js"></script>

</head>
<body>
  <!-- NAVBAR -->
  <%@ include file="/html/frame/frame_navbar.jsp"%>
  <!-- END-OF-NAVBAR -->

  <!-- CONTENT -->
  <div id="container-content">
    <!-- PUT-YOUR-CODE-BELOW -->
    <div class="grey-2">
      <div class="container grey-3 box-border-top project-title-box">
        <div class="project-title clearfix">
          <h2 class="project-title-title"><%=pret.getString("name")%></h2>
          <a class="project-title-status"><%=pret.getString("isFinshed").equals("0") ? "组队中" : "已完成"%></a>
        </div>
        <div class="clearfix project-title-require">
          <p >
            <a class="project-title-require-item with-right-border">项目简介:
              <%=pret.getString("intro")%></a>
            </a>
          </p>
          <p >
            <a class="project-title-require-item with-right-border">创建时间:
              <%=pret.getString("create_time")%></a> <a
              class="project-title-require-item">周期: <%=pret.getString("round_time")%>
              天
            </a>
          </p>
          <div class="project-title-join  <%=pret.getString("isFinshed").equals("0") ? "" : "hidden"%>">
            <a
              href="<%=request.getContextPath()%>/jsp/doJoinProject.jsp?pid=<%=pret.getInt("id")%>">加入他们</a>
          </div>
        </div>

      </div>
    </div>

    <div class="grey-3">
      <div class="container white box-border-bottom" id="markdown"></div>
    </div>
    <script type="text/javascript">
        content="<%=pret.getString("detail")%>";
					document.getElementById("markdown").innerHTML = markdown
							.toHTML(content);
				</script>
    <div
      class="container grey-3 box-border-top project-title-box clearfix project-user">
      <h4 class="project-join-title">团队成员[需要人数:<%=pret.getString("require_num")%>]</h4>

      <%@ include file="/jsp/project_info_member.jsp"%>
    </div>
  </div>
  <!-- PUT-YOUR-CODE-ABOVE -->
  </div>
  <!-- END-OF-CONTENT -->
  <!-- BOTTOM -->
  <jsp:include page="../../html/frame/frame_bottom.jsp"></jsp:include>
  <!-- END-OF-BOTTOM -->
</body>
</html>
