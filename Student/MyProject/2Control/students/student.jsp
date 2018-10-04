<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="db.Db"%>
<%@ page import="entity.*" %>
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
<% 权限 user=((权限)session.getAttribute("user"));%>

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
            Db conn=new Db();
	   		request.setCharacterEncoding("utf-8");
    		String strSql="";
			ResultSet rs=null;
			strSql="select * from dbo.学生";
			//执行查询，查询语句strSql是该方法的参数			
	    	 rs=conn.executeQuery(strSql);
			//判断结果是否为空
	    	for(int i=0;rs.next();i++){%>
				<tr>
					<td height="22" align="center"><%=rs.getString("学号")+""%></td>
					<td height="22" align="center"><%=rs.getString("姓名")+""%></td>
					<td height="22" align="center"><%=rs.getString("联系方式")+""%></td>
					<%if(user.canDo(1)){//仅系统管理员可操作 %>
					<td height="22" align="center">
						<!-- <div class="buton"> --><form action="update.jsp?no=<%=rs.getString("学号")%>" method="post"><input class="tablebutton" type="submit" value="详情"></form><!-- </div> -->
						
					</td>
					<%} %>
				</tr>
	<%		} %>
</table>

</body>
</html>