function get(url, callback1stLevel){
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			var jsonFileName = xhr.responseText;
			jsonFileName = "../../"+jsonFileName;
			carregarJson(jsonFileName,callback1stLevel);		
		}
	};
	xhr.open("GET",url,true);
	xhr.send(null);
}
function carregarJson(jsonFileURL,callback2ndLevel){
	var xhr = new XMLHttpRequest();			
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			if (typeof callback2ndLevel == 'function'){
				callback2ndLevel(xhr.responseText); // https://stackoverflow.com/a/12422050
			}
		}
	};
	xhr.open("GET",jsonFileURL,true);
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
	get('receita?id='+id,publicaReceita);
}
function publicaReceita(receitaJson){
	var receita = JSON.parse(receitaJson);
	document.getElementById("titulo").innerHTML = receita.titulo;
	document.getElementById("descricao").innerHTML = receita.descricao;
	document.getElementById("ingredientes").innerHTML = receita.ingredientes;
	document.getElementById("preparo").innerHTML = receita.preparo;
	
	var atributos = document.getElementById("receitaSelecionada").attributes;
	atributos.getNamedItem("style").nodeValue="";
}