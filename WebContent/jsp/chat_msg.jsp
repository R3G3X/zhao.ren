<%@page import="java.net.URLDecoder"%>
<%@page import="zhao_ren_db.db_connector"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%-- <%@ include file="/jsp/doLogin_required.jsp"%> --%>
<%
	ResultSet msgret = db.get_all_chat_person(id);
	int msgcnt = 0;
	while (msgret.next()) {
		msgcnt++;
		int uid = msgret.getInt("to_id");
		String doc = "<div id=\"target-message-" + uid + "\" class=\"target-message "
				+ (msgcnt == 1 ? "" : "hidden") + "\"></div>";
		out.print(doc);
	}
%>