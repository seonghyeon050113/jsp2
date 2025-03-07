<%@page import="java.util.HashMap"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBcon.DBcon"%>
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
	<table border = 1;>
		<tr>
			<td>휴대폰 이름</td>
			<td>휴대폰 가격</td>
			<td>휴대폰 출시일</td>
			<td>휴대폰 제조회사</td>
		</tr>
		<%
		Connection con = DBcon.getDBcon();
		List<Map<String, String>> list = new ArrayList<>();
		String sql = "select PI_NUM, PI_NAME ,PI_RELEASE, PI_VENDOR";
		sql += " from PHONE_INFO";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Map<String, String> map = new HashMap<>();
			map.put("piNum", rs.getString("PI_NUM"));
			map.put("piName", rs.getString("PI_NAME"));
			map.put("piPrice", rs.getString("PI_NUM"));
			map.put("piRelease", rs.getString("PI_RELEASE"));
			map.put("piVendor", rs.getString("PI_VENDOR"));
			list.add(map);
		}
		if (list.size() == 0) {
		%>
		<tr>
			<th colspan="4">휴대폰정보가 없습니다.</th>
		</tr>
		<%
		} else {
		for (Map<String, String> phone : list) {
		%>
		<tr>
			<td><%=phone.get("piNum")%></td>
			<td><a href="/phone/view.jsp?piNum=<%=phone.get("piNum")%>"><%=phone.get("piName")%></a></td>
			<td><%=phone.get("piPrice")%></td>
			<td><%=phone.get("piRelease")%></td>
			<td><%=phone.get("piVendor")%></td>
		</tr>
		<%
		}
		}
		%>
		<tr>
			<th colspan="3"><a href="/phone/insert.jsp">휴대폰정보등록</a></th>
		</tr>
	</table>
</body>
</html>