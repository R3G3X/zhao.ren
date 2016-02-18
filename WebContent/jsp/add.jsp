<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="java.sql.*"%>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  try {
    String className = request.getParameter("className");
    String teacherName = request.getParameter("teacherName");
    String describe = request.getParameter("describe");
    Connection con;
    Statement stmt;
    int row;
    Class.forName("com.mysql.jdbc.Driver");
    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    String dbUrl = "jdbc:mysql://127.0.0.1:3306/eval_db";
    String dbUser = "root";
    String dbPwd = "0000";
    con = java.sql.DriverManager.getConnection(dbUrl, dbUser, dbPwd);
    stmt = con.createStatement();
    row = stmt.executeUpdate("insert into class(class_name,class_des,total_eval,good_eval,teacher) values(\""+className+"\",\""+describe+"\",0,0,\""+teacherName+"\")");
    response.setStatus(200);
  } catch (Exception e) {
    out.println(e.getMessage());
  }
%>
<title>在此处插入标题</title>
</head>
<body>

</body>
</html>
