<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
    String projectId;
    String username = "";

    Cookie[] cookies = request.getCookies();
    for (int i = 0; i < cookies.length; i++){
        Cookie cookie = cookies[i];
        if(cookie.getName().equals("userid")){
            username = cookie.getValue();
        }
    }
    String projectName;
    String creatorName;
    String describe;
    String evalVal;
    String evalNum;
    String innerHtml = "";
    Connection con;
    Statement stmt;
    ResultSet rs;
    ResultSet rs_1;
    Class.forName("com.mysql.jdbc.Driver");
    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    String dbUrl = "jdbc:mysql://127.0.0.1:3306/zhao_ren";
    String dbUser = "root";
    String dbPwd = "zhao.ren.admin";
    con = java.sql.DriverManager.getConnection(dbUrl, dbUser, dbPwd);
    stmt = con.createStatement();
    rs = stmt
    .executeQuery("select * from class");
    for (int i = 0; i < 6; i ++){
        if(rs.next()){
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
            if(rs.getString("has_eval").indexOf("\""+username+"\"") != -1 && username != null && username != ""){
                innerHtml += "</p></div><p class=\"btn-container\"><a class=\"btn-select select-btn\">Joined</a></p><p class=\"result\"><a href=\"#\">";
            }else{
                innerHtml += "</p></div><p class=\"btn-container\"><a class=\"btn-select select-btn\"  data-toggle=\"modal\" data-target=\"#modal-vote\">Join</a></p><p class=\"result\"><a href=\"#\">";
            }
            innerHtml += evalNum;
            innerHtml += "</a> people at this project</p></div>";
        }
    }
%>
