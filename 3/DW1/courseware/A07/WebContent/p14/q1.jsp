<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body>
		<h1>Lista de filmes</h1>		
		<ul style="list-style-type:none;">
			<c:forEach var="filme" items="A volta dos que não foram,A mordida do banguelo,Um cavalo morto é um animal sem vida" step="2">
				<li>${filme}</li>				
			</c:forEach>
		</ul>		
	</body>
</html>