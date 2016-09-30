
					jQuery(document).ready(function($)
					{
						// Reveal Login form
						setTimeout(function(){ $(".fade-in-effect").addClass('in'); }, 1);
						
						
						// Validation and Ajax action
						$("form#login").validate({
							rules: {
								login: {
									required: true
								},
								
								senha: {
									required: true
								}
							},
							
							messages: {
								login: {
									required: 'Digite um usuário valido'
								},
								
								senha: {
									required: 'Digite uma senha valida.'
								}
							},
						});
						
						// Set Form focus
						$("form#login .form-group:has(.form-control):first .form-control").focus();
					});
		


