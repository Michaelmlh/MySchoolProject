<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.jsp.servlet.Answer" %>
<%@ page import="entity.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserInformation</title>
</head>
<body>
<center>
<%Answer answer=(Answer)session.getAttribute("answer"); 
if(answer!=null&&!answer.getStu().isEmpty()){
  学生 stu=answer.getStu().get(0);
  班级 clas=answer.getClas().get(0);
  宿舍 room=answer.getRoom().get(0);
  权限 user=(权限) session.getAttribute("user");
  ArrayList<宿舍卫生>list=answer.getEn();
  
%>
<form name="form1" action="../UpdInfo" method="post" target="_self"><!--  预留个人页面修改个人信息功能-->
<table align="center" height="100">
<tr><td colspan="2"><h2 align="center">个人详细信息</h2></td></tr>
<tr><td colspan="2" align="left"><h3>个人用户信息：</h3></td>
<tr>
	<td>学号（登录名）</td>
	<td><input type="text" name="No" readonly="readonly" value="<%=stu.getNo() %>"></td>
</tr>
<tr>
	<td>密码：</td>
	<td><input id="Password" type="password" name="Password"  value="<%=user.getKey() %>"></td>
</tr>
<tr>
	<td>姓名</td>
	<td><input type="text" name="name" value="<%=stu.getName()%>"></td> 
</tr>
<tr>
	<td>班号</td>
	<td><input type="text" name="clasNo" value="<%=stu.getClassNo() %>"></td>
</tr>
<tr>
	<td>班级</td>
	<td><input type="text" name="clasName" readonly="readonly" value="<%=clas.getClassName() %>"></td>
</tr>
<tr>
	<td>性别</td>
	<td><input type="radio" name=sex value=男 <%if(stu.getSex().equals("男")){%> checked<%} %>>男
        <input type="radio" name=sex value=女 <%if(stu.getSex().equals("女")){%> checked<%} %>>女
    </td>
</tr>
<tr>
	<td>生日</td>
	<td><input type="text" name="birth" value="<%=stu.getBirthday() %>"></td>
</tr>
<tr>
	<td>民族</td>
	<td><input type="text" name="nation" value="<%=stu.getNation()%>"></td>
</tr>
<tr>
	<td>入学年份</td>
	<td><input type="text" name="intoDate" value="<%=stu.getIntoDate() %>"></td>
</tr>
<tr>
	<td>联系方式</td>
	<td><input type="text" name="phone" value="<%=stu.getPhoneNumber()%>"></td>
</tr>
<tr>
	<td>宿舍号</td>
	<td><input type="text" name="roomNo" readonly="readonly" value="<%=stu.getRoomNo() %>"></td>
</tr>
<tr>
	<td>床位号</td>
	<td><input type="text" name="bedNo" readonly="readonly" value="<%=stu.getBedNo()%>"></td>
</tr>
<tr><td colspan="2" align="center"><input type="submit" value="修改"></td></tr>
<!--  -->
</table>
</form>
<table>
<tr><td align="left"><h3>宿舍相关信息：</h3></td></tr>
<tr>
	<td>宿舍号： <%=stu.getRoomNo() %></td>
</tr>
<tr>
	<td>宿舍人数： <%=room.getBedcount() %></td>
</tr>
<tr>
	<td>床位号： <%=stu.getBedNo()%></td>
</tr>
<tr><td>
<table width="600" border="1">
  	<caption>
    	<H5>宿舍卫生信息</H5>
  	</caption>
  	<tr>
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
 	 </tr>
<%for(宿舍卫生 temp:list){%>
	<tr>
		<td height="22" align="center"><%=temp.getCheckDate()%></td>
		<td height="22" align="center"><%=temp.getGrade()[0]%></td>
		<td height="22" align="center"><%=temp.getGrade()[1]%></td>
		<td height="22" align="center"><%=temp.getGrade()[2]%></td>
		<td height="22" align="center"><%=temp.getGrade()[3]%></td>
		<td height="22" align="center"><%=temp.getGrade()[4]%></td>
		<td height="22" align="center"><%=temp.getGrade()[5]%></td>
		<td height="22" align="center"><%=temp.getGrade()[6]%></td>
		<td height="22" align="center"><%=temp.getGrade()[7]%></td>
		<td height="22" align="center"><%=temp.getNote()%></td>
		<td height="22" align="center"><%=(temp.getIsRectify()==1?"是":"否")%></td>
	</tr>
<%} 
}else{
	out.print("无学生信息");
}
%>
</table>
</td></tr>
</table>



</center>
</body>
</html>