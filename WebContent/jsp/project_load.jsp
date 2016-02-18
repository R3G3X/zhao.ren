<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
    String courseId = request.getParameter("courseId");
    String courseName = "";
    String teacherName = "";
    String describe = "";
    String evalVal = "";
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
    .executeQuery("select * from class where class_id = \'"
        + courseId
        + "\'");
    if(rs.next()){
        courseName = rs.getString("class_name");
        teacherName = rs.getString("teacher");
        describe = rs.getString("class_des");
        evalVal = rs.getString("good_eval");
    }else{
      response.setStatus(402);//course not exist
    }
%>
