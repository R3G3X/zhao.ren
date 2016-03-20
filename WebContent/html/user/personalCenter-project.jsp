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
  	t3 = "";
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
                  <p>项目信息</p>
                </div>
                <div class="personal-center-right-item-project">
                  <div class="personal-center-project-names">
                  <%@ include
                      file="/jsp/project_manage.jsp"%>
                    <a class="personal-center-project-tag tag-activated"
                      href="">华师大创业</a> <a
                      class="personal-center-project-tag tag-deactivated"
                      href="">j2ee</a> <a
                      class="personal-center-project-tag tag-deactivated"
                      href="">php</a>
                  </div>
                  <div class="personal-center-project-info clearfix">
                    <h3>华师大创业</h3>
                    <ul class="personal-center-project-info-list">
                      <li class="clearfix"><p
                          class="personal-center-project-item-title">周期:</p>
                        <p class="personal-center-project-item-item">20</p></li>
                      <li class="clearfix"><p
                          class="personal-center-project-item-title">人数:</p>
                        <p class="personal-center-project-item-item">5</p></li>
                      <li class="clearfix"><p
                          class="personal-center-project-item-title">简介:</p>
                        <p class="personal-center-project-item-item">没什么可说的</p></li>
                    </ul>
                    <a class="personal-center-project-edit">编辑</a>
                  </div>
                  <div class="personal-center-right-title">
                    <div id="title-line"></div>
                    <p>成员</p>
                  </div>
                  <div
                    class="personal-center-project-developers clearfix">

                    <div
                      class="personal-center-project-developer clearfix">
                      <div
                        class="personal-center-project-developer-avatar-div">
                        <img
                          class="personal-center-project-developer-avatar"
                          src="../../avatar/1.jpg" alt="">
                      </div>
                      <div
                        class="personal-center-project-developer-username-div">
                        <p
                          class="personal-center-project-developer-username">机制汇</p>
                      </div>
                      <div
                        class="personal-center-project-devoloper-delete-div">
                        <a
                          class="personal-center-project-devoloper-delete"
                          href="" title="">-</a>
                      </div>
                    </div>

                    <div
                      class="personal-center-project-developer clearfix">
                      <div
                        class="personal-center-project-developer-avatar-div">
                        <img
                          class="personal-center-project-developer-avatar"
                          src="../../avatar/1.jpg" alt="">
                      </div>
                      <div
                        class="personal-center-project-developer-username-div">
                        <p
                          class="personal-center-project-developer-username">机制汇</p>
                      </div>
                      <div
                        class="personal-center-project-devoloper-delete-div">
                        <a
                          class="personal-center-project-devoloper-delete"
                          href="" title="">-</a>
                      </div>
                    </div>

                    <div
                      class="personal-center-project-developer clearfix">
                      <div
                        class="personal-center-project-developer-avatar-div">
                        <img
                          class="personal-center-project-developer-avatar"
                          src="../../avatar/1.jpg" alt="">
                      </div>
                      <div
                        class="personal-center-project-developer-username-div">
                        <p
                          class="personal-center-project-developer-username">机制汇</p>
                      </div>
                      <div
                        class="personal-center-project-devoloper-delete-div">
                        <a
                          class="personal-center-project-devoloper-delete"
                          href="" title="">-</a>
                      </div>
                    </div>

                    <div
                      class="personal-center-project-developer clearfix">
                      <div
                        class="personal-center-project-developer-avatar-div">
                        <img
                          class="personal-center-project-developer-avatar"
                          src="../../avatar/1.jpg" alt="">
                      </div>
                      <div
                        class="personal-center-project-developer-username-div">
                        <p
                          class="personal-center-project-developer-username">机制汇</p>
                      </div>
                      <div
                        class="personal-center-project-devoloper-delete-div">
                        <a
                          class="personal-center-project-devoloper-delete"
                          href="" title="">-</a>
                      </div>
                    </div>
                    <a href="" class="next-page">下一页</a>
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
