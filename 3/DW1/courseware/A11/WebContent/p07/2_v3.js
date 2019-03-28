var hoje = new Date();
var anoAtual = hoje.getFullYear();
var diaAtual = hoje.getDate();

var dataAlvo = new Date(anoAtual,11,25);
var msPorDia = 24*60*60*1000;
var nDias = (dataAlvo.getTime() - hoje.getTime()) / msPorDia; // (ms na data_alvo - ms hoje)/ ms por dia = n dias
nDias = Math.round(nDias);
document.write("Faltam " + nDias + " dias para o Natal.")