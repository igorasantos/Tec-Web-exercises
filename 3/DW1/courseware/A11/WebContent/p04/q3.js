// Altere o exemplo anterior para criar uma funcionalidade de EDITAR:
// ao se clicar no nome de uma cidade listada na tabela, os dados dela serão levados ao formulário para edição por parte do usuário.
// Ao se clicar no botão do formulário, as alterações feitas pelo usuário devem ser levadas de volta para a tabela, na linha que estava sendo editada. Dica: use o vetor rows para acessar as linhas já existentes.
var formEditingRow = false;
function inserirRegistro(){
	//get table body
	var tableBody = document.getElementById('registros');
	//get form fields
	var city = document.getElementById('inputCity').value;
	var pop = document.getElementById('inputCityPop').value;
	var constState = document.getElementById('inputConstState').value;
	var sovState = document.getElementById('inputSovState').value;
	
	if (formEditingRow == false){

	}

	// Recupera a quantidade de linhas atuais
	var totalLines = tableBody.rows.length;

	//adiciona a nova linha no fim da tableBody (1a posição é 0)
	var newLine = tableBody.insertRow(totalLines);

	//adiciona celulas vazias à linha criada
	var newCellCity=newLine.insertCell(0);
	var newCellPop=newLine.insertCell(1);
	var newCellConstState = newLine.insertCell(2);
	var newCellSovState = newLine.insertCell(3);

	//adiciona conteúdo nas células criadas
	newCellCity.innerHTML=city+"  ";
	newCellPop.innerHTML=pop;
	newCellConstState.innerHTML = constState;
	newCellSovState.innerHTML = sovState;

	//cria link
	var link = document.createElement("a");
	link.href = "#";
	var paramOnClick = `editarRegistro(${totalLines})`;
	link.setAttribute("onclick",paramOnClick);

	//adiciona ícone de edição	
	var icon = document.createElement("i");
	icon.setAttribute("class","fas fa-pen fa-sm");
	
	//adicionar ícone ao link
	link.appendChild(icon);
	
	//adiciona link à célula
	newCellCity.appendChild(link);
}
function editarRegistro(l){
	formEditingRow = true;
	console.log(l);
	var test = document.getElementById("registros").rows[l];
	// console.log(test.rows[l].cells[1].innerHTML);
	console.log(test);

	document.getElementById('inputCity').value = test.cells[0].innerText;
	document.getElementById('inputCityPop').value = test.cells[1].innerText;
	document.getElementById('inputConstState').value = test.cells[2].innerText;
	document.getElementById('inputSovState').value = test.cells[3].innerText;
	// inputCity
	// inputCityPop
	// inputConstState
	// inputSovState
	
}
function eraseForm(){
	document.getElementById('inputCity').value = "";
	document.getElementById('inputCityPop').value = null;
	document.getElementById('inputConstState').value = "";
	document.getElementById('inputSovState').value = "";
}