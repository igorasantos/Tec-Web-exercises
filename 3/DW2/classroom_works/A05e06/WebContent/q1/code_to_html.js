function carregarPagina(){
	var dropdown = document.getElementById("receitas_dropdown");
	dropdown.length = 0;
	var url = "receitas.json";
	var xhr = new XMLHttpRequest();		
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var dados = JSON.parse(xhr.responseText); 
			var option;
			for (var i = 0; i < dados.length; i++){
				option = document.createElement("option");
				option.text = dados[i].titulo;
				option.value = dados[i].id;				
				dropdown.add(option);				
			}
		}
	}
	xhr.open("POST", url, true);
	xhr.send(null);
}
function carregarNomeJson(id) {
	var url = null;
	switch (id) {
		case "1":
			url = "receita-1.json";
			carregarReceita(id,url);
			break;
		case "2":
			url = "receita-2.json";
			carregarReceita(id,url);
			break;
		default:
			console.log("caiu no default");
			break;
	}
}
function carregarReceita(id,url){
	var xhr2 = new XMLHttpRequest();	
	xhr2.onreadystatechange = function () {
		if (xhr2.readyState == 4 && (xhr2.status == 200)) {
			var dadosReceita = JSON.parse(xhr2.responseText);
			document.getElementById("titulo").innerHTML = dadosReceita.titulo;
			document.getElementById("descricao").innerHTML = dadosReceita.descricao;
			var ingred = "";
			document.getElementById("ingredientes").innerHTML = "";
			for (var i = 0; i < dadosReceita.ingredientes.length; i++) {
				if (i == dadosReceita.ingredientes.length - 1) {
					ingred += dadosReceita.ingredientes[i];					
				}
				else {
					ingred += (dadosReceita.ingredientes[i] + ", ");
				}
			}
			document.getElementById("ingredientes").innerHTML = ingred;
			document.getElementById("preparo").innerHTML = dadosReceita.preparo;
		}
	};
	xhr2.open("POST", url, true);
	xhr2.send(null);
	document.getElementById("divReceitaSelecionada").style.display = "block";
}