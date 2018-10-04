<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="db.Db"%>
<%@ page import="entity.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>class</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/body.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/table.css">
</head>
<body>
<% 权限 user=((权限)session.getAttribute("user"));%> 

<table border="1" align="center" width="100%" cellpadding="0" cellspacing="0">
  	<caption>
    	<H2>宿舍信息管理</H2>
  	</caption>
  	<tr>
    	 <th bgcolor="#A9D0F5" scope="col">宿舍号</th>
   		 <th bgcolor="#A9D0F5" scope="col">宿舍容量</th>
		 <%if(user.canDo(1)){//仅系统管理员可查看 %>
		 	<th bgcolor="#A9D0F5" scope="col">操作</th>
		 <%} %>
 	 </tr>
	<% 
            Db conn=new Db();
	   		request.setCharacterEncoding("gb2312");
    		String strSql="";
			ResultSet rs=null;
			strSql="select * from dbo.宿舍";
			//执行查询，查询语句strSql是该方法的参数			
	    	 rs=conn.executeQuery(strSql);
			//判断结果是否为空
	    	for(int i=0;rs.next();i++){%>
				<tr>
					<td height="22" align="center"><%=rs.getString("宿舍号")+""%></td>
					<td height="22" align="center"><%=rs.getString("人数")+""%></td>
					<%if(user.canDo(1)){//仅系统管理员可操作 %>
					<td height="22" align="center">
						<form style="display: inline-block; margin-top: 0px;margin-bottom: 0px;" action="${pageContext.request.contextPath }/2Control/rooms/update.jsp?no=<%=rs.getString("宿舍号")%>" method="post"><input class="tablebutton" type="submit" value="修改"></form>
						<form style="display: inline-block; margin-top: 0px;margin-bottom: 0px;" action="${pageContext.request.contextPath }/DelRom?no=<%=rs.getString("宿舍号")%>" method="post"><input class="tablebutton" type="submit" value="删除"></form>
					</td>
					<%} %>
				</tr>
	<%		} //while%>
</table>
<%if(user.canDo(1)){//仅系统管理员可查看 %>
<div class="buton"><form action="${pageContext.request.contextPath }/2Control/rooms/register.jsp" ><input type="submit" value="注册新宿舍"></form></div>
<%} %>

</body>
</html>