<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<% DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); %>
	<% Calendar cal = Calendar.getInstance(); %>
	<%= sdf.format(cal.getTime()) %>
</body>
</html>