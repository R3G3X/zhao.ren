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
          <div id="content" class="clearfix" style="padding-top:70">
            <!-- CONTENT -->
            <div class="personal-center clearfix">
              <%@ include file="/html/frame/personalCenter-right.jsp"%>
              <div class="personal-center-right-content">
                <div class="personal-center-right-title">
                  <div id="title-line"></div>
                  <p>项目信息</p>
                </div>
                <div class="personal-center-right-item-project">
                  <div class="personal-center-project-names clearfix">
                    <%@ include file="/jsp/project_manage.jsp"%>
                  </div>
                  <div class="personal-center-project-info clearfix">
                    <%
                    	if (pid > 0) {
                    %>
                    <h3><%=pjset.getString("name")%></h3>
                    <ul class="personal-center-project-info-list">
                      <li class="clearfix"><p
                          class="personal-center-project-item-title">周期:</p>
                        <p class="personal-center-project-item-item"><%=pjset.getString("round_time")%></p></li>
                      <li class="clearfix"><p
                          class="personal-center-project-item-title">人数:</p>
                        <p class="personal-center-project-item-item"><%=db.count_project_num(pjset.getInt("id")) + "/" + pjset.getString("require_num")%></p></li>
                      <li class="clearfix"><p
                          class="personal-center-project-item-title">简介:</p>
                        <p class="personal-center-project-item-item"><%=pjset.getString("intro")%></p></li>
                    </ul>
                    <%
                    	if (pjset.getInt("founder_id") == id) {
                    %>
                    <a class="personal-center-project-end"
                      href="../../jsp/doFinshProject.jsp?id=<%=pid%>">结束项目</a>
                    <a class="personal-center-project-edit"
                      href="../project/projectCreate.jsp?id=<%=pid%>">编辑</a>
                    <%
                    	}
                    %>
                  </div>
                  <div class="personal-center-right-title">
                    <div id="title-line"></div>
                    <p>成员</p>
                  </div>
                  <div
                    class="personal-center-project-developers clearfix">
                    <%@ include file="/jsp/project_member.jsp"%>

                  </div>
                  <%
                  	} else {
                  		out.print("你没有加入任何项目啊QAQ");
                  	}
                  %>
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
