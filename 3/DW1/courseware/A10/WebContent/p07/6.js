//declaração regular de um vetor
var titulos = new Array();

//declaração condensada do vetor
var codigos = new Array("65454", "12312");

// declaração literal
var codigos2 = ["um", "dois", "três"];

titulos[0] = "As crônicas de Nárnia";
titulos[1] = "Contato";
for (i = 0; i < 2; i++) {
  document.writeln(codigos[i] + " --- " + titulos[i]);
}
document.write("Total de Títulos: " + titulos.length)