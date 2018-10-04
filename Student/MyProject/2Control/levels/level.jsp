<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="db.Db"%>
<%@ page import="entity.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>class</title>
<style type="text/css">
div{
	overflow: auto;
}
body{
	height: 750px;
	position: relative;
}
body {
	background-image: url(../../images/bg.jpg);
	background-repeat: no-repeat;
	background-size: 100% 100%;
	background-attachment: fixed; /* 自动调整 */
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
<table border="1" align="center" width="100%" cellpadding="0" cellspacing="0">
  	<caption>
    	<H2>权限管理</H2>
  	</caption>
  	<tr>
    	 <th bgcolor="#A9D0F5" scope="col">登录名</th>
   		 <th bgcolor="#A9D0F5" scope="col">姓名</th>
   		 <th bgcolor="#A9D0F5" scope="col">权限级别</th>
		 <%if(user.canDo(1)){//仅系统管理员可查看 %>
		 	<th bgcolor="#A9D0F5" scope="col">操作</th>
		 <%} %>
 	 </tr>
	<% 
            Db conn=new Db();
	   		request.setCharacterEncoding("gb2312");
    		String strSql="";
			ResultSet rs=null;
			strSql="select * from dbo.权限";
			//执行查询，查询语句strSql是该方法的参数			
	    	 rs=conn.executeQuery(strSql);
			//判断结果是否为空
	    	for(int i=0;rs.next();i++){%>
				<tr>
					<td height="22" align="center"><%=rs.getString("登录名")+""%></td>
					<td height="22" align="center"><%=rs.getString("姓名")+""%></td>
					<td height="22" align="center"><%=rs.getString("权限级别")+""%></td>
					<%if(user.canDo(1)){//仅系统管理员可操作 %>
					<td height="22" align="center">
						<div class="buton"><form action="update.jsp?no=<%=rs.getString("登录名")%>" method="post" target="control"><input type="submit" value="修改"></form></div>
						
					</td>
					<%} %>
				</tr>
	<%		} //while%>
</table>
</div>
<a href="../students/student.jsp" ><h5>删除学生账号以删除权限（如需删除最高权限账号，请与数据库管理员联系）</h5></a>
<a href="../students/student.jsp" ><h5>注册学生账号以增添权限（如需增添最高权限账号，请与数据库管理员联系）</h5></a>
<div  style="width: 100%;height: 50%;border:1px dotted black ;box-sizing: border-box;">
<iframe name="control" frameborder="0" height="100%" width="100%"></iframe>
</div>
</div>
</body>
</html>