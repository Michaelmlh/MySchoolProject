<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.form-group .input-group {
	margin-top: 5px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/body.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/boostrap/css/bootstrap.min.css">
</head>
<body>
	<%
		Calendar now = Calendar.getInstance();
		String year = now.get(Calendar.YEAR) + "";
		String month = (now.get(Calendar.MONTH) + 1) + "";
		String day = now.get(Calendar.DAY_OF_MONTH) + "";
	%>
	<div class="container">
		<h1 align="center">添加检查记录</h1>
		<div class="col-md-4 col-md-push-4">
			<form name="form1" action="../../RegisterEnv" method="post">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon">宿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;舍</span>
						<input type="text" name="no"
							class="form-control" placeholder="如：N10B130"
							pattern="(([NE]\d+[AB][1-6][0-4]\d),)*(([NE]\d+[AB][1-6][0-4]\d))">
					</div>
					<div class="input-group">
						<span class="input-group-addon">日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期</span>
						<input type="text" name="checkDate" readonly="readonly" value="<%=year %>-<%=month %>-<%=day %>"
							class="form-control" >
					</div>
					<div class="input-group">
						<span class="input-group-addon">用电和气味</span> <input type="text"
							name="E&S"  class="form-control" pattern="\d+">
					</div>
					<div class="input-group">
						<span class="input-group-addon">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;面</span>
						<input type="text" name="floor" 
							class="form-control" pattern="\d+">
					</div>
					<div class="input-group">
						<span class="input-group-addon">书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;桌</span>
						<input type="text" name="desk" 
							class="form-control" pattern="\d+">
					</div>
					<div class="input-group">
						<span class="input-group-addon">床&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;铺</span>
						<input type="text" name="bed" 
							class="form-control" pattern="\d+">
					</div>
					<div class="input-group">
						<span class="input-group-addon">洗&nbsp;&nbsp;&nbsp;漱&nbsp;&nbsp;&nbsp;台</span>
						<input type="text" name="wash" 
							class="form-control" pattern="\d+">
					</div>
					<div class="input-group">
						<span class="input-group-addon">卫&nbsp;&nbsp;&nbsp;生&nbsp;&nbsp;&nbsp;间</span>
						<input type="text" name="bathroom" 
							class="form-control" pattern="\d+">
					</div>
					<div class="input-group">
						<span class="input-group-addon">阳&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;台</span>
						<input type="text" name="sun" 
							class="form-control" pattern="\d+">
					</div>
					<div class="input-group">
						<span class="input-group-addon">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</span>
						<input type="text" name="note" 
							class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">是否&nbsp;&nbsp;&nbsp;整改</span> <input
							type="radio" name=isChange value=1 >是 <input type="radio" name=isChange
							value=0 >否
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


</body>
</html>