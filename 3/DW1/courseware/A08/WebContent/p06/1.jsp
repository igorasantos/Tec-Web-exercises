<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt_BR" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Lista de Pessoas</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	</head>
	<body>
		<div class="container">
			<h1>Lista de pessoas</h1>
			<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<th>Pessoa</th>
						<th>Data de nascimento</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pessoa" items="${pessoas}">
						<tr>				
							<td><c:out value="${pessoa.nome}"/></td>
							<td><fmt:formatDate value="${pessoa.dataNascimento.getTime()}"/></td>			
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</body>
</html>