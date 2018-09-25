<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册失败</title>
<meta http-equiv="refresh" content="4; url=01/ex/register.html">
</head>  
  <body>
    <font size="6">用户名：</font>
    <font size="7" color="red"><%=(String)session.getAttribute("username")%></font><font size="6">  已存在！</font><br>
    <font size="6">4秒后将重新返回登录界面</font> <br>
   </body>
</html>