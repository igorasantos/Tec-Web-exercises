function get(url, callback){
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			var jsonDoc = xhr.responseText;
			callback(jsonDoc); //pq usar callback deixa a função reutilizável? - tirar dúvida disso na net
		}
	};
	xhr.open("GET",url,true);
	xhr.send(null);
}
function carregarReceitas(receitasJson){
	var receitas = JSON.parse(receitasJson);
	var select = document.getElementById("receitas");
	
	for (i in receitas){
		select.options[select.length] = new Option(receitas[i].titulo, receitas[i].id);
	}
}
function carregarReceita(id){
	get('receita-'+id+'.json', function(receitaJson){
		var receita = JSON.parse(receitaJson);
		document.getElementById("titulo").innerHTML = receita.titulo;
		document.getElementById("descricao").innerHTML = receita.descricao;
		document.getElementById("ingredientes").innerHTML = receita.ingredientes;
		document.getElementById("preparo").innerHTML = receita.preparo;
		
		var atributos = document.getElementById("receitaSelecionada").attributes;
		atributos.getNamedItem("style").nodeValue="";
	})
}