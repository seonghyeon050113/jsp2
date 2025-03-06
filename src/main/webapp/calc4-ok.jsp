<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num1 = request.getParameter("num1");
String op = request.getParameter("op");
String num2 = request.getParameter("num2");
int n1 = Integer.parseInt(num1);
int n2 = Integer.parseInt(num2);
int result = 0;
if("1".equals(op)){
	result = n1 + n2;
}else if("2".equals(op)){
	result = n1 - n2;
}else if("3".equals(op)){
	result = n1 * n2;
}else if("4".equals(op)){
	result = n1 / n2;
}
%>
결과 : <%=result%>