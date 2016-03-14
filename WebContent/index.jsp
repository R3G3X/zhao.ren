<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery/jquery-latest.js"></script>
<script src="js/bootstrap/3.0.3/bootstrap.min.js"></script>
<script src="js/index.js"></script>
<script type="text/javascript" src="js/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" />
<link href="css/modal.css" rel="stylesheet" />
<script type="text/javascript" charset="utf-8">
//   $(document).ready(function(){
<%--     var inner = '<%=innerHtml%>'; --%>
//     $("#content").html(inner);
//     $(".text").click(function(){
//       location.href ="html/project/project.jsp?courseId="+$(this).children("input").val();
//     })
//     $(".select-btn").click(function(){
//       $("#target-course").val($(this).parent().prev().children("input").val());
//       // alert($("#target-course").val());
//       var title = "为"+ $(this).parent().prev().children("h3").text() +"投票";
//       $("#vote-border").children("h3").text(title);
//     })
//   })
</script>
<jsp:include page="/jsp/frame.jsp"></jsp:include>
<!-- <script type="text/javascript" src="js/login1.js"></script> -->
<script type="text/javascript" src="js/voteClick.js"></script>
<script type="text/javascript" src="js/register.js"></script>
</head>

<body>
	<!-- NAVBAR -->
	<jsp:include page="/html/frame/frame_navbar.jsp"></jsp:include>
	<!-- END-OF-NAVBAR -->

	

	<!-- PROJECT-ADD -->

	<!-- MODAL-PROJECT -->
	<div id="modal-add" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- MODAL-HEADER -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">创建新项目</h4>
				</div>
				<!-- END-OF-MODAL-HEADER -->

				<!-- MODAL-CONTENT -->
				<div class="modal-body">
					<form id="box-projectadd">
						<div class="add-right">
							<div>项目简介：</div>
							<textarea id="brief"></textarea>
						</div>
						<div class="add-left">
							<div>项目名称：</div>
							<input type="text" id="project-name" />
						</div>
						<div class="add-left">
							<div class="project-adding">创建人：</div>
							<input type="text" id="founder-name" />
						</div>
					</form>
				</div>
				<!-- END-OF-MODAL-CONTENT -->

				<!-- MODAL-FOOTER -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="change-save">提交</button>
				</div>
				<!-- END-OF-MODAL-FOOTER -->
			</div>
		</div>
	</div>
	<!-- END-OF-MODAL-PROJECT -->
	<!-- END-OF-PROJECT-ADD -->

	<!-- MODAL-VOTE -->
	<div id="modal-vote" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- MODAL-CONTENT -->
				<div id="mod-body" class="white">
					<div id="mod-border" class="vote-border">
						<h3>现在加入这个项目？</h3>
						<a id="btn-for" class="btn-select">是的，我现在就想开始</a> <a id="btn-post"
							class="btn-select">不，等等再说</a>
					</div>
				</div>
				<!-- END-OF-MODAL-CONTENT -->
			</div>
		</div>
	</div>
	<!-- END-OF-MODAL-VOTE -->


	<!-- CONTENT -->

	<div id="container-content" class="grey-3">
		<!-- PUT-YOUR-CODE-BELOW -->
		<div class="container shadow" style="padding: 0px; width: 1140px;">
			<!-- TITLE -->
			<div class="grey-3">
				<div class="white shadow clearfix">
					<p style="height: 65px; text-align: center;">
						<!-- <img id="title" src="img/icon.png" alt=""> -->
						<!-- <h2 id="title">ZHAO.REN</h2> -->
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
			<!-- END-OF-CONTENT -->

			<!-- PUT-YOUR-CODE-ABOVE -->
		</div>
	</div>

	<!-- BOTTOM -->
	<jsp:include page="/html/frame/frame_bottom.jsp"></jsp:include>
	<!-- END-OF-BOTTOM -->
</body>
</html>
