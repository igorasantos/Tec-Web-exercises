function calcularHora(){
  var hoje = new Date();
  var hora = hoje.getHours();
  var minuto = hoje.getMinutes();
  var segundo = hoje.getSeconds();

  // adiciona 0 na frente do número caso o número seja <10
  hora=formata(hora);
  minuto=formata(minuto);
  segundo=formata(segundo);

  var horario = hora+":"+minuto+":"+segundo;
  var relogio = document.getElementById('relogio');

  relogio.innerHTML = horario;
  setTimeout('calcularHora()',500);
}
function formata(i) {
  if (i<10){
    i="0" + i;
  }
  return i;
}