<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="doLogin_required.jsp"%>
<%
	//int id, int pid, String name, String intro, int require_num, int round_time,
	//String detail
	String pid = request.getParameter("pid");
	String name = request.getParameter("name");
	String num = request.getParameter("num");
	String time = request.getParameter("time");
	String intro = request.getParameter("intro");
	String detail = request.getParameter("detail");
	String techs = request.getParameter("techs");
	detail = detail.replace("\n", "\\\\n");
	detail = detail.replace("\"", "\\\\\\\"");
	System.out.println(techs);
	try {
		if (db.project_info_edit(id, Integer.parseInt(pid), name, intro, Integer.parseInt(num), Integer.parseInt(time), detail)) {
			if (db.add_project_tech(Integer.valueOf(pid), techs))
					response.setStatus(200);
			else
				response.setStatus(400);
		} else {
			response.setStatus(400);
		}
	} catch (Exception e) {
		e.printStackTrace();
		response.setStatus(400);
	}
%>
