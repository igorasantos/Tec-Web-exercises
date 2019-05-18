var jsonDoc = "";
function get(url, callback){
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			var jsonFileName = xhr.responseText;
			jsonFileName = "../../"+jsonFileName;
			//var jsonString = carregarJson(jsonFileName); //solução via retorno
			carregarJson(jsonFileName); //solução via variável global					
			//callback(jsonString); // solução via retorno		
			callback(jsonDoc); //solução via variável global
		}
	};
	xhr.open("GET",url,true);
	xhr.send(null);
}
function carregarJson(jsonFileURL){
	var xhr = new XMLHttpRequest();			
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			//return jsonDoc; //solução via retorno (que não tava dando certo)
			jsonDoc = xhr.responseText; //solução via variável global
		}
	};
	xhr.open("GET",jsonFileURL,false); //como todos os demais passos dependem da existência da string do json aqui, precisei deixar esse ajax síncrono.
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
	get('receita?id='+id,function(receitaJson){
		var receita = JSON.parse(receitaJson);
		document.getElementById("titulo").innerHTML = receita.titulo;
		document.getElementById("descricao").innerHTML = receita.descricao;
		document.getElementById("ingredientes").innerHTML = receita.ingredientes;
		document.getElementById("preparo").innerHTML = receita.preparo;
		
		var atributos = document.getElementById("receitaSelecionada").attributes;
		atributos.getNamedItem("style").nodeValue="";
	})
}