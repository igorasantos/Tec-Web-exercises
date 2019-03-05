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
		<h1>Multiplication table</h1>
		<p><em>Using c:set var</em></p>
		<ul>
			<c:set var="multFac" value="${param.multFactor}"/>
			<c:forEach var="mult" begin="0" end="9">			
				<li>					
					<c:out value="${multFac}"/> * <c:out value="${mult}"/> = <c:out value="${multFac * mult}"/>			
				</li>
			</c:forEach>
		</ul>
	</body>
</html>