<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Variáveis da página -->
<c:set var="paginaTitulo" value="Meu Pedido"></c:set>
<c:set var="paginaId" value="pedido"></c:set>
<!-- Variáveis da página -->
	<%@include file="componente/topo.jsp"%>
	
		<div class="container mt-4">
		
			<div class="d-flex flex-column-reverse col-md-8 offset-md-2">
				<div class="card card-shadow mb-4">
					<div class="card-header">
						<div>
							<h5 class="m-0 cards-title mr-auto">
								<a href="pedido.html?id=${pedidoFinalizado.id}">Pedido</a>
								<span class="text-muted font-weight-light">#${indexPedido}</span>
							</h5>
							<span class="text-muted">
								${pedidoFinalizado.hora} - <fmt:formatDate pattern = 'dd-MM-yyyy' value = '${pedidoFinalizado.data}' />
							</span>
						</div>
					</div>
					<div class="card-body">
						<div>
							<span class="text-muted">Total de Itens: </span><strong><span><c:out value="${pedidoFinalizado.quantidadeTotal}"/></span></strong>
						</div>
						<div>
							<span class="text-muted">Valor Total: </span><strong><span>R$ <fmt:formatNumber currencySymbol="" value = "${pedidoFinalizado.valorTotal}" type = "currency" minFractionDigits="2" pattern="######"/></span></strong>
						</div>
						<div>
							<span class="text-muted">Tipo de Pagamento:</span> <strong>${pedidoFinalizado.tipoPagamento.tipo}</strong>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="d-flex flex-column-reverse col-lg-8 offset-lg-2 px-0">
			<c:set var="indexPedidos" value="0"></c:set>
			<c:forEach items="${itensPedido}" var="c">
				<c:set var="indexPedidos" value="${indexPedidos + 1}"></c:set>
					<c:if test="${c.tipo == 'pizza'}">
						<div class="card card-shadow mb-4">
							<div class="card-header">
								<div>
									<span class="m-0 cards-title mr-auto mb-2">
										<span class="text-muted d-block">Pizza de sabor </span>
										<strong>
											<a href="produto.html?id=${c.itemPedidoPizzaSingle.produtoPizza.idProduto}">
												<c:out value="${c.itemPedidoPizzaSingle.produtoPizza.titulo}"/>
											</a>
										</strong>
										<span class="float-right text-muted">
											${indexPedidos}
										</span>
									</span>
								</div>
							</div>
							<div class="card-body m-0 py-3">
								<div class="row">
						    		<div class="col-12">
						    			<span class="text-muted">Tamanho: </span><strong><span><c:out value="${c.itemPedidoPizzaSingle.tamanho.nomeTamanho}"/></span></strong>
						     		</div>
						     		<div class="col-12">
						     			<span class="text-muted">Quantidade: </span><strong><span><c:out value="${c.itemPedidoPizzaSingle.quantidade}"/></span></strong>
									</div>
									<div class="col-12">
										<span class="text-muted">Valor Total: </span><strong><span>R$ <fmt:formatNumber currencySymbol="" value = "${c.itemPedidoPizzaSingle.preco}" type = "currency" minFractionDigits="2" pattern="######"/></span></strong>
						  	 		</div>
						  	 		<c:if test="${fn:length(c.itemPedidoPizzaSingle.ingredientesRemovidos) != 0}">
										<div class="col-12 mt-3">
										
											<c:if test="${fn:length(c.itemPedidoPizzaSingle.ingredientesRemovidos) == 1}">
												<span class="text-muted">Ingrediente removido: </span>
											</c:if>
											<c:if test="${fn:length(c.itemPedidoPizzaSingle.ingredientesRemovidos) > 1}">
												<span class="text-muted">Ingredientes removidos: </span>
											</c:if>
											
											<c:forEach items="${c.itemPedidoPizzaSingle.ingredientesRemovidos}" var="i" varStatus="loopIngredientesRemovidos">
												<c:if test="${loopIngredientesRemovidos.count != 1}"><span>-</span></c:if>
												<strong><c:out value="${i.nome}"/></strong>
											</c:forEach>
							  	 		</div>
							  	 	</c:if>
						  	 	</div>
							</div>
						</div>
					</c:if>
					<c:if test="${c.tipo != 'pizza'}">
						<div class="card card-shadow mb-4">
							<!-- Adicionar algo para a pizza! -->
							<div class="card-header">
								<div>
									<strong>
										<span class="m-0 cards-title mr-auto mb-2"><a href="produto.html?id=${c.produtoVariedade.idProduto}"><c:out value="${c.produtoVariedade.titulo}"/></a></span>
									</strong>
									<span class="float-right text-muted">
										${indexPedidos}
									</span>
									<span class="text-justify d-block">
										<c:out value="${c.produtoVariedade.descricao}"/>
									</span>
								</div>
							</div>
							<div class="card-body">
								<div>
									<span class="text-muted">Quantidade: </span><strong><span><c:out value="${c.quantidade}"/></span></strong>
								</div>
								<div>
									<span class="text-muted">Valor Total: </span><strong><span>R$ <fmt:formatNumber currencySymbol="" value = "${c.valor}" type = "currency" minFractionDigits="2" pattern="######"/></span></strong>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			
				<!--
				<c:if test="${fn:length(sessionScope.carrinho) == 0 }">
					<div class="py-5">
						<div class="row pt-5">
							<c:set var="erro_modelo_titulo" value="Vazio!"></c:set>
							<c:set var="erro_modelo_mensagem" value="Você não tem produtos em seu carrinho."></c:set>
							<c:set var="erro_modelo_botao_link" value="produtos.html?tipo=pizza"></c:set>
							<c:set var="erro_modelo_botao_texto" value="Veja nossas pizzas"></c:set>
							<%@include file="componente/erroModelo.jsp"%>
						</div>
					</div>
				</c:if>
				-->
	
	<%@include file="componente/rodape.jsp"%>
</html>