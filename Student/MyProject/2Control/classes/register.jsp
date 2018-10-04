<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
	function check(theform) {
		if (theform.no.value == "") {
			alert("班号不能为空！");
			theform.no.focus();
			return false;
		}
		if (theform.name.value == "") {
			alert("班级名称不能为空！");
			theform.name.focus();
			return false;
		}
		return true;
	}
</script>
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
		<h1 align="center">注册新班级</h1>
		<div class="col-md-4 col-md-push-4">
			<form name="form1"
				action="${pageContext.request.contextPath }/RegisterCla"
				method="post">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span>
						<input type="text" name="no" required pattern="\d+"
							placeholder="如：00001" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span>
						<input type="text" name="name" required placeholder="如：软件工程161"
							class="form-control">
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