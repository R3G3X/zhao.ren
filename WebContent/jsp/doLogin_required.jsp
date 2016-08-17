<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="zhao_ren_db.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	db_connector db = new db_connector();
	boolean logined = false;
	int id = -1;
	String myid = (String) session.getAttribute("zhao_ren_token");
	if (myid != null) {
		logined = true;
		id = Integer.parseInt(myid);
	}
	if (!logined) {
		Cookie cookie = null;
		Cookie[] cookies = null;
		cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if ((cookie.getName()).equals("zhao_ren_token")) {
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
			}
		}
		response.sendRedirect(request.getContextPath() + "/403.jsp");
	}
%>
</head>
<body>
</body>
</html>