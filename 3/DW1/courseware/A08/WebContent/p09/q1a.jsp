<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt_BR" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Teste de fmt:formatDate</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	</head>
	<body>
		<div class="container">
			<h1>fmt:formatDate</h1>
			<p>value=<em>"${pessoa.dataNascimento.getTime()}"</em> in var=<em>"thisP"</em></p>
			<div class="table-responsive-md">
				<table class="table table-hover table-sm">
					<thead class="thead-dark">
						<tr>
							<th>Pessoa</th>						
							<th>Type="date" dateStyle="default"</th>
							<th>Type="time" timeStyle="default"</th>
							<th>Type="both" date and timeStyle="default"</th>
							<th>Type="both" date and timeStyle="short"</th>
							<th>Type="both" date and timeStyle="medium"</th>
							<th>Type="both" date and timeStyle="long"</th>
							<th>Type="both" date and timeStyle="full"</th>							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="pessoa" items="${pessoas}">
							<c:set value="${pessoa.dataNascimento.getTime()}" var="thisP"/>
							<tr>				
								<td><c:out value="${pessoa.nome}"/></td>							
								<td><fmt:formatDate value="${thisP}" type="date" dateStyle="default"/></td>
								<td><fmt:formatDate value="${thisP}" type="time" timeStyle="default"/></td>
								<td><fmt:formatDate value="${thisP}" type="both" dateStyle="default" timeStyle="default"/></td>
								<td><fmt:formatDate value="${thisP}" type="both" dateStyle="short" timeStyle="short"/></td>
								<td><fmt:formatDate value="${thisP}" type="both" dateStyle="medium" timeStyle="medium"/></td>
								<td><fmt:formatDate value="${thisP}" type="both" dateStyle="long" timeStyle="long"/></td>
								<td><fmt:formatDate value="${thisP}" type="both" dateStyle="full" timeStyle="full"/></td>			
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>