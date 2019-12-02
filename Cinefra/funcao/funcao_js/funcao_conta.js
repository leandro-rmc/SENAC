$("#registrar").click(function(){
	$.post({url: "funcao/funcao_php/funcao_conta.php",
		data:{
			registrar:true,
			r_email:$("#r_email").val(),
			r_cemail:$("#r_cemail").val(),
			r_senha:$("#r_senha").val(),
			r_csenha:$("#r_csenha").val()
		},
		success: function(result){
			var result = JSON.parse(result);
			if (result.erro_email.length == 0 && result.erro_senha.length == 0){
				$("#modalRegistro").modal("hide");
				$("#modalRegistroSucesso").modal("show");
				$("#modalRegistro .caixa-erro-form").html("");
			}
			else{
				$("#modalRegistro .caixa-erro-form").html("");
				for (var i=0;i<=result.erro_email.length-1;i++)
					$("#modalRegistro .caixa-erro-form-email").append("<span>"+result.erro_email[i]+"</span>");
				for (var i=0;i<=result.erro_senha.length-1;i++)
					$("#modalRegistro .caixa-erro-form-senha").append("<span>"+result.erro_senha[i]+"</span>");
			}
		},
		error: function(result){
			
		}
	});
});

$("#logar").click(function(){
	$.post({url: "funcao/funcao_php/funcao_conta.php",
		data:{
			logar:true,
			l_email:$("#l_email").val(),
			l_senha:$("#l_senha").val()
		},
		success: function(result){
			var result = JSON.parse(result);
			if (result.erro_email.length == 0 && result.erro_senha.length == 0){
				$("#modalLogin").modal("hide");
				location.reload();
			}
			else{
				$("#modalLogin .caixa-erro-form").html("");
				for (var i=0;i<=result.erro_email.length-1;i++)
					$("#modalLogin .caixa-erro-form-email").append("<span>"+result.erro_email[i]+"</span>");
				for (var i=0;i<=result.erro_senha.length-1;i++)
					$("#modalLogin .caixa-erro-form-senha").append("<span>"+result.erro_senha[i]+"</span>");
			}
		},
		error: function(result){
			
		}
	});
});

$("#deslogar").click(function(e){
	e.preventDefault();
	$.post({url: "funcao/funcao_php/funcao_conta.php",
		data:{
			deslogar:true
		},
		success: function(result){
			location.reload();
		},
		error: function(result){
			
		}
	});
});

$("#registroSucessoMsg").click(function(e){
	e.preventDefault();
	$("#modalRegistroSucesso").modal("hide");
	$("#modalLogin").modal("show");
});


$("#modalRegistro").keydown(function(e){
	if (e.which == 13 || e.key == 13) {
		$("#registrar").click();
	}
});
$("#modalLogin").keydown(function(e){
	if (e.which == 13 || e.key == 13) {
		$("#logar").click();
	}
});