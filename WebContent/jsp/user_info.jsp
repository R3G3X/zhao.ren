<%@page import="zhao_ren_db.db_connector"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	ResultSet info = null;
	int finish_count = 0;
	int ongoing_count = 0;
	int processing_count = 0;
	if (logined) {
		info = db.userInfo(id);
		info.next();
		finish_count = Integer.parseInt(db.finished_count(id));
		ongoing_count = Integer.parseInt(db.ongoing_count(id));
		processing_count = Integer.parseInt(db.processing_count(id));
	}
%>
</head>
<body>

</body>
</html>