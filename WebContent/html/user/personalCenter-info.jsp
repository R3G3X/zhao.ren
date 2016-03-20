<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- meta -->
<title>个人中心</title>
<%@ include file="/html/frame/frame_head.jsp"%>
<%@ include file="/jsp/doLogin_required.jsp"%>
<%@ include file="/jsp/user_info.jsp"%>

<link href="../../css/personalCenter.css" rel="stylesheet" />
<script type="text/javascript" src="../../js/personalCenter.js"></script>

</head>
<body>
  <!-- NAVBAR -->
  <%@ include file="../frame/frame_navbar.jsp"%>
  <!-- END-OF-NAVBAR -->
  <%
    t2 = "";
  %>
  <div id="container-content">
    <div class="grey-3">
      <div class="container clearfix">
        <div class="white shadow">
          <div id="content" class="clearfix" style="padding-top: 20px">
            <!-- CONTENT -->
            <div class="personal-center clearfix">
              <%@ include file="/html/frame/personalCenter-right.jsp"%>
              <div class="personal-center-right-content">
                <div class="personal-center-right-title">
                  <div id="title-line"></div>
                  <p>个人信息</p>
                </div>
                <div class="personal-center-right-item-top clearfix"
                  style="width: 655px;">
                  <div class="personal-center-right-item">
                    <ul class="personal-center-info">
                      <li class="personal-center-info-item clearfix">
                        <p class="personal-center-info-item-title">用户名：</p>
                        <p class="personal-center-info-item-item"
                          id="username-info"><%=info.getString("username")%></p>
                      </li>
                      <li class="personal-center-info-item clearfix">
                        <p class="personal-center-info-item-title">密码：</p>
                        <p class="personal-center-info-item-item"
                          id="password-input">******</p>
                      </li>
                     <li id="target" class="personal-center-info-item clearfix">
                        <p class="personal-center-info-item-title">真实姓名：</p>
                        <p class="personal-center-info-item-item"
                          id="name"><%=info.getString("realName")%></p>
                      </li>
                      <li class="personal-center-info-item clearfix">
                        <p class="personal-center-info-item-title">简介：</p>
                        <p class="personal-center-info-item-item"
                          id="describe"><%=info.getString("userintro")%></p>
                      </li>
                      <li class="personal-center-info-item clearfix">
                        <p class="personal-center-info-item-title">手机号：</p>
                        <p class="personal-center-info-item-item"
                          id="phone"><%=info.getString("phone")%></p>
                      </li>
                      <li class="personal-center-info-item clearfix">
                        <p class="personal-center-info-item-title">邮箱：</p>
                        <p class="personal-center-info-item-item"
                          id="mail"><%=info.getString("email")%></p>
                      </li>
                      <li class="personal-center-info-item clearfix">
                        <p class="personal-center-info-item-title">专业：</p>
                        <p class="personal-center-info-item-item"
                          id="major"><%=info.getString("major")%></p>
                      </li>
                      <li class="personal-center-info-item clearfix">
                        <p class="personal-center-info-item-title">技术介绍：</p>
                        <p class="personal-center-info-item-item"
                        id="tech-info"><%=info.getString("tech_intro") %></p>
                    </li>
                    </ul>
                  </div>
                  <div class="personal-center-right-item-right hidden">
                    <ul class="personal-center-info">
                      <li class="personal-center-info-item-right"><input
                        class="personal-center-info-change"
                        id="username-change" type="text" name=""
                        value=""></li>
                      <li class="personal-center-info-item-right"><input
                        class="personal-center-info-change"
                        type="password" name="" value=""
                        id="pre-password-change">
                        <p class="">原密码</p> <input
                        class="personal-center-info-change"
                        type="password" name="" value=""
                        id="now-password-change">
                        <p class="">现密码</p></li>
                      <li class="personal-center-info-item-right"><input
                        class="personal-center-info-change"
                        id="name-change" type="text" name="" value=""></li>
                      <li class="personal-center-info-item-right"><input
                        class="personal-center-info-change"
                        id="describe-change" type="text" name=""
                        value=""></li>
                      <li class="personal-center-info-item-right"><input
                        class="personal-center-info-change"
                        id="phone-change" type="text" name="" value=""></li>
                      <li class="personal-center-info-item-right"><input
                        class="personal-center-info-change"
                        id="mail-change" type="text" name="" value=""></li>
                      <li class="personal-center-info-item-right"><input
                        class="personal-center-info-change"
                        id="major-change" type="text" name="" value=""></li>
                      <li class="personal-center-info-item-right"><textarea
                        class="personal-center-info-change-textarea"
                        id="tech-info-change" type="text" name="" value=""></textarea></li>
                    </ul>
                  </div>
                </div>
                <div class="personal-center-right-item-down">
                  <ul class="personal-center-info">
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">技术：</p>
                      <a class="personal-center-info-item-item-tech"
                      id="10000"><span id="1"
                        class="require label label-primary">JAVA</span></a><a
                      class="personal-center-info-item-item-tech"
                      id="1000"><span id="1"
                        class="require label label-primary">C++</span></a> <a
                      class="personal-center-info-item-item-tech"
                      id="100"><span id="1"
                        class="require label label-primary">J2EE</span></a>
                      <a class="personal-center-info-item-item-tech"
                      id="10"><span id="1"
                        class="require label label-primary">PHP</span></a> <a
                      class="personal-center-info-item-item-tech" id="1"><span
                        id="1" class="require label label-default">...</span>
                    </a>
                    </li>
                  </ul>
                </div>
                <a class="personal-info-item-save hidden" id="info-save">保存信息</a>
                <a class="personal-info-item-save" id="info-change">编辑信息</a>
              </div>
            </div>
            <!-- END-OF-CONTENT -->
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- BOTTOM -->
  <jsp:include page="../../html/frame/frame_bottom.jsp"></jsp:include>
  <!-- END-OF-BOTTOM -->
</body>
</html>
