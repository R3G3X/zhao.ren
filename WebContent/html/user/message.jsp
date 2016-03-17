<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/html/frame/frame_head.jsp"%>
<%@ include file="/jsp/doLogin_required.jsp"%>
<title>我的消息</title>
</head>
<body>
	<!-- NAVBAR -->
	<%@ include file="/html/frame/frame_navbar.jsp"%>
	<!-- END-OF-NAVBAR -->
	<div id="container-content" class="grey-3">
		<div class="page-header">
			<h1>Notifications</h1>
		</div>
		以下是来自小组的消息:
		<div class="media">
			<div class="media-left">
				<img class="media-object img-circle"
					src="<%=request.getContextPath()%>/avatar/1.jpg">
			</div>
			<div class="media-body">
				<h4 class="media-heading">
					SkyZH <small>» All at 2015-09-02 23:04:06</small>
				</h4>
				<p>
					<span class="markdown_desc"><p>好久没有维护啦作为管理员冒个泡</p></span>
				</p>
				<p>
					<a href="/oj/notification/sendall" class="btn btn-success btn-large"><span class="glyphicon glyphicon-send"></span> 接受</a>
					<a href="/oj/notification/sendall" class="btn btn-danger btn-large"><span class="glyphicon glyphicon-send"></span> 拒绝</a>
				</p>
			</div>
		</div>
		以下是来自项目的消息:
		<div class="media">
			<div class="media-left">
				<img class="media-object img-circle"
					src="<%=request.getContextPath()%>/avatar/1.jpg">
			</div>
			<div class="media-body">
				<h4 class="media-heading">
					SkyZH <small>» All at 2015-09-02 23:04:06</small>
				</h4>
				<p>
					<span class="markdown_desc"><p>好久没有维护啦作为管理员冒个泡</p></span>
				</p>
				<p>
					<a href="/oj/notification/sendall" class="btn btn-success btn-large"><span class="glyphicon glyphicon-send"></span> 接受</a>
					<a href="/oj/notification/sendall" class="btn btn-danger btn-large"><span class="glyphicon glyphicon-send"></span> 拒绝</a>
				</p>
			</div>
		</div>
	</div>

	<!-- BOTTOM -->
	<jsp:include page="/html/frame/frame_bottom.jsp"></jsp:include>
	<!-- END-OF-BOTTOM -->
</body>
</html>