<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!String btn(int mid, int p) {
		String href = "?mid=" + mid + "&p=" + p;
		return href;
	}%>
<%
	boolean msg_process = true;
	try {
		int mmid = Integer.parseInt(request.getParameter("mid"));
		int p = Integer.parseInt(request.getParameter("p"));
		db.processing_msg(mmid, p, id);
	} catch (Exception e) {
		msg_process = false;
	}

	ResultSet mset = db.user_message(id);
	while (mset.next()) {
		int mid = mset.getInt("id");
		String doc = "<div class=\"personal-center-message clearfix\"><div class=\"personal-center-message-avatar\"><img class=\"personal-center-message-avatar-img\"\r\n"
				+ " src=\"" + request.getContextPath() + "/avatar/";
		int sender_id = mset.getInt("sender_id");
		if (sender_id == -1) {
			sender_id = id;
		}
		ResultSet p = db.userInfo(sender_id);
		p.next();
		doc += p.getString("avatar");
		doc += "\" alt=\"\">";
		doc += "</div><div class=\"personal-center-message-item\"><p class=\"personal-center-message-message\">";
		doc += mset.getString("message");
		doc += "</p></div><div class=\"personal-center-message-agreement\">";
		if (mset.getInt("needConfirm") == 1) {
			doc += "<a class=\"personal-center-message-agree\" href=\"";
			doc += btn(mid, 1) + "\">";
			doc += "同意</a>";
			doc += "<a class=\"personal-center-message-disagree\" href=\"";
			doc += btn(mid, 0) + "\">";
			doc += "拒绝</a>";
		} else {
			doc += "<a class=\"personal-center-message-agree\" href=\"";
			doc += btn(mid, -1) + "\">";
			doc += "好</a>";
		}
		doc += "</div></div>";
		out.print(doc);
	}
%>