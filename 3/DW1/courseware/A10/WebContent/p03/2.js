function Livro(tituloPar, autorPar) {
    this.titulo = tituloPar;
    this.autor = autorPar;
}
var meuLivro1 = new Livro("Harry Potter","J.K. Rowling");
var meuLivro2 = new Livro("As Crônicas de Nárnia","C.S. Lewis");
alert(meuLivro1.titulo);
alert(meuLivro2.titulo);