<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<center>
<%if((boolean)session.getAttribute("rs")==true){ %>
<h3>删除成功，</h3>
<%}else{ %>
<h3>删除失败，</h3>
<%} %>
<h3><a href="2Control/environments/environment.jsp" target="_parent">点击此处刷新表格信息</a></h3>
</center>
</body>
</html>