function iniciarRequisicao(url){
	var xhr = iniciarAjax();
	if (!(xhr)) {
		// the browser is not supported
	}
	else {
		xhr.onreadystatechange = function () {
			exibirResposta(xhr); // implementa-se aqui a operação 
		};
		xhr.open("GET", url, true);
		xhr.send(null);
	}
}
function iniciarAjax(){
	var ajaxRequest;
	if (window.XMLHttpRequest) { // Feature-Detect
		ajaxRequest = new XMLHttpRequest();
	}
	else {
		ajaxRequest = false;
		alert("Navegador não suportado");
	}
	return ajaxRequest;	
}