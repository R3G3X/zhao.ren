<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 为 first_name 和 last_name设置cookie      
	Cookie firstName = new Cookie("first_name", "123");
	Cookie lastName = new Cookie("last_name", "456");

	// 设置cookie过期时间为24小时。
	firstName.setMaxAge(60 * 60 * 24);
	lastName.setMaxAge(60 * 60 * 24);
	
	// 在响应头部添加cookie
	response.addCookie(firstName);
	response.addCookie(lastName);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   Cookie cookie = null;
   Cookie[] cookies = null;
   // 获取cookies的数据,是一个数组
   cookies = request.getCookies();
   if( cookies != null ){
      out.println("<h2> Found Cookies Name and Value</h2>");
      for (int i = 0; i < cookies.length; i++){
         cookie = cookies[i];
         out.print("Name : " + cookie.getName( ) + ",  ");
         out.print("Value: " + cookie.getValue( )+" <br/>");
      }
  }else{
      out.println("<h2>No cookies founds</h2>");
  }
%>
</body>
</html>