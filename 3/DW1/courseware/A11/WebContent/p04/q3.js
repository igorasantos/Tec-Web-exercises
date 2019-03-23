//still not working

var formEditingRow = false;

function main(l){
	var index = readIndex(l);
	if (formEditingRow == true){
		dataRecToForm(index);
	}
	var newEmptyLine = createDataStruct();
	var arrayInputs = new Array();
	arrayInputs = readInputs();
	eraseForm();
	var newFilledLine = dataFilling(newEmptyLine, arrayInputs, index);
	updateTable(newFilledLine, index);
	gameOver();
}

function startGame(i){
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
	//debug
	console.log(line);
	
	//recupera TR
	var test = document.getElementById("registros").rows[l];

	//debug
	console.log(test);
	
	//preenche form inputs
	document.getElementById('inputCity').value = test.cells[0].innerText;
	document.getElementById('inputCityPop').value = test.cells[1].innerText;
	document.getElementById('inputConstState').value = test.cells[2].innerText;
	document.getElementById('inputSovState').value = test.cells[3].innerText;
}

function createDataStruct(){
	//adiciona nova linha temporária, ainda sem vínculo
	var newLine = document.createElement("tr");
	//adiciona celulas vazias à linha temporária criada
	// var c1 = newLine.insertCell(0);
	// var c2 = newLine.insertCell(1);
	// var c3 = newLine.insertCell(2);
	// var c4 = newLine.insertCell(3);
	newLine.insertCell(0); // aplicar um for aqui depois
	newLine.insertCell(1);
	newLine.insertCell(2);
	newLine.insertCell(3);
	return newLine;
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

function dataFilling(nEmpL, aInp, indx){
	//aplicar um for aqui depois
	// ou seria innerHTML?
	nEmpL.cells[0].innerText = aInp[0];
	nEmpL.cells[1].innerText = aInp[1];
	nEmpL.cells[2].innerText = aInp[2];
	nEmpL.cells[3].innerText = aInp[3];

	// 1a celula - cria link
	var link = document.createElement("a");
	link.href = "#";
	// var paramOnClick = `main(${indx})`;
	link.setAttribute("onclick", `startGame(${indx})`);
	link.innerText = " ";

	// 1a celula - adiciona ícone de edição	
	var icon = document.createElement("i");
	icon.setAttribute("class", "fas fa-pen fa-sm");

	//1a celula - adicionar ícone ao link
	link.appendChild(icon);

	// 1a celula - adiciona link à célula
	nEmpL.cells[0].appendChild(link);
	return nEmpL;
}

function updateTable(nFillL, idx){
	var tableBody = document.getElementById('registros');
	if (formEditingRow == true) {
		// debug
		console.log(tableBody.rows[idx]);

		tableBody.rows[idx] = nFillL;
	} else {
		tableBody.insertRow(nFillL);
	}
}

function gameOver(){
	formEditingRow = false;
}