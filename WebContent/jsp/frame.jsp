<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="zhao_ren_db.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"> --%>
<%!db_connector	db		= new db_connector();
	boolean			logined	= false;
	int				id		= -1;
%>
<%
	String myid = (String) session.getAttribute("zhao_ren_token");
	if (myid != null) {
		logined = true;
		id = Integer.parseInt(myid);
		out.print("<br/><br/><h1>you have logged in.</h1>");
	}
%>
</head>
<body>
</body>
</html>