<%@ page import="java.util.List" %>
<%@ page import="sys.Encontro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Editar local de encontro</title>
		<style rel="stylesheet" type="text/css">
			label{
				display: block;
				width: 100px;				
			}			
		</style>
	</head>
<body>
	<h1>Editar local</h1>
	<form action="Controller" method="post">
		<% List<Encontro> lista = (List<Encontro>) request.getAttribute("lista"); %>
		<% int id = (Integer) request.getAttribute("ind"); %>
		<input type="hidden" name="acao" value="editLocal"/>
		<input type="hidden" name="indEdit" value="<%= id %>"/>
		<label for="novoLocal">Novo Local: </label><input type="text" name="novoLocal" value=""/><br>
		<input type="submit" value="Registrar novo local"/><br>
	</form>
	<p><a href="Controller?acao=index">Voltar ao menu</a></p>
</body>
</html>