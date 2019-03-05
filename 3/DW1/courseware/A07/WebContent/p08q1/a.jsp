<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<style>
			ul{
				list-style-type: none;
				padding: 0 0 0 20px;
			}
		</style>
	</head>
	<body>
		<h1>Lista de pessoas</h1>
		<p><em>Alterando atributo nome do objeto Pessoa, usando c:set var</em></p>
		<ul>
			<c:forEach var="pessoa" items="${pessoas}" varStatus="status">
			<li>				
				<c:set var="id" value="${id+1}"/>
				<c:set var="nome" value="${pessoa.nome}${id}"/>
				<c:out value="${id}"/> - <c:out value="${nome}"/>			
			</li>
			</c:forEach>
		</ul>
	</body>
</html>