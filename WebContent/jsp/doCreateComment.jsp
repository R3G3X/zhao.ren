<%@page import="zhao_ren_db.db_connector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/jsp/doLogin_required.jsp"%>
<%
	boolean success = true;
	try {
		int pid = Integer.parseInt(request.getParameter("pid"));
		success = db.join_project(id, pid);
	} catch (Exception e) {
		e.printStackTrace();
		success = false;
	}
	if (success) {
		out.print("<script>alert(\"发表成功！\")</script>");
	} else {
		out.print("<script>alert('发表失败！可能的原因: \\n应该不可能吧')</script>");
	}
%>

