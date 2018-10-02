<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>    
    <title>登录失败</title> 
	<meta http-equiv="refresh" content="10; url=/01/login.jsp">
  </head>  
  <body>
    <font size="6">对不起， </font>
    <font size="7" color="red"><%=(String)session.getAttribute("username")%></font><font size="6">!</font><br>
    <font size="6">请您确认用户名和密码!</font> <br>
   </body>
</html>
