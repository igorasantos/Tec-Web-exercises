var jsonObj = null;
var livro = null;
function onLoad() {
  var xhr = new XMLHttpRequest();
  var url = "livros.json";
  xhr.onreadystatechange = function() {
    if (xhr.readyState == 4 && xhr.status == 200) {
      jsonObj = JSON.parse(xhr.responseText);
      carregarLista();
    }
  };        
  xhr.open("GET", url, true);
  xhr.send();
}
function carregarLista() {
  var livros = jsonObj.livros;
  for (var i = 0; i < livros.length; i++) {
    var livro = livros[i];
    var campoLivro = document.getElementById("livros");
    campoLivro.options[campoLivro.length] = new Option(livro.nome,i);
  }
}
function carregarLivro(indice) {
  var livros = jsonObj.livros;
  var livro = livros[indice];
  document.getElementById("nome").innerHTML = livro.nome;
  document.getElementById("isbn").innerHTML = livro.isbn;
  document.getElementById("editora").innerHTML = livro.editora;
  document.getElementById("edicao").innerHTML = livro.edicao;
  document.getElementById("preco").innerHTML = livro.preco;      
  var autoresStr = "";
  var autores = livro.autores;
  for ( var i = 0; i < autores.length; i++) {
    if( i > 0 ){
      autoresStr +=" | ";
    }
    autoresStr += autores[i];
  }
  document.getElementById("autores").innerHTML = autoresStr;
  document.getElementById("sinopse").innerHTML = livro.sinopse;
  var atributos = document.getElementById("tabLivroSelecionado").attributes;
  atributos.getNamedItem("style").nodeValue="";
}