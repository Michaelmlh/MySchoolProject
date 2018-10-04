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
<style type="text/css">
.form-group .input-group {
	margin-top: 5px;
}
</style>
<title>在此处插入标题</title>
</head>
<%
	Db conn = new Db();
	request.setCharacterEncoding("gb2312");
	String strSql = "";
	ResultSet rs = null;
	strSql = "select * from dbo.权限 where 登录名='" + request.getParameter("no") + "'";
	//执行查询，查询语句strSql是该方法的参数			
	rs = conn.executeQuery(strSql);
	String no = "", name = "", level = "";
	if (rs.next()) {
		no = rs.getString("登录名");
		name = rs.getString("姓名");
		level = rs.getString("权限级别");
	}
%>
<body>
	<div class="container">
		<h1 align="center">修改权限信息</h1>
		<div class="col-md-4 col-md-push-4">
			<form name="form1" action="../../UpdLev" method="post">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon">登&nbsp;&nbsp;录&nbsp;&nbsp;名</span>
						<input type="text" name="No" readonly="readonly"
							value="<%=no%>" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
						<input class="form-control" type="text" name="Name" value="<%=name%>">
					</div>
					<div class="input-group">
						<span class="input-group-addon">级别权限</span>
						<select class="form-control" name="Level">
								<%
									String str[] = { "学生", "卫生检查员", "班级负责人", "系统管理员" };
									for (int i = 0; i < 4; i++) {
								%>
								<option value="<%=str[i]%>" <%if (str[i].equals(level)) {%>
									selected="selected" <%}%>><%=str[i]%></option>
								<%
									}
								%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-6">
						<input type="reset" style="margin: 0 30%"
							class="btn btn-info btn-sm" value="重置">
					</div>
					<div class="col-xs-6">
						<input type="submit" style="margin: 0 30%"
							class="btn btn-info btn-sm" value="提交">
					</div>
				</div>
			</form>
		</div>
	</div>


	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/boostrap/js/bootstrap.min.js"></script>
</body>
</html>