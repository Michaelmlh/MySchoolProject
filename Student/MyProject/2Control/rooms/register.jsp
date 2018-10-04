<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div class="container">
		<h1 align="center">注册新宿舍</h1>
		<div class="col-md-4 col-md-push-4">
			<form name="form1" action="../../RegisterRom" method="post">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon">宿舍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span>
						<input type="text" name="no" required pattern="(([NE]\d+[AB][1-6][0-4]\d),)*(([NE]\d+[AB][1-6][0-4]\d))"
							placeholder="如:N10B130" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">容&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</span>
						<input type="text" name="name" required pattern="[246]"
							placeholder="如:6" class="form-control">
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