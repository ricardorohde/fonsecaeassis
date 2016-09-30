/* JS ALERT WELCOME / JS ALERTA BEM VINDO */
$(document).ready(function(){
	$(".alert").slideDown("slow");
	window.setTimeout(function () {
		$(".alert").slideUp("slow");
	}, 8000);
});


