function Livro(tituloPar,autorPar) {
	this.titulo = tituloPar;
	this.autor = autorPar;
	this.getDescricao = function(){
		return (this.titulo +" - "+this.autor);
	}
	this.adicionarAutor = function(novoAutor) {
		this.autor = this.autor + ","+novoAutor;
	}
}
var meuLivro = new Livro("Harry Potter","J.K. Rowling");
meuLivro.adicionarAutor("XXXX");
alert(meuLivro.getDescricao());