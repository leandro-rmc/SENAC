//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

$(document).ready(function(){
	$("input[data-campo='email']").blur(function(){
		verificaCampo("email");
	})
	
	$("input[data-campo='senha']").blur(function(){
		verificaCampo("senha");
	})
});

function verificaCampo(campo){
	if(campo == "email"){
		$("div[data-campo='email']").html("");
		$("input[data-campo='email']").removeClass("is-invalid");
		if($("#email").val().length == 0){
			$("div[data-campo='email']").html('Campo não pode estar vazio!');
			$("input[data-campo='email']").addClass("is-invalid");
		}
	}
	if(campo == "senha"){
		$("div[data-campo='senha']").html("");
		$("input[data-campo='senha']").removeClass("is-invalid");
		if($("#senha").val().length == 0){
			$("div[data-campo='senha']").html('Campo não pode estar vazio!');
			$("input[data-campo='senha']").addClass("is-invalid");
		}
	}
}

function validarLogin(formulario){
	
	verificaCampo("email");
	verificaCampo("senha");
	
	var erros = 0;
	erros = $(".is-invalid").length;
	if(erros == 0){
		formulario.submit();
	}
}