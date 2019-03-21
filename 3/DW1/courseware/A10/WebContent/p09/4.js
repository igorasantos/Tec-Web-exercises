var contador = 0;
function getValue() {
  var cabecalho1 = document.getElementById("header1");
  var cabecalho2 = document.getElementById("header2");
  alert(cabecalho1.innerHTML);
  contador++;
  cabecalho2.innerHTML = "Cliques: " + contador;
}