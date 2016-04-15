<%@page import="java.net.URLDecoder"%>
<%@page import="zhao_ren_db.db_connector"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%-- <%@ include file="/jsp/doLogin_required.jsp"%> --%>
<%
	ResultSet cret = db.get_all_chat_person(id);
	int ccid = 0;
	while (cret.next()) {
		ccid++;
		int uid = cret.getInt("to_id");
		String doc = "<li class=\"chatroom-left-userlist-item item-" + ((ccid == 1) ? "" : "de")
				+ "activated\"><a class=\"id\">";
		doc += db.username(uid);
		doc += "</a><input class=\"userId\" type=\"hidden\" value=\"";
		doc += uid;
		doc += "\"><a class=\"btn-delete\">×</a></li>";
		out.print(doc);
	}
%>