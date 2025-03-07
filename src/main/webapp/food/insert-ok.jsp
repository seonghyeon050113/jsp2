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
String fiName = request.getParameter("fiName");
String fiPrice = request.getParameter("fiPrice");

Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/ezen";
Connection con = DriverManager.getConnection(url,"root","r1r2r3");

String sql = "INSERT INTO FOOD_INFO(fiName, fiPrice)";
sql+= "values(?,?)";
PreparedStatement rs= con.prepareStatement(sql);
rs.setString(1,fiName);
rs.setString(2,fiPrice);
int result = rs.executeUpdate();
if(result==1){
%>
등록에 성공하였습니다
<%
}
else{
%>
등록에 실패하였습니다
<%
}
%>
</body>
</html>