<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/html/frame/frame_head.jsp"%>
<%@ include file="/jsp/doLogin_required.jsp"%>
<link href="<%=request.getContextPath()%>/css/message.css"
	rel="stylesheet" />
<title>我的消息</title>
</head>
<body>
	<!-- NAVBAR -->
	<%@ include file="/html/frame/frame_navbar.jsp"%>
	<!-- END-OF-NAVBAR -->
	<div id="container-content" class="grey-3">
		<div class="container">
			<div class="page-header">
				<h1>Notifications</h1>
			</div>
			 <h3>以下是来自项目的消息:</h3>
			<div class="media">
				<div class="media-left">
					<img class="media-object img-circle avatar"
						src="<%=request.getContextPath()%>/avatar/1.jpg">
				</div>
				<div class="media-body v-align">
					<h4 class="media-heading">Kaito想要加入project 1<small> at 2015-09-02 23:04:06</small></h4>
					<div style="float:right;">
						<a href="/oj/notification/sendall"
							class="btn btn-success btn-large"><span
							class="glyphicon glyphicon-send"></span> 接受</a> <a
							href="/oj/notification/sendall" class="btn btn-danger btn-large"><span
							class="glyphicon glyphicon-send"></span> 拒绝</a>
					</div>
				</div>
			</div>
			<h3>以下是来自小组的消息:</h3>
			<div class="media">
				<div class="media-left">
					<img class="media-object img-circle avatar"
						src="<%=request.getContextPath()%>/avatar/1.jpg">
				</div>
				<div class="media-body v-align">
					<h4 class="media-heading">admin邀请你加入管理员组<small> at 2015-09-02 23:04:06</small></h4>
					<div style="float:right;">
						<a href="/oj/notification/sendall"
							class="btn btn-success btn-large"><span
							class="glyphicon glyphicon-send"></span> 接受</a> <a
							href="/oj/notification/sendall" class="btn btn-danger btn-large"><span
							class="glyphicon glyphicon-send"></span> 拒绝</a>
					</div>
				</div>
			</div>
			<div style="padding-bottom:20px;"></div>
		</div>
	</div>

	<!-- BOTTOM -->
	<jsp:include page="/html/frame/frame_bottom.jsp"></jsp:include>
	<!-- END-OF-BOTTOM -->
</body>
</html>