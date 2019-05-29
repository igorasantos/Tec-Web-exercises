$(document).ready(function () {
  $("#d2").css({
    "border-width": "2px",
    "border-style": "dotted",
    "border-color": "red",
    "display": "flex",
    "align-items": "center",
    "justify-content": "center",
    "flex-direction": "row"
    
  });
});
function recuperarValor() {
  var altura = $("#d1").css("height");
  $("#t1").val(altura);

  var largura = $("#d1").css("width");
  $("#t2").val(largura);
}
function definirValor() {
  var altura = $("#t1").val();
  $("#d1").css("height", altura);

  var largura = $("#t2").val();
  $("#d1").css("width", largura);
}
function trocaCoresInputs() {
  $("input").css({
    "color": "red"
  });
}

