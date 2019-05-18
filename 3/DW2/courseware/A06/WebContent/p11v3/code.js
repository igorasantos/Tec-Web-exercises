function carregarPagina(){
	var listaDisciplinas = document.getElementById("resultado");
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var dados = JSON.parse(xhr.responseText);
			listaDisciplinas.innerHTML = "";
			for (var i in dados) {
				listaDisciplinas.innerHTML += dados[i].nome + " tem "+dados[i].ch + " horas.<br>";
			}
		}
	}
	xhr.open("GET", "dados.json", true);
	xhr.send(null);
}