function Autor() {
	this.nomeAut = "";
}  
function Genero(){
	this.nomeGen = "";
}
function Livro(isbn,titulo,paginas){
	this.isbn = isbn;
	this.titulo = titulo;
	this.paginas = paginas;        
}
Livro.prototype = new Genero();
Livro.prototype = new Autor();

var livro1 = new Livro();
livro1.nomeAut = prompt("Digite o nome do autor do livro:");
livro1.nomeGen = prompt("Digite o gênero do livro:");
livro1.isbn = prompt("Digite o ISBN do livro:");
livro1.titulo = prompt("Digite o título do livro:");
livro1.paginas = prompt("Digite a quantidade de páginas do livro");

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
console.log("Livro validado? "+validar(livro1));