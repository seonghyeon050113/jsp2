<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uiName = request.getParameter("uiName");
String uiAge = request.getParameter("uiAge");
String uiId = request.getParameter("uiId");
String uiPwd = request.getParameter("uiPwd");
String uiPhone = request.getParameter("uiPhone");
String uiAddress = request.getParameter("uiAddress");
String uiTrans = request.getParameter("uiTrans");
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/ezen";
Connection con = DriverManager.getConnection(url, "root", "r1r2r3");
String sql = "insert into USER_INFO(UI_NAME, UI_AGE, UI_ID, UI_PWD,\r\n"
		+ "UI_PHONE, UI_ADDRESS, UI_TRANS)\r\n"
		+ "VALUES(?,?,?,?,\r\n"
		+ "?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,uiName);
ps.setString(2,uiAge);
ps.setString(3,uiId);
ps.setString(4,uiPwd);
ps.setString(5,uiPhone);
ps.setString(6,uiAddress);
ps.setString(7,uiTrans);
int result = ps.executeUpdate();
if(result==1){
%>
	<%=uiName%>님이 정상적으로 등록 되었습니다.
<%
}else{
%>
	유저 등록 시에 오류가 발생하였습니다.
<%
}
%>
<a href="/user/list.jsp">유저목록</a>