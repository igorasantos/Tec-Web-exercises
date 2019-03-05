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
		<p><em>Alterando atributo nome do objeto Pessoa, usando c:set target</em></p>
		<ul>
			<c:forEach var="pessoa" items="${pessoas}" varStatus="status">
			<li>				
				<c:set target="${pessoa}" property="id" value="${status.index+1}"/>
				<c:set target="${pessoa}" property="nome" value="${pessoa.nome}${pessoa.id}"/>
				<c:out value="${pessoa.id}"/> - <c:out value="${pessoa.nome}"/>
							
			</li>
			</c:forEach>
		</ul>
	</body>
</html>