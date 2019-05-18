var xmlDoc = null;
var livro = null;

function onLoad(){			   
	var ajaxReq = new XMLHttpRequest();
	var url = "livros.xml";		
	ajaxReq.onreadystatechange = function() {
		if (ajaxReq.readyState == 4 && ajaxReq.status == 200) {
			/* ao invés de utilizar o atributo responseText, utiliza o responseXML
			e salva  uma referência do mesmo na variável xmlDoc para uso posterior. */
			xmlDoc = ajaxReq.responseXML;
			carregarLista();
		}
	};		
	ajaxReq.open("GET", url, true);
	ajaxReq.send();			   
}
// carrega a lista que exibe os nomes dos livros contidos no documento XML enviado pelo servidor.
function carregarLista(){			   
	var livros = xmlDoc.getElementsByTagName("livro");
	for (var i = 0; i < livros.length; i++) {	
		/* retorna o objeto contido na posição informada como parâmetro.
		Também pode ser acessado da maneira convencional dos arrays, utilizando chaves
		(ex.: livros[i]). */
		var livro = livros.item(i);
		var nome="";
		var isbn="";
		if (livro.hasAttributes()) {
			/* o método getNamedItem() retorna um objeto contendo informações do atributo informado
			para acessar o seu valor é necessário utilizar a propriedade nodeValue. */
			nome = livro.attributes.getNamedItem("nome").nodeValue;
			document.getElementById("nome").innerHTML = nome;
			isbn = livro.attributes.getNamedItem("isbn").nodeValue;
			document.getElementById("isbn").innerHTML = isbn;
		}
		var campoLivro = document.getElementById("livros");
		campoLivro.options[campoLivro.length] = new Option(nome, ""+i);	 //pra quê essa string vazia?			 
	}			     
}	
/* atualiza a tabela contendo os dados do livro selecionado,
recebendo como parâmetro o índice do nó (tag livro) a ser carregado. */
function carregarLivro(indice) {			   
	var livros = xmlDoc.getElementsByTagName("livro");
	var livro = livros.item(indice);	
	var nome="";
	var isbn="";
	if (livro.hasAttributes()) {
		nome = livro.attributes.getNamedItem("nome").nodeValue;
		document.getElementById("nome").innerHTML = nome;
		isbn = livro.attributes.getNamedItem("isbn").nodeValue;
		document.getElementById("isbn").innerHTML = isbn;
	}	
	var nosFilhos = livro.childNodes;
	for (var i = 0; i < nosFilhos.length; i++) {
		var noFilho = nosFilhos.item(i);	
		switch (noFilho.nodeName) {
			case "editora":
			case "edicao":
			case "preco":            
			case "sinopse":                        
				var valor = noFilho.firstChild.nodeValue;
				document.getElementById(noFilho.nodeName).innerHTML = valor
				break;
			case "autores":
				var valor = "";
				for (var j = 0; j < noFilho.childNodes.length; j++) {
	 				if (noFilho.childNodes.item(j).nodeName=="autor"){
	   					if( valor != "" ) {
	     					valor+=" | ";
	   					}
	   					valor += noFilho.childNodes.item(j).firstChild.nodeValue;
	 				}
				}
				document.getElementById(noFilho.nodeName).innerHTML = valor;	
				default:
					break;
		}	
	}	
	var atributos = document.getElementById("divLivroSelecionado").attributes;
	atributos.getNamedItem("style").nodeValue="";
}