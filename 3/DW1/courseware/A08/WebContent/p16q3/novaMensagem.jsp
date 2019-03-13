<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cadastrar mensagem</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	</head>
<body>
	<div class="container">
		<h1>Cadastrar mensagem</h1>
		<form action="gravarMensagem.jsp" method="post">
			<div class="form-group">
			  <label for="email">E-mail:</label>
			  <input type="email" class="form-control" name="email" aria-describedby="emailHelp" placeholder="Type your email">
			  <small id="emailHelp" class="form-text text-muted">Favor, digite um e-email válido.</small>
			</div>
			<div class="form-group">
			    <label for="message">Mensagem:</label>
			    <textarea class="form-control" name="message" rows="3"></textarea>
			</div>
			<button type="submit" class="btn btn-primary">Registrar mensagem</button>
		</form>
	</div>
</body>
</html>