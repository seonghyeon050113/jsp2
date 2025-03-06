<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<%
String sql = "\r\n"
		+ "select UI_NUM, UI_NAME, UI_AGE, UI_ID, \r\n"
		+ "UI_PWD, UI_PHONE, UI_ADDRESS, UI_TRANS\r\n"
		+ "from USER_INFO";
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/ezen";
Connection con = DriverManager.getConnection(url, "root", "r1r2r3");
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
List<Map<String,String>> users = new ArrayList<>();
while(rs.next()){
	Map<String,String> user = new HashMap<>();
	user.put("uiNum", rs.getString("UI_NUM"));
	user.put("uiName", rs.getString("UI_NAME"));
	user.put("uiAge", rs.getString("UI_AGE"));
	user.put("uiId", rs.getString("UI_ID"));
	user.put("uiPwd", rs.getString("UI_PWD"));
	user.put("uiPhone", rs.getString("UI_PHONE"));
	user.put("uiAddress", rs.getString("UI_ADDRESS"));
	user.put("uiTrans", rs.getString("UI_TRANS"));
	users.add(user);
}
%>
<table border="1">
	<tr>	
		<th>번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>전화번호</th>
		<th>성별</th>
	</tr>
<%
if(users.size()==0){
%>
	<tr>
		<th colspan="5">등록된 유저가 없습니다.</th>
	</tr>
<%
}else{
	for(Map<String,String> user : users){
%>
	<tr>
		<td><%=user.get("uiNum")%></td>
		<td><%=user.get("uiName")%></td>
		<td><%=user.get("uiId")%></td>
		<td><%=user.get("uiAge")%></td>
		<td><%="1".equals(user.get("uiTrans"))?"남":"여"%></td>
	</tr>
<%
	}
}
%>
	<tr>
		<th colspan="5"><a href="/user/insert.jsp">유저등록</a></th>
	</tr>
</table>
</body>
</html>