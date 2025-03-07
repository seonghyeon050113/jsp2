<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.HashMap"%>
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
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>가격</th>
		</tr>
		
		<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = ("jdbc:mysql://localhost:3306/ezen");
		Connection con = DriverManager.getConnection(url, "root", "r1r2r3");
		List<Map<String, String>> list = new ArrayList<>();
		String sql = "SELECT FI_NUM, FI_NAME, FI_PRICE";
		sql += " FROM FOOD_INFO";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Map<String, String> map = new HashMap<>();
			map.put("fiNum", rs.getString("FI_NUM"));
			map.put("fiName", rs.getString("FI_NAME"));
			map.put("fiPrice", rs.getString("FI_PRICE"));
			list.add(map);
		}
		if (list.size() == 0) {
		%>
		<tr>
			<th colspan="3">내용이 없습니다</th>
		</tr>
	
	<%
	} else {
	for (Map<String, String> food : list) {
	%>
	<tr>
		<td><%=food.get("fiNum")%></td>
		<td><%=food.get("fiName")%></td>
		<td><%=food.get("fiPrice")%></td>
	</tr>
	<%
	}
	}
	%>
	<tr>
	<th colspan="3"><a href="/food/insert.jsp">메뉴등록</a></th>
	</tr>
	</table>
</body>
</html>