<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	if (pid > 0) {
		ResultSet mset = db.member_of_project(pid);
		while (mset.next()) {
			int memid = mset.getInt("user_id");
			String doc = "<div class=\"personal-center-project-developer clearfix\">";
			doc += "<div class=\"personal-center-project-developer-avatar-div\">";
			ResultSet memset = db.userInfo(memid);
			memset.next();
			doc += "<img class=\"personal-center-project-developer-avatar\" src=\"../../avatar/"
					+ memset.getString("avatar") + "\">";
			doc += "</div><div class=\"personal-center-project-developer-username-div\">";
			doc += "<p class=\"personal-center-project-developer-username\"><a ";
			doc += "href=\"user.jsp?id=" + memset.getString("id") + "\">";
			doc += memset.getString("username");
			doc += "</a></p></div><div class=\"personal-center-project-devoloper-delete-div\">";
			doc += "<a class=\"personal-center-project-devoloper-delete "
					+ ((id == db.founder_of_project(pid) || id == memset.getInt("id")) ? "" : "hidden")
					+ "\"";
			doc += "href=\"../../jsp/doRemoveMember.jsp?pid=" + pid + "&member=" + memset.getString("id")
					+ "\" >-</a>";
			doc += "</div></div>";
			out.print(doc);
		}
	}
%>