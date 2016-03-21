<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
	String nav_username = "username";
	String avatar = null;
	String avatar_path = null;
	String new_msg = "";
	if (logined) {
		ResultSet navSet = db.userInfo(id);
		navSet.next();
		nav_username = navSet.getString("username");
		avatar = navSet.getString("avatar");
		avatar_path = request.getContextPath() + "/avatar/" + avatar;
		int cnt = db.unread_message_count(id);
		if (cnt > 0) {
			new_msg = "[" + cnt + "]";
		}
	}
%>
<nav class="navbar navbar-inverse navbar-fixed-top grey-1"
  role="navigation">
  <div class="container grey-0" style="width: 1140px;">
    <!-- NAVBAR-HEADER -->
    <div class="navbar-header">
      <!-- FOR-SMALLER -->
      <button type="button" class="navbar-toggle" data-toggle="collapse"
        data-target="#example-navbar-collapse">
        <span class="sr-only">切换导航</span> <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <!-- END-OF-FOR-SMALLER -->
      <a class="navbar-brand" id="logo"
        href="<%=request.getContextPath()%>/index.jsp"><span>ZHAO.REN</span></a>
    </div>
    <!-- END-OF-NAVBAR-HEADER -->

    <div class="collapse navbar-collapse" id="example-navbar-collapse">
      <!-- NAVBAR-LEFT -->
      <ul class="nav navbar-nav navbar-left">

        <li><a id="project-list-btn"
          href="<%=request.getContextPath()%>/html/projectlist/projectlist.jsp"><span
            class="glyphicon glyphicon-search" aria-hidden="true">
              </span></a></li>
      </ul>
      <!-- END-OF-NAVBAR-LEFT -->

      <!-- NAVBAR-RIGHT -->

      <ul class="nav navbar-nav navbar-right">
        <li><a id="project-add-btn" class="hidden"
          href="<%=request.getContextPath()%>/html/project/projectCreate.jsp"><span
            class="glyphicon glyphicon-edit" aria-hidden="true">
              创建项目</span></a></li>
        <li><a id="personal-center-btn" class="hidden"
          href="<%=request.getContextPath()%>/html/user/personalCenter-message.jsp"><span
            class="glyphicon glyphicon-user" aria-hidden="true"> 个人中心</span>
            <%=new_msg%></a></li>
        <li><a id="user-btn" class="hidden"
          href="<%=request.getContextPath()%>/html/user/user.jsp"><span
            class="glyphicon glyphicon-home" aria-hidden="true">
              我的主页</span></a></li>
        <li id="login"><a id="login-btn" type="button"
          data-toggle="modal" data-target="#modal-login"><span
            class="glyphicon glyphicon-log-in" aria-hidden="true"></span></a></li>
        <li><img id="avatar" class="img-circle hidden-xs hidden"
          src="<%=avatar_path%>"></li>


        <li><a id="logout" href="#" class="hidden"><span
            class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a></li>
      </ul>
      <!-- END-OF-NAVBAR-RIGHT -->
    </div>
  </div>
</nav>
<!-- END-OF-NAVBAR -->

<!-- MODAL-LOGIN -->
<div id="modal-login" class="modal fade" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel">
  <div class="modal-body">
    <div id="mod-body" class="white">
      <h4 style="margin-left: 15px; margin-top: 13px; color: #6A6A6A"
        id="login-header">登陆到ZHAO.REN</h4>
      <h4 style="margin-left: 15px; margin-top: 13px; color: #6A6A6A"
        id="register-header" class="hidden">注册到ZHAO.REN</h4>
      <div id="mod-border" style="height: 230px; top: 15%;">
        <div id="submit-box">
          <div id="user-check"></div>
          <div id="check-status"></div>
          <input id="username" class="input-box" type="text"
            placeholder="USERNAME"> <input id="password"
            class="input-box" type="password" placeholder="PASSWORD">
        </div>
        <a id="login-submit">登陆</a> <a id="register-submit"
          class="hidden">注册</a> <a id="registerBtn" class="register">没有账号？</a>
        <a id="loginBtn" class="register hidden">已有账号？</a>
        <!--         <a id="find-pass">找回密码</a> -->
      </div>
    </div>
  </div>
</div>
<!-- END-OF-MODAL-LOGIN -->

<!-- PROJECT-ADD -->
<div id="modal-add" class="modal fade" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel">
  <div class="modal-body">
    <div id="mod-body" class="white">
      <h4 style="margin-left: 15px; margin-top: 13px; color: #6A6A6A">提交课程到ZHAO.REN</h4>
      <div id="mod-border" style="height: 230px; top: 15%;">
        <div id="submit-box">
          <div id="user-check"></div>
          <div id="check-status"></div>
          <input id="class-submit" class="box" type="text"
            placeholder="COURSENAME"> <input id="teacher-submit"
            class="box" type="text" placeholder="TEACHER">
          <textarea id="describe-submit"></textarea>
        </div>
        <a id="course-submit">提交</a>
      </div>
    </div>
  </div>
</div>
<!-- END-OF-PROJECT-ADD -->
