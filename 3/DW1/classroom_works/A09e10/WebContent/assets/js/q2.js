var caminho = 'assets/img/2.png';
function trocarImagem(image){
	document.getElementById(image).src = caminho;
	if (caminho == 'assets/img/2.png'){
		caminho = 'assets/img/1.png';
	} else {
		caminho = 'assets/img/2.png';
	}
}