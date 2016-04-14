<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<div class="personal-center-left-content">
	<div class="personal-center-avatar">
		<img id="personal-center-avatar-img" src="<%=avatar_path%>">
		<p id="personal-center-avatar-username"><%=info.getString("username")%></p>
	</div>
	<div class="personal-center-control">
		<ul class="personal-center-control-list">
			<li class="personal-center-control-item item-activated"><a
				>1</a></li>
			<li class="personal-center-control-item item-deactivated"><a
				>2</a></li>
			<li class="personal-center-control-item item-deactivated"><a
				>9</a></li>
<%-- 			<li class="personal-center-control-item item-<%=t4 %>activated"><a --%>
<!-- 				href="personalCenter-team.jsp">团队管理</a></li> -->
		</ul>
	</div>
</div>
