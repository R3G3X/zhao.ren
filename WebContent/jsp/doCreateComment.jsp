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
		String msg = request.getParameter("msg");
		int pre_id = 0;
		int f1 = msg.indexOf(':');
		if (f1 != -1) {
			String s = msg.substring(0, f1);

		}
		success = db.project_add_comment(id, pid, msg, pre_id);
	} catch (Exception e) {
		e.printStackTrace();
		success = false;
	}
	if (success) {
		response.setStatus(200);
	} else {
		response.setStatus(400);
	}
%>

