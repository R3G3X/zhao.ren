<%@page import="java.net.URLDecoder"%>
<%@page import="zhao_ren_db.db_connector"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
	int pages = 1;
	String keyword = "";
	String par = request.getParameter("pages");
	keyword = request.getParameter("s");
	String method = request.getParameter("method");
	String crew = request.getParameter("crew");
	String cycle = request.getParameter("cycle");
	if (par != null) {
		try {
			pages = Integer.parseInt(par);
		} catch (Exception e) {

		}
	}
	ResultSet set;
	int all_pages;
	if (keyword != null) {
		//java.net.URLDncoder.decode(keyword,"utf-8");
		//keyword = keyword.replace("\\\\u", "\\u");
		String decode = URLDecoder.decode(keyword, "UTF-8");
		set = db.project_list(pages, decode,method,crew,cycle);
		all_pages = db.all_pages(decode, crew, cycle);
	} else {
		keyword = "";
		set = db.project_list(pages);
		all_pages=db.all_pages();
	}
	//int all_pages = db.all_pages(keyword);
	String div ="<div class=\"sort-list-wrapper\"><ul id=\"method\" class=\"sort-list\"><li id=\"visits,id\" class=\"sort-list-item";
	if (method.equals("visits,id")){
		div += " sort-list-item-active\"><a>综合排序</a></li><li id=\"visits\" class=\"sort-list-item\"><a>最多点击</a></li><li id=\"id\" class=\"sort-list-item\"><a>最新发布</a></li></ul>";
	}else if(method.equals("visits")){
		div += "\"><a>综合排序</a></li><li id=\"visits\" class=\"sort-list-item sort-list-item-active\"><a>最多点击</a></li><li id=\"id\" class=\"sort-list-item\"><a>最新发布</a></li></ul>";
	}else if(method.equals("id")){
		div += "\"><a>综合排序</a></li><li id=\"visits\" class=\"sort-list-item\"><a>最多点击</a></li><li id=\"id\" class=\"sort-list-item sort-list-item-active\"><a>最新发布</a></li></ul>";
	}
	div += "<ul id=\"crew\" class=\"sort-list\"><li id=\"1000\" class=\"sort-list-item";
	if (crew.equals("1000")){
		div += " sort-list-item-active\"><a>全部人数</a></li><li id=\"3\" class=\"sort-list-item\"><a>2人</a></li><li id=\"5\" class=\"sort-list-item\"><a>5人以下</a></li><li id=\"10\" class=\"sort-list-item\"><a>10人以下</a></li></ul>";
	}else if(crew.equals("2")){
		div += "\"><a>全部人数</a></li><li id=\"3\" class=\"sort-list-item sort-list-item-active\"><a>2人</a></li><li id=\"5\" class=\"sort-list-item\"><a>5人以下</a></li><li id=\"10\" class=\"sort-list-item\"><a>10人以下</a></li></ul>";
	}else if(crew.equals("5")){
		div += "\"><a>全部人数</a></li><li id=\"3\" class=\"sort-list-item\"><a>2人</a></li><li id=\"5\" class=\"sort-list-item sort-list-item-active\"><a>5人以下</a></li><li id=\"10\" class=\"sort-list-item\"><a>10人以下</a></li></ul>";
	}else if(crew.equals("10")){
		div += "\"><a>全部人数</a></li><li id=\"3\" class=\"sort-list-item\"><a>2人</a></li><li id=\"5\" class=\"sort-list-item\"><a>5人以下</a></li><li id=\"10\" class=\"sort-list-item sort-list-item-active\"><a>10人以下</a></li></ul>";
	}
	div += "<ul id=\"cycle\" class=\"sort-list\"><li id=\"1001\" class=\"sort-list-item";
	if (cycle.equals("1001")){
		div +=" sort-list-item-active\"><a>全部周期</a></li><li id=\"7\" class=\"sort-list-item\"><a>7天</a></li><li id=\"15\" class=\"sort-list-item\"><a>15天</a></li><li id=\"20\" class=\"sort-list-item\"><a>20天</a></li></ul></div>";
	}else if(cycle.equals("7")){
		div +="\"><a>全部周期</a></li><li id=\"7\" class=\"sort-list-item sort-list-item-active\"><a>7天</a></li><li id=\"15\" class=\"sort-list-item\"><a>15天</a></li><li id=\"20\" class=\"sort-list-item\"><a>20天</a></li></ul></div>";
	}else if(cycle.equals("15")){
		div +="\"><a>全部周期</a></li><li id=\"7\" class=\"sort-list-item\"><a>7天</a></li><li id=\"15\" class=\"sort-list-item sort-list-item-active\"><a>15天</a></li><li id=\"20\" class=\"sort-list-item\"><a>20天</a></li></ul></div>";
	}else if(cycle.equals("20")){
		div +="\"><a>全部周期</a></li><li id=\"7\" class=\"sort-list-item\"><a>7天</a></li><li id=\"15\" class=\"sort-list-item\"><a>15天</a></li><li id=\"20\" class=\"sort-list-item sort-list-item-active\"><a>20天</a></li></ul></div>";
	}
	String base = request.getContextPath();
	if (set.next()){
		div += "<div class=\"project-list-box\" id = \"" + set.getString("id") + "\">";
		div += "<div class=\"project-list-img\"><img src=\"";
		div += base + "\\project\\" + set.getString("image");
		div += "\"></div><div class=\"project-list-info\">";
		div += "<h3>" + set.getString("name") + "</h3>";
		div += "<p>" + set.getString("intro") + "</p>";
		div += "<div class=\"project-list-skill clearfix\">";
		div += "";
		div += "</div></div><div class=\"project-list-creator clearfix\">";
		div += "<img class=\"project-list-creator-avatar img-circle\" src=\"";
		div += base + "\\avatar\\";
		ResultSet p = db.userInfo(Integer.parseInt(set.getString("founder_id")));
		p.next();
		div += p.getString("avatar");
		div += "\"><a class=\"project-list-creator-username\" href=\"../user/user.jsp?id=" + p.getString("id")
				+ "\">";
		div += p.getString("username");
		div += "</a><a class=\"project-list-creator-count\" href=\"\">";
		div += db.count_project_num(set.getInt("id")) + "/" + set.getString("require_num");
		div += "</a> <img class=\"project-list-creator-number\" src=\"../../img/person.png\"><h6 class=\"project-list-date\">";
		div += set.getString("create_time");
		div += "</h6></div></div>";
		out.print(div);
		while (set.next()) {
			div = "<div class=\"project-list-box\" id = \"" + set.getString("id") + "\">";
			div += "<div class=\"project-list-img\"><img src=\"";
			div += base + "\\project\\" + set.getString("image");
			div += "\"></div><div class=\"project-list-info\">";
			div += "<h3>" + set.getString("name") + "</h3>";
			div += "<p>" + set.getString("intro") + "</p>";
			div += "<div class=\"project-list-skill clearfix\">";
			div += "";
			div += "</div></div><div class=\"project-list-creator clearfix\">";
			div += "<img class=\"project-list-creator-avatar img-circle\" src=\"";
			div += base + "\\avatar\\";
			p = db.userInfo(Integer.parseInt(set.getString("founder_id")));
			p.next();
			div += p.getString("avatar");
			div += "\"><a class=\"project-list-creator-username\" href=\"../user/user.jsp?id=" + p.getString("id")
					+ "\">";
			div += p.getString("username");
			div += "</a><a class=\"project-list-creator-count\" href=\"\">";
			div += db.count_project_num(set.getInt("id")) + "/" + set.getString("require_num");
			div += "</a> <img class=\"project-list-creator-number\" src=\"../../img/person.png\"><h6 class=\"project-list-date\">";
			div += set.getString("create_time");
			div += "</h6></div></div>";
			out.print(div);
		}
	}else{
		div += "<p style=\"text-align:center; font-size:30px; font-weight: bold; color:#C5C5C5;width: 100%; margin-left:-15px; margin-top: 40px;\">啊呀，什么都没有呢╮(╯▽╰)╭</p>";
		out.print(div);
	}
	
%>