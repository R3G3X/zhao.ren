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
<%@ include file="/jsp/user_project_manage.jsp"%>
<link href="../../css/personalCenter.css" rel="stylesheet" />
<link href="../../css/messageControl.css" rel="stylesheet" />
<script src="../../js/message.js" type="text/javascript" charset="utf-8" async defer></script>
</head>
<body>
  <!-- NAVBAR -->
  <%@ include file="../frame/frame_navbar.jsp"%>
  <!-- END-OF-NAVBAR -->

  <div id="container-content">
    <div class="grey-3">
      <div class="container clearfix">
        <div class="white shadow">
          <div id="content" class="clearfix" style="padding-top:70">
            <!-- CONTENT -->
            <div class="personal-center clearfix">
              <%@ include file="/html/frame/personalCenter-messageControl.jsp"%>
              <div class="personal-center-right-content">
                <div class="personal-center-right-title">
                  <div id="title-line"></div>
                  <p>正在与 2 进行对话</p>
                </div>
                <div id="target-message-1" class="target-message">
                </div>
                <div id="target-message-2" class="target-message hidden">
                </div>
                <div id="target-message-9" class="target-message hidden">
                </div>
                <div id="message-input">
                  <textarea id="message"></textarea>
                </div>
                <a id="btn-send">发送</a>
                <p id="alert">ctrl + enter 发送</p>
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
