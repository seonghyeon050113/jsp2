<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBcon.DBcon"%>
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
	String piNum = request.getParameter("piNum");
	Connection con = DBcon.getDBcon();
	String sql = "select PI_NUM,PI_PRICE, PI_NAME ,PI_RELEASE, PI_VENDOR";
	sql += " from PHONE_INFO";
	sql += " where PI_NUM=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, piNum);
	ResultSet rs = ps.executeQuery();
	Map<String, String> board = new HashMap<>();
	if (rs.next()) {
		board.put("piNum", rs.getString("PI_NUM"));
		board.put("piName", rs.getString("PI_NAME"));
		board.put("piPrice", rs.getString("PI_PRICE"));
		board.put("piRelease", rs.getString("PI_RELEASE"));
		board.put("piVendor", rs.getString("PI_VENDOR"));
	}
	if (board.isEmpty()) {
	%>
	해당 정보는 이미 삭제되었거나 없습니다.
	<br>
	<a href="/phone/list.jsp">돌아가기</a>
	<%
	} else {
	%>
	<form method="GEt" action="/phone/update-ok.jsp">
		<input type="hidden" name="piNum" value="<%=board.get("piNum")%>">
		<table border="1">
			<tr>
				<td>번호</td>
				<td><%=board.get("piNum")%></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="piName"
					value="<%=board.get("piName")%>"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="piPrice"
					value="<%=board.get("piPrice")%>"></td>
			</tr>
			<tr>
				<th>출시일</th>
				<td><input type="text" name="piRelease"
					value="<%=board.get("piRelease")%>"></td>
			</tr>
			<tr>
				<th>제조사</th>
				<td><input type="text" name="piVendor"
					value="<%=board.get("piVendor")%>"></td>
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