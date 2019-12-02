var ultimo_edit = ""; 
var ultimo_delete = ""; 
var qtdPessoasAtendidas = 197;
var qtdCasosSolucionados = 27842;
var chamadosEmEspera = 1;
var campo_erro_mensagem_vazia = "Preencha este campo";
var campo_erro_email_mensagem = "E-mails não são iguais";
var campo_erro_email_mensagem_invalido = "Formato de e-mail inválido";
var campo_erro_senha_mensagem = "Senhas não são iguais";
var listaTecnicos = [{Nome:"Carlita Mig",Perfil:"ver_perfil.php?id=1"},{Nome:"Marcela Neves",Perfil:"ver_perfil.php?id=2"},{Nome:"Nathalia Silva",Perfil:"ver_perfil.php?id=3"}];
//Lista acima é usada para gerar uma técnica aleatória para o atendimento.
$("document").ready(function(){
	
	window.setInterval(function(){
		var n = Math.floor(Math.random()*2);
		if (n == 0)
			qtdPessoasAtendidas++;
		else{
			qtdPessoasAtendidas--;
			qtdCasosSolucionados++;
		}
		$("#qtdPessoasAtendidas").html(qtdPessoasAtendidas);
		$("#qtdCasosSolucionados").html(qtdCasosSolucionados);
	},500);
	//Função acima é usada para gerar valores aleatórios na tela Index.
	
	$("#formLogin").submit(function(){
		if($("#l_senha").val() == "" || $("#l_email").val() == "")
			return false
	});
	//Apenas verifica se ambos os campos não estão vazios. Se qualquer dos dois estiver, o formulário não será enviado.
	
	$("#cadastroCliente").click(function(){
		$("#formTecnico").fadeOut(600);
		$("#cadastroTecnico").removeClass("btn-primary");
		$("#cadastroCliente").addClass("btn-primary");
	});
	$("#cadastroTecnico").click(function(){
		$("#formTecnico").fadeIn(600);
		$("#cadastroCliente").removeClass("btn-primary");
		$("#cadastroTecnico").addClass("btn-primary");
	});
	//Essas duas funções click acima são usadas para trocar o estilo do botão pill na página "Meus Chamados".
	
	$("#btnCriarChamado").click(function(){
		$.ajax({
			type:"GET",
			url:"funcoes/criarChamado.php",
			timeout:2500,
			data:{
				equipamento: $("#equipamento").val(),
				marca: $("#marca").val(),
				problema: $("#problema").val(),
				assunto: $("#assunto").val()
				},
			beforeSend:function(){
				$("#chamados-espera").prepend("<div class='mensagem-chamado'>Aguardando servidor...</div>");
			},
			error:function(){
				$(".mensagem-chamado").html("Erro no servidor!");
			},
			success:function(dados){
				$(".mensagem-chamado").remove();
				$("#chamados-espera").prepend(dados);
				$('.nenhumChamado').html("");
				chamadosEmEspera++; //Acrescenta em 1 o valor mostrado no botão pill da página "Meus Chamados".
				$("#chamadosEmEspera").html(chamadosEmEspera);
			}
		});
		$("#modalChamado input").val("");
		$("#modalChamado textarea").val("");
	});
	//Este Ajax acima é uma simulação de uma requisição ao banco de dados. O PHP gera o chamado com um Sleep e e nos envia. Assim colocamos os dados retornados na DIV de ID "chamados-espera".
	$("#btnSalvarChamadoEditado").click(function(){
		$(ultimo_edit + " .campo_equipamento").html($("#e_equipamento").val());
		$(ultimo_edit + " .campo_marca").html($("#e_marca").val());
		$(ultimo_edit + " .campo_assunto").html($("#e_assunto").val());
		$(ultimo_edit + " .campo_problema").html($("#e_problema").val());
	});
	//Ultimo_edit recebe o ID do último chamado que você apertou o botão editar.
	//Essa função pesquisará as classes que estão dentro da DIV com este ID e irá salvar os dados dos campos do Modal neles.
	
	$("#btnDeletarChamado").click(function(){
		$(ultimo_delete).fadeOut(800,function(){
			$(ultimo_delete).remove();
			if($("#chamados-espera div").length == 0)
				$('.nenhumChamado').html("Nenhum chamado a ser exibido.");
			//Caso não tenha mais nenhuma DIV dentro da DIV com ID chamados-espera, mostrará uma mensagem informando que não há mais chamados a serem exibidos.
		});
		chamadosEmEspera--;
		$("#chamadosEmEspera").html(chamadosEmEspera);
	});
	$("#formRegistro input").blur(function(){
		if ($(this).val() == ""){
			$(this).css("outline","1px solid red")
			$(this).parent().find(".mensagem-erro").html(campo_erro_mensagem_vazia);
		}
		else{
			$(this).css("outline","none");
			$(this).parent().find(".mensagem-erro").html("");
		}
		
		if ($(this).attr("id") == "email" || $(this).attr("id") == "cemail")
			if(!/^\w([\-\+\_\.](?![\-\+\_\.])|\w(?=[\w\-\+\_\.])){1,}\w@\w([\-\+\_\.](?![\-\+\_\.])|\w(?=[\w\-\+\_\.])){1,}\w$/.test($(this).val()))
				$(this).parent().find(".mensagem-erro").html(campo_erro_email_mensagem_invalido);
				/*
				A expressão regular acima valida o e-mail da seguinte forma:
				Impede que carácteres especiais sejam usados em sequência, exemplo: leandro..musser@gmail.com
				Impede que carácteres especiais sejam usados no início, antes do @, depois do @ e no fim
				Impede que menos de três carácteres sejam usados antes e/ou depois do @.
				*/
	});
	//Todos os inputs dentro do formulário de ID formRegistro ganharão o evento blur, contendo várias funções para cada campo.
	//Caso algum campo esteja vazio ao sair do mesmo, o script pegará a mensagem que está abaixo dele e mudará o texto dela para informar o erro.
	
	$("#formRegistro").submit(function(){
		var resultado = true;
		$("#formRegistro input").each(function() {
			if ($(this).val() == ""){
				if ($("#cadastroCliente").hasClass("btn-primary") && $(this).attr("id") != "matricula" && $(this).attr("id") != "funcao"){
						$(this).css("outline","1px solid red");
						$(this).parent().find(".mensagem-erro").html(campo_erro_mensagem_vazia);
						resultado = false;
					}
				if ($("#cadastroTecnico").hasClass("btn-primary")){
					$(this).css("outline","1px solid red");
					$(this).parent().find(".mensagem-erro").html(campo_erro_mensagem_vazia);
					resultado = false;
				}
			}
			else{
				$(this).css("outline","none");
				$(this).parent().find(".mensagem-erro").html("");
			}
			if ($(this).attr("id") == "email" || $(this).attr("id") == "cemail")
				if(!/^\w([\-\+\_\.](?![\-\+\_\.])|\w(?=[\w\-\+\_\.])){1,}\w@\w([\-\+\_\.](?![\-\+\_\.])|\w(?=[\w\-\+\_\.])){1,}\w$/.test($(this).val()))
					$(this).parent().find(".mensagem-erro").html(campo_erro_email_mensagem_invalido);
				/*
				A expressão regular acima valida o e-mail da seguinte forma:
				Impede que carácteres especiais sejam usados em sequência, exemplo: leandro..musser@gmail.com
				Impede que carácteres especiais sejam usados no início, antes do @, depois do @ e no fim
				Impede que menos de três carácteres sejam usados antes e/ou depois do @.
				*/
		});
		
		if($("#email").val() != $("#cemail").val()){
			$("#email").css("outline","1px solid red");
			$("#cemail").css("outline","1px solid red");
			$("#cemail").parent().find(".mensagem-erro").html(campo_erro_email_mensagem);
			$("#email").parent().find(".mensagem-erro").html(campo_erro_email_mensagem);
			resultado = false;
		}
		if($("#senha").val() != $("#csenha").val()){
			$("#senha").css("outline","1px solid red");
			$("#csenha").css("outline","1px solid red");
			$("#csenha").parent().find(".mensagem-erro").html(campo_erro_senha_mensagem);
			$("#senha").parent().find(".mensagem-erro").html(campo_erro_senha_mensagem);
			resultado = false;
		}
		return resultado;
	});
});
atualizarIds();
function atualizarIds(){
	$(".deletarChamado").click(function(){
		ultimo_delete = "#"+$(this).attr("data-deletar");
	});
	$(".editarChamado").click(function(){
		var id = "#"+$(this).attr("data-editar");
		ultimo_edit = id;
		$("#e_equipamento").val($(id + " .campo_equipamento").html());
		$("#e_marca").val($(id + " .campo_marca").html());
		$("#e_assunto").val($(id + " .campo_assunto").html());
		$("#e_problema").val($(id + " .campo_problema").html());
	});
	$(".verRelatorio").click(function(){
		var id = "#"+$(this).attr("data-relatorio");
		
		$(".modalChamadoData").html($(id + " .data").html());
		$(".modalChamadoHora").html($(id + " .hora").html());
		
		$(".modalChamadoId").html(id);
		$(".modalChamadoEquipamento").html($(id + " .campo_equipamento").html());
		$(".modalChamadoMarca").html($(id + " .campo_marca").html());
		$(".modalChamadoAssunto").html($(id + " .campo_assunto").html());
		$(".modalChamadoProblema").html($(id + " .campo_problema").html());
		$(".modalChamadoTecnico").html($(id + " .nome-tecnico").html());
		$(".modalChamadoTecnico").attr("href",$(id + " .nome-tecnico").attr("href"));
	});
}
//Função acima é usada para adicionar eventos click a novos chamados que foram gerados pelo Ajax.
function pegarChamado(id){
	var n = Math.round(Math.random()*2); //Bug corrigido no dia 08/02/2018 às 15:49
	//O chamado será pego por uma das pessoas do vetor de objetos no inicio do script.js.
	var n2 = Math.round(Math.random()*17000)+3000;
	//O chamado será pego de 3 a 20 segundos.
	window.setTimeout(function(){
		if($("#"+id).length > 0){
			$("#"+id+" .msg-status").html("Chamado atendido por: <a class='nome-tecnico' href='"+listaTecnicos[n].Perfil+"'>"+listaTecnicos[n].Nome+"</a>.");
			$("#"+id+" .chamado").addClass("chamado-pego");
			$("#"+id+" .verRelatorio").removeClass("hidden");
		}
	},n2);
}
//Função acima é usada para pegar um chamado aleatóriamente.