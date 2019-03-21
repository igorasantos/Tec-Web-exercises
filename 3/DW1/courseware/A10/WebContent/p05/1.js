function Livro(tituloPar,autorPar) {
	this.titulo = tituloPar;
	this.autor = autorPar;
	this.getDescricao = function(){
		return (this.titulo +" - "+this.autor);
	}
}
var meuLivro = new Livro("Harry Potter","J.K. Rowling");
var meuLivro2 = new Livro("As Crônicas de Nárnia","C.S. Lewis");
alert(meuLivro.getDescricao());
alert(meuLivro2.getDescricao());