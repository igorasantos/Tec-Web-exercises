<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% javaClass.Contador.novoAcesso(); %>
	<p>Quantidade de acessos a essa página:</p>
	<strong>
		<%= javaClass.Contador.getQuantidadeAcessos() %>
	</strong>
</body>
</html>