$.getJSON("a.json",function (data) {
  $.each(data.alunos, function (){
    $("ul").append("<li>Nome: "+this['nome']+"</li>");
  });
});