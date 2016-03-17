<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<%@ include file="/html/frame/frame_head.jsp"%>
<%@ include file="/jsp/doLogin_required.jsp"%>
<%@ include file="/jsp/user_info.jsp"%>

<link href="../../css/user.css" rel="stylesheet" />
</head>
<body>
	<!-- NAVBAR -->
	<%@ include file="/html/frame/frame_navbar.jsp"%>
	<!-- END-OF-NAVBAR -->

	<!-- CONTENT -->
	<div id="container-content">
		<!-- PUT-YOUR-CODE-BELOW -->
		<!-- BASICS -->
		<div class="grey-2">
			<div class="contain">
				<div class="white shadow">
					<div class="clearfix"
						style="background: url(../../img/background-img.jpg) no-repeat fixed center center/cover;">
						<div id="user-box">
							<a id="pic-edit" href="#"><img src="<%=request.getContextPath()%>/avatar/<%=avatar%>"
								class="img-circle big-avatar" /></a> <a id="user-edit">编辑</a>
						</div>
						<div id="comment">
							<input id="courseId" type="hidden" value="courseId" />
							<h2 style="padding-bottom: 3px; border-bottom: 1px solid #fff;">
								<%=info.getString("username")%>
							</h2>
							<h4>
								<%=info.getString("userintro")%>
							</h4>
							<p>
								专业:<%=info.getString("major")%>
								| 邮箱:<%=info.getString("email")%>
							</p>
							<p>
								<%=info.getString("tech_intro")%>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END-OF-BASICS -->

		<!-- COMMENT -->
		<div class="grey-3">
			<div class="contain">
				<div id="width" class="white shadow clearfix">
					<div id="counter"
						style="border-top: 1px solid #BDBCBC; border-bottom: 1px solid #BDBCBC;">
						<div id="test" class="clearfix">
							<div class="count-item"
								style="font-size: 10px; border-right: 1px solid #BDBCBC; padding-top: 5px;">
								<p>已经完成的项目</p>
								<p class="count-number"><%=finish_count %></p>
							</div>
							<div class="count-item"
								style="font-size: 10px; border-right: 1px solid #BDBCBC; padding-top: 5px;">
								<p>正在进行的项目</p>
								<p class="count-number"><%=ongoing_count %></p>
							</div>
							<div class="count-item"
								style="font-size: 10px; padding-top: 5px;">
								<p>申请中的项目</p>
								<p class="count-number"><%=processing_count %></p>
							</div>
						</div>

					</div>
					<div id="left-content">

						<div></div>

						<h3 style="font-weight: bold;">最近动态</h3>
						<div id="recent-move">
							<div class="recent-move-content">
								<a class="move-title-title">Project Name</a>
								<div class="move-title">
									<p class="move-title-detail">project details</p>
								</div>
								<div class="move-detail">
									<a class="move-detail-duration">28小时</a> <a
										class="move-detail-time">加入时间：2016-01-01</a>
								</div>
							</div>
							<div class="recent-move-content">
								<a class="move-title-title">Project Name</a>
								<div class="move-title">
									<p class="move-title-detail">project details</p>
								</div>
								<div class="move-detail">
									<a class="move-detail-duration">28小时</a> <a
										class="move-detail-time">加入时间：2016-01-01</a>
								</div>
							</div>
							<div class="recent-move-content">
								<a class="move-title-title">Project Name</a>
								<div class="move-title">
									<p class="move-title-detail">project details</p>
								</div>
								<div class="move-detail">
									<a class="move-detail-duration">28小时</a> <a
										class="move-detail-time">加入时间：2016-01-01</a>
								</div>
							</div>
						</div>

						<div id="comment-area">
							<h3 style="font-weight: bold">留言区</h3>
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
							<input id="target-comment" type="hidden" value="" />
							<div>
								<textarea id="comment-context"></textarea>
								<div id="comment-btn">
									<a id="comment-submit">评论</a>
								</div>
							</div>
						</div>
					</div>
					<div id="right-content">
						<div class="detail-box">
							<div class="detail-title clearfix">
								<a class="detail-title-title" href="#">项目</a>
								<p class="detail-title-count"><%=finish_count+ongoing_count %></p>
							</div>
							<ul class="recommend-item">
								<%@ include file="/jsp/user_project.jsp"%>
							</ul>
						</div>

						<div class="detail-box">
							<div class="detail-title clearfix">
								<p class="detail-title-title">小组</p>
								<p class="detail-title-count">4</p>
							</div>
							<div class="recommend-item">
								<div class="clearfix">
									<img src="../../img/bilibili.jpg" style="float: left;"
										width="60px">
									<ul style="float: left; list-style: none; padding-left: 20px">
										<li><a>嗶哩嗶哩 - ( ゜- ゜)つロ 乾杯~</a></li>
										<li><a>125名成员</a></li>
									</ul>
								</div>
							</div>
							<div class="recommend-item">
								<div class="clearfix">
									<img src="../../img/bilibili.jpg" style="float: left;"
										width="60px">
									<ul style="float: left; list-style: none; padding-left: 20px">
										<li><a>嗶哩嗶哩 - ( ゜- ゜)つロ 乾杯~</a></li>
										<li><a>125名成员</a></li>
									</ul>
								</div>
							</div>
							<div class="recommend-item">
								<div class="clearfix">
									<img src="../../img/bilibili.jpg" style="float: left;"
										width="60px">
									<ul style="float: left; list-style: none; padding-left: 20px">
										<li><a>嗶哩嗶哩 - ( ゜- ゜)つロ 乾杯~</a></li>
										<li><a>125名成员</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- COMMENT -->
		<!-- PUT-YOUR-CODE-ABOVE -->
	</div>
	<!-- END-OF-CONTENT -->
	<!-- BOTTOM -->
	<jsp:include page="../../html/frame/frame_bottom.jsp"></jsp:include>
	<!-- END-OF-BOTTOM -->
</body>
</html>
