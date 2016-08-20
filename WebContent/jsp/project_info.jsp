<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String name = "";
	String num = "";
	String time = "";
	String intro = "";
	String detail = "";
	String techs = "";
	int pid = -1;
	ResultSet pret = null;
	try {
		pid = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {

	}
	if (pid != -1) {
		pret = db.project_info(pid);
		pret.next();
		name = pret.getString("name");
		num = pret.getString("require_num");
		time = pret.getString("round_time");
		intro = pret.getString("intro");
		detail = pret.getString("detail");
		techs = db.project_tech(pid);
		db.add_visits(pid);
	}
%>
</head>
<body>

</body>
</html>