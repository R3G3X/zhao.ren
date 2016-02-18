<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
    String username = "";
    Cookie[] cookies = request.getCookies();
    for (int i = 0; i < cookies.length; i++){
        Cookie cookie = cookies[i];
        if(cookie.getName().equals("userid")){
            username = cookie.getValue();
        }
    }
%>
