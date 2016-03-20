<%@page import="zhao_ren_db.db_connector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	db_connector db = new db_connector();
	int id = -1;
	String myid = (String) session.getAttribute("zhao_ren_token");
	if (myid != null) {
		id = Integer.parseInt(myid);
	}
	String name = request.getParameter("name");
	String num = request.getParameter("num");
	String time = request.getParameter("time");
	String intro = request.getParameter("intro");
	String detail = request.getParameter("detail");
	detail = detail.replace("\n", "\\\\n");
	detail = detail.replace("\"", "\\\\\\\"");
	if (db.add_project(name, id, intro, num, time, detail)) {
		response.setStatus(200);
	} else {
		response.setStatus(400);
	}
%>

</head>
<body>

</body>
</html>