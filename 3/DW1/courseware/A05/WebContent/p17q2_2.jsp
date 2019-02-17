<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Tela inicial</title>
</head>
<body>
	<jsp:include page="p17q2_1.jsp">
    	<jsp:param name="primeiroNome" value="PrimeiroNome" />
    	<jsp:param name="sobrenome" value="Sobrenome" />
	</jsp:include>
</body>
</html>