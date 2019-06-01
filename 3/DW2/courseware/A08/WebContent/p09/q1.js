$(document).ready(function(){
	$("#srcCode").focusout(function(){
		$("#output").html( // https://stackoverflow.com/a/5678933
			$("#srcCode").val()
		);			
	});
});