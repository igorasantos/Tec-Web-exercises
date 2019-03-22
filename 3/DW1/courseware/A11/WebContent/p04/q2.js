function inserirRegistro(){
	//get table
	var tabela = document.getElementById('registros');
	//get form fields
	var city = document.getElementById('inputCity').value;
	var pop = document.getElementById('inputCityPop').value;
	var constState = document.getElementById('inputConstState').value;
	var sovState = document.getElementById('inputSovState').value;
	
	// Recupera a quantidade de linhas atuais
	var totalLines = tabela.rows.length;

	//adiciona a nova linha no fim da tabela (1a posição é 0)
	var newLine = tabela.insertRow(totalLines);

	//adiciona celulas vazias à linha criada
	var newCellCity=newLine.insertCell(0);
	var newCellPop=newLine.insertCell(1);
	var newCellConstState = newLine.insertCell(2);
	var newCellSovState = newLine.insertCell(3);

	//adiciona conteúdo nas células criadas
	newCellCity.innerHTML=city;
	newCellPop.innerHTML=pop;
	newCellConstState.innerHTML = constState;
	newCellSovState.innerHTML = sovState;
}