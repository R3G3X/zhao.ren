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
        <h2 class="project-title-title"><%=pret.getString("name") %></h2>
        <a class="project-title-status">组队中</a>
      </div>
      <div class="clearfix project-title-require">
        <a class="project-title-require-item with-right-border">类型: <%=pret.getString("intro") %></a>
        <a class="project-title-require-item">周期: <%=pret.getString("round_time") %> 天</a>
        <div class="project-title-join">
          <a>加入他们</a>
        </div>
      </div>

    </div>
  </div>

  <div class="grey-3">
    <div class="container white box-border-bottom">
      <h3 class="project-require-title">一、项目需求</h3>
      <ul class="project-require-list">
        <li>需求1</li>
        <li>需求2</li>
      </ul>
      <h3 class="project-require-title">一、项目需求</h3>
      <ul class="project-require-list">
        <li>需求1</li>
        <li>需求2</li>
      </ul>
      <h3 class="project-require-title">一、项目需求</h3>
      <ul class="project-require-list">
        <li>需求1</li>
        <li>需求2</li>
      </ul>
      <h3 class="project-require-title">一、项目需求</h3>
      <ul class="project-require-list">
        <li>需求1</li>
        <li>需求2</li>
      </ul>
      <h3 class="project-require-title">一、项目需求</h3>
      <ul class="project-require-list">
        <li>需求1</li>
        <li>需求2</li>
      </ul>
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
