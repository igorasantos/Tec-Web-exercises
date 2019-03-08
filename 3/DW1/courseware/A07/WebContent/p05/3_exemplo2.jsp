<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body>
		<h1>Lista de filmes</h1>
		<table>
		    <c:forEach var="filme" items="${filmes}">
		    <tr>
		    	<td>
		        	<input type="text" name="meufilme" value="<c:out value="${filme}" escapeXml="true"/>"/>
		        </td>
		    </tr>
		    </c:forEach>
		</table>		
	</body>
</html>