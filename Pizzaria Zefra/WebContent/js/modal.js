//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

function criarModalConfirmacao(titulo, mensagem, formulario, tipo){
	$("#modalConfirmacao-titulo").html(titulo);
	$("#modalConfirmacao-mensagem").html(mensagem);
	if(tipo == "ACAO_NEGATIVA"){
		$("#modalConfirmacao-sim").removeClass("btn-pizza");
		$("#modalConfirmacao-sim").addClass("btn-danger");
	}
	else{
		$("#modalConfirmacao-sim").addClass("btn-pizza");
		$("#modalConfirmacao-sim").removeClass("btn-danger");
	}
		
	$("#modalConfirmacao-sim").unbind();
	$("#modalConfirmacao-sim").click(function(){
		$('#modalConfirmacao').modal('hide');
		formulario.submit();
	});
	$('#modalConfirmacao').modal('show');
}

function criarModalConfirmacaoPedido(titulo, mensagem, formulario, tipo){
	$("#modalConfirmacaoPedido-titulo").html(titulo);
	$("#modalConfirmacaoPedido-mensagem").html(mensagem);
	if(tipo == "ACAO_NEGATIVA"){
		$("#modalConfirmacaoPedido-sim").removeClass("btn-pizza");
		$("#modalConfirmacaoPedido-sim").addClass("btn-danger");
	}
	else{
		$("#modalConfirmacaoPedido-sim").addClass("btn-pizza");
		$("#modalConfirmacaoPedido-sim").removeClass("btn-danger");
	}
		
	$("#modalConfirmacaoPedido-sim").unbind();
	$("#modalConfirmacaoPedido-sim").click(function(){
		$(formulario).find('[data-caracteristica=tipoPagamento]').val($("#modalConfirmacaoPedido-tipoPagamento").find(":selected").val());
		$('#modalConfirmacaoPedido').modal('hide');
		formulario.submit();
	});
	$('#modalConfirmacaoPedido').modal('show');
}

function criarModalEdicaoCarrinho(titulo, formulario, quantidadeSelecionada, tipo){
	$("#modalEdicaoCarrinho-titulo").html(titulo);
	$("#modalEdicaoCarrinho-quantidade").val(quantidadeSelecionada);
	if(tipo == "PRODUTO_PIZZA"){
		
	}
		
	$("#modalEdicaoCarrinho-salvar").unbind();
	$("#modalEdicaoCarrinho-salvar").click(function(){
		$('#modalEdicaoCarrinho').modal('hide');
		
		$(formulario).find('[data-caracteristica=quantidade-selecionada]').val($("#modalEdicaoCarrinho-quantidade").val());
		formulario.submit();
	});
	$('#modalEdicaoCarrinho').modal('show');
}

function criarModalSucesso(titulo, mensagem){
	$("#modalSucesso-titulo").html(titulo);
	$("#modalSucesso-mensagem").html(mensagem);
	$('#modalSucesso').modal('show');
}

function criarModalErro(titulo, mensagem){
	$("#modalErro-titulo").html(titulo);
	$("#modalErro-mensagem").html(mensagem);
	$('#modalErro').modal('show');
}

function criarModalAvaliacao(titulo, idProduto, nota, comentario){
	$("#modalAvaliacao-idProduto").val(idProduto);
	$(".modalAvaliacao-option-nota").prop('selected', false);
	$("#modalAvaliacao-textoAvaliacao").html("");
	
	if(nota != null){
		$(".modalAvaliacao-nota-"+nota).prop('selected', true);
		$("#modalAvaliacao-textoAvaliacao").html($("#"+comentario).html());
	}
	
	$("#modalAvaliacao-titulo").html(titulo);
	$('#modalAvaliacao').modal('show');
}