//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

const MAX_QT_COMPRA = 99999;
const MIN_QT_COMPRA = 1;
const MAX_QT_COMPRA_PIZZA = 999;

//$("input[name='pizza_tamanho']:not(:checked)").parent().parent().removeClass("bg-warning");
//$("input[name='pizza_tamanho']:checked").parent().parent().addClass("bg-warning");

$("input[name='pizza_tamanho']").click(function(){
	$("input[name='pizza_tamanho']:not(:checked)").parent().parent().removeClass("bg-warning");
	$("input[name='pizza_tamanho']:checked").parent().parent().addClass("bg-warning");
});

function controleQuantidade(){
	$("[data-produto-variedade]").each(function(a){
		var precoBase = $(this).find("[data-caracteristica=preco-base]").val();
		var quantidadeSelecionada = $(this).find("[data-caracteristica=quantidade-selecionada]").val();
		var textoQuantidade = $(this).find("[data-caracteristica=quantidade]").html(); 
		var textoTotal = $(this).find("[data-caracteristica=total]").html();
		
		if(isNaN(parseInt(quantidadeSelecionada)) || quantidadeSelecionada < MIN_QT_COMPRA){
			quantidadeSelecionada = 1;
			//$(this).find("[data-caracteristica=quantidade-selecionada]").val(quantidadeSelecionada);
		}
		
		var total = precoBase * quantidadeSelecionada;
		
		var quantidadeSelecionadaF = quantidadeSelecionada+"x";
		$(this).find("[data-caracteristica=total]").html(total.toFixed(2).replace(".",","));
		$(this).find("[data-caracteristica=quantidade]").html(quantidadeSelecionadaF);
		
		if(quantidadeSelecionada == 1){
			$(this).find("[data-caracteristica=quantidade]").html("");
		}
	});
}

function controleQuantidadePizza(){
	$("input[name='pizza_tamanho']:not(:checked)").parent().parent().removeClass("bg-warning");
	$("input[name='pizza_tamanho']:checked").parent().parent().addClass("bg-warning");
	$("[data-produto-pizza]").each(function(){
		var pizza = this;
		var quantidadeSelecionada = $(pizza).find("[data-caracteristica=quantidade-selecionada]").val();
		
		if(isNaN(parseInt(quantidadeSelecionada)) || quantidadeSelecionada < MIN_QT_COMPRA){
			quantidadeSelecionada = 1;
			//$(pizza).find("[data-caracteristica=quantidade-selecionada]").val(quantidadeSelecionada);
		}
		
		$(pizza).find(":radio").each(function(){
			var idRadio = $(this).attr("id");
			var precoBase = $(pizza).find("[data-precobase="+idRadio+"]").val();
			
			var total = precoBase * quantidadeSelecionada;
			
			$(pizza).find("[data-total="+idRadio+"]").html(total.toFixed(2).replace(".",","));
			var quantidadeSelecionadaF = "("+quantidadeSelecionada+"x)";
			$(pizza).find("[data-quantidade="+idRadio+"]").html(quantidadeSelecionadaF);
			
			if(quantidadeSelecionada == 1){
				$(pizza).find("[data-quantidade="+idRadio+"]").html("");
			}
		});

	});
}

$("#modalEdicaoCarrinho-quantidade").keyup(function(){
	var quantidadeSelecionada = $("#modalEdicaoCarrinho-quantidade").val();
	
	if(isNaN(parseInt(quantidadeSelecionada)) || quantidadeSelecionada < MIN_QT_COMPRA){
		quantidadeSelecionada = 1;
		$("#modalEdicaoCarrinho-quantidade").val(quantidadeSelecionada);
	}
})

if($("[data-produto-variedade]").length > 0){
	window.setInterval(function(){controleQuantidade()},100);
}
if($("[data-produto-pizza]").length > 0){
	window.setInterval(function(){controleQuantidadePizza()},100);
}

function controleFormularioVariedade(formulario){
	var quantidadeSelecionada = $(formulario).find("[data-caracteristica=quantidade-selecionada]").val();
	if(isNaN(parseInt(quantidadeSelecionada)) || quantidadeSelecionada < MIN_QT_COMPRA || quantidadeSelecionada > MAX_QT_COMPRA){
		criarModalErro("Erro!", "Insira uma quantidade válida. Mínimo de "+MIN_QT_COMPRA+" e máximo de "+MAX_QT_COMPRA+".");
	}
	else{
		criarModalConfirmacao("Confirmação", "Adicionar ao carrinho?", formulario);
	}
}

function controleFormularioPizza(formulario){
	var quantidadeSelecionada = $(formulario).find("[data-caracteristica=quantidade-selecionada]").val();
	if(isNaN(parseInt(quantidadeSelecionada)) || quantidadeSelecionada < MIN_QT_COMPRA || quantidadeSelecionada > MAX_QT_COMPRA_PIZZA){
		criarModalErro("Erro!", "Insira uma quantidade válida. Mínimo de "+MIN_QT_COMPRA+" e máximo de "+MAX_QT_COMPRA_PIZZA+".");
	}
	else{
		criarModalConfirmacao("Confirmação", "Adicionar a pizza ao carrinho?", formulario);
	}
}