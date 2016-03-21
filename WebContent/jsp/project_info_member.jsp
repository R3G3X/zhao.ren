<%@page import="java.sql.ResultSet"%>
<%@ page
  language="java"
  contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta
  http-equiv="Content-Type"
  content="text/html; charset=UTF-8">
<%
	if (pid != -1) {
    int count = 0;
		ResultSet ppset = db.member_of_project(pid);
		while (ppset.next()) {
			String doc = "<div class=\"project-join-user\">";
			doc += "<img class=\"project-join-user-avatar img-circle\" src=\"../../avatar/";
			ResultSet memset = db.userInfo(ppset.getInt("user_id"));
			memset.next();
			doc += memset.getString("avatar");
			doc += "\"><a class=\"project-join-user-username\" href=\"../user/user.jsp?id=";
			doc += ppset.getInt("user_id");
      if (count == 0)
			  doc += "\">" + "&nbsp;&nbsp;&nbsp;队长：" + memset.getString("username");
			else
        doc += "\">" + memset.getString("username");
      doc += "</a></div>";
			out.print(doc);
      count++;
		}
	}
%>
