<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%!
	int cont;
	int calculaContagem() {
	   int valor = 1;
	   int hora = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
	   if (hora >= 22 || hora < 6) {
	      valor = 2;
	   }
	   return valor;
	}
	%>
	<%
		cont = cont + calculaContagem();
	%>
	<p>Este é o acesso de número: <%= cont %>*</p>
	<p>* Considerando que acessos noturnos valem por 2.</p>
</body>
</html>