<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="db.*"%>
<%@ page import="com.jsp.servlet.Answer"%>
<%@ page import="entity.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/body.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/boostrap/css/bootstrap.min.css">
<title>修改学生信息</title>
<style type="text/css">
	.form-group .input-group{
		margin-top : 5px;
	}
</style>
</head>
<%
	Db conn = new Db();
	request.setCharacterEncoding("utf-8");
	String strSql = "";
	ResultSet rs = null;
	strSql = "select * from dbo.学生 where 学号=" + request.getParameter("no");
	//执行查询，查询语句strSql是该方法的参数			
	rs = conn.executeQuery(strSql);
	String no = "", name = "", sex = "", birth = "", nation = "", intoDate = "", phone = "", clasNo = "",
			roomNo = "", bedNo = "";
	if (rs.next()) {
		no = rs.getString("学号");
		name = rs.getString("姓名");
		sex = rs.getString("性别");
		birth = rs.getString("出生日期");
		nation = rs.getString("民族");
		intoDate = rs.getString("入学年份");
		phone = rs.getString("联系方式");
		clasNo = rs.getString("班号");
		roomNo = rs.getString("宿舍号");
		bedNo = rs.getString("床位号");
	}
%>

<body>
	<div class="container">
		<h1 align="center">修改学生信息</h1>
		<div class="col-md-4 col-md-push-4">
			<form name="form1" action="${pageContext.request.contextPath }/UpdStu" method="post">
				<a style="color: gray;text-decoration: none;" href="${pageContext.request.contextPath }/DelStu?no=<%=no %>" id="del">删除此学生？</a>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span>
						<input type="text" name="no" class="form-control"
							readonly="readonly" value="<%=no%>">
					</div>
					<div class="input-group">
						<span class="input-group-addon">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
						<input type="text" name="name" class="form-control"
							value="<%=name%>">
					</div>
					<div class="input-group">
						<span class="input-group-addon">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span>
						<input type="text" name="sex"
							value="<%if (sex.equals("男")) {%>男 <%} else {%>女<%}%>"
							class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">出生日期</span> <input type="text"
							name="birth" value="<%=birth%>" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族</span>
						<input type="text" name="nation" value="<%=nation%>"
							class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">入学年份</span> <input type="text"
							name="intoDate" value="<%=intoDate%>" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">联系方式</span> <input type="text"
							name="phone" value="<%=phone%>" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span>
						<input type="text" name="clasNo" value="<%=clasNo%>"
							class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">宿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;舍</span> <input
							type="text" name="roomNo" value="<%=roomNo%>" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">床&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位</span> <input
							type="text" name="bedNo" value="<%=bedNo%>" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-6">
						<input type="reset" style="margin: 0 30%" class="btn btn-info btn-sm" value="重置">
					</div>
					<div class="col-xs-6">
						<input type="submit" style="margin: 0 30%" class="btn btn-info btn-sm" value="提交">
					</div>
				</div>
			</form>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/boostrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var del = document.querySelector("#del");
        del.onclick = function(){
            if( confirm( "确认删除?此操作不可逆?" ) ){
                return true;
            }
            return false;
        }
	</script>
</body>

</html>