<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <%@ include file="/html/frame/frame_head.jsp" %>
    <%@ include file="/jsp/doLogin_required.jsp" %>
    <%@ include file="/jsp/user_info.jsp" %>

    <link href="../../css/user.css" rel="stylesheet"/>
    <script type="text/javascript" src="../../js/userspace.js"></script>
</head>
<body>
<!-- NAVBAR -->
<%@ include file="/html/frame/frame_navbar.jsp" %>
<!-- END-OF-NAVBAR -->
<%
    id = iid;
    String ava_path = request.getContextPath() + "/avatar/" + info.getString("avatar");
%>
<!-- CONTENT -->
<div id="container-content" class="grey-2">
    <!-- PUT-YOUR-CODE-BELOW -->
    <!-- BASICS -->
    <div>
        <div class="container">
            <div class="white shadow">
                <div class="clearfix box"
                     style="background: url(../../img/background-img.jpg) no-repeat fixed center center/cover;padding-top:10px;">
                    <div id="user-box">
                        <a id="pic-edit" href="#"><img src="<%=ava_path%>"
                                                       class="img-circle big-avatar"/></a>
                        <div id="user-Message">
                            <a>私信</a>
                            <input id="userID" type="hidden" value="<%=id%>"/>
                        </div>
                    </div>
                    <div id="comment">
                        <input id="courseId" type="hidden" value="courseId"/>
                        <h2 id="user-username" style="padding-bottom: 3px; border-bottom: 1px solid #fff;">
                            <%=info.getString("username")%>
                        </h2>
                        <h4>
                            <%=info.getString("userintro")%>
                        </h4>
                        <p>
                            专业:<%=info.getString("major")%>
                            | 邮箱:<%=info.getString("email")%>
                        </p>
                        <p>
                            <%=info.getString("tech_intro")%>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END-OF-BASICS -->

    <!-- COMMENT -->
    <div class="grey-3">
        <div class="container">
            <div id="width" class="white shadow clearfix">
                <div id="counter"
                     style="border-top: 1px solid #BDBCBC; border-bottom: 1px solid #BDBCBC;">
                    <div id="test" class="clearfix">
                        <div class="count-item"
                             style="font-size: 10px; border-right: 1px solid #BDBCBC; padding-top: 5px;">
                            <p>已经完成的项目</p>
                            <p class="count-number"><%=finish_count%>
                            </p>
                        </div>
                        <div class="count-item"
                             style="font-size: 10px; border-right: 1px solid #BDBCBC; padding-top: 5px;">
                            <p>正在进行的项目</p>
                            <p class="count-number"><%=ongoing_count%>
                            </p>
                        </div>
                        <div class="count-item"
                             style="font-size: 10px; padding-top: 5px;">
                            <p>申请中的项目</p>
                            <p class="count-number"><%=processing_count%>
                            </p>
                        </div>
                    </div>

                </div>
                <div id="left-content">
                    <h3 style="font-weight: bold;">最近动态</h3>
                    <div id="recent-move">
                        <button id="switch">切换页面</button>
                        <%--<%@ include file="/jsp/user_space.jsp" %>--%>
                        <%--传js: /jsp/user_space.jsp?page=1 其中page为第几页--%>
                    </div>
                </div>
                <div id="right-content">
                    <div class="detail-box">
                        <div class="detail-title clearfix">
                            <a class="detail-title-title">项目</a>
                            <p class="detail-title-count"><%=finish_count + ongoing_count%>
                            </p>
                        </div>
                        <ul class="recommend-item detail-group-box">
                            <%@ include file="/jsp/user_project.jsp" %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- COMMENT -->
<!-- PUT-YOUR-CODE-ABOVE -->

<!-- END-OF-CONTENT -->
<!-- BOTTOM -->
<jsp:include page="../../html/frame/frame_bottom.jsp"></jsp:include>
<!-- END-OF-BOTTOM -->
</body>
</html>
