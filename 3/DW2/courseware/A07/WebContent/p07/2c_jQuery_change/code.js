$(document).ready(onLoad);
var jsonObj = null;
var livro = null;

function onLoad() {
  $("#livros").change(carregarLivro);
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
//function carregarLivro(indice) {
function carregarLivro() {
  var indice = $("#livros").val();
  var livros = jsonObj.livros;      
  var livro = livros[indice];
  $("#nome").html(livro.nome);
  $("#isbn").html(livro.isbn);
  $("#editora").html(livro.editora);
  $("#edicao").html(livro.edicao);
  $("#preco").html(livro.preco);
  var autoresStr = "";
  var autores = livro.autores;
  for ( var i = 0; i < autores.length; i++) {
    if( i > 0 ){
      autoresStr +=" | ";
    }
    autoresStr += autores[i];
  }
  $("#autores").html(autoresStr);
  $("#sinopse").html(livro.sinopse);
  var atributos = document.getElementById("tabLivroSelecionado").attributes;
  atributos.getNamedItem("style").nodeValue="";
}