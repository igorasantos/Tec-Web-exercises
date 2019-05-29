$(document).ready(function(){
  $("#msg_login").hide();
  $("#msg_login").slideDown();

  $("#fechar").click(function (e) { //https://stackoverflow.com/a/10415760
    e.preventDefault();
    // e.stopPropagation();
    $("#msg_login").slideUp();
  });
});
