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
            <div class="personal-center">
              <%@ include file="/html/frame/personalCenter-right.jsp"%>
              <div class="personal-center-right-content">
                <div class="personal-center-right-title">
                  <div id="title-line"></div>
                  <p>个人信息</p>
                </div>
                <div class="personal-center-right-item">
                  <ul class="personal-center-info">
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">用户名：</p>
                      <p class="personal-center-info-item-item"
                        id="username">机制汇</p>
                    </li>
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">密码：</p>
                      <p class="personal-center-info-item-item"
                        id="password-input">******</p>
                    </li>
                    <li class="personal-center-info-item pass">
                      <p class="personal-center-info-item-title">真实姓名：</p>
                      <p class="personal-center-info-item-item"
                        id="name">黄汇</p>
                    </li>
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">简介：</p>
                      <p class="personal-center-info-item-item"
                        id="describe">机制汇最sb</p>
                    </li>
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">手机号：</p>
                      <p class="personal-center-info-item-item"
                        id="phone">13256985589</p>
                    </li>
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">邮箱：</p>
                      <p class="personal-center-info-item-item"
                        id="mail">123456@qq.com</p>
                    </li>
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">专业：</p>
                      <p class="personal-center-info-item-item"
                        id="major">软件</p>
                    </li>
                  </ul>
                </div>
                <div class="personal-center-right-item-right">
                  <ul class="personal-center-info">
                    <li class="personal-center-info-item-right"><input
                      class="personal-center-info-change"
                      id="username-change" type="text" name="" value=""></li>
                    <li class="personal-center-info-item-right"><input
                      class="personal-center-info-change"
                      type="password" name="" value="">
                      <p class="">原密码</p> <input
                      class="personal-center-info-change"
                      type="password" name="" value="">
                      <p class="">现密码</p></li>
                    <li class="personal-center-info-item-right"><input
                      class="personal-center-info-change"
                      id="name-change" type="text" name="" value=""></li>
                    <li class="personal-center-info-item-right"><input
                      class="personal-center-info-change"
                      id="describe-change" type="text" name="" value=""></li>
                    <li class="personal-center-info-item-right"><input
                      class="personal-center-info-change"
                      id="phone-change" type="text" name="" value=""></li>
                    <li class="personal-center-info-item-right"><input
                      class="personal-center-info-change"
                      id="mail-change" type="text" name="" value=""></li>
                    <li class="personal-center-info-item-right"><input
                      class="personal-center-info-change"
                      id="major-change" type="text" name="" value=""></li>
                  </ul>
                </div>
                <div class="personal-center-right-item-down">
                  <ul class="personal-center-info">
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">技术：</p>
                      <a href="#"
                      class="personal-center-info-item-item-tech"><span
                        id="0" class="require label label-default">JAVA</span></a><a
                      href="#"
                      class="personal-center-info-item-item-tech"><span
                        id="0" class="require label label-default">C++</span></a>
                      <a href="#"
                      class="personal-center-info-item-item-tech"><span
                        id="0" class="require label label-default">J2EE</span></a>
                      <a href="#"
                      class="personal-center-info-item-item-tech"><span
                        id="0" class="require label label-default">PHP</span></a>
                      <a href="#"
                      class="personal-center-info-item-item-tech"><span
                        id="0" class="require label label-default">...</span>
                    </a>
                    </li>
                  </ul>
                </div>
                <a href="" class="personal-info-item-save">保存信息</a> <a
                  href="" class="personal-info-item-save hidden">编辑信息</a>
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
