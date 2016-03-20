<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/jsp/doLogin_required.jsp"%>
<%
	int user = Integer.parseInt(request.getParameter("member"));
	int pid = Integer.parseInt(request.getParameter("pid"));
	if (db.project_leave(id, user, pid, true)) {
		out.print("<script>alert('已经移除此名成员')</script>");
	} else {
		out.print("<script>alert('移除失败！可能的原因:\\n您不能移除您自己')</script>");
	}
%>
<script language="JavaScript">
  window.location = "../html/user/personalCenter-project.jsp";
</script>
