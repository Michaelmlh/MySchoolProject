<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.jsp.servlet.Answer" %>
<%@ page import="entity.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%Answer answer=(Answer)session.getAttribute("answer"); 
if(!answer.getEn().isEmpty()){//有查询结果
	ArrayList<宿舍卫生> en=answer.getEn();
%>
	<table width="600" border="1" align="center">
  	<caption>
    	<H5>统计查询&nbsp;按 <%=session.getAttribute("project") %> <%=session.getAttribute("order") %>查询前 <%=session.getAttribute("discribe")%>条信息</H5>
  	</caption>
  	<tr>
    	 <th bgcolor="#A9D0F5" scope="col">宿舍号</th>
   		 <th bgcolor="#A9D0F5" scope="col"><%=session.getAttribute("project") %></th>
 	 </tr> 
<%for(宿舍卫生 temp:en){%>
	<tr>
		<td height="22" align="center"><%=temp.getRoomNo()%></td>
		<td height="22" align="center"><%=temp.getNote() %></td>
	</tr>
<%}%>
</table>
<%}else{ %>
	
<%}%>
</body>
</html>