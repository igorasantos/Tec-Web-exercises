// Construtores do objeto Date.

// a partir do relógio do computador onde o script está sendo executado 
var d = new Date();

// a partir de um número inteiro que representa a quantidade de milésimos de segundos desde 1/1/1970 (mesmo padrão usado no Java).
var d = new Date(milisegundos);

// a partir da conversão de uma string formatada em:
// padrão ISO-8601 - YYYY-MM-DDTHH:mm:ss.sssZ [*1]
// padrão simplificado: YYYY-MM-DD, YYYY-MM, etc.
var d = new Date(dataString);

// considerando um determinado ano, mês, dia, hora, minuto, segundo e milésimo de segundo.
// com 2 até 7 parâmetros, o sistema entende que o horário é dado no fuso horário local
// obrigatório: ano e mês
var d = new Date(ano, mes, dia, hora, minuto, segundo, milisegundo);

//[*1]: vide:
// https://tools.ietf.org/html/rfc3339
// https://docs.microsoft.com/pt-br/dotnet/standard/base-types/standard-date-and-time-format-strings