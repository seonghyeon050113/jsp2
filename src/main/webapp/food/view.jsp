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
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/ezen";
Connection con = DriverManager.getConnection(url,"root","r1r2r3");
String sql = "SELECT FI_NUM, FI_NAME, FI_PRICE";
sql +="FROM FOOD_INFO WHERE FI_NUM = ?";
PreparedStatement ps= con.prepareStatement(sql);


%>
</body>
</html>