function show_confirm() {
  var r = window.confirm("Pressione um botão!");
  var opcaoDigitada = document.getElementById("opcao");
  if (r == true) {
    opcaoDigitada.innerHTML = "Você pressionou OK!";
  } else {
    opcaoDigitada.innerHTML = "Você pressionou Cancela!";
  }
}