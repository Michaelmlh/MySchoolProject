<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
	function check(theform){
		if(theform.no.value==""){
			alert("学号不能为空！");
			theform.no.focus();
			return  false;
		}
		if(theform.name.value==""){
			alert("学生名字不能为空！");
			theform.name.focus();
			return  false;
		}
		return true;
	}	
	function Date(theselect,dayselect){
		var month=theselect.value;
		/* console.log("dayselect=",dayselect," month=",month); */
		var i=0;
		dayselect.options.length=0;
		for(i=1;i<=28;i++){
			dayselect.options[i-1]=new Option(i, i);
		}
		switch(month){
		case "1":case "3":case "5":case "7":case "8":case "10":case "12":{
			for(i=29;i<=31;i++){
				dayselect.options[i-1]=new Option(i, i);
			}
			break;
		}
		case "4":case "6":case "9":case "11":{
			for(i=29;i<=30;i++){
				dayselect.options[i-1]=new Option(i, i);
			}
			break;
		}
		case "2":
			break;
		
		}
	}
</script>
</head>
<body>
<%
	Calendar now = Calendar.getInstance(); 
	String year=now.get(Calendar.YEAR)+"";
	String month=(now.get(Calendar.MONTH)+1)+"";
	String day=now.get(Calendar.DAY_OF_MONTH)+"";
%>
    <h1 align="center">添加检查记录</h1> 
    <form name="form1" action="../../RegisterEnv" method="post" >
        <table align="center" border=0 width=80%>
            <tr>
                <td align = "right" width=45%>检查宿舍号：</td> 
                <td><input type="text" name="no">*</td>
            </tr>
            <tr>
                <td align = "right">检查日期：</td>
                <td><input type = "text" name="checkYear" value="<%=year%>"><!-- 动态表示为当前年份 -->
                <select name="checkMonth" onchange="Date(this,checkDay)">
                    <%for(int i=1;i<=12;i++){ %>
                		<option value="<%=i %>"><%=i %></option>
                	<%} %>
                </select>月
                <select name="checkDay" id="checkDay"><option value="1">1</option>		</select>日*</td>
            </tr>
             <tr>
                <td align = "right">用电和气味：</td>
                <td><input type="text" name="E&S"></td>
            </tr>
             <tr>
                <td align = "right">地面：</td>
                <td><input type="text" name="floor"></td>
            </tr>
            <tr>
                <td align = "right">书桌：</td>
                <td><input type="text" name="desk"></td>
            </tr>
            <tr>
                <td align = "right">床铺：</td>
                <td><input type="text" name="bed"></td>
            </tr>
            <tr>
                <td align = "right">洗漱台：</td>
                <td><input type="text" name="wash"></td>
            </tr>
            <tr>
                <td align = "right">卫生间：</td>
                <td><input type="text" name="bathroom"></td>
            </tr>
            <tr>
                <td align = "right">阳台：</td>
                <td><input type="text" name="sun"></td>
            </tr>
            <tr>
                <td align = "right">备注：</td>
                <td><input type="text" name="note"></td>
            </tr>
            <tr>
                <td align = "right">是否整改：</td>
                <td><input type="radio" name=isChange value="1" checked>是<input type="radio" name=sex value="0">否</td>
            </tr>
            
           
           
            
            
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