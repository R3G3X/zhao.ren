<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="zhao_ren_db.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需要登录</title>
<%response.setStatus(401); %>
</head>
<script language="javascript">
          alert("清先登录！");
          top.location='index.jsp';
   </script>
<body>

</body>
</html>