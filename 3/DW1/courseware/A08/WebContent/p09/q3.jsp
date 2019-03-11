<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt_BR" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL demo</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		
		<style>
			.emph{
				color: #856404;
			} 
		</style>
		<!--
		Utilizando o conhecimento adquirido nas aulas de JSTL,
		crie uma página e nela declare três variáveis (nome, data de nascimento, endereço), 
		inicialize-as e apresente o valor dessas variáveis usando JTSL, sempre que possível.
		-->
	</head>
	<body>
		<div class="container">
			<h1>JSTL demo - Artista da MPB</h1>
			<c:set var="nome" value="Agenor de Miranda Araújo Neto" />
			<c:set var="dataNascimento" value="04/04/1958" />
			<c:set var="endereco" value="Leblon, Rio de Janeiro-RJ, Brazil"/>
			<p>O valor da variável <em class="emph">nome</em> é <em class="emph"><c:out value="${nome}"/></em>.</p>
			<p>O valor da variável <em class="emph">dataNascimento</em> é <em class="emph"><c:out value="${dataNascimento}"/></em>.</p>
			<p>O valor da variável <em class="emph">endereco</em> é <em class="emph"><c:out value="${endereco}"/></em>.</p>
		</div>
	</body>
</html>