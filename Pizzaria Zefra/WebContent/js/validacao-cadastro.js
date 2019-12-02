//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

$(document).ready(function(){
	
	$("#celular").val($("#celular").val().replace(/\D/g,""));
	
	$("#celular").keyup(function(){
		$("#celular").val($("#celular").val().replace(/\D/g,""));
	})
	
	$("#telefone").keyup(function(){
		$("#telefone").val($("#telefone").val().replace(/\D/g,""));
	})
	
	$("#cep").keyup(function(){
		$("#cep").val($("#cep").val().replace(/\D/g,""));
	})
	
	$("input[data-campo='nome']").blur(function(){
		verificaCampo("nome");
	})
	
	$("input[data-campo='telefone']").blur(function(){
		verificaCampo("telefone");
	})
	
	$("input[data-campo='celular']").blur(function(){
		verificaCampo("celular");
	})
	
	$("input[data-campo='email']").blur(function(){
		verificaCampo("email");
	})
	
	$("input[data-campo='senha']").blur(function(){
		verificaCampo("senha");
	})
	
	$("input[data-campo='confirmarSenha']").blur(function(){
		verificaCampo("confirmarSenha");
	})
	
	$("input[data-campo='numero']").blur(function(){
		verificaCampo("numero");
	})
	
	$("input[data-campo='logradouro']").blur(function(){
		verificaCampo("logradouro");
	})
	
	$("input[data-campo='diaNascimento']").blur(function(){
		verificaCampo("diaNascimento");
	})
	
	$("input[data-campo='mesNascimento']").blur(function(){
		verificaCampo("mesNascimento");
	})
	
	$("input[data-campo='anoNascimento']").blur(function(){
		verificaCampo("anoNascimento");
	})
});

