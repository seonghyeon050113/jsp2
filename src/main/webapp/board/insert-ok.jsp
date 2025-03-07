<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String biTitle = request.getParameter("biTitle");
String biWriter = request.getParameter("biWriter");
String biContent = request.getParameter("biContent");

Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/ezen";
Connection con = DriverManager.getConnection(url, "root", "r1r2r3");
String sql = "insert into BOARD_INFO(BI_TITLE, BI_CONTENT, BI_WRITER)";
sql += " VALUES(?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, biTitle);
ps.setString(2, biWriter);
ps.setString(3, biContent);
int result = ps.executeUpdate();
if (result == 1) {
%>
게시물등록이 잘되었습니다.
<%
} else {
%>
게시물 등록 시 오류 발생하였습니다.
<%
}
%>
<br>
<a href="/board/list.jsp">게시판</a>