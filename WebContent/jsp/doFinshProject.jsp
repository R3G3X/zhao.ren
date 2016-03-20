<%@ page
  language="java"
  contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta
  http-equiv="Content-Type"
  content="text/html; charset=UTF-8">
<%@ include file="/jsp/doLogin_required.jsp"%>
<%
	String ppid = request.getParameter("pid");
	int pid = Integer.parseInt(ppid);
	if (db.project_finsh(id, pid)) {
		response.setStatus(200);
	} else {
		response.setStatus(400);
	}
%>
</head>
</html>