<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/jsp/doLogin_required.jsp"%>
<%
	String ppid = request.getParameter("id");
	int pid = Integer.parseInt(ppid);
	if (db.project_finsh(id, pid)) {
		out.print("<script>alert('您已完成该项目!')</script>");
	} else {
		out.print("<script>alert('结束该项目!也许你不是项目的创建者')</script>");
	}
	db.close();
%>
<script language="JavaScript">
	window.location = "../html/user/personalCenter-project.jsp";
</script>
</head>
</html>