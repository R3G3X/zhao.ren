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
		out.print("<script>alert(\"已发送申请\")</script>");
	} else {
		out.print("<script>alert('申请失败！可能的原因: \\n您已加入该项目\\n您已申请该项目')</script>");
	}
%>
<script language="JavaScript">
	window.location = "../index.jsp";
</script>

