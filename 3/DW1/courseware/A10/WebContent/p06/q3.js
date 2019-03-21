function Autor() {
	this.nomeAut = "";
}
function Genero(){
	this.nomeGen = "";
}
function Livro(){
	this.isbn = "";
	this.titulo = "";
	this.paginas = "";
	this.ano = 0;
}
Livro.prototype = new Genero();
Livro.prototype = new Autor();

var livro1 = new Livro();
livro1.nomeAut = prompt("Livro 1 - Autor:");
livro1.nomeGen = prompt("Livro 1 - Gênero:");
livro1.isbn = prompt("Livro 1 - ISBN:");
livro1.titulo = prompt("Livro 1 - Título:");
livro1.paginas = prompt("Livro 1 - Páginas:");
livro1.ano = prompt("Livro 1 - Ano:");

for (var i in livro1) {    
	document.write("<p><strong>"+i+"</strong>: "+livro1[i]+"</p>");
}

function validar(livro){
	valid = true;
	for (var i in livro) {
		if (livro[i] == "") {
			valid = false;			
		}		
	}
	return valid;
}
console.log("1º livro validado? "+validar(livro1));

var livro2 = new Livro();
livro2.nomeAut = prompt("Livro 2 - Autor:");
livro2.nomeGen = prompt("Livro 2 - Gênero:");
livro2.isbn = prompt("Livro 2 - ISBN:");
livro2.titulo = prompt("Livro 2 - Título:");
livro2.paginas = prompt("Livro 2 - Páginas:");
livro2.ano = prompt("Livro 2 - Ano:");

console.log("2º livro validado? "+validar(livro2));

function temMesmoAutor(livroX,livroY){
	if (livroX.nomeAut == livroY.nomeAut) {
		return true;
	} else {
		return false;
	}
}

function temMesmoAnoPublicacao(livroX,livroY){
	if(livroX.ano == livroY.ano){
		return true;
	} else {
		return false;
	}
}

console.log("Livros têm mesmo autor? "+temMesmoAutor(livro1,livro2));

console.log("Livros têm mesmo ano? "+temMesmoAnoPublicacao(livro1,livro2));