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
	strSql="select * from dbo.学生 where 学号="+request.getParameter("no");
	//执行查询，查询语句strSql是该方法的参数			
   	 rs=conn.executeQuery(strSql);
	String no="",name="",sex="",birth="",nation="",intoDate="",phone="",clasNo="",roomNo="",bedNo="";
	if(rs.next()){
		no=rs.getString("学号");
		name=rs.getString("姓名");
		sex=rs.getString("性别");
		birth=rs.getString("出生日期");
		nation=rs.getString("民族");
		intoDate=rs.getString("入学年份");
		phone=rs.getString("联系方式");
		clasNo=rs.getString("班号");
		roomNo=rs.getString("宿舍号");
		bedNo=rs.getString("床位号");
	}
%>
<body>
<h1 align="center">修改学生信息</h1> 
<form name="form1" action="../../UpdStu" method="post" >
        <table align="center" border=0 width=80%>
            <tr>
                <td align = "right" width=45%>学号(登录名)：</td> 
                <td><input type="text" name="no" readonly="readonly" value="<%=no %>"></td>
            </tr>
            <tr>
                <td align = "right">姓名：</td>
                <td><input type="text" name="name" value="<%=name %>"></td>
            </tr>
            <tr>
                <td align = "right">性别：</td>
                <td><input type="radio" name=sex value=男 <%if(sex.equals("男")){%> checked<%} %>>男
                	<input type="radio" name=sex value=女 <%if(sex.equals("女")){%> checked<%} %>>女</td>
            </tr>
            <tr>  
                <td align = "right">出生日期：</td>
                <td><input type="text" name="birth" value="<%=birth %>"></td>
            </tr>
            <tr>  
                <td align = "right">民族：</td>
                <td><input type="text" name="nation" value="<%=nation %>"></td>
            </tr>
            <tr>  
                <td align = "right">入学年份：</td>
                <td><input type="text" name="intoDate" value="<%=intoDate %>"></td>
            </tr>
            <tr>  
                <td align = "right">联系方式：</td>
                <td><input type="text" name="phone" value="<%=phone %>"></td>
            </tr>
             <tr>  
                <td align = "right">班号：</td>
                <td><input type="text" name="clasNo" value="<%=clasNo %>"></td>
            </tr>
             <tr>  
                <td align = "right">宿舍号：</td>
                <td><input type="text" name="roomNo" value="<%=roomNo %>"></td>
            </tr>
             <tr>  
                <td align = "right">床位号：</td>
                <td><input type="text" name="bedNo" value="<%=bedNo %>"></td>
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