<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	ResultSet ret = db.project_as_founder(id);
	while(ret.next()){
		String doc = String.format("<li><a class=\"recommend-name\" href=\"../project/project.jsp?id=%s\">%s</a><a class=\"recommend-status\">他发起的</a></li>", ret.getString("id"),ret.getString("name"));
		out.print(doc);
	}
	ret=db.project_as_member(id);
	while(ret.next()){
		String doc = String.format("<li><a class=\"recommend-name\" href=\"../project/project.jsp?id=%s\">%s</a><a class=\"recommend-status\">他加入的</a></li>", ret.getString("project_id"),ret.getString("name"));
		out.print(doc);
	}	
%>
</head>
<body>

</body>
</html>