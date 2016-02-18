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
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    String dbUrl = "jdbc:mysql://127.0.0.1:3306/eval_db";
    String dbUser = "root";
    String dbPwd = "0000";
    con = java.sql.DriverManager.getConnection(dbUrl, dbUser, dbPwd);
    stmt = con.createStatement();
    rs = stmt
    .executeQuery("select username from user where u_name = \'"
        + username
        + "\'");
    if(rs.next()){
      rs = stmt
        .executeQuery("select username from user where u_name = \'"
            + username
            + "\' and password =\'"
            + password
            + "\'");
      if (rs.next()) {
        response.setStatus(200);//success
      } else {
        response.setStatus(400);//password error
      }
    }else{
      response.setStatus(401);//username not exist
    }
  } catch (Exception e) {
    out.println(e.getMessage());
  }
%>
<title>在此处插入标题</title>
</head>
<body>

</body>
</html>
