<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Variáveis da página -->
<c:set var="paginaTitulo" value="Meus Pedidos"></c:set>
<c:set var="paginaId" value="pedidos"></c:set>
<!-- Variáveis da página -->
	<%@include file="componente/topo.jsp"%>
	
		<c:if test="${!empty pedidoFinalizado}">
			<div class="container my-4 py-4">
			
				<div class="my-4 py-4 d-flex flex-column-reverse col-md-8 offset-md-2">
					<c:forEach items="${pedidoFinalizado}" var="pedido" varStatus="status">
						<div class="card card-shadow mb-4">
							<div class="card-header">
								<div>
									<h5 class="m-0 cards-title mr-auto">
										<a href="pedido.html?id=${pedido.id}">Pedido</a>
										<span class="text-muted font-weight-light">#${status.count}</span>
									</h5>
									<span class="text-muted">
										${pedido.hora} - <fmt:formatDate pattern = 'dd-MM-yyyy' value = '${pedido.data}' />
									</span>
								</div>
							</div>
							<div class="card-body">
								<div>
									<span class="text-muted">Total de Itens: </span><strong><span><c:out value="${pedido.quantidadeTotal}"/></span></strong>
								</div>
								<div>
									<span class="text-muted">Valor Total: </span><strong><span>R$ <fmt:formatNumber currencySymbol="" value = "${pedido.valorTotal}" type = "currency" minFractionDigits="2" pattern="######"/></span></strong>
								</div>
								<div>
									<span class="text-muted">Tipo de Pagamento:</span> <strong>${pedido.tipoPagamento.tipo}</strong>
								</div>
							</div>
						</div>
					</c:forEach>	
				</div>
			</div>
		</c:if>
		
		<c:if test="${empty pedidoFinalizado}">
			<div class="container pt-5">
				<div class="row py-5">
					<c:set var="erro_modelo_titulo" value="Vazio!"></c:set>
					<c:set var="erro_modelo_mensagem" value="Você ainda não efetuou compras no site."></c:set>
					<c:set var="erro_modelo_botao_link" value="produtos.html?tipo=pizza"></c:set>
					<c:set var="erro_modelo_botao_texto" value="Veja nossas pizzas"></c:set>
					<%@include file="componente/erroModelo.jsp"%>
				</div>
			</div>
		</c:if>
	
	<%@include file="componente/rodape.jsp"%>
</html>