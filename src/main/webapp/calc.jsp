<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num1 = request.getParameter("num1");
String result ="";
if(num1!=null){
	int n1 = Integer.parseInt(num1);
	String op = request.getParameter("op");
	String num2 = request.getParameter("num2");
	int n2 = Integer.parseInt(num2);
	result = "결과 : ";
	if("1".equals(op)){
		result += (n1 + n2);
	}else if("2".equals(op)){
		result += (n1 - n2);
	}else if("3".equals(op)){
		result += (n1 * n2);
	}else if("4".equals(op)){
		result += (n2 / n2);
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- form tag method가 없을경우 default 값은 GET -->
<!-- form tag action이 없을경우 default 값은 "" -->
<form method="GET" action=""> 
	<input type="text" name="num1" value="${param.num1}">
	<select name="op">
		<option value="1" ${param.op == "1"? "selected":""}>더하기</option>
		<option value="2" ${param.op == "2"? "selected":""}>빼기</option>
		<option value="3" ${param.op == "3"? "selected":""}>곱하기</option>
		<option value="4" ${param.op == "4"? "selected":""}>나누기</option>
	</select>
	<input type="text" name="num2" value="${param.num2}">
	<div id="result"><%=result%></div>
	<button>계산</button>
</form>
</body>
</html>