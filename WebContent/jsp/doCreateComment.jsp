<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
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
		if (msg.equals("")) {
			throw (new Exception());
		}
		int pre_id = 0;
		try {
			int begin = msg.indexOf("回复");
			int end = msg.indexOf("楼");
			String s = msg.substring(begin + 2, end);
			pre_id = Integer.parseInt(s);
		} catch (Exception e) {
			pre_id = 0;
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

