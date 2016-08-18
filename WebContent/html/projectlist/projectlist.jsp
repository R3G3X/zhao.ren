<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/html/frame/frame_head.jsp"%>
<link href="../../css/projectlist.css" rel="stylesheet" />
<%@ include file="/jsp/frame.jsp"%>
<script type="text/javascript" src="../../js/projectlist.js"></script>
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
					<div id="content" class="clearfix">
						<!-- CONTENT -->
						<input type="hidden" id="currentPage" /> <input type="hidden"
							id="numPerPage" /> <input type="hidden" id="target-course" />

						<div id="search-box" class="clearfix">
							<div id="search-box-inside">
								<input id="search-box-input" type="text" name="" value="">
							</div>
							<div id="search-box-btn" href="" title="">搜 索</div>
						</div>

						<div id="description">
							按“;”生成标签  双击标签删除
						</div>

						<div id="content-width" class="clearfix">
							<%@ include file="/jsp/project_list.jsp"%>
						</div>
						<!-- END-OF-CONTENT -->
					</div>
					<div style="text-align: center; padding-bottom: 50px" id="htarget">
					</div>
					<script type="text/javascript">
						var pages = <%=pages%>
						var allPages = <%=all_pages%>
						var keyword = "";
						var keyword = '<%=keyword%>';
						keyword = encodeURIComponent(keyword);
						// alert(keyword);
						// alert(pages);
						// alert(allPages);
						$(document).ready(function(){
							var innerHTML = '<a type="button" class="btn-page" id="pre" href="?s='+keyword+'&pages=<%=pages - 1 > 0 ? pages - 1 : pages%>">上一页</a>';
							if (allPages-Math.floor(pages/10)>8){
								for(var i = 1; i <= 10;i++){
									if (i==pages){
										innerHTML += '<a type="button" class="btn-page activated" id='+ (Mathw.floor(pages/10) *10 + i) +' href="?pages='+ Math.floor(pages/10) *10 + i +'&s='+keyword+'">'+ Math.floor(pages/10) *10 + i+'</a>'
									}else{
										innerHTML += '<a type="button" class="btn-page" id='+ (Math.floor(pages/10) *10 + i) +' href="?pages='+ Math.floor(pages/10) *10 + i +'&s='+keyword+'">'+ Math.floor(pages/10) *10 + i+'method='+method+'crew='+crew+'cycle='+cycle+'</a>'
									}
								}
							}else{
								for(var i = 1; i <= allPages-Math.floor(pages/10);i++){
									if (i==pages){
										innerHTML += '<a type="button" class="btn-page activated" id='+ (Math.floor(pages/10) *10 + i) +' href="?pages='+ Math.floor(pages/10) *10 + i +'&s='+keyword+'">'+ Math.floor(pages/10) *10 + i+'</a>'
									}else{
										innerHTML += '<a type="button" class="btn-page" id='+ (Math.floor(pages/10) *10 + i) +' href="?pages='+ Math.floor(pages/10) *10 + i +'&s='+keyword+'">'+ Math.floor(pages/10) *10 + i+'</a>'
									}
								}
							}
							innerHTML += '<a type="button" class="btn-page" id="next" href="?s='+keyword+'&pages=<%=pages + 1%>">下一页</a>'
							$("#htarget").html(innerHTML);
							if(pages>=allPages){
								$("#next").addClass("hidden");
							}else{
								$("#next").removeClass("hidden");
							}
							if(pages<=1){
								$("#pre").addClass("hidden");
							}else{
								$("#pre").removeClass("hidden");
							}
							$("#search-box-input").val(decodeURIComponent(decodeURIComponent(keyword)));
						})

					</script>
				</div>
			</div>
		</div>

	</div>

	<!-- BOTTOM -->
	<jsp:include page="/html/frame/frame_bottom.jsp"></jsp:include>
	<!-- END-OF-BOTTOM -->
</body>
</html>
