<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
    String projectId;
    String projectName;
    String creatorName;
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
        projectId = rs.getString("class_id");
        projectName = rs.getString("class_name");
        creatorName = rs.getString("teacher");
        describe = rs.getString("class_des");
        evalVal = rs.getString("good_eval");
        evalNum = rs.getString("total_eval");

        innerHtml += "<div class=\"content-item\"><div class=\"text\"><h3>";
        innerHtml += projectName;
        innerHtml += "</h3>";
        innerHtml += "<input type=\"hidden\" value=\"";
        innerHtml += projectId;
        innerHtml += "\"class=\"name\"/>";
        innerHtml +="<p>";
        innerHtml += describe;
        innerHtml += "</p></div><p class=\"btn-container\"><a class=\"btn-select select-btn\"  data-toggle=\"modal\" data-target=\"#modal-vote\">Vote</a></p><p class=\"result\"><a href=\"#\">";
        innerHtml += evalNum;
        innerHtml += "</a> people voted</p></div>";
    }
%>
