<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String biNum = request.getParameter("biNum");
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/ezen";
Connection con = DriverManager.getConnection(url,"root","r1r2r3");
String sql = "DELETE FROM BOARD_INFO WHERE BI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,biNum);
int result = ps.executeUpdate();
if(result==1){
	out.println("정상적으로 삭제되었습니다.");
}else{
	out.println("이미 삭제된 게시물입니다.");
}
%>
<a href="/board/list.jsp">게시판</a>