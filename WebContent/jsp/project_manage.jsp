<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
	ResultSet pset = db.project_of(id);
	int cnt = 0;
	while (pset.next()) {
		cnt++;
		String doc = "<a class=\"personal-center-project-tag tag-activated\" href=\"";
		doc += "\">";
		doc += db.project_name(pset.getInt("project_id"));
		doc += "</a>";
		out.print(doc);
	}
%>
</head>

</html>