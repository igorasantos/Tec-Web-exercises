function Livro(titulo,autor) {
  this.titulo=titulo;
  this.autor=autor;
}
function Capitulo(titulo,paginas) {
  this.titulo=titulo;
  this.paginas=paginas;
}

var livro = new Livro("Use a Cabeça JS","Michael Morrison");
var cap1 = new Capitulo("Vetores",3);
var cap2 = new Capitulo("Eventos",8);

livro.cap1 = cap1;
livro.cap2 = cap2;

alert(livro.titulo + " - " + livro.autor + "\n\t" + livro.cap1.titulo + " - " + livro.cap1.paginas + " páginas\n\t" + livro.cap2.titulo + " - "+ livro.cap2.paginas + " páginas");