<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form data-produto-pizza="idProduto" class="row p-4 mt-4 card-shadow mb-4" novalidate onsubmit="controleFormularioPizza(this); return false" action="carrinho.html" method="POST">
	
	<input type="hidden" name="id" value="${produtoModelo.idProduto}">
	<input type="hidden" name="tipo" value="${produtoModelo.tipo}">
	<input type="hidden" name="acao" value="addCarrinho">
	
	<div class="col-sm-8 offset-sm-2 col-lg-4 offset-lg-0">
		<a href="produto.html?id=${produtoModelo.idProduto}">
			<img class="border-0 img-fluid rounded" src="imagem/produto/${produtoModelo.img}"/>
		</a>
		<div class="row mt-3">
			<div class="col-7 col-md-7">
				<div class="px-4 rounded text-center bg-light border border-secondary z-index-1 aval-container">
					<span class="text-center font-weight-bold"><i class="fas fa-heart"></i> 
						<c:choose>
							<c:when test="${produtoModelo.mediaNotas == -1}">
								-
							</c:when>
							<c:otherwise>
								<fmt:formatNumber value="${fn:substring(produtoModelo.mediaNotas * 10, 0, 3)}" type="NUMBER"></fmt:formatNumber>%
							</c:otherwise>
						</c:choose>
					</span>
					<div class="bg-success aval-nota" style="width:${produtoModelo.mediaNotas * 10}0%;"></div>
				</div>
			</div>
			<div class="col-5 col-md-5">
				<div class="rounded text-center bg-light border border-secondary">
					<span><i class="fas fa-comment-alt"></i><span class="font-weight-bold"> ${produtoModelo.numeroComentarios}</span></span>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-8 mb-4">
		<div class="row">
			<div class="col">
				<div class="m-0 pb-4 mt-4 mt-lg-0 border-bottom text-center">
					<span class="text-muted">Pizza de sabor </span>
					<h3>
						<a href="produto.html?id=${produtoModelo.idProduto}">
							<c:out value="${produtoModelo.titulo}"/>
						</a>
					</h3>
					
					<c:set var="quantidadeTotalPizza" value="0"></c:set>
					<c:forEach items="${sessionScope.carrinho}" var="c">
						<c:if test="${c.value.tipo == 'pizza'}">
							<c:forEach items="${c.value.itemPedidoPizza}" var="p">
								<c:if test="${p.produtoPizza.idProduto == produtoModelo.idProduto}">
									<c:set var="quantidadeTotalPizza" value="${quantidadeTotalPizza + p.quantidade}"></c:set>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
					
					<c:if test="${quantidadeTotalPizza > 0}">
						<span class="font-monospace">Você tem
							<strong>${quantidadeTotalPizza}</strong>
							<c:choose>
								<c:when test="${quantidadeTotalPizza > 1}">
									<span>pizzas</span>
								</c:when>
								<c:otherwise>
									<span>pizza</span>
								</c:otherwise>
							</c:choose>
							<span> deste sabor no seu <a href="carrinho.html">carrinho</a>.</span>
						</span>
					</c:if>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<c:set var="ppizzaModeloCheckedTamanho" value="checked"></c:set>
			<c:set var="ppizzaModeloCheckedCor" value="bg-warning"></c:set>
			<c:forEach items="${produtoModelo.pizzaPrecosTamanhos}" var="ppizzaModeloPT">
				<div class="col-12 col-sm-6 col-md-4 mb-4">
					<div class="card">
						<div class="p-1 p-md-2 card-header text-center ${ppizzaModeloCheckedCor}">
							<label class="m-0" for="pizza_tamanho_${ppizzaModeloPT.tamanho.id}_${produtoModelo.idProduto}">
								<input ${ppizzaModeloCheckedTamanho} type="radio" name="pizza_tamanho" id="pizza_tamanho_${ppizzaModeloPT.tamanho.id}_${produtoModelo.idProduto}" value="${ppizzaModeloPT.tamanho.id}"/>
								<strong><c:out value="${ppizzaModeloPT.tamanho.nomeTamanho}"/></strong>
								 <span data-quantidade="pizza_tamanho_${ppizzaModeloPT.tamanho.id}_${produtoModelo.idProduto}"></span>
								
								<c:set var="ppizzaModeloCheckedTamanho" value=""></c:set>
								<c:set var="ppizzaModeloCheckedCor" value=""></c:set>
								
							</label>
						</div>
						<div class="p-1 p-md-2 card-body text-center">
							R$ <span data-total="pizza_tamanho_${ppizzaModeloPT.tamanho.id}_${produtoModelo.idProduto}">
								<fmt:formatNumber currencySymbol="" value = "${ppizzaModeloPT.preco}" type = "currency" minFractionDigits="2" pattern="######"/>
							</span>
							<input type="hidden" data-precobase="pizza_tamanho_${ppizzaModeloPT.tamanho.id}_${produtoModelo.idProduto}" value="${ppizzaModeloPT.preco}"/>
						</div>
					</div>
				</div>
			</c:forEach>
			<c:if test="${fn:length(produtoModelo.pizzaPrecosTamanhos) == 0}">
				<div class="col mb-4">
					<span class="lead">Nenhum tamanho cadastrado.</span>
				</div>
			</c:if>
		</div>
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-body">
						<div class="card-title border-bottom pb-2">
							<h5 class="mb-0">Conteúdo</h5>
							<span class="font-monospace text-muted">Você pode desmarcar o que não quer.</span>
						</div>

						<div class="d-flex flex-wrap">
							<c:forEach items="${produtoModelo.pizzaIngredientes}" var="ppizzaModeloIngrediente">
								<div class="mt-1 mr-1">
									<label class="p-2 px-2 rounded bg-light" for="pizza_ingrediente_${ppizzaModeloIngrediente.ingrediente.id}_${produtoModelo.idProduto}"><input value="${ppizzaModeloIngrediente.ingrediente.id}" checked name="pizza_ingrediente" type="checkbox" id="pizza_ingrediente_${ppizzaModeloIngrediente.ingrediente.id}_${produtoModelo.idProduto}"> 
										<input type="hidden" name="pizza_todos_ingredientes" value="${ppizzaModeloIngrediente.ingrediente.id}">
										<c:out value="${ppizzaModeloIngrediente.ingrediente.nome}"/>
									</label>
								</div>
							</c:forEach>
							<c:if test="${fn:length(produtoModelo.pizzaIngredientes) == 0}">
								<span class="lead">Nenhum ingrediente cadastrado.</span>
							</c:if>
						</div>
												
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-12 col-sm-6 col-md-4">
				<label for="quantidade">Quantidade</label>
				<input data-caracteristica="quantidade-selecionada" name="quantidade-selecionada" id="quantidade" type="number" placeholder="Quantidade" min="1" max="999" value="1" class="form-control">
			</div>
		</div>
		
		<c:if test="${fn:length(produtoModelo.pizzaPrecosTamanhos) > 0}">
			<div class="row mt-4">
				<div class="col">
					<button class="btn btn-pizza">Carrinho</button>
					<c:if test="${produtoModelo.avaliacao != null}">
						<button type="button" onclick="criarModalAvaliacao('Reavaliação',${produtoModelo.idProduto},${produtoModelo.avaliacao.nota},'comentario-${produtoModelo.idProduto}')" class="ml-2 btn btn-dark rounded border-0">Reavaliar</button>
						<textarea id="comentario-${produtoModelo.idProduto}" class="d-none"><c:out value='${produtoModelo.avaliacao.comentario}'></c:out></textarea>
					</c:if>
					<c:if test="${produtoModelo.avaliacao == null}">
						<c:if test="${produtoModelo.comprador == true}">
							<button type="button" onclick="criarModalAvaliacao('Avaliação', ${produtoModelo.idProduto})" class="ml-2 btn btn-success">Avaliar</button>
						</c:if>
					</c:if>
				</div>
			</div>
		</c:if>
	</div>
</form>