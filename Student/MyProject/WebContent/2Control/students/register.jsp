<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <h1 align="center">注册新学生</h1> 
    <form name="form1" action="../../RegisterStu" method="post" >
        <table align="center" border=0 width=80%>
            <tr>
                <td align = "right" width=45%>学号：</td> 
                <td><input type="text" name="no">*</td>
            </tr>
            <tr>
                <td align = "right" width=45%>姓名：</td> 
                <td><input type="text" name="name" onBlur="check(form1)">*</td>
            </tr>
            <tr>
                <td align = "right">性别：</td>
                <td><input type="radio" name=sex value=男 checked>男<input type="radio" name=sex value=女>女</td>
            </tr>
            <tr>
                <td align = "right">出生年月：</td>
                <td><input type = "text" name="birthYear" value="1990">
                <select name="birthMonth" onchange="Date(this,birthDay)">
                    <%for(int i=1;i<=12;i++){ %>
                		<option value="<%=i %>"><%=i %></option>
                	<%} %>
                </select>月
                <select name="birthDay" id="birthDay"><option value="1">1</option>		</select>日</td>
            </tr>
            <tr>
                <td align = "right">民族：</td>
                <td><input type="text" name="nation"></td>
            </tr>
            <tr>
                <td align = "right">入学年份：</td>
                <td><input type = "text" name="intoYear" value="1990">
                <select name="intoMonth" onchange="Date(this,intoDay)">
                	<%for(int i=1;i<=12;i++){ %>
                		<option value="<%=i %>"><%=i %></option>
                	<%} %>
                </select>月
                <select name="intoDay" id="intoDay"><option value="1">1</option>		</select>日</td>
            </tr>
            <tr>
                <td align = "right">联系方式：</td>
                <td><input type="text" name="phone"></td>
            </tr>
            <tr>
                <td align = "right">班号：</td>
                <td><input type="text" name="clasNo"></td>
            </tr>
            <tr>
                <td align = "right">宿舍号：</td>
                <td><input type="text" name="roomNo"></td>
            </tr>
            <tr>
                <td align = "right">床位号：</td>
                <td><input type="text" name="bedNo"></td>
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