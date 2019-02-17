<%@page import="java.util.Properties" %>
<%@page import="java.util.Set" %>
<%@page import="java.io.InputStream" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem do arquivo propriedade.txt</title>
</head>
<body>
	<%!
		Properties propriedades = new Properties();
	%>
	<%
		InputStream is = application.getResourceAsStream("/WEB-INF/propriedades.txt");
		
		propriedades.load(is);
		is.close();
		Set<Object> chaves = propriedades.keySet();
	%>
	<h1>Lista de Propriedades do Sistema</h1>
	<table border="1" width="100%">
		<tr>
			<td><strong>Nome</strong></td>
			<td><strong>Valor</strong></td>
		</tr>
		<% for (Object c: chaves){ %>
		<tr>
			<td><%= c %></td>
			<td><%= propriedades.getProperty((String)c) %></td>
		</tr>
		<% } %>
	</table>
</body>
</html>