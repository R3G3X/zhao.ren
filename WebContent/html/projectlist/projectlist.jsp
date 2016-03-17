<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/html/frame/frame_head.jsp"%>
<link href="../../css/projectlist.css" rel="stylesheet" />
<script type="text/javascript" src="../../js/pagination.js"></script>
<%@ include file="/jsp/frame.jsp"%>
<title>全部项目</title>
</head>
<body>
	<!-- NAVBAR -->
	<%@ include file="/html/frame/frame_navbar.jsp"%>
	<!-- END-OF-NAVBAR -->

	<div id="container-content">
		<div class="grey-3">
			<div class="container clearfix">
				<div class="white shadow">
					<div id="content" class="clearfix" style="padding-top: 20px">
						<!-- CONTENT -->
						<input type="hidden" id="currentPage" /> <input type="hidden"
							id="numPerPage" /> <input type="hidden" id="target-course" />

						<div id="search-box" class="clearfix">
							<input id="search-box-input" type="text" name="" value="">
							<div id="search-box-btn" href="" title="">搜索</div>
						</div>

						<div>
							<ul class="classify">
								<li><a href="" title="">最多访问</a></li>
								<li><a href="" title="">最近发布</a></li>
								<li><a href="" title="">最多申请</a></li>
							</ul>
							<ul class="classify">
								<li><a href="" title="">全部周期</a></li>
								<li><a href="" title="">一周以内</a></li>
								<li><a href="" title="">一个月以内</a></li>
								<li><a href="" title="">半年以内</a></li>
								<li><a href="" title="">半年以上</a></li>
							</ul>
							<ul class="classify">
								<li><a href="" title="">全部技能</a></li>
								<li><a href="" title="">PHP</a></li>
								<li><a href="" title="">jee</a></li>
								<li><a href="" title="">java</a></li>
								<li><a href="" title="">C++/C</a></li>
							</ul>
						</div>

						<div id="content-width" class="clearfix">

							<div class="project-list-box">
								<div class="project-list-img">
									<img src="../../img/bg.jpg">
								</div>
								<div class="project-list-info">
									<h3>华师大创业</h3>
									<p>哈哈哈哈哈哈哈哈哈哈哈哈哈哈</p>
									<div class="project-list-skill clearfix">
										<a href=""><span class="require label label-default">C/C++</span></a>
										<a href=""><span class="require label label-primary">Java</span></a>
									</div>
								</div>
								<div class="project-list-creator clearfix">
									<img class="project-list-creator-avatar img-circle"
										src="../../img/avatar3.jpg"> <a
										class="project-list-creator-username" href="">机制汇</a> <a
										class="project-list-creator-count" href="">&nbsp;10</a> <img
										class="project-list-creator-number" src="../../img/person.png">
									<h6 class="project-list-date">2016-03-17</h6>
								</div>
							</div>

							<div class="project-list-box">
								<div class="project-list-img">
									<img src="../../img/bg.jpg">
								</div>
								<div class="project-list-info">
									<h3>华师大创业</h3>
									<p>哈哈哈哈哈哈哈哈哈哈哈哈哈哈</p>
									<div class="project-list-skill clearfix">
										<a href=""><span class="require label label-default">C/C++</span></a>
										<a href=""><span class="require label label-primary">Java</span></a>
									</div>
								</div>
								<div class="project-list-creator clearfix">
									<img class="project-list-creator-avatar img-circle"
										src="../../img/avatar3.jpg"> <a
										class="project-list-creator-username" href="">机制汇</a> <a
										class="project-list-creator-count" href="">&nbsp;10</a> <img
										class="project-list-creator-number" src="../../img/person.png">
									<h6 class="project-list-date">2016-03-17</h6>
								</div>
							</div>

							<div class="project-list-box">
								<div class="project-list-img">
									<img src="../../img/bg.jpg">
								</div>
								<div class="project-list-info">
									<h3>华师大创业</h3>
									<p>哈哈哈哈哈哈哈哈哈哈哈哈哈哈</p>
									<div class="project-list-skill clearfix">
										<a href=""><span class="require label label-default">C/C++</span></a>
										<a href=""><span class="require label label-primary">Java</span></a>
									</div>
								</div>
								<div class="project-list-creator clearfix">
									<img class="project-list-creator-avatar img-circle"
										src="../../img/avatar3.jpg"> <a
										class="project-list-creator-username" href="">机制汇</a> <a
										class="project-list-creator-count" href="">&nbsp;10</a> <img
										class="project-list-creator-number" src="../../img/person.png">
									<h6 class="project-list-date">2016-03-17</h6>
								</div>
							</div>

							<div class="project-list-box">
								<div class="project-list-img">
									<img src="../../img/bg.jpg">
								</div>
								<div class="project-list-info">
									<h3>华师大创业</h3>
									<p>哈哈哈哈哈哈哈哈哈哈哈哈哈哈</p>
									<div class="project-list-skill clearfix">
										<a href=""><span class="require label label-default">C/C++</span></a>
										<a href=""><span class="require label label-primary">Java</span></a>
									</div>
								</div>
								<div class="project-list-creator clearfix">
									<img class="project-list-creator-avatar img-circle"
										src="../../img/avatar3.jpg"> <a
										class="project-list-creator-username" href="">机制汇</a> <a
										class="project-list-creator-count" href="">&nbsp;10</a> <img
										class="project-list-creator-number" src="../../img/person.png">
									<h6 class="project-list-date">2016-03-17</h6>
								</div>
							</div>
						</div>
						<!-- END-OF-CONTENT -->

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- BOTTOM -->
	<jsp:include page="/html/frame/frame_bottom.jsp"></jsp:include>
	<!-- END-OF-BOTTOM -->
</body>
</html>