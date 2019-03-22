function inserirRegistro(){
	var tableBody = document.getElementById('registros');
	
	var nome = document.getElementById('inputNome').value;
	var cpf = document.getElementById('inputCPF').value;
	// Recupera a quantidade de linhas atuais
	var linhasTotais = tableBody.rows.length;

	//adiciona a nova linha no fim da tableBody
	var novaLinha = tableBody.insertRow(linhasTotais);

	//adiciona duas celulas à linha criada
	var novaCelulaNome=novaLinha.insertCell(0);
	var novaCelulaCPF=novaLinha.insertCell(1);

	//define o conteúdo das células criadas
	novaCelulaNome.innerHTML=nome;
	novaCelulaCPF.innerHTML=cpf;
}