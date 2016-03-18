<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- meta -->
<title>项目发布平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/html/frame/frame_head.jsp"%>
<link href="../../css/projectlist.css" rel="stylesheet" />
<%@ include file="/jsp/frame.jsp"%>
<link href="../../css/personalCenter.css" rel="stylesheet" />
</head>
<body>
  <!-- NAVBAR -->
  <%@ include file="../frame/frame_navbar.jsp"%>
  <!-- END-OF-NAVBAR -->

  <div id="container-content">
    <div class="grey-3">
      <div class="container clearfix">
        <div class="white shadow">
          <div id="content" class="clearfix" style="padding-top: 20px">
            <!-- CONTENT -->
            <div class="personal-center">
              <div class="personal-center-left-content">
                <div class="personal-center-avatar">
                  <img id="personal-center-avatar-img" src="../../img/wang.png">
                  <p id="personal-center-avatar-username">机制汇</p>
                </div>
                <div class="personal-center-control">
                  <ul class="personal-center-control-list">
                    <li class="personal-center-control-item item-deactivated"><a href="">我的消息</a></li>
                    <li class="personal-center-control-item item-activated"><a href="">我的信息</a></li>
                    <li class="personal-center-control-item item-deactivated"><a href="">项目管理</a></li>
                    <li class="personal-center-control-item item-deactivated"><a href="">团队管理</a></li>
                  </ul>
                </div>
              </div>
              <div class="personal-center-right-content">
                <div class="personal-center-right-title">
                  <div id="title-line">
                  </div>
                  <p>个人信息</p>
                </div>
                <div class="personal-center-right-item">
                  <ul class="personal-center-info">
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">用户名：</p>
                      <p class="personal-center-info-item-item" id="username">机制汇</p>
                      <input class="personal-center-info-change" id="username-change" type="text" name="" value="">
                    </li>
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">密码：</p>
                      <p class="personal-center-info-item-item" id="password">******</p>
                      <input class="personal-center-info-change personal-center-password-pre" type="password" name="" value=""> <p class="">原密码</p>
                      <input class="personal-center-info-change personal-center-password-now" type="password" name="" value=""> <p class="">现密码</p>
                    </li>
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">真实姓名：</p>
                      <p class="personal-center-info-item-item" id="name">黄汇</p>
                      <input class="personal-center-info-change" id="name-change" type="text" name="" value="">
                    </li>
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">简介：</p>
                      <p class="personal-center-info-item-item" id="describe">机制汇最sb</p>
                      <input class="personal-center-info-change" id="describe-change" type="text" name="" value="">
                    </li>
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">手机号：</p>
                      <p class="personal-center-info-item-item" id="phone">13256985589</p>
                      <input class="personal-center-info-change" id="phone-change" type="text" name="" value="">
                      </li>
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">邮箱：</p>
                      <p class="personal-center-info-item-item" id="mail">123456@qq.com</p>
                      <input class="personal-center-info-change" id="mail-change" type="text" name="" value="">
                    </li>
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">专业：</p>
                      <p class="personal-center-info-item-item" id="major">软件</p>
                      <input class="personal-center-info-change" id="major-change" type="text" name="" value="">
                    </li>
                    <li class="personal-center-info-item">
                      <p class="personal-center-info-item-title">技术：</p>
                      <p class="personal-center-info-item-item-tech" id="jsp">jsp</p>
                      <a class="personal-center-info-item-item-tech-delete" href="">-</a>
                      <p class="personal-center-info-item-item-tech" id="java">java</p>
                      <a class="personal-center-info-item-item-tech-delete" href="">-</a>
                      <p class="personal-center-info-item-item-tech" id="c++">c++</p>
                      <a class="personal-center-info-item-item-tech-delete" href="">-</a>
                      <p class="personal-center-info-item-item-tech" id="c++"></p>
                      <a class="personal-center-info-item-item-tech-delete" href="">+</a>
                    </li>
                  </ul>
                  <a href="" class="personal-info-item-save">保存信息</a>
                  <a href="" class="personal-info-item-save hidden">编辑信息</a>
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
