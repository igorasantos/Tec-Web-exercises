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
// var livro1 = new Livro(9780689849107,"Pollyana",304);
// var livro2 = [];
var livro2 = new Livro();
livro2.nomeAut = prompt("Digite o nome do autor do livro:");
livro2.nomeGen = prompt("Digite o gênero do livro:");
livro2.isbn = prompt("Digite o ISBN do livro:");
livro2.titulo = prompt("Digite o título do livro:");
livro2.paginas = prompt("Digite a quantidade de páginas do livro");

console.log(livro2);
for (var i in livro2) {    
	document.write("<p><strong>"+i+"</strong>: "+livro2[i]+"</p>");
}
console.log(Object.values);