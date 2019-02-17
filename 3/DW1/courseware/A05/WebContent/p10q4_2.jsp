<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! int numConselho; %>
<%! String msgConselho; %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<% float atual = Float.valueOf(request.getParameter("valorAtual")); %>
	<% float aumento = Float.valueOf(request.getParameter("percentualAumento")); %>
	<% float novo = atual * (1 + aumento); %>	
	<% if (novo < 200){
		numConselho = 1;
	} else if (novo >= 200 && novo <= 500 ) {
		numConselho = 2;
	} else {
		numConselho = 3;
	}
	%>
	<h1>Novo valor da sua bolsa estágio</h1>
	<p>O novo valor é: R$ <%= novo %></p>
	<p>Nosso conselho é: 
		<strong>
			<%
				switch (numConselho) {
					case 1:
						msgConselho = "Mude de estágio!";
						break;
					case 2:
						msgConselho = "Negocie que esse valor pode melhorar!";
						break;
					default:
						msgConselho = "Agora está ficando bom!";			
				}
			%>
			<%= msgConselho %>
		</strong>
	</p>
</body>
</html>