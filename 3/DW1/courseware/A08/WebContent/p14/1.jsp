<%@ page import="p14.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Acesso a atributos</title>
	</head>
	<body>
		<h1>Implementação com Scriptlets</h1>
			<h2>Implementação que não previne NullPointerException</h2>
				<p>
					O nome do usário logado (atributo "usuarioLogado") é:			
					<%= ((Usuario) session.getAttribute("usuarioLogado")).getNome() %>		
					ou
					<%= ((Usuario) request.getSession().getAttribute("usuarioLogado")).getNome() %>.
				</p>			
			<h2>Implementação que previne NullPointerException</h2>			
				<p>O nome do usário logado (atributo "usuarioLogado") é:
				<% if (session != null && session.getAttribute("usuarioLogado") != null) {%>
						<%= ((Usuario) session.getAttribute("usuarioLogado")).getNome() %>
						ou
						<%= ((Usuario) request.getSession().getAttribute("usuarioLogado")).getNome() %>.								
				<%}%>		
				</p>
		<h1>Implementação usando Expression Language (EL)</h1>
			<h2>O nome do usário logado (atributo "usuarioLogado") é</h2>
			<p>Na sintaxe &#36;{objeto.nomeAtributo}: ${usuarioLogado.nome}.</p>				
			<p>Na sintaxe &#36;{objeto["nomeAtributo"]}, é: ${usuarioLogado["nome"]}.</p>					
	</body>	
</html>