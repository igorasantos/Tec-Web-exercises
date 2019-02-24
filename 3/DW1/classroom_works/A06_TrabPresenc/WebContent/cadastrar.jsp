<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cadastrar novo encontro</title>
		<style rel="stylesheet" type="text/css">
			label{
				display: block;
				width: 100px;				
			}			
		</style>
	</head>
<body>
	<h1>Cadastrar novo encontro</h1>
	<form action="Controller" method="post">
		<input type="hidden" name="acao" value="confirmarCadastro"/>
		<label for="nomePessoa">Nome: </label><input type="text" name="nomePessoa" value=""/><br>
		<label for="local">Local: </label><input type="text" name="local" value=""/><br>
		<label for="motivo">Motivo: </label><input type="text" name="motivo" value=""/><br>
		<input type="submit" value="Registrar encontro"/><br>
	</form>
	<p><a href="Controller?acao=index">Voltar ao menu</a></p>
</body>
</html>