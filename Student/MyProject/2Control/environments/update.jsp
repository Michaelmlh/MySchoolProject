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
<title>在此处插入标题</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/body.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/boostrap/css/bootstrap.min.css">
<style type="text/css">
.form-group .input-group {
	margin-top: 5px;
}</style>
</head>
<%
	Db conn = new Db();
	request.setCharacterEncoding("gb2312");
	String strSql = "";
	ResultSet rs = null;
	strSql = "select * from dbo.宿舍卫生 where 宿舍号='" + request.getParameter("no") + "' and 检查日期='"
			+ request.getParameter("checkDate") + "'";
	//执行查询，查询语句strSql是该方法的参数			
	rs = conn.executeQuery(strSql);
	String no = "", checkDate = "", ES = "", floor = "", desk = "", bed = "", wash = "", bathRoom = "",
			sun = "", note = "", isChange = "";
	if (rs.next()) {
		no = rs.getString("宿舍号");
		checkDate = rs.getString("检查日期");
		ES = rs.getString("用电与气味");
		floor = rs.getString("地面");
		desk = rs.getString("书桌");
		bed = rs.getString("床铺");
		wash = rs.getString("洗漱台");
		bathRoom = rs.getString("卫生间");
		sun = rs.getString("阳台");
		note = rs.getString("备注");
		isChange = rs.getString("是否整改");
	}
%>
<body>
	<div class="container">
		<h1 align="center">修改学生信息</h1>
		<div class="col-md-4 col-md-push-4">
			<form name="form1" action="../../UpdEnv" method="post">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon">宿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;舍</span>
						<input type="text" name="no" value="<%=no%>"
							readonly="readonly" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期</span>
						<input type="text" name="checkDate"
							value="<%=checkDate%>" readonly="readonly" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">用电和气味</span>
						<input type="text" name="E&S" value="<%=ES%>" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;面</span>
						<input type="text" name="floor" value="<%=floor%>" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;桌</span>
						<input type="text" name="desk" value="<%=desk%>" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">床&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;铺</span>
						<input type="text" name="bed" value="<%=bed%>" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">洗&nbsp;&nbsp;&nbsp;漱&nbsp;&nbsp;&nbsp;台</span>
						<input type="text" name="wash" value="<%=wash%>" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">卫&nbsp;&nbsp;&nbsp;生&nbsp;&nbsp;&nbsp;间</span>
						<input type="text" name="bathroom" value="<%=bathRoom%>" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">阳&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;台</span>
						<input type="text" name="sun" value="<%=sun%>" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</span>
						<input type="text" name="note" value="<%=note%>" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">是否&nbsp;&nbsp;&nbsp;整改</span>
						<input type="radio" name=isChange value=1 <%if("1".equals(isChange)){%>  checked<%} %>>是
                		<input  type="radio" name=isChange value=0 <%if("0".equals(isChange)){%> checked<%} %>>否
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