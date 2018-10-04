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
    	<H2>宿舍卫生信息管理</H2>
  	</caption>
  	<tr>
    	 <th bgcolor="#A9D0F5" scope="col">宿舍号</th>
   		 <th bgcolor="#A9D0F5" scope="col">检查日期</th>
		 <th bgcolor="#A9D0F5" scope="col">用电与气味</th>
		 <th bgcolor="#A9D0F5" scope="col">地面</th>
		 <th bgcolor="#A9D0F5" scope="col">书桌</th>
		 <th bgcolor="#A9D0F5" scope="col">床铺</th>
		 <th bgcolor="#A9D0F5" scope="col">洗漱台</th>
		 <th bgcolor="#A9D0F5" scope="col">卫生间</th>
		 <th bgcolor="#A9D0F5" scope="col">阳台</th>
		 <th bgcolor="#A9D0F5" scope="col">总分</th>
		 <th bgcolor="#A9D0F5" scope="col">备注</th>
		 <th bgcolor="#A9D0F5" scope="col">是否整改</th>
		 <%if(user.canDo(2)){//卫生检查员及以上可查看 %>
		 	<th bgcolor="#A9D0F5" scope="col">操作</th>
		 <%} %>
 	 </tr>
	<% 
            Db conn=new Db();
	   		request.setCharacterEncoding("gb2312");
    		String strSql="";
			ResultSet rs=null;
			strSql="select * from dbo.宿舍卫生";
			//执行查询，查询语句strSql是该方法的参数			
	    	 rs=conn.executeQuery(strSql);
			//判断结果是否为空
	    	for(int i=0;rs.next();i++){%>
				<tr>
					<td height="22" align="center"><%=rs.getString("宿舍号")+""%></td>
					<td height="22" align="center"><%=rs.getString("检查日期")+""%></td>
					<td height="22" align="center"><%=rs.getString("用电与气味")+""%></td>
					<td height="22" align="center"><%=rs.getString("地面")+""%></td>
					<td height="22" align="center"><%=rs.getString("书桌")+""%></td>
					<td height="22" align="center"><%=rs.getString("床铺")+""%></td>
					<td height="22" align="center"><%=rs.getString("洗漱台")+""%></td>
					<td height="22" align="center"><%=rs.getString("卫生间")+""%></td>
					<td height="22" align="center"><%=rs.getString("阳台")+""%></td>
					<td height="22" align="center"><%=rs.getString("总分")+""%></td>
					<td height="22" align="center"><%=rs.getString("备注")+""%></td>
					<td height="22" align="center"><%=("1".equals(rs.getString("是否整改"))?"是":"否")%></td>
					<%if(user.canDo(2)){//卫生检查员及以上可操作 %>
					<td height="22" align="center">
						<div class="buton"><form action="update.jsp?no=<%=rs.getString("宿舍号")%>&checkDate=<%=rs.getString("检查日期") %>" method="post" target="control"><input type="submit" value="修改"></form></div>
						<div class="buton"><form action="../../DelEnv?no=<%=rs.getString("宿舍号")%>&checkDate=<%=rs.getString("检查日期")%>" method="post"  target="control"><input type="submit" value="删除"></form></div>
					</td>
					<%} %>
				</tr>
	<%		} //while%>
</table>
</div>
<%if(user.canDo(2)){//卫生检查员及以上可操作 %>
<div class="buton"><form action="register.jsp" target="control"><input type="submit" value="添加检查记录"></form></div>
<%} %>
<div  style="width: 100%;height: 50%;border:1px dotted black ;box-sizing: border-box;">
<iframe name="control" frameborder="0" height="100%" width="100%"></iframe>
</div>
</div>
</body>
</html>