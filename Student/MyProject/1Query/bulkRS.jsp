<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="entity.*"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/body.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/table.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		Answer answer = (Answer) session.getAttribute("answer");
		if (!answer.getStu().isEmpty()) {//有查询结果
			List<Student> stu = answer.getStu();
			List<Classes> clas = answer.getClas();
			if (clas.isEmpty()) {//查询宿舍信息
	%>
	<table width="600" border="1" align="center">
		<caption>
			<H2>
				批量查询&nbsp;按 宿舍 查询
				<%=stu.get(0).getDormid()%>号宿舍信息
			</H2>
		</caption>
		<tr>
			<th bgcolor="#A9D0F5" scope="col">宿舍号</th>
			<th bgcolor="#A9D0F5" scope="col">学号</th>
			<th bgcolor="#A9D0F5" scope="col">姓名</th>
			<th bgcolor="#A9D0F5" scope="col">联系方式</th>
			<th bgcolor="#A9D0F5" scope="col">班号</th>
			<th bgcolor="#A9D0F5" scope="col">床位号</th>
		</tr>
		<%
			for (Student temp : stu) {
		%>
		<tr>
			<td height="22" align="center"><%=temp.getDormid()%></td>
			<td height="22" align="center"><%=temp.getStudentid()%></td>
			<td height="22" align="center"><%=temp.getName()%></td>
			<td height="22" align="center"><%=temp.getContactway()%></td>
			<td height="22" align="center"><%=temp.getClassid()%></td>
			<td height="22" align="center"><%=temp.getBedid()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		} else {//查询班级信息
	%>
	<table width="80%" border="1" align="center">
		<caption>
			<H2>
				批量查询&nbsp;按 班级 查询
				<%=clas.get(0).getClassid()%>号班级信息
			</H2>
		</caption>
		<tr>
			<th bgcolor="#A9D0F5" scope="col">班名</th>
			<th bgcolor="#A9D0F5" scope="col">学号</th>
			<th bgcolor="#A9D0F5" scope="col">姓名</th>
			<th bgcolor="#A9D0F5" scope="col">入学年份</th>
			<th bgcolor="#A9D0F5" scope="col">联系方式</th>
			<th bgcolor="#A9D0F5" scope="col">宿舍号</th>
			<th bgcolor="#A9D0F5" scope="col">床位号</th>
		</tr>
		<%
			for (int i = 0; i < stu.size(); i++) {
		%>
		<tr>
			<td height="22" align="center"><%=clas.get(i).getClassname()%></td>
			<td height="22" align="center"><%=stu.get(i).getStudentid()%></td>
			<td height="22" align="center"><%=stu.get(i).getName()%></td>
			<td height="22" align="center"><%=stu.get(i).getStringEnrollmentyear()%></td>
			<td height="22" align="center"><%=stu.get(i).getContactway()%></td>
			<td height="22" align="center"><%=stu.get(i).getDormid()%></td>
			<td height="22" align="center"><%=stu.get(i).getBedid()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	%>
	<%
		} else {
	%>
	<script>
		alert("无查询结果");
		location.href = "bulkQuery.html";
	</script>
	<%
		}
	%>
</body>
</html>