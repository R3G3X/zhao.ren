<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pages = 1;
	String par = request.getParameter("pages");
	if(par!=null){
		try{
			pages = Integer.parseInt(par);
		}catch(Exception e){
			
		}
	}
	ResultSet set = db.project_list(pages);
	String base = request.getContextPath();
	while(set.next()){
		String div = "<div class=\"project-list-box\" id = \""+set.getString("id")+"\">";
		div+="<div class=\"project-list-img\"><img src=\"";
		div+=base+"\\project\\"+set.getString("image");
		div+="\"></div><div class=\"project-list-info\">";
		div+="<h3>"+set.getString("name")+"</h3>";
		div+="<p>"+set.getString("intro")+"</p>";
		div+="<div class=\"project-list-skill clearfix\">";
		div+="";
		div+="</div></div><div class=\"project-list-creator clearfix\">";
		div+="<img class=\"project-list-creator-avatar img-circle\" src=\"";
		div+=base+"\\avatar\\";
		ResultSet p=db.userInfo(Integer.parseInt(set.getString("founder_id")));
		p.next();
		div+=p.getString("avatar");
		div+="\"><a class=\"project-list-creator-username\" href=\"../user/user.jsp?id="+p.getString("id")+"\">";
		div+=p.getString("username");
		div+="</a><a class=\"project-list-creator-count\" href=\"\">";
		div+=set.getString("require_num");
		div+="</a> <img class=\"project-list-creator-number\" src=\"../../img/person.png\"><h6 class=\"project-list-date\">";
		div+=set.getString("create_time");
		div+="</h6></div></div>";
		out.print(div);
	}
%>