<!-- para acessar no navegador, executar o servidor e acessar a URL:
http://localhost:8080/A05/p11/Controller/Ajax
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DW2 a05 p11 (caso ex 2)</title>
</head>
<body>
	<script src="/A05/p11/view_codes.js"></script>
	<select id="campoCategoria" name="categoria" size="5" onchange="buscarLivros()">
		<c:forEach var="c" items="${categorias}">
			<option value="${c}">${c}</option>
		</c:forEach>
	</select>
	
	<select id="campoLivro" name="livro" size="5" style="width: 200px;" onchange="buscarInfoLivro()">
	</select>	
	
	<textarea id="campoInfoLivro" rows="5" cols="40">
	</textarea>
</body>
</html>