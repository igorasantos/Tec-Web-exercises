<%@ page import="java.util.List" %>
<%@ page import="sys.Encontro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Consulta por nome</title>
		<style rel="stylesheet" type="text/css">
			label{
				display: block;
				width: 100px;				
			}			
		</style>
	</head>
<body>
	<h1>Consulta por nome</h1>
	<form action="Controller" method="post">
		<%-- List<Encontro> lista = (List<Encontro>) request.getAttribute("lista"); --%>
		<%-- int id = (Integer) request.getAttribute("ind"); --%>
		<input type="hidden" name="acao" value="queryMeetingByName"/>		
		<label for="nameConsult">Nome a consultar: </label><input type="text" name="nameConsult" value=""/><br>
		<input type="submit" value="Consultar encontros com essa pessoa"/><br>
	</form>
	<p><a href="Controller?acao=index">Voltar ao menu</a></p>
</body>
</html>