<%@page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="doLogin_required.jsp"%>
<%@ include file="user_info.jsp" %>
<%
    String ava_path = request.getContextPath() + "/avatar/" + info.getString("avatar");
    int pages = Integer.valueOf(request.getParameter("page"));
    int uid = Integer.valueOf(request.getParameter("id"));
    ResultSet sret = db.user_space(uid, pages);
    String[] msg = {"加入了", "结束了", "完成了"};
    int cnt = 0;
    while (sret.next()) {
        cnt++;
        String doc = "<div class=\"recent-move-content clearfix\"><div class=\"recent-move-content-avatar\">";
        doc += "<img src=\"" + ava_path + "\">";
        doc += "</div><div class=\"recent-move-content-box\"><a class=\"move-title-title\">";
        doc += info.getString("username") + "</a>";
        doc += "<div class=\"move-title\"><p class=\"move-title-detail\">";
        doc += msg[Integer.parseInt(sret.getString("isFinshed"))];
        ResultSet pinfo = db.project_info(sret.getInt("project_id"));
        pinfo.next();
        doc += "<a href=\"../project/project.jsp?id=" + sret.getInt("project_id") + "\">";
        doc += pinfo.getString("name");
        doc += "</a></p></div><div class=\"move-detail\"><a class=\"move-detail-duration\">";
        doc += sret.getInt("diff") + "天</a><a class=\"move-detail-time\"> at ";
        doc += sret.getString("time");
        doc += "</a></div></div></div>";
        out.print(doc);
    }
    if(cnt!=0){
        response.setStatus(200);
    }else{
        response.setStatus(400);
    }
    db.close();
%>