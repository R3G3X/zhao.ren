<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<div class="personal-center-left-content">
	<div class="personal-center-avatar">
		<img id="personal-center-avatar-img" src="<%=avatar_path%>">
		<p id="personal-center-avatar-username"><%=info.getString("username")%></p>
	</div>
	<div class="personal-center-control">
		<ul class="personal-center-control-list">
			<li class="personal-center-control-item item-<%=t1 %>activated"><a
				href="personalCenter-message.jsp">我的消息</a></li>
			<li class="personal-center-control-item item-<%=t2 %>activated"><a
				href="personalCenter-info.jsp">个人信息</a></li>
			<li class="personal-center-control-item item-<%=t3 %>activated"><a
				href="personalCenter-project.jsp">项目管理</a></li>
<%-- 			<li class="personal-center-control-item item-<%=t4 %>activated"><a --%>
<!-- 				href="personalCenter-team.jsp">团队管理</a></li> -->
		</ul>
	</div>
</div>