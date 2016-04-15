<%@page import="java.net.URLDecoder"%>
<%@page import="zhao_ren_db.db_connector"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
	ResultSet sret = db.project_comment(pid);
	int ccid = 0;
	while (sret.next()) {
		ccid++;
		String doc = "<div class=\"project-comment-item\" style=\"border: 1px solid #c8c8c8; margin-top: -1px\">";
		doc += "<div class=\"clearfix\"><div class=\"project-comment-img\">";
		int uid = sret.getInt("user_id");
		ResultSet uset = db.userInfo(uid);
		uset.next();
		doc += "<img src=\"../../avatar/";
		doc += uset.getString("avatar") + "\">";
		doc += "<a class=\"project-comment-username\" href=\"";
		doc += "../user/user.jsp?id=" + uid + "\">";
		doc += uset.getString("username");
		doc += "</a></div><div class=\"project-comment-content\"><div class=\"project-comment-comment\"><p>";
		doc += sret.getString("content");
		doc += "</p></div><a href=\"#comment\" id=\"" + ccid
				+ "\" class=\"project-comment-content-reply\">回复</a><p class=\"project-comment-content-time\">";
		doc += ccid + "楼 " + sret.getString("time").substring(0, 19);
		doc += "</p></div></div></div>";
		out.print(doc);
	}
%>