// chama instanciação
var xhr = instanciarAjax();
// instancia
function instanciarAjax(){
	var request, err;
	try{
		request = new XMLHttpRequest();			
	} catch (err) {
		try {
			request = new ActiveXObject ("MSXML2.XMLHttp.6.0");
		}
		catch (err) {
			try {
				request = new ActiveXObject ("Msxml2.XMLHTTP.3.0");
			}
			catch (err) {
				request = false;
			}
		}
	}
	return request;
};
// função p/ tratar a resposta
xhr.onreadystatechange = function() {
	//...
	if (xhr.readyState == 4 && xhr.status == 200) {
		//...
	}
};
//abrir uma conexão
xhr.open("get",url,true);
//enviar os dados para o servidor
xhr.send("...");