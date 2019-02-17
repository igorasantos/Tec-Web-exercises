<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<p>Sr. <%= request.getParameter("usuario") %>,</p>
	<!--
		se a URL não tiver parâmetros
		(que serão recebidos pelo método doGet servlet gerado por esse JSP),
		retornará 'null'. se tiver parâmetro na URL, retornará o valor passado
	-->
	<p>É um prazer tê-lo conosco!</p>
</body>
</html>