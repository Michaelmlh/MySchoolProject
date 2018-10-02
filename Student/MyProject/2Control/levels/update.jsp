<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="db.*" %>
<%@ page import="com.jsp.servlet.Answer" %>
<%@ page import="entity.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在此处插入标题</title>
</head>
<% 
	Db conn=new Db();
	request.setCharacterEncoding("gb2312");
	String strSql="";
	ResultSet rs=null;
	strSql="select * from dbo.权限 where 登录名='"+request.getParameter("no")+"'";
	//执行查询，查询语句strSql是该方法的参数			
   	 rs=conn.executeQuery(strSql);
	String no="",name="",level="";
	if(rs.next()){
		no=rs.getString("登录名");
		name=rs.getString("姓名");
		level=rs.getString("权限级别");
	}
%>
<body>
<h1 align="center">修改权限信息</h1> 
<form name="form1" action="../../UpdLev" method="post" >
        <table align="center" border=0 width=80%>
           	 <tr>  
                <td align = "right" width="45%"> 登录名：</td>
                <td><input type="text" name="No" readonly="readonly" value="<%=no %>"></td>
            </tr>
             <tr>  
                <td align = "right">姓名：</td>
                <td><input type="text" name="Name" value="<%=name %>"></td>
            </tr>
            <tr>  
                <td align = "right">权限级别：</td>
                <td>
                	<select name="Level">
                		<%
                		String str[]={"学生","卫生检查员","班级负责人","系统管理员"};
                		for(int i=0;i<4;i++){ %>
                		<option value="<%=str[i]%>" 
                		<%if(str[i].equals(level)){ %>selected="selected"<%} %>
                			><%=str[i] %></option>
                		<%} %>
                	</select>
                </td>
            </tr>
            <tr>
                <td align="center" colspan=2>
                    <input type="reset">
                    <input type="submit" value="提交">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>