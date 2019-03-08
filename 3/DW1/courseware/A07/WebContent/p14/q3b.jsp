<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body>
		<h1>Lista de filmes</h1>		
		<ul style="list-style-type:none;">
			<c:forEach var="filme" items="A volta dos que não foram,A mordida do banguelo,Um cavalo morto é um animal sem vida" varStatus="status">
				<c:choose>         
					<c:when test="${status.index % 2 == 0}">
						<li style="background-color:blue;color:white;">${filme}</li>
					</c:when>
					<c:otherwise>
						<li style="background-color:yellow;">${filme}</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>		
	</body>
</html>

