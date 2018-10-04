<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="db.Db"%>
<%@ page import="entity.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班级信息管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/body.css">
<style type="text/css">
div{
	overflow: auto;
}

.buton{
	display: inline-block;
	position: relative;
	
}
</style>
</head>
<body>
<% 权限 user=((权限)session.getAttribute("user"));%>
<table border="1" align="center" width="100%" cellpadding="0" cellspacing="0">
  	<caption>
    	<H2>班级信息管理</H2>
  	</caption>
  	<tr>
    	 <th bgcolor="#A9D0F5" scope="col">班号</th>
   		 <th bgcolor="#A9D0F5" scope="col">班名</th>
		 <%if(user.canDo(1)){//仅系统管理员可查看 %>
		 	<th bgcolor="#A9D0F5" scope="col">操作</th>
		 <%} %>
 	 </tr>
	<% 
            Db conn=new Db();
	   		request.setCharacterEncoding("utf-8");
    		String strSql="";
			ResultSet rs=null;
			strSql="select * from dbo.班级";
			//执行查询，查询语句strSql是该方法的参数			
	    	 rs=conn.executeQuery(strSql);
			//判断结果是否为空
	    	for(int i=0;rs.next();i++){%>
				<tr>
					<td height="22" align="center"><%=rs.getString("班号")+""%></td>
					<td height="22" align="center"><%=rs.getString("班名")+""%></td>
					<%if(user.canDo(1)){//仅系统管理员可操作 %>
					<td height="22" align="center">
						<a class="tablebutton" style="height: 22px;font-size: 16px;" href="${pageContext.request.contextPath }/2Control/classes/update.jsp?no=<%=rs.getString("班号")%>">修改</a>
						<a class="tablebutton" style="height: 22px;font-size: 16px;" href="${pageContext.request.contextPath }/DelCla?no=<%=rs.getString("班号")%>">删除</a>
					</td>
					<%} %>
				</tr>
	<%		} //while%>
</table>

<%if(user.canDo(1)){//仅系统管理员可查看 %>
<div class="buton"><form action="${pageContext.request.contextPath }/2Control/classes/register.jsp"><input type="submit" value="注册新班级"></form></div>
<%} %>



</body>
</html>