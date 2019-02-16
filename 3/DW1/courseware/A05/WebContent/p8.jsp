<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% A05.Contador.novoAcesso(); %>
	<p>Quantidade de acessos a essa página:</p>
	<strong>
		<%= A05.Contador.getQuantidadeAcessos() %>
	</strong>
</body>
</html>