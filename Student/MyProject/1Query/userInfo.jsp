<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="entity.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserInformation</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/body.css">
</head>
<body>
	<center>
		<%
			Answer answer = (Answer) session.getAttribute("answer");
			Limit user=null;
			if((user = (Limit) session.getAttribute("user"))==null)
				out.print("<script>alert(\"用户登录超时，请登录！\");location.href=\""+request.getContextPath()+"/frame2.jsp\";</script>");
			if (answer != null && !answer.getStu().isEmpty()) {
				Student stu = answer.getStu().get(0);
				Classes clas = answer.getClas().get(0);
				Dorm room = answer.getRoom().get(0);
				List<Dormhealth> list = answer.getEn();
		%>
		<form name="form1" action="../UpdInfo" method="post" target="_self">
			<!--  预留个人页面修改个人信息功能-->
			<table align="center" height="100">
				<tr>
					<td colspan="2"><h2 align="center">个人详细信息</h2></td>
				</tr>
				<tr>
					<td colspan="2" align="left"><h3>个人用户信息：</h3></td>
				<tr>
					<td>学号（登录名）</td>
					<td><input type="text" name="No" readonly="readonly"
						value="<%=stu.getStudentid()%>"></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input id="Password" type="password" name="Password"
						value="<%=user.getPassword()%>"></td>
				</tr>
				<tr>
					<td>姓名</td>
					<td><input type="text" name="name" value="<%=stu.getName()%>"></td>
				</tr>
				<tr>
					<td>班号</td>
					<td><input type="text" name="clasNo"
						value="<%=stu.getClassid()%>"></td>
				</tr>
				<tr>
					<td>班级</td>
					<td><input type="text" name="clasName" readonly="readonly"
						value="<%=clas.getClassname()%>"></td>
				</tr>
				<tr>
					<td>性别</td>
					<td><input type="radio" name=sex value=男
						<%if (stu.getSex().equals("男")) {%> checked <%}%>>男 <input
						type="radio" name=sex value=女 <%if (stu.getSex().equals("女")) {%>
						checked <%}%>>女</td>
				</tr>
				<tr>
					<td>生日</td>
					<td><input type="text" name="birth"
						value="<%=stu.getStringBirthday()%>"></td>
				</tr>
				<tr>
					<td>民族</td>
					<td><input type="text" name="nation"
						value="<%=stu.getNation()%>"></td>
				</tr>
				<tr>
					<td>入学年份</td>
					<td><input type="text" name="intoDate"
						value="<%=stu.getStringEnrollmentyear()%>"></td>
				</tr>
				<tr>
					<td>联系方式</td>
					<td><input type="text" name="phone"
						value="<%=stu.getContactway()%>"></td>
				</tr>
				<tr>
					<td>宿舍号</td>
					<td><input type="text" name="roomNo" readonly="readonly"
						value="<%=stu.getDormid()%>"></td>
				</tr>
				<tr>
					<td>床位号</td>
					<td><input type="text" name="bedNo" readonly="readonly"
						value="<%=stu.getBedid()%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="修改"></td>
				</tr>
				<!--  -->
			</table>
		</form>
		<table>
			<tr>
				<td align="left"><h3>宿舍相关信息：</h3></td>
			</tr>
			<tr>
				<td>宿舍号： <%=stu.getDormid()%></td>
			</tr>
			<tr>
				<td>宿舍人数： <%=room.getPeoplenum()%></td>
			</tr>
			<tr>
				<td>床位号： <%=stu.getBedid()%></td>
			</tr>
			<tr>
				<td>
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
						<%
							for (Dormhealth temp : list) {
						%>
						<tr>
							<td height="22" align="center"><%=temp.getStringCheckdate()%></td>
							<td height="22" align="center"><%=temp.getElectricityandsmell()%></td>
							<td height="22" align="center"><%=temp.getGround()%></td>
							<td height="22" align="center"><%=temp.getDesk()%></td>
							<td height="22" align="center"><%=temp.getBed()%></td>
							<td height="22" align="center"><%=temp.getWashtable()%></td>
							<td height="22" align="center"><%=temp.getToilet()%></td>
							<td height="22" align="center"><%=temp.getBalcony()%></td>
							<td height="22" align="center"><%=temp.getTotalscore()%></td>
							<td height="22" align="center"><%=((temp.getNote()==null)?"":temp.getNote())%></td>
							<td height="22" align="center"><%=(temp.getRectificationornot() == 1 ? "是" : "否")%></td>
						</tr>
						<%
							}
							} else {
								out.print("无学生信息");
							}
						%>
					</table>
				</td>
			</tr>
		</table>



	</center>
</body>
</html>