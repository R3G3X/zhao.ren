<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="java.sql.*"%>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  try {
    String username=request.getParameter("username");
    String courseId = request.getParameter("courseId");
    String postStatus = request.getParameter("postStatus");
    Connection con;
    Statement stmt;
    int row;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    String dbUrl = "jdbc:mysql://127.0.0.1:3306/eval_db";
    String dbUser = "root";
    String dbPwd = "0000";

    con = java.sql.DriverManager.getConnection(dbUrl, dbUser, dbPwd);
    stmt = con.createStatement();
    rs=stmt.executeQuery("select * from class where class_id="+courseId);
    if (rs.next()){
        if(postStatus.compareTo("0") == 0){
          row = stmt.executeUpdate("update class set total_eval=total_eval+1 where class_id="+courseId);
          row = stmt.executeUpdate("update class set good_eval=good_eval+1 where class_id="+courseId);
          stmt.executeUpdate("update class set has_eval=concat(has_eval,\'\""+username+"\"\') where class_id="+courseId);

          response.setStatus(200);
        }
        if(postStatus.compareTo("1") == 0){
          row = stmt.executeUpdate("update class set total_eval=total_eval+1 where class_id="+courseId);
          row = stmt.executeUpdate("update class set good_eval=good_eval-1 where class_id="+courseId);
          response.setStatus(200);
          stmt.executeUpdate("update class set has_eval=concat(has_eval,\'\""+username+"\"\') where class_id="+courseId);

        }
    }
  }catch (Exception e) {
    out.println(e.getMessage());
  }
%>
<title>在此处插入标题</title>
</head>
<body>

</body>
</html>
