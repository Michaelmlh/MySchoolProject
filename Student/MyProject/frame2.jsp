<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.权限"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生宿舍卫生管理系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/boostrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/body.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/frame2.css">
</head>
<body>
	<%
		权限 user = ((权限) session.getAttribute("user"));
	%>
	<div class="container">
		<div class="navbar navbar-default">
			<button class="navbar-toggle" data-toggle="collapse"
				data-target=".mycollapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<ul
				class="navbar-nav nav navbar-right navbar-collapse collapse mycollapse">
				<%
					if (user != null) { //登录后操作
				%>
				<li><span style="line-height: 300%"><font size="5"
						face="楷体">&nbsp;欢迎你，<%=user.getUser()%>&nbsp;
					</font></span></li>
				<li><a href="StuInfo" target="main">用户信息</a></li>
				<li><a href="exit.jsp">退出登陆</a></li>

				<%
					}
				%>

			</ul>
			<ul class="navbar-nav nav navbar-collapse collapse mycollapse" id="">
				<li role="presentation "><a href="#"
					class="navbar-brand hidden-xs" style="padding-top: 0px"> <img
						src="images/LOGO.PNG" alt="" style="height: 45px;">
				</a></li>
				 <%
					if (user != null) { //登录后操作
				%>
				<li role="presentation" class="dropdown hidden-sm hidden-md hidden-lg"><a href="#"
					class="drowndown-toggle" data-toggle="dropdown" role="button">信息查询
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="StuInfo" target="_blank">个人详情</a></li>
						<li><a href="1Query/bulkQuery.html" target="_blank">批量查询</a></li>
						<li><a href="1Query/statisticQuery.html" target="main">统计查询</a>
						</li>
					</ul></li>
				<%
					if (user.canDo(3)) {//班级负责人及以上权限能操作
				%>
				<li role="presentation" class="dropdown hidden-sm hidden-md hidden-lg"><a href="#"
					class="drowndown-toggle" data-toggle="dropdown" role="button">信息管理
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="2Control/students/student.jsp" target="_blank">学生管理</a>
						</li>
						<li><a href="2Control/classes/class.jsp" target="_blank">班级管理</a>
						</li>
						<li><a href="2Control/rooms/room.jsp" target="_blank">宿舍管理</a>
						</li>
						<li><a href="2Control/environments/environment.jsp"
							target="_blank">卫生管理</a></li>
						<%
							if (user.canDo(1)) {//仅系统管理员可查看
						%>
						<li><a href="2Control/levels/level.jsp" target="_blank">权限管理</a>
						</li>
					</ul></li>
				<%
					}
						}
					}
				%>
			</ul>
			
			<div class=" hidden-xs navbar-text"
				style="padding-left: 50px; line-height: 100%">
				<font size="5" face="黑体">学生宿舍卫生管理系统</font>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<div class="hidden-sm hidden-xs ">
					<h2 align="center">
						<br>欢迎使用宿舍卫生管理系统
					</h2>
					<p></p>
				</div>
			</div>
		</div>
		<div class="row">
			<%
				if (user != null) {
			%>
			<div class="col-sm-3 navigater hidden-xs">

				<ul>
					<li>信息查询</li>
					<li><a href="StuInfo" target="_blank">个人详情</a></li>
					<li><a href="1Query/bulkQuery.html" target="_blank">批量查询</a></li>
					<li><a href="1Query/statisticQuery.html" target="main">统计查询</a>
					</li>
				</ul>
				<%
					if (user.canDo(3)) {
				%>
				<ul>
					<li>信息管理</li>
					<li><a href="2Control/students/student.jsp" target="_blank">学生管理</a>
					</li>
					<li><a href="2Control/classes/class.jsp" target="_blank">班级管理</a>
					</li>
					<li><a href="2Control/rooms/room.jsp" target="_blank">宿舍管理</a>
					</li>
					<li><a href="2Control/environments/environment.jsp"
						target="_blank">卫生管理</a></li>
					<%
						if (user.canDo(1)) {//仅系统管理员可查看
					%>
					<li><a href="2Control/levels/level.jsp" target="_blank">权限管理</a>
					</li>
					<%
						}
					%>
				</ul>
				<%
					}
				%>

			</div>
			<%
				}
			%>
			<div class="col-sm-6  hidden-xs hidden-sm" style="opacity: 0.6">
				<div class="middle_right">
					<div id="lunbobox">
						<div id="toleft">&lt;</div>
						<div class="lunbo">
							<a href="#"><img
								src="${pageContext.request.contextPath }/images/lunbo/101.jpg"></a>
							<a href="#"><img
								src="${pageContext.request.contextPath }/images/lunbo/102.jpg"></a>
							<a href="#"><img
								src="${pageContext.request.contextPath }/images/lunbo/103.jpg"></a>
							<a href="#"><img
								src="${pageContext.request.contextPath }/images/lunbo/104.jpg"></a>
							<a href="#"><img
								src="${pageContext.request.contextPath }/images/lunbo/112.jpg"></a>
						</div>
						<div id="toright">&gt;</div>
						<ul>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
						<span></span>
					</div>
				</div>
			</div>
		 <%
				if (user == null) {
			%> 
			<div class="col-sm-4 col-sm-push-1">
				<form action="${pageContext.request.contextPath }/servlet/Login"
					method="POST">
					<dl class="form-group">
						<dt class="input-label">
							<label for="username" class="form-label">用户名</label>
						</dt>
						<dd class="input-group input-group-lg">
							<input type="text"
								class="form-control form-control-lg input-block" id="name"
								name="username" placeholder="用户名" required>
						</dd>
					</dl>
					<dl class="form-group">
						<dt class="input-label">
							<label for="password" class="form-label">密码</label>
						</dt>
						<dd class="input-group input-group-lg">
							<input type="password"
								class="form-control form-control-lg input-block" id="password"
								name="password" placeholder="密码" required>
						</dd>
					</dl>
					<button type="submit" class="btn btn-info btn-lg">登 陆</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset" class="btn btn-info btn-lg">重 置</button>
				</form>
			</div>
			<%
				} else {
			%>
			<div class="col-sm-3 ">
				<form action="${pageContext.request.contextPath }/Updpsd"
					method="POST">
					<dl class="form-group">
						<dt class="input-label">
							<label for="password" class="form-label">原密码</label>
						</dt>
						<dd class="input-group input-group-lg">
							<input type="text"
								class="form-control form-control-lg input-block" id="password"
								name="password" placeholder="原密码" required>
						</dd>
					</dl>
					<dl class="form-group">
						<dt class="input-label">
							<label for="newpassword" class="form-label">新密码</label>
						</dt>
						<dd class="input-group input-group-lg">
							<input type="password"
								class="form-control form-control-lg input-block" id="newpassword"
								name="newpassword" placeholder="新密码" required>
						</dd>
					</dl>
					<button type="submit" class="btn btn-info btn-lg">修改密码</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset" class="btn btn-info btn-lg">重 置</button>
				</form>
			</div>


			<%
				}
			%> 

		</div>





	</div>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/boostrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		///轮播
		$(function() {
			//$("#toright").hide();
			//$("#toleft").hide();
			$('#toright').hover(function() {
				$("#toleft").hide()
			}, function() {
				$("#toleft").show()
			})
			$('#toleft').hover(function() {
				$("#toright").hide()
			}, function() {
				$("#toright").show()
			})
		})

		var t;
		var index = 0;
		/////自动播放
		t = setInterval(play, 3000)

		function play() {
			index++;
			if (index > 4) {
				index = 0
			}
			// console.log(index)
			$("#lunbobox ul li").eq(index).css({
				"background" : "#999",
				"border" : "1px solid #ffffff"
			}).siblings().css({
				"background" : "#cccccc",
				"border" : ""
			})

			$(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000);
		};

		///点击鼠标 图片切换
		$("#lunbobox ul li").click(function() {

			//添加 移除样式
			//$(this).addClass("lito").siblings().removeClass("lito"); //给当前鼠标移动到的li增加样式 且其余兄弟元素移除样式   可以在样式中 用hover 来对li 实现
			$(this).css({
				"background" : "#999",
				"border" : "1px solid #ffffff"
			}).siblings().css({
				"background" : "#cccccc"
			})
			var index = $(this).index(); //获取索引 图片索引与按钮的索引是一一对应的
			// console.log(index);

			$(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000); // siblings  找到 兄弟节点(不包括自己）
		});

		/////////////上一张、下一张切换
		$("#toleft").click(function() {
			index--;
			if (index <= 0) //判断index<0的情况为：开始点击#toright  index=0时  再点击 #toleft 为负数了 会出错
			{
				index = 4
			}
			console.log(index);
			$("#lunbobox ul li").eq(index).css({
				"background" : "#999",
				"border" : "1px solid #ffffff"
			}).siblings().css({
				"background" : "#cccccc"
			})

			$(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000); // siblings  找到 兄弟节点(不包括自己）必须要写
		}); // $("#imgbox a ")获取到的是一个数组集合 。所以可以用index来控制切换

		$("#toright").click(function() {
			index++;
			if (index > 4) {
				index = 0
			}
			console.log(index);
			$(this).css({
				"opacity" : "0.5"
			})
			$("#lunbobox ul li").eq(index).css({
				"background" : "#999",
				"border" : "1px solid #ffffff"
			}).siblings().css({
				"background" : "#cccccc"
			})
			$(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000); // siblings  找到 兄弟节点(不包括自己）
		});
		$("#toleft,#toright").hover(function() {
			$(this).css({
				"color" : "black"
			})
		}, function() {
			$(this).css({
				"opacity" : "0.3",
				"color" : ""
			})
		})
		///

		///////鼠标移进  移出
		$("#lunbobox ul li,.lunbo a img,#toright,#toleft ").hover(
		////////鼠标移进
		function() {
			$('#toright,#toleft').show()
			clearInterval(t);

		},
		///////鼠标移开
		function() {
			//$('#toright,#toleft').hide()
			//alert('aaa')
			t = setInterval(play, 3000)

			function play() {
				index++;
				if (index > 4) {
					index = 0
				}
				$("#lunbobox ul li").eq(index).css({
					"background" : "#999",
					"border" : "1px solid #ffffff"
				}).siblings().css({
					"background" : "#cccccc"
				})
				$(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000);
			}
		})
	</script>
</body>

</html>