// fluxo de criação ok, mas de criação, não.

var formEditingRow = false;

function main(l){
	var index = readIndex(l);
	//testar depois o fluxo do edit
	if (formEditingRow == true){
		dataRecToForm(index);
	}
	createDataRowInTable(index);
	var rowToFill = document.getElementById('registros').rows[index];
	var arrayInputs = readInputs();
	eraseForm();
	// criação - ok até aqui.
	// var newFilledLine = dataFilling(newEmptyLine, arrayInputs, index);
	
	// updateTable(newFilledLine, index);
	updateTable(rowToFill, arrayInputs, index);
	if (formEditingRow == true) {
		endEditing();
	}
}
function startEditing(i){
	formEditingRow = true;
	main(i);
}
function readIndex(lin){	
	var ind;
	if (formEditingRow == true){
		ind = lin;
	} else {
		ind = document.getElementById('registros').rows.length;		
	}	
	return ind;
}
function dataRecToForm(line){	
	//recupera TR
	var storedRow = document.getElementById("registros").rows[line];
	//evita que a TR seja apagada
	var sR0 = storedRow.cells[0].innerText;
	var sR1 = storedRow.cells[1].innerText;
	var sR2 = storedRow.cells[2].innerText;
	var sR3 = storedRow.cells[3].innerText;
	var arrayStoredRow = [sR0,sR1,sR2,sR3];
	//preenche form inputs - os inputs não estão recendo os valores do TR
	document.forms['localidade']['inputCity'].value = arrayStoredRow[0];
	document.forms['localidade']['inputCityPop'].value = arrayStoredRow[1];
	document.forms['localidade']['inputConstState'].value = arrayStoredRow[2];
	document.forms['localidade']['inputSovState'].value = arrayStoredRow[3];
}
function createDataRowInTable(ln){
	if (formEditingRow == false){
		//adiciona nova linha vinculada à tabela
		var tableBody = document.getElementById('registros');
		//see refs
		var newLine = tableBody.insertRow(ln);

		newLine.insertCell(0); // aplicar um for aqui depois
		newLine.insertCell(1);
		newLine.insertCell(2);
		newLine.insertCell(3);
	}
}
function readInputs() {
	var i1 = document.getElementById('inputCity').value;
	var i2 = document.getElementById('inputCityPop').value;
	var i3 = document.getElementById('inputConstState').value;
	var i4 = document.getElementById('inputSovState').value;
	var arrayTemp = [i1, i2, i3, i4];	
	return arrayTemp;
}
function eraseForm() {
	document.getElementById('inputCity').value = "";
	document.getElementById('inputCityPop').value = null;
	document.getElementById('inputConstState').value = "";
	document.getElementById('inputSovState').value = "";
}
// function dataFilling(nEmpL, aInp, indx){
// 	//aplicar um for aqui depois
// 	// ou seria innerHTML?
// 	nEmpL.cells[0].innerText = aInp[0];
// 	nEmpL.cells[1].innerText = aInp[1];
// 	nEmpL.cells[2].innerText = aInp[2];
// 	nEmpL.cells[3].innerText = aInp[3];

// 	// 1a celula - cria link
// 	var link = document.createElement("a");
// 	link.href = "#";
// 	// var paramOnClick = `main(${indx})`;
// 	link.setAttribute("onclick", `startEditing(${indx})`);
// 	link.innerText = " ";

// 	// 1a celula - adiciona ícone de edição	
// 	var icon = document.createElement("i");
// 	icon.setAttribute("class", "fas fa-pen fa-sm");

// 	//1a celula - adicionar ícone ao link
// 	link.appendChild(icon);

// 	// 1a celula - adiciona link à célula
// 	nEmpL.cells[0].appendChild(link);
// 	return nEmpL;
// }

// function updateTable(nFillL, idx){
// 	var tableBody = document.getElementById('registros'); //essa porra tá vindo com uma TR vazia, mas q não deveria existir
// 	if (formEditingRow == true) {
// 		tableBody.rows[idx] = nFillL;
// 	} else {
// 		// var newLine = tableBody.insertRow(totalLines);
// 		tableBody.insertRow(nFillL);
// 	}
// }
function updateTable(rTF, aInp, indx) {
	rTF.cells[0].innerHTML = aInp[0];
	rTF.cells[1].innerHTML = aInp[1];
	rTF.cells[2].innerHTML = aInp[2];
	rTF.cells[3].innerHTML = aInp[3];

	// 1a celula - cria link
	var link = document.createElement("a");
	link.href = "#";
	link.setAttribute("onclick", `startEditing(${indx})`);
	link.innerText = " ";

	// 1a celula - adiciona ícone de edição	
	var icon = document.createElement("i");
	icon.setAttribute("class", "fas fa-pen fa-sm");

	//1a celula - adicionar ícone ao link
	link.appendChild(icon);

	// 1a celula - adiciona link à célula
	rTF.cells[0].appendChild(link);
}
function endEditing(){
	formEditingRow = false;
}

/*
refs:
https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableElement/insertRow
*/