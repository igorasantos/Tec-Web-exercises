function buscarLivros() {
	var ajaxReq = new XMLHttpRequest();
	var url = "/A05/p11/Controller/Ajax/Categoria";
	var data = "categoria=" + document.getElementById("campoCategoria").value;	
	
	ajaxReq.onreadystatechange = function() {
		if (ajaxReq.readyState == 4 && ajaxReq.status == 200) {
			var text = ajaxReq.responseText;
			var livros = text.split(';'); // essa variável livros não tem que ser declarada como array?
			var campoLivro = document.getElementById("campoLivro");
			campoLivro.length = 0; // q
			for(var i=0; i<livros.length; i++){
				if(livros[i].length > 0){
					campoLivro.options[campoLivro.length] = new Option(livros[i], livros[i]); // pq array bidimensional?
				}
			}
		}
	};
	ajaxReq.open("POST", url, true);
	ajaxReq.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");  
	ajaxReq.send(data);
}	
function buscarInfoLivro() {		   
	var ajaxReq = new XMLHttpRequest();
	var url = "/A05/p11/Controller/Ajax/LivroInfo";
	var data = "livro=" + document.getElementById("campoLivro").value;			
	ajaxReq.onreadystatechange = function() {
		if (ajaxReq.readyState == 4 && ajaxReq.status == 200) {
			var campoInfoLivro = document.getElementById("campoInfoLivro");
			campoInfoLivro.value = ajaxReq.responseText;
		}
	};			
	ajaxReq.open("POST", url, true);
	ajaxReq.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");  
	ajaxReq.send(data);
}