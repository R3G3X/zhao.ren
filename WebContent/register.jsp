<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<%@ include file="/html/frame/frame_head.jsp"%>

<%@ include file="jsp/frame.jsp" %>
<link href="css/register.css" rel="stylesheet" />
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
		
		<div class=" container shadow white" style="width: 1140px;">
			<div class="register-box">
				<p class="register-title">加入 ZHAO.REN</p>
				<div class="register-info-box">
					<div id="check-statusR"></div>
					<p>用户名</p>
					<input id="usernameR" type="text" />
					<p>密码</p>
					<input id="passwordR" type="password" />
					<p>确认密码</p>
					<input id="pass-confirmR" type="password" />
					<p>邮箱</p>
					<input id="emailR" type="text" />
					<div style="margin-top:0.5%">
						<a id="register-submitR">确认信息</a>
					</div>
				</div>
			</div>
		</div>
		<!-- PUT-YOUR-CODE-ABOVE -->
	</div>
	<!-- END-OF-CONTENT -->
	<!-- BOTTOM -->
	<jsp:include page="/html/frame/frame_bottom.jsp"></jsp:include>
	<!-- END-OF-BOTTOM -->
</body>
</html>















<!DOCTYPE html>
<html>
	<head><meta charset="utf-8"></head>
	<body>
		
	</body>
</html>