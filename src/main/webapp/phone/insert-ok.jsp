<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBcon.DBcon"%>
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
<% 
String piName = request.getParameter("piName");
String piPrice = request.getParameter("piPrice");
String piRelease = request.getParameter("piRelease");
String piVendor = request.getParameter("piVendor");

Connection con = DBcon.getDBcon();
String sql = "insert into PHONE_INFO";
sql+= "(PI_NAME, PI_PRICE, PI_RELEASE, PI_VENDOR)";
sql+= "VALUES(?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, piName);
ps.setString(2, piPrice);
ps.setString(3, piRelease);
ps.setString(4, piVendor);
int result = ps.executeUpdate();
if(result==1){
%>
게시물 등록이 잘되었습니다.
<% 
String str = piRelease;
String[] strs = piRelease.split("-");
str="";
for(int i=0;i<=strs.length;i++){
	str+=strs[i];
}
ps.SetString(3,piRelease);
}else {
%>
게시물 등록시 오류 발생하였습니다.
<%
}
%>
<br>
<a href = "/phone/list.jsp">게시판</a>
</body>
</html>