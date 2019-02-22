<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cadastrar novo encontro</title>
	</head>
<body>
	<h1>Cadastrar novo encontro:</h1>
	<form action="Controller" method="post">
		<input type="hidden" name="acao" value="confirmarCadastro"/>
		Nome: <input type="text" name="nomePessoa" value=""/><br>
		Local: <input type="text" name="local" value=""/><br>
		Motivo: <input type="text" name="motivo" value=""/><br>
		<input type="submit" value="Registrar encontro"/><br>
		</form>
	<p><a href="Controller">Voltar ao menu</a></p>
</body>
</html>