$(document).ready(function(){
	$("#b1").click(function(){ // equiv à função get
//		get("Controller/infos/info?method=get",publicaDados);
		var url_ = "Controller/infos/info";
		var jqxhr = $.ajax({ // não entendi o que mudou significativamente... usar .ajax ou .get (jQuery) ou o XHR puro parece dar no mesmo resultado 
			url: url_,
			data : {
				'method':'get',
				'nome': $("#nome").val(),
				'sobrenome': $("#sobrenome").val()
			},
			success: function(){
				get(this.url,publicaDados);
			},
			dataType: "text"
		});		
	});
	$("#b2").click(function(){ // equiv à função post
//		post("Controller/infos/info?method=post",publicaDados);
		var url_ = "Controller/infos/info";		
		var jqxhr = $.ajax({
			url: url_,
			data : {
				'method':'post',
				'nome': $("#nome").val(),
				'sobrenome': $("#sobrenome").val()
			},
			success: function(){
				post(this.url,publicaDados);
			},
			dataType: "text"
		});
	});
});
// GET
function get(url, callback1stLevel){
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			var jsonFileName = xhr.responseText;
			jsonFileName = jsonFileName;
			carregarJsonGet(jsonFileName,callback1stLevel);		
		}
	};
	xhr.open("GET",url,true);
	xhr.send(null);
}
// GET
function carregarJsonGet(jsonFileURL,callback2ndLevel){
	var xhr = new XMLHttpRequest();			
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			if (typeof callback2ndLevel == 'function'){
				callback2ndLevel(xhr.responseText);
			}
		}
	};
	xhr.open("GET",jsonFileURL,true);
	xhr.send(null);
}
// POST
function post(url, callback1stLevel){
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			var jsonFileName = xhr.responseText;
			jsonFileName = jsonFileName;
			carregarJsonPost(jsonFileName,callback1stLevel);		
		}
	};
	xhr.open("POST",url,true);
	xhr.send(null);
}
// POST
function carregarJsonPost(jsonFileURL,callback2ndLevel){
	var xhr = new XMLHttpRequest();			
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			if (typeof callback2ndLevel == 'function'){
				callback2ndLevel(xhr.responseText);
			}
		}
	};
	xhr.open("POST",jsonFileURL,true);
	xhr.send(null);
}
function publicaDados(infoJson){
	var dados = JSON.parse(infoJson);
	$("#ta1").val("Cidade: "+dados.cidade+"\n"+"País: "+dados.pais+"\n"+"Método de Consulta: "+dados.metodo);
}