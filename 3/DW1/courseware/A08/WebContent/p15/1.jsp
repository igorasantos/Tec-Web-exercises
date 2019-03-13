<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body>
		<h1>Lista de pessoas</h1>
		<%
			request.setAttribute("pessoas", new String[] {"joao", "maria", "joaquim", "Luana", "eduardo"});
		%>
		<ul>
			<c:forEach var="pessoa" items="${pessoas}" varStatus="status">
				<c:choose>
					<c:when test="${status.index % 2 == 0}">
						<c:set var="bgColor" value="lightgray" />
					</c:when>
					<c:otherwise>
						<c:set var="bgColor" value="white" />
					</c:otherwise>
				</c:choose>
				<li style="background-color: <c:out value="${bgColor}"/>;">
					<c:out value="${pessoa}" />
				</li>
			</c:forEach>
		</ul>
	</body>
</html>