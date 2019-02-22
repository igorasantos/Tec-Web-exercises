<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Remover encontro</title>
	</head>
<body>
	<h1>Remover encontro:</h1>
	<form action="Controller" method="post">
		<input type="hidden" name="acao" value="removerEncontro"/>
		Nome: <input type="text" name="nomePessoa" value=""/><br>
		Data: <input type="date" name="date" value=""/><br>		
		<input type="submit" value="Remover encontro"/><br>
		</form>
	<p><a href="Controller">Voltar ao menu</a></p>
</body>
</html>