<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="zhao_ren_db.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<div class="grey-3">
	<div class="clearfix">
		<div class="white clearfix">
			<div id="content" class="clearfix">
				<%
					ResultSet ret = db.index_project_qry();
					while (ret.next()) {
						String div = String.format(
								"<div class=\"content-item\" id=\"%s\"><div class=\"text\"><h3>%s</h3><input type=\"hidden\" value=\"14\" class=\"name\"><p>%s</p></div><p class=\"btn-container\"><a class=\"btn-select select-btn\" data-toggle=\"modal\" data-target=\"#modal-vote\">Join</a></p><p class=\"result\"><a href=\"#\">%s</a> people at this project</p></div>",
								ret.getString("id"),ret.getString("name"), ret.getString("intro"), ret.getString("people"));
						out.print(div);
					}
				%>
			</div>
		</div>
	</div>
</div>