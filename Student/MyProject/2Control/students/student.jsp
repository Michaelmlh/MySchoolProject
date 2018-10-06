<!DOCTYPE html>
<%@page import="db.DBUtils"%>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="entity.*" %>
<%@ page import="java.util.List" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/body.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/table.css">
<title>student</title>
<style type="text/css">
div{
	overflow: auto;
}
body{
	position: relative;
	
}
.buton{
	display: inline-block;
	position: relative;
	
}

</style>
</head>
<body>
<% Limit user=((Limit)session.getAttribute("user"));%>

<%if(user.canDo(1)){//仅系统管理员可查看 %>
<div class="buton"><form action="register.jsp"><input type="submit" value="注册新学生"></form></div>
<%} %>
<table border="1" align="center" width="100%" cellpadding="0" cellspacing="0">
  	<caption>
    	<H2>学生信息管理</H2>
  	</caption>
  	<tr>
    	 <th bgcolor="#A9D0F5" scope="col">学号</th>
   		 <th bgcolor="#A9D0F5" scope="col">姓名</th>
		 <th bgcolor="#A9D0F5" scope="col">联系方式</th>
		 <%if(user.canDo(1)){//仅系统管理员可查看 %>
		 	<th bgcolor="#A9D0F5" scope="col">操作</th>
		 <%} %>
 	 </tr>
	<% 
			request.setCharacterEncoding("utf-8");
    		String sql="select * from dbo.Student";
			//执行查询，得到结果集list<Student>		
			List<Student> stu=DBUtils.getListData(Student.class, sql);
			//判断结果是否为空
	    	for(Student t:stu){// i=0;rs.next();i++%>
				<tr>
					<td height="22" align="center"><%=t.getStudentid()%></td>
					<td height="22" align="center"><%=t.getName()%></td>
					<td height="22" align="center"><%=t.getContactway()%></td>
					<%if(user.canDo(1)){//仅系统管理员可操作 %>
					<td height="22" align="center">
						<!-- <div class="buton"> --><form action="update.jsp?no=<%=t.getStudentid()%>" method="post"><input class="tablebutton" type="submit" value="详情"></form><!-- </div> -->
						
					</td>
					<%} %>
				</tr>
	<%		} %>
</table>

</body>
</html>