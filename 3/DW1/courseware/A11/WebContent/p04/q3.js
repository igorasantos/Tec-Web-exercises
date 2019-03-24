var formEditingRow = false;
function mainCreating(){
	var index = document.getElementById('registros').rows.length;	
	createDataRowInTable(index);
	var arrayNewValues = readInputs();
	eraseForm();
	updateTable(arrayNewValues, index);
}
function mainEditing1(i){
	formEditingRow = true;
	document.getElementById("botao").setAttribute("onclick",`mainEditing2(${i})`);
	dataRecToForm(i);
}
function mainEditing2(indxx) {
	var arrayNewValues = readInputs();
	updateTable(arrayNewValues, indxx);
	endEditing();
}
function dataRecToForm(line){	
	//recupera TR
	var storedRow = document.getElementById("registros").rows[line];
	//TR to array
	var sR0 = storedRow.cells[0].innerText;
	var sR1 = storedRow.cells[1].innerText;
	var sR2 = storedRow.cells[2].innerText;
	var sR3 = storedRow.cells[3].innerText;
	var arrayStoredRow = [sR0,sR1,sR2,sR3];
	//preenche form inputs
	var formulario = document.forms['localidade'];
	formulario['inputCity'].value = arrayStoredRow[0];
	formulario['inputCityPop'].value = arrayStoredRow[1];
	formulario['inputConstState'].value = arrayStoredRow[2];
	formulario['inputSovState'].value = arrayStoredRow[3];
}
function createDataRowInTable(ln){	
		//adiciona nova linha vinculada ao tableBody
		var tableBody = document.getElementById('registros');
		//see refs
		var newLine = tableBody.insertRow(ln); //thanks to https://github.com/StefanYohansson
		newLine.insertCell(0);
		newLine.insertCell(1);
		newLine.insertCell(2);
		newLine.insertCell(3);	
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
function updateTable(aNV, indx) {
	var rowToFill = document.getElementById('registros').rows[indx];
	var textNode0 = document.createTextNode(aNV[0]);	
	var textNode1 = document.createTextNode(aNV[1]);
	var textNode2 = document.createTextNode(aNV[2]);
	var textNode3 = document.createTextNode(aNV[3]);

	if (formEditingRow == false){
		rowToFill.childNodes[0].appendChild(textNode0);
		rowToFill.childNodes[1].appendChild(textNode1);
		rowToFill.childNodes[2].appendChild(textNode2);
		rowToFill.childNodes[3].appendChild(textNode3);
	} else {
		var cNL0 = rowToFill.childNodes[0];
		while (cNL0.hasChildNodes()) {
			cNL0.removeChild(cNL0.firstChild);
		}
		cNL0.appendChild(textNode0);

		var cNL1 = rowToFill.childNodes[1];
		while (cNL1.hasChildNodes()) {
			cNL1.removeChild(cNL1.firstChild);
		}
		cNL1.appendChild(textNode1);
		
		var cNL2 = rowToFill.childNodes[2];
		while (cNL2.hasChildNodes()) {
			cNL2.removeChild(cNL2.firstChild);
		}
		cNL2.appendChild(textNode2);

		var cNL3 = rowToFill.childNodes[3];
		while (cNL3.hasChildNodes()) {
			cNL3.removeChild(cNL3.firstChild);
		}
		cNL3.appendChild(textNode3);
	}
	
	// 1a celula - cria link
	var link = document.createElement("a");
	link.href = "#";
	link.setAttribute("onclick", `mainEditing1(${indx})`);
	link.innerText = " ";

	// 1a celula - adiciona ícone de edição	
	var icon = document.createElement("i");
	icon.setAttribute("class", "fas fa-pen fa-sm");

	//1a celula - adicionar ícone ao link
	link.appendChild(icon);

	// 1a celula - adiciona link à célula
	rowToFill.childNodes[0].appendChild(link);
}
function endEditing(){
	formEditingRow = false;
	document.getElementById("botao").setAttribute("onclick", "mainCreating(-1);");
	eraseForm(); //Thanks to https://github.com/JoaoVSouto
}

/*
refs:
https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableElement/insertRow
*/