<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>유저등록</h3>
<form method="GET" action="/user/insert-ok.jsp">
	<input type="text" name="uiName" placeholder="이름"><br>
	<input type="text" name="uiAge" placeholder="나이"><br>
	<input type="text" name="uiId" placeholder="아이디"><br>
	<input type="password" name="uiPwd" placeholder="비번"><br>
	<input type="text" name="uiPhone" placeholder="전번"><br>
	<input type="text" name="uiAddress" placeholder="주소"><br>
	<input type="radio" name="uiTrans" value="1" id="men"><label for="men">남</label>
	<input type="radio" name="uiTrans" value="2" id="women"><label for="women">여</label><br>
	<button>등록</button>
</form>
</body>
</html>