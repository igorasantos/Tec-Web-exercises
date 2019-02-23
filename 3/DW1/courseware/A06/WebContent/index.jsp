<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hello World</title>
	</head>
	<body>
		<p>Seja bem-vindo a esse sistema! Selecione a operação desejada:</p>
		<ol>
			<li><a href="Controller?acao=cadastrar">Registrar um encontro.</a></li>
			<li><a href="Controller?acao=listar">Listar, remover ou editar meus encontros.</a></li>			
			<li><a href="Controller?acao=callQueryMeetByName">Consultar encontro, por pessoa.</a></li>
		</ol>		
	</body>
</html>