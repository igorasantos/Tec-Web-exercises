function aumentar() {
  var input = document.getElementById("textoCrescente");

  //tamanho do campo
  var tamanhoCampo = input.size;

  var texto = input.value;

  //tamanho de um string
  var tamanhoTexto = texto.length;

  //Para ficar sempre com um espaço a mais
  if (tamanhoTexto - 1 >= tamanhoCampo) {
    input.size = tamanhoCampo + 1;
  }
}