function verificaCampo(campo){
	if(campo == "nome"){
		$("div[data-campo='nome']").html("");
		$("input[data-campo='nome']").removeClass("is-invalid");
		if($("#nome").val().length < 5){
			$("div[data-campo='nome']").html('Mínimo de 5 caracteres');
			$("input[data-campo='nome']").addClass("is-invalid");
		}
	}
	if(campo == "telefone"){
		$("div[data-campo='telefone']").html("");
		$("input[data-campo='telefone']").removeClass("is-invalid");
		$("#telefone").val($("#telefone").val().replace(/\D/g,""));
		if(($("#telefone").val().length > 0 &&
		   $("#telefone").val().length < 10) || $("#telefone").val().length > 14 || isNaN($("#celular").val()))	
		{
			$("div[data-campo='telefone']").html('Telefone inválido');
			$("input[data-campo='telefone']").addClass("is-invalid");
		}
	}
	if(campo == "celular"){
		$("div[data-campo='celular']").html("");
		$("input[data-campo='celular']").removeClass("is-invalid");
		$("#celular").val($("#celular").val().replace(/\D/g,""));
		if(($("#celular").val().length > 0 &&
			$("#celular").val().length < 10) || $("#celular").val().length > 14 || isNaN($("#celular").val()))	
		{
			$("div[data-campo='celular']").html('Celular inválido');
			$("input[data-campo='celular']").addClass("is-invalid");
		}
	}
	if(campo == "email"){
		$("div[data-campo='email']").html("");
		$("input[data-campo='email']").removeClass("is-invalid");
		if(!/^.{1,}@.{1,}$/g.test($("#email").val())){
			$("div[data-campo='email']").html('Email inválido!');
			$("input[data-campo='email']").addClass("is-invalid");
		}
		if($("#email").val().length == 0){
			$("div[data-campo='email']").html('Campo obrigatório!');
			$("input[data-campo='email']").addClass("is-invalid");
		}
	}
	if(campo == "senha"){
		$("div[data-campo='senha']").html("");
		$("input[data-campo='senha']").removeClass("is-invalid");
		
		if($("#senha").val() != $("#confirmarSenha").val() && $("#confirmarSenha").val().length > 0){
			$("div[data-campo='senha']").html('Senhas não conferem!');
			$("input[data-campo='senha']").addClass("is-invalid");
			$("input[data-campo='confirmarSenha']").addClass("is-invalid");
			$("div[data-campo='confirmarSenha']").html('Senhas não conferem!');
		}
		
		if($("#senha").val().length == 0){
			$("div[data-campo='senha']").html('Campo obrigatório!');
			$("input[data-campo='senha']").addClass("is-invalid");
		}
	}
	if(campo == "confirmarSenha"){
		$("div[data-campo='confirmarSenha']").html("");
		$("input[data-campo='confirmarSenha']").removeClass("is-invalid");
		
		if($("#confirmarSenha").val() != $("#senha").val() && $("#senha").val().length > 0){
			$("div[data-campo='confirmarSenha']").html('Senhas não conferem!');
			$("input[data-campo='confirmarSenha']").addClass("is-invalid");
			$("input[data-campo='senha']").addClass("is-invalid");
			$("div[data-campo='senha']").html('Senhas não conferem!');
		}
		
		if($("#confirmarSenha").val().length == 0){
			$("div[data-campo='confirmarSenha']").html('Campo obrigatório!');
			$("input[data-campo='confirmarSenha']").addClass("is-invalid");
		}
	}
	
	if($("#confirmarSenha").val() == $("#senha").val() && $("#senha").val().length > 0 && $("#confirmarSenha").val().length > 0){
		$("div[data-campo='senha']").html("");
		$("input[data-campo='senha']").removeClass("is-invalid");
		$("div[data-campo='confirmarSenha']").html("");
		$("input[data-campo='confirmarSenha']").removeClass("is-invalid");
	}

	if(campo == "numero"){
		$("div[data-campo='numero']").html("");
		$("input[data-campo='numero']").removeClass("is-invalid");
		if($("#numero").val().length == 0){
			$("div[data-campo='numero']").html('Campo obrigatório!');
			$("input[data-campo='numero']").addClass("is-invalid");
		}
	}
	
	if(campo == "logradouro"){
		$("div[data-campo='logradouro']").html("");
		$("input[data-campo='logradouro']").removeClass("is-invalid");
		if($("#logradouro").val().length == 0){
			$("div[data-campo='logradouro']").html('Campo obrigatório!');
			$("input[data-campo='logradouro']").addClass("is-invalid");
		}
	}
	
	if(campo == "diaNascimento"){
		$("div[data-campo='diaNascimento']").html("");
		$("input[data-campo='diaNascimento']").removeClass("is-invalid");
		if($("#diaNascimento").val() == 0 || $("#diaNascimento").val() > 31 || $("#diaNascimento").val().length == 0){
			$("div[data-campo='diaNascimento']").html('Dia inválido!');
			$("input[data-campo='diaNascimento']").addClass("is-invalid");
		}
	}
	
	if(campo == "mesNascimento"){
		$("div[data-campo='mesNascimento']").html("");
		$("input[data-campo='mesNascimento']").removeClass("is-invalid");
		if($("#mesNascimento").val() == 0 || $("#mesNascimento").val() > 12 || $("#mesNascimento").val().length == 0){
			$("div[data-campo='mesNascimento']").html('Mês inválido!');
			$("input[data-campo='mesNascimento']").addClass("is-invalid");
		}
	}
	
	if(campo == "anoNascimento"){
		$("div[data-campo='anoNascimento']").html("");
		$("input[data-campo='anoNascimento']").removeClass("is-invalid");
		if($("#anoNascimento").val() > (new Date()).getFullYear() || $("#anoNascimento").val() < (new Date()).getFullYear()-500 || $("#anoNascimento").val().length == 0){
			$("div[data-campo='anoNascimento']").html('Ano inválido!');
			$("input[data-campo='anoNascimento']").addClass("is-invalid");
		}
	}
	
	if($("#diaNascimento").val().length == 0 && $("#mesNascimento").val().length == 0 && $("#anoNascimento").val().length == 0){
		$("div[data-campo='anoNascimento']").html("");
		$("input[data-campo='anoNascimento']").removeClass("is-invalid");
		$("div[data-campo='mesNascimento']").html("");
		$("input[data-campo='mesNascimento']").removeClass("is-invalid");
		$("div[data-campo='diaNascimento']").html("");
		$("input[data-campo='diaNascimento']").removeClass("is-invalid");
	}
}

function validarCadastro(formulario){
	
	verificaCampo("nome");
	verificaCampo("telefone");
	verificaCampo("celular");
	verificaCampo("email");
	verificaCampo("senha");
	verificaCampo("confirmarSenha");
	verificaCampo("numero");
	verificaCampo("logradouro");
	verificaCampo("diaNascimento");
	verificaCampo("mesNascimento");
	verificaCampo("anoNascimento");
	
	var erros = 0;
	erros = $(".is-invalid").length;
	
	if(erros == 1){
		criarModalErro("Erro!", "Encontramos um erro em um campo do formulário. Nós o marcamos para que você possa corrigi-lo.");
	}
	if(erros > 1){
		criarModalErro("Erro!", "Encontramos erros em alguns campos do formulário. Nós os marcamos para que você possa corrigi-los.")
	}
	if(erros == 0){
		formulario.submit();
	}
}