<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
<h3>게시글 구성</h3>
<%
String biNum=request.getParameter("biNum");
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/ezen";
Connection con = DriverManager.getConnection(url,"root","r1r2r3");
String sql = "SELECT BI_NUM, BI_TITLE, BI_COTENT,BI_WRITER,";
sql += " FROM BOARD_INFO WHERE BI_NUM+? ";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, biNum);
ResultSet rs= ps.executeQuery();
if(!rs.next()){
	%>
	이미 삭제된 게시물입니다
	<a href="/board/list.jsp/">게시만</a>
	<% 	
}else {
	Map<String,String > board = new HashMap<>();
	board.put("biNum",rs.getString("BI_NUM"));
	board.put("biTitle",rs.getString("BI_TITLE"));
	board.put("biContent",rs.getString("BI_CONTENT"));
	board.put("biWriter",rs.getString("BI_WRITER"));
%>	
<form method="GET" action="/board/update-ok.jsp">
	<input type="hidden" name="biNum" value="<%=board.get("biNum")%>">
	<table border="1">
		<tr>
			<th>번호</th>
			<td><%=board.get("biNum")%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name = "biTitle" value="<%= board.get("biTitle")%>"></td>
			
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type = "text" name = "biWriter" value = "<%=board.get("biWriter")%>"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name = "biContent"><%=board.get("biContent")%></textarea></td>
		</tr>
		<tr>
			<th colspan="2">
				<button>수정</button>
			</th>
		</tr>
	</table>
</form>
<% 	
}
%>


</body>
</html>