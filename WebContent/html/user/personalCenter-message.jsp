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
  	t1 = "";
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
                  <p>我的消息</p>
                </div>
                <div class="personal-center-message-container">
                  <%@ include file="/jsp/personalMessage.jsp"%>
                  <div class="personal-center-message clearfix">
                    <div class="personal-center-message-avatar">
                      <img class="personal-center-message-avatar-img"
                        src="../../img/avatar3.jpg" alt="">
                    </div>
                    <div class="personal-center-message-item">
                      <p class="personal-center-message-message">
                        静态页面</p>
                    </div>
                    <div class="personal-center-message-agreement">
                      <a class="personal-center-message-agree" href="">同意</a>
                      <a class="personal-center-message-disagree"
                        href="">拒绝</a>
                    </div>
                  </div>


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
  <jsp:include page="../../html/frame/frame_bottom.jsp"></jsp:include>
  <!-- END-OF-BOTTOM -->
</body>
</html>
