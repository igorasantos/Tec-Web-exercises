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
var livro1 = new Livro(9780689849107,"Pollyana",304);
livro1.nomeAut = "Eleanor H. Porter";
livro1.nomeGen = "American Literature";

console.log(livro1);
for (var i in livro1) {    
    document.write("<p><strong>"+i+"</strong>: "+livro1[i]+"</p>");
}