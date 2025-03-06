<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String uiId= request.getParameter("uiId");
String uiPwd= request.getParameter("uiPwd");
String uiName= request.getParameter("uiName");
String uiBirth= request.getParameter("uiBirth");
String uiAddress= request.getParameter("uiAddress");

Class.forName("com.mysq.cj.Driver");

String url = "jdbc:mysql://localhost:3306/ezen";
String id = "root";
String pwd = "r1r2r3";
String sql = "INSERT INTO USER_TEST(UI_ID, UI_PWD, UI_NAME, UI_BIRTH, UI_ADDRESS)";
sql += " VALUES(?,?,?,?,?)";
int result = 0;
try(Connection con = DriverManager.getConnection(url, id, pwd);
		PreparedStatement ps = con.prepareStatement(sql)){
	ps.setString(1,uiId);
	ps.setString(2,uiPwd);
	ps.setString(3,uiName);
	ps.setString(4,uiBirth);
	ps.setString(5,uiAddress);
	result = ps.executeUpdate();
}
if(result ==1){
%>
	<%=uiName%>님 회원가입이 성공하였습니다.
<%
}else{
%>
	회원가입에 실패하였습니다.
<%
}
%>