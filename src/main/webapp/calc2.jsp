<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String num1 = request.getParameter("num1");
int result = 0;
if(num1!=null){
	String op = request.getParameter("op");
	String num2 = request.getParameter("num2");
	int n1 = Integer.parseInt(num1);
	int n2 = Integer.parseInt(num2);
	if("1".equals(op)){
		result = n1 + n2;
	}else if("2".equals(op)){
		result = n1 - n2;
	}else if("3".equals(op)){
		result = n1 * n2;
	}else if("4".equals(op)){
		result = n1 / n2;
	}
}
%>
<form>
	<input type="text" name="num1" value="${param.num1}">
	<select name="op">
		<option value="1" ${param.op == "1"? "selected":""}>더하기</option>
		<option value="2" ${param.op == "2"? "selected":""}>빼기</option>
		<option value="3" ${param.op == "3"? "selected":""}>곱하기</option>
		<option value="4" ${param.op == "4"? "selected":""}>나누기</option>
	</select> 
	<input type="text" name="num2" value="${param.num2}">
	<div id="result"><%= result%></div>
	<button type="submit">계산</button>
</form>
</body>
</html>