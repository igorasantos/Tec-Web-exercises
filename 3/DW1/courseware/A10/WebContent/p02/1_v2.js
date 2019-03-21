// função construtora
// Pode definir ações que devem ser executadas ao se instanciar um objeto do tipo Livro
function Livro() {  
  this.titulo = "";
  this.autor = "";
}

// Criação de objetos

// 1a forma
var meuLivro1 = new Livro();

//2a forma - literais de objeto
var meuLivro2 = { titulo: "Harry Potter 2", autor: "J.K. Rowling" };

//3a forma
var meuLivro3 = Object.create(Livro);
meuLivro3.titulo = "Harry Potter 3";