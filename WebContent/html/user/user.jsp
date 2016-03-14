<%@ page language="java" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<jsp:include page="/html/frame/frame_head.jsp"></jsp:include>
<jsp:include page="/jsp/frame.jsp"></jsp:include>
<link href="../../css/user.css" rel="stylesheet" />
<script type="text/javascript" src="../../js/agreeClick.js"></script>
<script type="text/javascript" src="../../js/commentClick.js"></script>
<script type="text/javascript" src="../../js/register1.js"></script>
</head>
<body>
	<jsp:include page="/html/frame/frame_navbar.jsp"></jsp:include>
	<div id="container-content">
		<!-- BASICS -->
		<div class="grey-2">
			<div class="container">
				<div class="white shadow">
					<div class="clearfix"
						style="background: url(../../img/background-img.jpg) no-repeat fixed center center/cover;">
						<div id="user-box">
							<img src="../../img/wang.png" class="img-circle big-avatar" />
						</div>
						<div id="comment">
							<input id="courseId" type="hidden" value="courseId" />
							<h2 style="padding-bottom: 3px; border-bottom: 1px solid #fff;">
								projectName</h2>
							<h4>creatorName</h4>
							<p>describe</p>
							<p style="float: right">
								EVAL评分为：<a id="score">evalVal </a>分
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

						<div class="comment-item">
							<div class="comment-title clearfix">
								<h5 class="username">user_name</h5>
								<h5 class="time">date</h5>
							</div>
							<p class="comment-content">content</p>
							<div class="clearfix">
								<input type="hidden" id="commentId" value="commentId" /> <a
									class="thumbs da-btn">踩(disagree)</a> <input type="hidden"
									id="disagreei" value="" /> <a class="thumbs ag-btn">赞(agree)</a>
								<input type="hidden" id="agreei" value="" />
							</div>
						</div>
						<script type="text/javascript" charset="utf-8" async defer>
							$(document).ready(function() {
								$("#agree").val("agree");
								$("#disagree").val("disagree");
							})
						</script>
						<input id="target-comment" type="hidden" value="" />
						<div>
							<textarea id="comment-context"></textarea>
							<a id="comment-submit">评论</a>
						</div>
					</div>
					<div id="recommend">
						<h3 style="margin-bottom: 30px">这个老师还上过</h3>
						<div class="recommend-item clearfix">
							<a class="recommend-name" href="user.jsp?courseId=id">className</a>
							<h5 class="recommend-score">
								EVAL评分为：<a class="score">eval</a> 分
							</h5>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- COMMENT -->
	</div>
	<jsp:include page="/html/frame/frame_bottom.jsp"></jsp:include>
</body>
</html>
