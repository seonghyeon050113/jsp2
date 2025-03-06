<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="GET" action="/calc4-ok.jsp">
	<input type="text" name="num1"><br>
	<select name="op">
		<option value="1">더하기</option>
		<option value="2">빼기</option>
		<option value="3">곱하기</option>
		<option value="4">나누기</option>
	</select><br>
	<input type="text" name="num2"><br>
	<button>계산하기</button>
</form>
</body>
</html>