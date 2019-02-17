<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%! int cont = 1; %>
<%!
	String mostraData() {
	   Calendar agora = Calendar.getInstance();
	   String ano = Integer.toString(agora.get(Calendar.YEAR));
	   String mes = Integer.toString(agora.get(Calendar.MONTH));
	   String dia = Integer.toString(agora.get(Calendar.DAY_OF_MONTH));
	   String hora = Integer.toString(agora.get(Calendar.HOUR_OF_DAY));
	   String minuto = Integer.toString(agora.get(Calendar.MINUTE));
	   String segundo = Integer.toString(agora.get(Calendar.SECOND));
	   String data_hora = "[" + ano + "-" + mes + "-" + dia + "] " + hora + ":" + minuto + ":" + segundo;   
	   return data_hora;
	}
%>
<% if (cont == 1) { %>
	<%! String primeiroAcesso = mostraData(); %>
<% } %>
<%! String acessoUltimo; %>
<% acessoUltimo = mostraData(); %>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>	
	<p>Este é o acesso de número: <%= cont %></p>
	<% cont++; %>
	<h1>Primeiro acesso</h1>
	<p><%= primeiroAcesso %></p>
	<h1>Último acesso</h1>
	<p><%= acessoUltimo%></p>
</body>
</html>