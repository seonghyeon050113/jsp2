<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num1 = request.getParameter("num1");
String num2 = request.getParameter("num2");
int n1 = Integer.parseInt(num1);
int n2 = Integer.parseInt(num2);
int result = n1 + n2;
%>
<%=result%>