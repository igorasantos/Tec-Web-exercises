//console.log(1);
var content;
$(document).ready(function(){
//	console.log(2);
	$("#srcCode").focusout(function(){
//		console.log(3);
//		$.ajax(content).done(function(){
//			console.log(4);
			$("#loaded").html(
				$("#srcCode").val()
			);			
//		});
	});
});