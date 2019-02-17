<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<p>Sr. <%= request.getParameter("primeiroNome") %> <%= request.getParameter("sobrenome") %>,</p>
	<p>É um prazer tê-lo conosco!</p>
</body>
</html>