<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body>
		<c:catch var="excecao">
	    	<% int x = 28/0; %>
		</c:catch>
		<c:if test="${excecao!=null}">
			<p>Ocorreu um erro pois excecao!=null </p>
			<p>Mensagem do erro: ${excecao.message}</p>
		</c:if>		
	</body>
</html>