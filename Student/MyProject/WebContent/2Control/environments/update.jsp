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
	strSql="select * from dbo.宿舍卫生 where 宿舍号='"+request.getParameter("no")+"' and 检查日期='"+request.getParameter("checkDate")+"'";
	//执行查询，查询语句strSql是该方法的参数			
   	 rs=conn.executeQuery(strSql);
	String no="",checkDate="",ES="",floor="",desk="",bed="",wash="",bathRoom="",sun="",note="",isChange="";
	if(rs.next()){
		no=rs.getString("宿舍号");
		checkDate=rs.getString("检查日期");
		ES=rs.getString("用电与气味");
		floor=rs.getString("地面");
		desk=rs.getString("书桌");
		bed=rs.getString("床铺");
		wash=rs.getString("洗漱台");
		bathRoom=rs.getString("卫生间");
		sun=rs.getString("阳台");
		note=rs.getString("备注");
		isChange=rs.getString("是否整改");
	}
%>
<body>
<h1 align="center">修改学生信息</h1> 
<form name="form1" action="../../UpdEnv" method="post" >
        <table align="center" border=0 width=80%>
           <tr>
                <td align = "right" width=45%>检查宿舍号：</td> 
                <td><input type="text" name="no" value="<%=no%>" readonly="readonly"></td>
            </tr>
            <tr>
                <td align = "right">检查日期：</td>
                <td><input type = "text" name="checkDate" value="<%=checkDate%>" readonly="readonly">
            </tr>
             <tr>
                <td align = "right">用电和气味：</td>
                <td><input type="text" name="E&S"  value="<%=ES%>"></td>
            </tr>
             <tr>
                <td align = "right">地面：</td>
                <td><input type="text" name="floor" value="<%=floor%>"></td>
            </tr>
            <tr>
                <td align = "right">书桌：</td>
                <td><input type="text" name="desk" value="<%=desk%>"></td>
            </tr>
            <tr>
                <td align = "right">床铺：</td>
                <td><input type="text" name="bed" value="<%=bed%>"></td>
            </tr>
            <tr>
                <td align = "right">洗漱台：</td>
                <td><input type="text" name="wash" value="<%=wash%>"></td>
            </tr>
            <tr>
                <td align = "right">卫生间：</td>
                <td><input type="text" name="bathroom" value="<%=bathRoom%>"></td>
            </tr>
            <tr>
                <td align = "right">阳台：</td>
                <td><input type="text" name="sun" value="<%=sun%>"></td>
            </tr>
            <tr>
                <td align = "right">备注：</td>
                <td><input type="text" name="note" value="<%=note%>"></td>
            </tr>
            
             <tr>
                <td align = "right">是否整改：</td>
                <td><input type="radio" name=isChange value=1 <%if("1".equals(isChange)){%>  checked<%} %>>是
                	<input type="radio" name=isChange value=0 <%if("0".equals(isChange)){%> checked<%} %>>否</td>
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