<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>登录成功</title>
  </head>  
  <body>
	  <font size="6">欢迎</font>
	  <font size="7" color="red"><%=(String)session.getAttribute("username")%></font>
	  <font size="6"> 使用本系统!</font> <br>
  </body>
</html>
