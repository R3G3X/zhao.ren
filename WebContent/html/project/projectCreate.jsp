<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<%@ include file="/html/frame/frame_head.jsp"%>
<%@ include file="/jsp/doLogin_required.jsp"%>
<link href="../../css/projectCreate.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/js/projectCreate.js"></script>
<script src="<%=request.getContextPath()%>/js/markdown.js"></script>

</head>
<body>
	<!-- NAVBAR -->
	<%@ include file="/html/frame/frame_navbar.jsp"%>
	<!-- END-OF-NAVBAR -->



	<!-- CONTENT -->
	<div id="container-content">
		<!-- PUT-YOUR-CODE-BELOW -->
		<div class="grey-3" style="min-height: 830px;">
			<div class="container white shadow" style="min-height: 830px;">
				<div class="project-create">
					<div class="project-create-box">
						<h3>创建项目</h3>
						<p class="project-create-info-grey">*项目类型（BETA中不提供此项选择）</p>
						<p class="project-create-info">*项目名称</p>
						<input class="project-create-input-short" type="text"
							id="projectname" value="" />
						<p class="project-create-info">*技术需求</p>
						<div>
							<a href="#" class="project-create-info-skill"><span id="0"
								class="require label label-default">JAVA</span></a> <a href="#"
								class="project-create-info-skill"><span id="0"
								class="require label label-default">C++</span></a> <a href="#"
								class="project-create-info-skill"><span id="0"
								class="require label label-default">J2EE</span></a> <a href="#"
								class="project-create-info-skill"><span id="0"
								class="require label label-default">PHP</span></a> <a href="#"
								class="project-create-info-skill"><span id="0"
								class="require label label-default">...</span></a>
						</div>
						<p class="project-create-info">*人数需求</p>
						<input class="project-create-input-short" type="text"
							id="projectMenRequired" value="" />
						<p class="project-create-info">*开发周期</p>
						<input class="project-create-input-short" placeholder="请输入天数"
							type="text" id="projectDevelopTime" value="" />
						<p class="project-create-info">*项目简介</p>
						<input class="project-create-input-short" type="text"
							id="projectDescribe" value="" />
						<p class="project-create-info">详细介绍（方便队友更方便地了解你的需求）[支持Markdown语法]</p>
						<textarea class="project-create-input-long"
							oninput="this.editor.update()" id="projectDescribeInDetails"></textarea>

						<p class="project-create-info">详细介绍预览</p>
						<div id="preview"></div>
						<script type="text/javascript">
// 							function Editor(input, preview) {
// 								this.update = function() {
// 									preview.innerHTML = markdown
// 											.toHTML(input.value);
// 								};
// 								input.editor = this;
// 								this.update();
// 							}
// 							var $ = function(id) {
// 								return document.getElementById(id);
// 							};
// 							new Editor($("text-input"), $("preview"));
						</script>
					</div>
					<div class="project-create-btn-div">
						<a class="project-create-btn" id="project-create-post" href="#">确认信息</a>
					</div>
					<a id = "check-project-status"></a>
				</div>
			</div>
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
