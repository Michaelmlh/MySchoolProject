<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.jsp.servlet.Answer" %>
<%@ page import="entity.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%Answer answer=(Answer)session.getAttribute("answer"); 
if(!answer.getStu().isEmpty()){//有查询结果
	ArrayList<学生> stu=answer.getStu();
	ArrayList<班级> clas=answer.getClas();
	if(clas.isEmpty()){//查询宿舍信息
%>
	<table width="600" border="1" align="center">
  	<caption>
    	<H5>批量查询&nbsp;按 宿舍 查询 <%=stu.get(0).getRoomNo() %>号宿舍信息</H5>
  	</caption>
  	<tr> 
    	 <th bgcolor="#A9D0F5" scope="col">宿舍号</th>
   		 <th bgcolor="#A9D0F5" scope="col">学号</th>
		 <th bgcolor="#A9D0F5" scope="col">姓名</th>
		 <th bgcolor="#A9D0F5" scope="col">联系方式</th>
		 <th bgcolor="#A9D0F5" scope="col">班号</th>
		 <th bgcolor="#A9D0F5" scope="col">床位号</th>
 	 </tr>
<%for(学生 temp:stu){%>
	<tr>
		<td height="22" align="center"><%=temp.getRoomNo()%></td>
		<td height="22" align="center"><%=temp.getNo() %></td>
		<td height="22" align="center"><%=temp.getName()%></td>
		<td height="22" align="center"><%=temp.getPhoneNumber()%></td>
		<td height="22" align="center"><%=temp.getClassNo()%></td>
		<td height="22" align="center"><%=temp.getBedNo() %></td>
	</tr>
<%}%>
</table>
<%	}else{//查询班级信息 %>
	<table width="80%" border="1" align="center">
  	<caption>
    	<H5>批量查询&nbsp;按 班级 查询 <%=clas.get(0).getClassNo() %>号班级信息</H5>
  	</caption>
  	<tr>
    	 <th bgcolor="#A9D0F5" scope="col">班名</th>
   		 <th bgcolor="#A9D0F5" scope="col">学号</th>
		 <th bgcolor="#A9D0F5" scope="col">姓名</th>
		 <th bgcolor="#A9D0F5" scope="col">入学年份</th>
		 <th bgcolor="#A9D0F5" scope="col">联系方式</th>
		 <th bgcolor="#A9D0F5" scope="col">宿舍号</th>
		 <th bgcolor="#A9D0F5" scope="col">床位号</th>
 	 </tr>
	<%for(int i=0;i<stu.size();i++){%>
		<tr>
			<td height="22" align="center"><%=clas.get(i).getClassName()%></td>
			<td height="22" align="center"><%=stu.get(i).getNo() %></td>
			<td height="22" align="center"><%=stu.get(i).getName()%></td>
			<td height="22" align="center"><%=stu.get(i).getIntoDate()%></td>
			<td height="22" align="center"><%=stu.get(i).getPhoneNumber()%></td>
			<td height="22" align="center"><%=stu.get(i).getRoomNo()%></td>
			<td height="22" align="center"><%=stu.get(i).getBedNo()%></td>
		</tr>
	<%}
	%>
</table>	
<%	} %>
<%}else{ %>
<h4 align="center">无查询结果,<a href="bulkQuery.html" target="main">点击返回查询</a></h4>
<%} %>
</body>
</html>