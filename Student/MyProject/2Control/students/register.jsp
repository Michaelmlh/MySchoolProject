<!DOCTYPE html>
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
		<h1 align="center">注册新学生</h1>
		<div class="col-md-4 col-md-push-4">
			<form name="form1"
				action="${pageContext.request.contextPath }/RegisterStu"
				method="post">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span>
						<input type="text" name="no" required pattern="\d{9}"
							placeholder="如：202161011" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
						<input type="text" name="name" required placeholder="如：张三"
							class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span>
						<input type="text" name="sex" required placeholder="如：男"
							pattern="[男女]" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">出生日期</span> <input type="date"
							name="birth" required placeholder="如：1998-02-20"
							class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族</span>
						<input type="text" required placeholder="如：汉" " name="nation"
							class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">入学年份</span> <input type="date"
							name="intoDate" required class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">联系方式</span> <input type="text"
							name="phone" required class="form-control"
							placeholder="如：手机号,qq,邮箱">
					</div>
					<div class="input-group">
						<span class="input-group-addon">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span>
						<input type="text" name="clasNo" placeholder="如：0001"
							pattern="\d+" required class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">宿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;舍</span>
						<input type="text" name="roomNo" placeholder="如：N10B130"
							pattern="(([NE]\d+[AB][1-6][0-4]\d),)*(([NE]\d+[AB][1-6][0-4]\d))"
							required class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">床&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位</span>
						<input type="text" name="bedNo" placeholder="如：1" pattern="[1-6]"
							required class="form-control">
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