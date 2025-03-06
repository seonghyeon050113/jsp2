<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<h3>로그인</h3>
<form method="GET" action="/login-ok.jsp">
	<input type="text" name="id" placeholder="아이디"><br>
	<input type="password" name="pwd" placeholder="비밀번호"><br>
	<button>로그인</button>
</form>
</body>
</html>