<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
	function check(theform){
		if(theform.no.value==""){
			alert("班号不能为空！");
			theform.no.focus();
			return  false;
		}
		if(theform.name.value==""){
			alert("班级名称不能为空！");
			theform.name.focus();
			return  false;
		}
		return true;
	}	
</script>
</head>
<body>
    <h1 align="center">注册新班级</h1> 
    <form name="form1" action="../../RegisterCla" method="post" >
        <table align="center" border=0 width=80%>
            <tr>
                <td align = "right" width=45%>班号：</td> 
                <td><input type="text" name="no">*</td>
            </tr>
            <tr>
                <td align = "right" width=45%>班名：</td> 
                <td><input type="text" name="name">*</td>
            
            <tr>
                <td align="center" colspan=2>
                    <input type="reset">
                    <input type="submit" value="提交">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>