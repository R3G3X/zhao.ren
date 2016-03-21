<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<%@ include file="/html/frame/frame_head.jsp"%>

<%@ include file="jsp/frame.jsp" %>
<link href="css/index.css" rel="stylesheet" />
<script type="text/javascript" src="js/voteClick.js"></script>
<script type="text/javascript" src="js/index.js"></script>

</head>

<body>
	<!-- NAVBAR -->
	<%@ include file="/html/frame/frame_navbar.jsp"%>
	<!-- END-OF-NAVBAR -->

	<!-- CONTENT -->

	<div id="container-content" class="grey-3">
		<!-- PUT-YOUR-CODE-BELOW -->
		<div class="container shadow" style="padding: 0px; width: 1140px;">
			<!-- TITLE -->
			<div class="grey-3">
<!-- 				<div class="white shadow clearfix"> -->
<!-- 					<p style="height: 65px; text-align: center;"> -->
<!-- 					</p> -->
<!-- 				</div> -->
			</div>
			<!-- END-OF-TITLE -->
			<!-- SLIDE -->
			<div class="white" style="height: 366px;">
				<div class="shadow">
					<div id="showcase"
						style="background: url(<%=request.getContextPath()%>/img/background-img.jpg) no-repeat fixed center center/cover;">
						<h1>"找点人"项目平台</h1>
						<h2>想找项目做？想和其他人一起合作？欢迎使用"找点人"项目平台</h2>
						<p>
							<a id="find-project" role="button" target=""
								href="<%=request.getContextPath()%>/html/projectlist/projectlist.jsp">我要找项目</a>
						</p>
					</div>
				</div>
			</div>
			<!-- END-OF-SLIDE -->

			<!-- CONTENT -->
			<%@ include file="jsp/index_project.jsp" %>
			<!-- PUT-YOUR-CODE-ABOVE -->

		</div>
	</div>
	<!-- END-OF-CONTENT -->
	<!-- BOTTOM -->
	<jsp:include page="/html/frame/frame_bottom.jsp"></jsp:include>
	<!-- END-OF-BOTTOM -->
</body>
</html>
