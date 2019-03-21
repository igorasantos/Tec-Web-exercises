function getValor(){
	valor = prompt("Insira um valor: ");
	sequenciaNumerica(valor);
}
function sequenciaNumerica(v){
	document.write(v+" ");
	while (v != 1){
		if(v%2 == 0){
			v=v/2;
		}
		else{
			v=(v*3)+1;
		}
		document.write(v+" ");
	}
}