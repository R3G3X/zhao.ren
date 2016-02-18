<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
    String courseId;
    String courseName;
    String teacherName;
    String describe;
    String evalVal;
    String evalNum;
    String innerHtml = "";
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
    .executeQuery("select * from class");
    while(rs.next()){
        courseId = rs.getString("class_id");
        courseName = rs.getString("class_name");
        teacherName = rs.getString("teacher");
        describe = rs.getString("class_des");
        evalVal = rs.getString("good_eval");
        evalNum = rs.getString("total_eval");

        innerHtml += "<div class=\"content-item\"><div class=\"text\"><h3>";
        innerHtml += courseName;
        innerHtml += "</h3>";
        innerHtml += "<input type=\"hidden\" value=\"";
        innerHtml += courseId;
        innerHtml += "\"class=\"name\"/>";
        innerHtml +="<p>";
        innerHtml += describe;
        innerHtml += "</p></div><p class=\"btn-container\"><a class=\"btn-select delete-btn\">删除</a></p><p class=\"result\"><a href=\"#\">";
        innerHtml += evalNum;
        innerHtml += "</a> people voted</p></div>";
    }
%>
