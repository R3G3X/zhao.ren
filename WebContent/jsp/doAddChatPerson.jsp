<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="zhao_ren_db.db_connector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/jsp/doLogin_required.jsp"%>
<%
	if (logined) {
		boolean success = true;
		int to = Integer.parseInt(request.getParameter("to"));
		db.add_chat_person(id, to);
		db.add_chat_person(to, id);
		response.setStatus(200);
	} else {
		response.setStatus(401);
	}
%>

