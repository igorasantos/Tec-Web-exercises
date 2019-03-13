<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Lista de mensagens</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	</head>
	<body>
		<div class="container">
			<h1>Lista de mensagens</h1>
			<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
					    <th>Email</th>
					    <th>Mensagem</th>
					    <th>Quantidade de caracteres</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<String> listHistEmails = (List<String>) session.getAttribute("listMails");
						List<String> listHistMsgs = (List<String>) session.getAttribute("listMsgs");
					%>
					<% for (int i = 0; i < listHistEmails.size(); i++) {%>
						<tr>
							<td><%= listHistEmails.get(i) %></td>
							<td><%= listHistMsgs.get(i) %></td>
							<td>
								<% String msg = listHistMsgs.get(i); %>
								<%= msg.length() %>
							</td>
						</tr>
					<% }%>						    		
				</tbody>
			</table>			
			<p><a href="novaMensagem.jsp">Voltar ao formulário de cadastro</a></p>			
		</div>
	</body>
</html>