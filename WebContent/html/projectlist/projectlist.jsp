<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/html/frame/frame_head.jsp"%>
<link href="../../css/projectlist.css" rel="stylesheet" />
<%@ include file="/jsp/frame.jsp"%>

<title>全部项目</title>
</head>
<body>
	<!-- NAVBAR -->
	<%@ include file="/html/frame/frame_navbar.jsp"%>
	<!-- END-OF-NAVBAR -->

	<div id="container-content" class="grey-3">
		<div>
			<div class="container clearfix">
				<div class="white shadow">
					<div id="content" class="clearfix">
						<!-- CONTENT -->
						<input type="hidden" id="currentPage" /> <input type="hidden"
							id="numPerPage" /> <input type="hidden" id="target-course" />

						<div id="search-box" class="clearfix">
							<div id="search-box-inside">
								<input id="search-box-input" type="text" name="" value="">
								<input id="variable" type="hidden">
							</div>
							<div id="search-box-btn" href="" title="" style="font-size:18px">搜 索</div>
						</div>
						<p id="description">输入","生成标签 双击标签以删除</p>
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
						var keyword = '<%=keyword%>';
						var tryMethod = <%=tryMethod%>;
						var crew = <%=crew%>;
						var cycle = <%=cycle%>;
						keyword = encodeURIComponent(keyword);
						// alert(keyword);
						// alert(pages);
						// alert(allPages);
						$(document).ready(function(){
							var innerHTML = '<a type="button" class="btn-page" id="pre" href="?s='+keyword+'&pages=<%=pages - 1 > 0 ? pages - 1 : pages%>&method='+tryMethod+'&crew='+crew+'&cycle='+cycle+'">上一页</a>';
							if (allPages-Math.floor(pages/10)>8){
								for(var i = 1; i <= 10;i++){
									if (i==pages){
										innerHTML += '<a type="button" class="btn-page activated" id='+ (Math.floor(pages/10) *10 + i) +' href="?pages='+ Math.floor(pages/10) *10 + i +'&s='+keyword+'&method='+tryMethod+'&crew='+crew+'&cycle='+cycle+'">'+ Math.floor(pages/10) *10 + i+'</a>'
									}else{
										innerHTML += '<a type="button" class="btn-page" id='+ (Math.floor(pages/10) *10 + i) +' href="?pages='+ Math.floor(pages/10) *10 + i +'&s='+keyword+'&method='+tryMethod+'&crew='+crew+'&cycle='+cycle+'">'+ Math.floor(pages/10) *10 + i+'method='+method+'crew='+crew+'cycle='+cycle+'</a>'
									}
								}
							}else{
								for(var i = 1; i <= allPages-Math.floor(pages/10);i++){
									if (i==pages){
										innerHTML += '<a type="button" class="btn-page activated" id='+ (Math.floor(pages/10) *10 + i) +' href="?pages='+ Math.floor(pages/10) *10 + i +'&s='+keyword+'&method='+tryMethod+'&crew='+crew+'&cycle='+cycle+'">'+ Math.floor(pages/10) *10 + i+'</a>'
									}else{
										innerHTML += '<a type="button" class="btn-page" id='+ (Math.floor(pages/10) *10 + i) +' href="?pages='+ Math.floor(pages/10) *10 + i +'&s='+keyword+'&method='+tryMethod+'&crew='+crew+'&cycle='+cycle+'">'+ Math.floor(pages/10) *10 + i+'</a>'
									}
								}
							}
							innerHTML += '<a type="button" class="btn-page" id="next" href="?s='+keyword+'&pages=<%=pages + 1%>&method='+tryMethod+'&crew='+crew+'&cycle='+cycle+'">下一页</a>'
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
							var search = decodeURIComponent(decodeURIComponent(keyword));
							var techsPos = search.indexOf("[T]");
							var wordsPos = search.indexOf("[W]");
							if (techsPos == 0){
								if (wordsPos > 0){
									var techs = search.substr(3,wordsPos-3);
									var words = search.substr(wordsPos + 3, search.length);
								}else{
									var techs = search.substr(3,search.length);
									var words = "";
								}
							}else{
								var techs = "";
								var words = search;
							}
							$("#variable").val(techs);
							var len = 0;
							var width = 0;
							var pos = techs.indexOf(",");
							while(techs.length > 0 && pos> 0){
								var str = techs.substr(0, pos);
								var prependElm  = "<div class=\"tag-name\">"+str+"</div>";
								$("#search-box-inside").prepend(prependElm);
								width += $(".tag-name").slice(0,1).width() + 10;
								techs = techs.substr(pos + 1, techs.length);
								pos = techs.indexOf(",");
							}
							if (techs.length > 0){
								var prependElm  = "<div class=\"tag-name\">"+techs+"</div>";
								$("#search-box-inside").prepend(prependElm);
								width += $(".tag-name").slice(0,1).width() + 10;
								len += width;
							}
							width = $("#search-box-input").width() - width ;
							if (len >= 500){
								$("#search-box-inside").height($("#search-box-input").height() + Math.floor((len + 2) / 514) * 52);
								width = 502;
								$("#search-box-input").width(width)
							}else{
								$("#search-box-input").width(width);
							}
							$("#search-box-input").val(words);
						})

					</script>
					<script type="text/javascript" src="../../js/projectlist.js"></script>
				</div>
			</div>
		</div>

	</div>

	<!-- BOTTOM -->
	<jsp:include page="/html/frame/frame_bottom.jsp"></jsp:include>
	<!-- END-OF-BOTTOM -->
</body>
</html>
