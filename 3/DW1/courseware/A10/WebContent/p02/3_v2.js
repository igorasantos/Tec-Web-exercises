function Pessoa() {
  this.nome = "";
  this.idade = 0;
}

function Aluno(){
  this.turma = 0;
  this.enfase = "Nenhuma";
  imprimirDados = function(){
    return ("O aluno" + this.nome + " da turma " + this.turma + " tem "+ this.idade + " anos.");
  }
}

Aluno.prototype = new Pessoa();
var a = new Aluno();
a.turma = "Web";
a.nome = "Andre";