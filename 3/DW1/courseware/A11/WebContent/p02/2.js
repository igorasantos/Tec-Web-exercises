//Adiciona um novo option ao elemento select
function adicionarItem(){
  var campoTexto=document.getElementById("item");
  var campoItens=document.getElementById("itens");  
  var opcaoNova=document.createElement('option');
  opcaoNova.text = campoTexto.value;  
  campoItens.add(opcaoNova);
}

//Concatena o texto do item selecionado do elemento select na �rea de texto
function adicionarTexto(){
  var campoAreaTexto=document.getElementById("areaTexto");
  var campoItens=document.getElementById("itens");  
  var posicaoSelecionada = campoItens.selectedIndex;
  var novoTexto = campoItens[posicaoSelecionada].text;  
  campoAreaTexto.value = campoAreaTexto.value + "\n" + novoTexto;  
}