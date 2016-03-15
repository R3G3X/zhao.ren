<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<jsp:include page="/html/frame/frame_head.jsp"></jsp:include>
<jsp:include page="/jsp/frame.jsp"></jsp:include>
<script type="text/javascript" src="js/voteClick.js"></script>
<script type="text/javascript" src="js/index.js"></script>

</head>

<body>
	<!-- NAVBAR -->
	<jsp:include page="/html/frame/frame_navbar.jsp"></jsp:include>
	<!-- END-OF-NAVBAR -->

	<!-- CONTENT -->

	<div id="container-content" class="grey-3">
		<!-- PUT-YOUR-CODE-BELOW -->
		<div class="container shadow" style="padding: 0px; width: 1140px;">
			<!-- TITLE -->
			<div class="grey-3">
				<div class="white shadow clearfix">
					<p style="height: 65px; text-align: center;">
					</p>
				</div>
			</div>
			<!-- END-OF-TITLE -->
			<!-- SLIDE -->
			<div class="white" style="height: 366px;">
				<div class="shadow">
					<div id="">
						<div>
							<div id="showcase"
								style="background: url(img/background-img.jpg) no-repeat fixed center center/cover;">
								<h1>REG | EX</h1>
								<h2>想找实验室么？想找项目做？REG|EX 是您的最佳解决方案</h2>
								<p>
									<a id="find-project" role="button" target=""
										href="html/project/projectlist.jsp">我要找项目</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END-OF-SLIDE -->

			<!-- CONTENT -->
			<div class="grey-3">
				<div class="clearfix">
					<div class="white clearfix">
						<div id="content" class="clearfix"></div>
						<a id="vote-link" href="#">>>>我要投票</a> <input type="hidden"
							id="target-course" />
					</div>
				</div>
			</div>
			<jsp:include page="/jsp/index_project.jsp"></jsp:include>

			<!-- PUT-YOUR-CODE-ABOVE -->
			
		</div>
	</div>
	<!-- END-OF-CONTENT -->

	<!-- BOTTOM -->
	<jsp:include page="/html/frame/frame_bottom.jsp"></jsp:include>
	<!-- END-OF-BOTTOM -->
</body>
</html>
