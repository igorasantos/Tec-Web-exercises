<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="sys.Encontro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Lista de encontros</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	</head>
	<body>
		<div class="container">
			<h1>Lista de encontros</h1>
			<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
					    <th>Nome</th>
					    <th>Local</th>
					    <th>Motivo</th>
					    <th>Data</th>
					</tr>
				</thead>
				<tbody>
				<% List<Encontro> lista = (List<Encontro>) request.getAttribute("lista");
					for (Encontro meeting : lista) {
				%>
				  	<tr>
					    <td><%= meeting.getNomePessoa() %></td>
					    <td><%= meeting.getLocal() %></td>
					    <td><%= meeting.getMotivo() %></td>
					    <td>
						    <% DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy - hh:mm:ss"); %>
							<% Calendar cal = meeting.getData().getInstance(); %>
							<%= sdf.format(cal.getTime()) %>
							<% int id = meeting.getId(); %>
							<a href="Controller?acao=remover&ind=<%= id %>">[x]</a>
					    </td>					    
				  	</tr>
				<%}%>
				</tbody>
			</table>			
			<p><a href="Controller?acao=index">Voltar ao menu</a></p>
		</div>
	</body>
</html>