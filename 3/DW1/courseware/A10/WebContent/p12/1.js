function logar() {
  var loginInput = document.getElementById("login");
  var senhaInput = document.getElementById("senha");
  var formulario = document.getElementById("formulario");
  if (loginInput.value == "") {
    alert("Digite o login!");
  }
  else if (senhaInput.value == "") {
    alert("Digite a senha!");
  }
  else {
    formulario.submit();
  }
}