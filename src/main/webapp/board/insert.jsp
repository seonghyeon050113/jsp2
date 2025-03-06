<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="GET" action="/board/insert-ok.jsp">
	<input type="text" name="biTitle" placeholder="제목"><br>
	<input type="text" name="biWriter" placeholder="작성자"><br>
	<textarea name="biContent"></textarea>
	<button>등록</button>
</form>
</body>
</html>