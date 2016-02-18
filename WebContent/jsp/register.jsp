<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="java.sql.*"%>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  try {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
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
    row = stmt.executeUpdate("insert into user(u_name,password) values(\""+username+"\",\""+password+"\")");
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
