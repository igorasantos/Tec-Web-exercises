<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	int converteCEmF(int tempC){
		return ((( tempC * 9) / 5) + 32);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>Celsius para Fahrenheit</h1>
		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th>&deg; C</th>
					<th>&deg; F</th>					
				</tr>
			</thead>
			<tbody>
			<!--
				Escreva um arquivo JSP (...) que imprima uma tabela HTML
				de conversão Celsius (C) para Fahrenheit (F)
				entre -40 e 100 graus Celsius,
				com incrementos de 10 em 10
				(A fórmula é F = 9/5 C + 32).
				Escreva no arquivo comentários HTML e JSP.
			-->
			<%-- o Java retorna um valor bugado, se escrever return ((c * (9/5)) + 32). Tem que ser return ((c * 9/5) + 32) ou fórmula semelhante. --%>
			<% for (int i = -40; i <= 100; i+=10){ %>
				<tr>
					<td><%= i %></td>
					<% int f = converteCEmF(i); %>
					<td><%= f %></td>
				</tr>
			<%} %>				
			</tbody>
		</table>
	</div>
</body>
</html>