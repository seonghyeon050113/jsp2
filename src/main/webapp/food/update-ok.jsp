<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String fiNum = request.getParameter("fiNum");
	String fiName = request.getParameter("fiName");
	String fiPrice = request.getParameter("fiPrice");

	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/ezen";
	Connection con = DriverManager.getConnection(url, "root", "r1r2r3");
	String sql = "UPDATE BOARD_INFO";
	sql += "SET FI_NAME";
	sql += "FI_PRICE=?";
	sql += "WHERE FI_NUM=?";

	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, fiName);
	ps.setString(2, fiPrice);
	ps.setString(1, fiNum);
	int result = ps.executeUpdate();
	if (result == 1) {
	%>
	<script>
	aler('수정 완료!!');
	localtion.href='/board/view.jsp?fiNum=<%=fiNum%>
		';
	</script>
	<%
	} else {
	%>
	<script>
		alert('이미 삭제된 게시물입니다');
		location.href = '/food/list.jsp';
	</script>
	<%
	}
	%>
</body>
</html>