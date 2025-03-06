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
<title>상세화면</title>
</head>
<body>
<%
String biNum = request.getParameter("biNum");
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/ezen";
Connection con = DriverManager.getConnection(url, "root", "r1r2r3");
String sql = "SELECT BI_NUM, BI_TITLE, BI_WRITER, BI_CONTENT FROM BOARD_INFO";
sql += " WHERE BI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,biNum);
ResultSet rs = ps.executeQuery();
Map<String,String> board = new HashMap<>();
if(rs.next()){
	board.put("biNum",rs.getString("BI_NUM"));
	board.put("biTitle",rs.getString("BI_TITLE"));
	board.put("biWriter",rs.getString("BI_WRITER"));
	board.put("biContent",rs.getString("BI_CONTENT"));
}
if(board.isEmpty()){
%>
	해당 게시물은 이미 삭제되었습니다.<br>
	<a href="/board/list.jsp">돌아가기</a>
<%
}else{
%>
<form method="GET" action="/board/delete.jsp">
	<input type="hidden" name="biNum" value="<%=board.get("biNum")%>">
	<table border="1">
		<tr>
			<th>번호</th>
			<td><%=board.get("biNum")%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=board.get("biTitle")%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=board.get("biWriter")%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=board.get("biContent")%></td>
		</tr>
		<tr>
			<th colspan="2">
				<button>수정</button> <button>삭제</button>
			</th>
		</tr>
	</table>
</form>
<%
}
%>
</body>
</html>