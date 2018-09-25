<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="entity.权限"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>学生宿舍卫生管理系统</title>
    <link rel="stylesheet" href="frame.css"> 
</head>
<body>
<% 权限 user=((权限)session.getAttribute("user"));%>
    <div class="body">
        <div class="mytop">
            <div class="top">
                <div class="logo"><img alt="LOGO" src="images/LOGO.PNG" width="80" height="40"/></div>
                <div class="title"><font size="5" face="黑体">学生宿舍卫生管理系统</font></div>
                <ul class="function">
                    <li>
                        <a href="StuInfo" target="main">用户信息</a><!-- 同个人详情 -->
                    </li>
                    <%if(user!=null){ //登录后操作%>
                    <li>
                        <a href="exit.jsp">退出登录</a>
                    </li>
                    <%} %>
                </ul>
            </div>
            <div class="top">
             <%if(user!=null){ %>
                <span><font face="楷体">欢迎你，<%=user.getUser()%></font></span>
             <%}else{%>
            	 <span><a href="Login&Register/login.jsp">登录</a></span>
             <%} %>
            </div>
            <div class="top" style="background-color: #4d55ff">
            <%if(user!=null){ %>
                <a  class="button" onclick="run1()" style="background-color: #8080ff;height: 40px;">信息查询</a>
                <%if(user.canDo(3)){//班级负责人及以上权限能操作 %>
                	<a  class="button" onclick="run2()" style="background-color: #8080ff;height: 40px;">信息管理</a>
            	<%} 
            }%>
            </div>
        </div>
        <div class="left">
            <span style="width: 120px;">操作选择菜单：</span><br>
             <%if(user!=null){ //登录后操作%>
             <div id="option1">
                <ul class="nav">
                    <li>
                        <a href="StuInfo" target="main">个人详情</a>
                    </li>
                    <%if(user.canDo(3)){//班级负责人及以上权限能进行查询操作  %>
	                    <li>
	                        <a href="1Query/bulkQuery.html" target="main">批量查询</a>
	                    </li>
	                    <li>
	                        <a href="1Query/statisticQuery.html" target="main">统计查询</a>
	                    </li>
                    <%} %>
                </ul>
            </div>
            <div id="option2">
                <ul class="nav">
                    <li>
                        <a href="2Control/students/student.jsp" target="main">学生管理</a>
                    </li>
                    <li>
                        <a href="2Control/classes/class.jsp" target="main">班级管理</a>
                    </li>
                    <li>
                        <a href="2Control/rooms/room.jsp" target="main">宿舍管理</a>
                    </li>
                    <li>
                        <a href="2Control/environments/environment.jsp" target="main">卫生管理</a>
                    </li>
                     <%if(user.canDo(1)){//仅系统管理员可查看 %>
	                    <li>
	                        <a href="2Control/levels/level.jsp" target="main">权限管理</a>
	                    </li>
                    <%} %>
                </ul>
            </div>
            <%}else{ %>
            	<center><b> 请先登录</b></center>
           	<%} %>
        </div>
       
        <div class="frame">
                <iframe name="main" src="" frameborder="0"></iframe>
        </div>
    </div>
    
</body>
    <script>
        function run1(){
           var option1 =  document.getElementById('option1');
           var option2 = document.getElementById('option2');
           option1.style.display = "block";
           option2.style.display = "none"
        }
        function run2(){
           var option1 =  document.getElementById('option1');
           var option2 = document.getElementById('option2');
           option2.style.display = "block";
           option1.style.display = "none"
        }
        
    </script>
</html>