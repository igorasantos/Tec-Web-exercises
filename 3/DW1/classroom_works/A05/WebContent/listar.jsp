<%@page import="java.util.Properties" %>
<%@page import="java.util.Set" %>
<%@page import="java.io.InputStream" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem do arquivo propriedade.txt</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
	<div class="container">
		<h1>Lista de Propriedades do Sistema</h1>
		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th>Nome</th>
					<th>Valor</th>
				</tr>
			</thead>
			<tbody>
				<% for (Object c: chaves){ %>
				<tr>
					<td><%= c %></td>
					<td><%= propriedades.getProperty((String)c) %></td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>
</body>
</html>