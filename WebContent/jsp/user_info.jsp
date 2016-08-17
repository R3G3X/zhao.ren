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
	int iid = -1;
	if (logined) {
		String siid = request.getParameter("id");
		if (siid != null) {
			iid = Integer.parseInt(siid);
		} else {
			iid = id;
		}
		info = db.userInfo(iid);
		info.next();
		finish_count = Integer.parseInt(db.finished_count(iid));
		ongoing_count = Integer.parseInt(db.ongoing_count(iid));
		processing_count = Integer.parseInt(db.processing_count(iid));
	}
	String t1, t2, t3, t4;
	t1 = t2 = t3 = t4 = "de";
%>
</head>
<body>

</body>
</html>