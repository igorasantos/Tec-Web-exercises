// this code is a "fork" from 'DW2 A07 p07 2c_jQ_change'
$(document).ready(onLoad);
var jsonObj = null;
var livro = null;

function onLoad() {
  $("#livros").change(carregarLivro);
  $.getJSON("livros.json", function(dados){
      jsonObj = dados;
      carregarLista();
  });
}
function carregarLista() {
  var livros = jsonObj.livros;
  for (var i = 0; i < livros.length; i++) {
    var livro = livros[i];
    var campoLivro = document.getElementById("livros");
    campoLivro.options[campoLivro.length] = new Option(livro.nome,i);
  }
}
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
  $("#tabLivroSelecionado").attr("style","");
}