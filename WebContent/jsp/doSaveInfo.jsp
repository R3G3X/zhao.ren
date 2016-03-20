<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/jsp/doLogin_required.jsp"%>
<%
	//int id, String username, String oldpass, String password, String realname, String intro,
	//String tech_intro, String phone, String email, String major

	if (db.user_edit(id, request.getParameter("username"), request.getParameter("pre-pass"),
			request.getParameter("now-pass"), request.getParameter("name"), request.getParameter("describe"),
			request.getParameter("tech-info"), request.getParameter("phone"),
			request.getParameter("mail"), request.getParameter("major"))) {
		response.setStatus(200);
	} else {
		response.setStatus(400);
	}
%>