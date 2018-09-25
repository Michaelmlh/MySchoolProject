<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="db.Db"%>
<%@ page import="entity.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>student</title>
<style type="text/css">
div{
	overflow: auto;
}
body{
	height: 750px;
	position: relative;
}
.buton{
	display: inline-block;
	position: relative;
	top: 10px;
}
</style>
</head>
<body>
<% 权限 user=((权限)session.getAttribute("user"));%>
<div style="width: 100%;height: 100%;">
<div  style="width: 100%;height: 50%;"> 
<table border="1" align="center" width="100%">
  	<caption>
    	<H2>学生信息管理</H2>
  	</caption>
  	<tr>
    	 <th bgcolor="#A9D0F5" scope="col">学号</th>
   		 <th bgcolor="#A9D0F5" scope="col">姓名</th>
		 <th bgcolor="#A9D0F5" scope="col">性别</th>
		 <th bgcolor="#A9D0F5" scope="col">出生日期</th>
		 <th bgcolor="#A9D0F5" scope="col">民族</th>
		 <th bgcolor="#A9D0F5" scope="col">入学年份</th>
		 <th bgcolor="#A9D0F5" scope="col">联系方式</th>
		 <th bgcolor="#A9D0F5" scope="col">班号</th>
		 <th bgcolor="#A9D0F5" scope="col">宿舍号</th>
		 <th bgcolor="#A9D0F5" scope="col">床位号</th>
		 <%if(user.canDo(1)){//仅系统管理员可查看 %>
		 	<th bgcolor="#A9D0F5" scope="col">操作</th>
		 <%} %>
 	 </tr>
	<% 
            Db conn=new Db();
	   		request.setCharacterEncoding("gb2312");
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
					<td height="22" align="center"><%=rs.getString("性别")+""%></td>
					<td height="22" align="center"><%=rs.getString("出生日期")+""%></td>
					<td height="22" align="center"><%=rs.getString("民族")+""%></td>
					<td height="22" align="center"><%=rs.getString("入学年份")+""%></td>
					<td height="22" align="center"><%=rs.getString("联系方式")+""%></td>
					<td height="22" align="center"><%=rs.getString("班号")+""%></td>
					<td height="22" align="center"><%=rs.getString("宿舍号")+""%></td>
					<td height="22" align="center"><%=rs.getString("床位号")+""%></td>
					<%if(user.canDo(1)){//仅系统管理员可操作 %>
					<td height="22" align="center">
						<div class="buton"><form action="update.jsp?no=<%=rs.getString("学号")%>" method="post" target="control"><input type="submit" value="修改"></form></div>
						<div class="buton"><form action="../../DelStu?no=<%=rs.getString("学号")%>" method="post"  target="control"><input type="submit" value="删除"></form></div>
					</td>
					<%} %>
				</tr>
	<%		} //while%>
</table>
</div>
<%if(user.canDo(1)){//仅系统管理员可查看 %>
<div class="buton"><form action="register.jsp" target="control"><input type="submit" value="注册新学生"></form></div>
<%} %>
<div  style="width: 100%;height: 50%;border:1px dotted black ;box-sizing: border-box;">
<iframe name="control" frameborder="0" height="100%" width="100%"></iframe>
</div>
</div>
</body>
</html>