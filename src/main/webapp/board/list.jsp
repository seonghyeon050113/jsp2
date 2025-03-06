<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<h3>자유 게시판</h3>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/ezen";
Connection con = DriverManager.getConnection(url,"root","r1r2r3");
List<Map<String,String>> list = new ArrayList<>();
String sql = "select BI_NUM, BI_TITLE, BI_WRITER,CREDAT";
sql += " from BOARD_INFO";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()){
	Map<String,String> map = new HashMap<>();
	map.put("biNum", rs.getString("BI_NUM"));
	map.put("biTitle", rs.getString("BI_TITLE"));
	map.put("biWriter", rs.getString("BI_WRITER"));
	map.put("credat", rs.getString("CREDAT"));
	list.add(map);
}
if(list.size()==0){
%>
	<tr>
		<th colspan="4">내용이 없습니다.</th>
	</tr>
<%
}else{
	for(Map<String,String> map : list){
%>
	<tr>
		<td><%=map.get("biNum") %></td>
		<td><%=map.get("biTitle") %></td>
		<td><%=map.get("biWriter") %></td>
		<td><%=map.get("credat") %></td>
	</tr>
<%
	}
}
%>
	<tr>
		<th colspan="4"><a href="/board/insert.jsp">글쓰기</a></th>
	</tr>
</table>
</body>
</html>