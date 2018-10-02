<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>   
    <title>欢迎使用学生宿舍卫生管理系统</title>    
	<script type="text/javascript">
	// 验证输入不为空的脚本代码
	function checkForm(form) {
		if(form.username.value == "") {
			alert("用户名不能为空!");
			form.username.focus();
			return false;
		}	
		if(form.password.value == "") {
			alert("密码不能为空!");
			form.password.focus();
			return false;
		}	
		return true;
	}
	</script>
	<style type="text/css">
	body{
	background-image: url(../images/bg.jpg);
	background-repeat: no-repeat;
	background-size: 100%;
	background-attachment: fixed;/* 自动调整 */
	}
	</style>
  </head>
  
  <body>
    <h1 align="center">用户登录</h1>
	<form  name="form1" method="post" action="../servlet/Login" onsubmit="return checkForm(this);">
	  <table width="300" border="1" align="center">
	    <tr>
	      <td width="80">用&nbsp;户&nbsp;名</td>
	      <td width="220"><input type="text" name="username" /></td>
	    </tr>
	    <tr>
	      <td>密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
	      <td><input type="password" name="password" /></td>
	    </tr>	   
	    <tr>
	      <td colspan="2" align="center">
	        <input type="submit" name="Submit" value="登录" />&nbsp;&nbsp;&nbsp;&nbsp;
	        <input type="reset" name="Submit2" value="重置" />
	      </td>
	    </tr>
	  </table>
	</form>
  </body>
</html>
