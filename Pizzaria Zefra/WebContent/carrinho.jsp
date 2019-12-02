<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Variáveis da página -->
<c:set var="paginaTitulo" value="Carrinho de compras"></c:set>
<c:set var="paginaId" value="carrinho"></c:set>
<!-- Variáveis da página -->
	<%@include file="componente/topo.jsp"%>
	
	<c:if test="${sessionScope.pedidoAddSucesso == true}">
		<div class="text-center p-4 rounded-0 alert alert-success alert-dismissible fade show" role="alert">
		  <h4 class="alert-heading">Sucesso!</h4>
	  		Agora você pode acessar informações do seu pedido <a href="pedido.html?id=${sessionScope.sucessoPedidoId}" class="alert-link">aqui</a>.
		  <button type="button" class="close" data-dismiss="alert">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<c:set var="pedidoAddSucesso" value="" scope="session"/>
		<c:set var="sucessoPedidoId" value="" scope="session"/>
	</c:if>
	
	
	<div class="container-fluid pt-4 pb-5">
	
		<!--
			Caso não tenha nada no carrinho, isso não aparece
		-->
		<c:if test="${fn:length(sessionScope.carrinho) > 0 }">
			<c:set var="quantidadeTotalProdutos" value="0"></c:set>
			<c:set var="valorTotalProdutos" value="0"></c:set>
			<c:forEach items="${sessionScope.carrinho}" var="c">
				<c:choose>
					<c:when test="${c.value.tipo != 'pizza'}">
						<c:set var="quantidadeTotalProdutos" value="${quantidadeTotalProdutos + c.value.quantidade}"></c:set>
						<c:set var="valorTotalProdutos" value="${valorTotalProdutos + c.value.valor}"></c:set>
					</c:when>
					<c:otherwise>
						<c:forEach items="${c.value.itemPedidoPizza}" var="p">
							<c:set var="quantidadeTotalProdutos" value="${quantidadeTotalProdutos + p.quantidade}"></c:set>
							<c:set var="valorTotalProdutos" value="${valorTotalProdutos + p.preco}"></c:set>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		
			<div class="row mb-4">
				<div class="col-lg-8 offset-lg-2">
					<div class="row">
						<div class="col">
							<div class="d-flex flex-row text-dark">
								<div class="pr-5">
									<span class="font-monospace">Total</span>
									<h2>
										<span>
											R$ <fmt:formatNumber currencySymbol="" value = "${valorTotalProdutos}" type = "currency" minFractionDigits="2" pattern="######"/>
										</span>
									</h2>
								</div>
								<div>
									<span class="font-monospace">Itens</span>
									<h2>
										<span><c:out value="${quantidadeTotalProdutos}"></c:out></span><span class="font-monospace"></span>
									</h2>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-12">
							<c:choose>
								<c:when test="${sessionScope.logado != true}">
									<c:set var="modalPedido" value="criarModalErro('Ops!', 'Acesse a sua <a href=logar.jsp>conta</a> para finalizar seu pedido. <span class=d-block>Caso não tenha uma conta, clique <a href=cadastrar.jsp>aqui</a> para criar uma.</span>')"></c:set>
								</c:when>
								<c:otherwise>
									<c:set var="modalPedido" value="criarModalConfirmacaoPedido('Confirmação','Finalizar seu pedido?',this)"></c:set>
								</c:otherwise>
							</c:choose>
							
							<form onsubmit="${modalPedido}; return false" action="pedido.html" method="POST" class="float-right d-block">
								<input type="hidden" name="acao" value="novoPedido">
								<input data-caracteristica="tipoPagamento" type="hidden" name="tipoPagamento" value="1">
								<button class="btn btn-dark">Finalizar pedido</button>
							</form>
							<form onsubmit="criarModalConfirmacao('Confirmação','Deseja realmente limpar seu carrinho?',this,'ACAO_NEGATIVA'); return false" action="carrinho.html" method="POST" class="px-2 float-right">
								<input type="hidden" name="acao" value="limparCarrinho">
								<button class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i></button>
							</form>
							
						</div>
					</div>
				</div>
			</div>
		
			<div class="d-flex flex-column-reverse col-lg-8 offset-lg-2 px-0">
			
				<c:forEach items="${sessionScope.carrinho}" var="c">
					<c:if test="${c.value.tipo == 'pizza'}">
						<div class="card card-shadow mb-4">
							<div class="card-header">
								<div>
										<c:forEach items="${c.value.itemPedidoPizza}" var="p" end="0">
											<span class="text-muted d-block">Pizza de sabor </span>
											<h5 class="m-0 cards-title mr-auto mb-2">
												
												<a href="produto.html?id=${p.produtoPizza.idProduto}">
													<c:out value="${p.produtoPizza.titulo}"/>
												</a>
											</h5>
										</c:forEach>
									<span class="text-justify">
										<!-- ${c.value.produtoVariedade.descricao} -->
										<!-- <span class="text-muted">Tamanho:</span> <strong>Grande.</strong> <br> -->
										<!-- <span class="text-muted">Contém:</span> <strong>Mussarela, Catupiri e Teste.</strong><br> -->
										<!-- <span class="text-muted">Retirado:</span> <strong>Orégano e Batata Frita. </strong><br> -->
										
										<c:out value="${c.value.produtoVariedade.descricao}"/>
									</span>
								</div>
							</div>
							<div class="card-body pizza-container">
								<div id="pizzaCombinacoes">
									<c:forEach items="${c.value.itemPedidoPizza}" var="p" varStatus="loopPizza">
										<c:if test="${loopPizza.count == 1}">
											<c:set var="show" value="show"></c:set>
										</c:if>
										<div class="card my-2 mb-4 bg-light">
											<div class="card-header">
												<button class="btn btn-link text-dark" type="button" data-toggle="collapse" data-target="#collapsePizza_<c:out value='${loopPizza.count}'/>_<c:out value='${p.produtoPizza.idProduto}'/>">
										        	<span>Combinação <c:out value="${loopPizza.count}"/></span>
										        </button>
											</div>
											<div id="collapsePizza_<c:out value='${loopPizza.count}'/>_<c:out value='${p.produtoPizza.idProduto}'/>" class="collapse show"> <!-- <c:out value="${show}"/> -->
											    <div class="card-body">
											    	<div class="row">
											    		<div class="col-12">
											    			<span class="text-muted">Tamanho: </span><strong><span><c:out value="${p.tamanho.nomeTamanho}"/></span></strong>
											     		</div>
											     		<div class="col-12">
											     			<span class="text-muted">Quantidade: </span><strong><span><c:out value="${p.quantidade}"/></span></strong>
														</div>
														<div class="col-12">
															<span class="text-muted">Valor Total: </span><strong><span>R$ <fmt:formatNumber currencySymbol="" value = "${p.preco}" type = "currency" minFractionDigits="2" pattern="######"/></span></strong>
											  	 		</div>
											  	 		<c:if test="${fn:length(p.ingredientesRemovidos) != 0}">
															<div class="col-12 mt-3">
															
																<c:if test="${fn:length(p.ingredientesRemovidos) == 1}">
																	<span class="text-muted">Removido: </span>
																</c:if>
																<c:if test="${fn:length(p.ingredientesRemovidos) > 1}">
																	<span class="text-muted">Removidos: </span>
																</c:if>
																
																<c:forEach items="${p.ingredientesRemovidos}" var="i" varStatus="loopIngredientesRemovidos">
																	<c:if test="${loopIngredientesRemovidos.count != 1}"><span>-</span></c:if>
																	<strong><c:out value="${i.nome}"/></strong>
																</c:forEach>
												  	 		</div>
												  	 	</c:if>
											  	 	</div>
											  	 	
													<div class="row">	
														<div class="col-12">			  	 	
															<form data-produto-carrinho="idProduto" class="d-inline-block" onsubmit="criarModalEdicaoCarrinho('Edição de produto',this,<c:out value="${p.quantidade}"/>); return false" action="carrinho.html" method="POST">
																<input type=hidden name="acao" value="editarProduto">
																<input type=hidden name="codigoProtecao" value="${p.codigoProtecao}">
																<input type=hidden name="tipo" value="pizza">
																<input type=hidden name="indexPizza" value="<c:out value='${loopPizza.index}'/>">
																<input data-caracteristica="quantidade-selecionada" type="hidden" name="quantidade">
																<input type="hidden" name="id" value="${p.produtoPizza.idProduto}">
																<button class="btn btn-warning mt-3"><i class="far fa-edit"></i></button>
															</form>
															<form onsubmit="criarModalConfirmacao('Confirmação','Deseja realmente remover esta pizza do seu carrinho?',this,'ACAO_NEGATIVA'); return false" action="carrinho.html" method="POST" class="float-right">
																<input type=hidden name="tipo" value="pizza">
																<input type="hidden" name="acao" value="removerProduto">
																<input type=hidden name="codigoProtecao" value="${p.codigoProtecao}">
																<input type=hidden name="indexPizza" value="<c:out value='${loopPizza.index}'/>">
																<input type="hidden" name="id" value="${p.produtoPizza.idProduto}">
																<button class="btn btn-danger mt-3"><i class="fa fa-trash" aria-hidden="true"></i></button>
															</form>
														</div>
													</div>
								
											    </div>
										    </div>
										</div>
										<c:set var="show" value=""></c:set>
									</c:forEach>
								</div>
								
								<!--
								<c:if test="${fn:length(c.value.itemPedidoPizza) > 1}">
									<form onsubmit="criarModalConfirmacao('Confirmação','Deseja realmente remover todas as pizzas deste sabor do seu carrinho?',this,'ACAO_NEGATIVA'); return false" action="carrinho.html" method="POST" class="float-right">
										<input type="hidden" name="acao" value="removerProduto">
										<input type="hidden" name="id" value="${c.value.produtoVariedade.idProduto}">
										<button class="btn btn-danger mt-3"><i class="fa fa-trash" aria-hidden="true"></i></button>
									</form>
								</c:if>
								-->
								
							</div>
						</div>
						
						<!-- 
						<c:forEach items="${c.value.itemPedidoPizza}" var="p">
							${p.tamanho.nomeTamanho}<br>
							${p.quantidade}<br>
							${p.produtoPizza.titulo}<br>
							<button class="btn btn-dark mt-3">Detalhes</button>
						</c:forEach>
						-->
					</c:if>
					<c:if test="${c.value.tipo != 'pizza'}">
						<div class="card card-shadow mb-4">
							<!-- Adicionar algo para a pizza! -->
							<div class="card-header">
								<div>
									<h5 class="m-0 cards-title mr-auto mb-2"><a href="produto.html?id=${c.value.produtoVariedade.idProduto}"><c:out value="${c.value.produtoVariedade.titulo}"/></a></h5>
									<span class="text-justify">
										<!-- ${c.value.produtoVariedade.descricao} -->
										<!-- <span class="text-muted">Tamanho:</span> <strong>Grande.</strong> <br> -->
										<!-- <span class="text-muted">Contém:</span> <strong>Mussarela, Catupiri e Teste.</strong><br> -->
										<!-- <span class="text-muted">Retirado:</span> <strong>Orégano e Batata Frita. </strong><br> -->
										
										<c:out value="${c.value.produtoVariedade.descricao}"/>
									</span>
								</div>
							</div>
							<div class="card-body">
								<div>
									<span class="text-muted">Quantidade: </span><strong><span><c:out value="${c.value.quantidade}"/></span></strong>
								</div>
								<div>
									<span class="text-muted">Valor Total: </span><strong><span>R$ <fmt:formatNumber currencySymbol="" value = "${c.value.valor}" type = "currency" minFractionDigits="2" pattern="######"/></span></strong>
								</div>
								<form data-produto-carrinho="idProduto" class="d-inline-block" onsubmit="criarModalEdicaoCarrinho('Edição de produto',this,<c:out value="${c.value.quantidade}"/>); return false" action="carrinho.html" method="POST">
									<input type=hidden name="acao" value="editarProduto">
									<input data-caracteristica="quantidade-selecionada" type="hidden" name="quantidade">
									<input type=hidden name="tipo" value="variedade">
									<input type="hidden" name="id" value="${c.value.produtoVariedade.idProduto}">
									<button class="btn btn-warning mt-3"><i class="far fa-edit"></i></button>
								</form>
								<form onsubmit="criarModalConfirmacao('Confirmação','Deseja realmente remover este item do seu carrinho?',this,'ACAO_NEGATIVA'); return false" action="carrinho.html" method="POST" class="float-right">
									<input type="hidden" name="acao" value="removerProduto">
									<input type="hidden" name="id" value="${c.value.produtoVariedade.idProduto}">
									<button class="btn btn-danger mt-3"><i class="fa fa-trash" aria-hidden="true"></i></button>
								</form>
							</div>
						</div>
					</c:if>
				</c:forEach>
	
			</div>
		</c:if>
	</div>
	
		<c:if test="${fn:length(sessionScope.carrinho) == 0 }">
			<div class="container pb-5">
				<div class="row py-4">
					<c:set var="erro_modelo_titulo" value="Vazio!"></c:set>
					<c:set var="erro_modelo_mensagem" value="Você não tem produtos em seu carrinho."></c:set>
					<c:set var="erro_modelo_botao_link" value="produtos.html?tipo=pizza"></c:set>
					<c:set var="erro_modelo_botao_texto" value="Veja nossas pizzas"></c:set>
					<%@include file="componente/erroModelo.jsp"%>
				</div>
			</div>
		</c:if>
	
		<%@include file="componente/rodape.jsp"%>
		<%@include file="componente/modalModelo.jsp"%>
		<script charset="utf-8" src="js/modal.js"></script>
		<script charset="utf-8" src="js/produto.js"></script>
		
		<c:if test="${sessionScope.carrinhoRemoverSucesso == true}">
			<script>
				//criarModalSucesso("Sucesso!", "O produto foi removido do seu carrinho.");
				
				//(?) O cache dos navegadores modernos vai salvar esse script.
				//	  Fica ruim ao tentar voltar (usando recursos do navegador)...
				//	  ...para uma página que tenha exibido ele assim
				//    Vai abrir o modal toda hora, por isso removi do código.
				
			</script>
		</c:if>
		<c:set var="carrinhoRemoverSucesso" value="false" scope="session"  />
	</body>
</html>