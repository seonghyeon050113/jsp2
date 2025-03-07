<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBcon.DBcon"%>
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
	String piNum = request.getParameter("piNum");
	Connection con = DBcon.getDBcon();
	String sql = "select PI_PRICE,PI_NAME,PI_RELEASE,PI_VENDOR";
	sql += "FROM PHONE_INFO WHERE PI_NUM=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, piNum);
	ResultSet rs = ps.executeQuery();
	if (!rs.next()) {
	%>
	이미 삭제된 게시물입니다
	<a href="/phone/list.jsp">게시판</a>
	<%
	} else {
	Map<String, String> board = new HashMap<>();
	board.put("piNum", rs.getString("PI_NUM"));
	board.put("piName", rs.getString("PI_NAME"));
	board.put("piRelease", rs.getString("PI_RELEASE"));
	board.put("piVendor", rs.getString("PI_VENDOR"));
	board.put("piPrice", rs.getString("PI_PRICE"));
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

			<%
			}
			%>
		</table>
	</form>
</body>
</html>