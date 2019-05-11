function carregarPagina(){
	var listaAlunos = document.getElementById("resultado");
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var dados = JSON.parse(xhr.responseText);
			listaAlunos.innerHTML = "";
			for (var i in dados) {
				listaAlunos.innerHTML += dados[i].nome + " tem "+dados[i].ch + " horas.<br>";
			}
		}
	}
	xhr.open("GET", "dados.json", true);
	xhr.send(null);
}