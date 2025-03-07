<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="/phone/insert-ok.jsp">
<input type = "text" name="piName" placeholder="휴대폰 기종">
<input type = "text" name="piPrice" placeholder="휴대폰 가격">
<input type = "DATE" name="piRelease" placeholder="휴대폰 출시일">
<input type = "text" name="piVendor" placeholder="휴대폰 회사">
<button>등록하기</button>
</form>
</body>
</html>