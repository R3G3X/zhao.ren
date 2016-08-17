<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="zhao_ren_db.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	db_connector db = new db_connector();
	String username = request.getParameter("username");
	String passwd = request.getParameter("password");
	if (db.login(username, passwd)) {
		Cookie cookie = new Cookie("zhao_ren_token", db.whois(username));
		cookie.setMaxAge(3600);
		cookie.setPath("/");
		response.addCookie(cookie);
		session.setAttribute("zhao_ren_token", db.whois(username));
		response.setStatus(200);
	} else {
		response.setStatus(400);
	}
%>
</head>
<body>
</body>
</html>