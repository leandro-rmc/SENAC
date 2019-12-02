<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form data-produto-variedade="idProduto" class="h-100 col-12 col-sm-6 col-md-5 offset-md-1 offset-lg-0 col-lg-4 mt-5 mt-lg-5 ${cardClasses}" novalidate onsubmit="controleFormularioVariedade(this); return false" action="carrinho.html" method="POST">

	<input type="hidden" name="id" value="${produtoModelo.idProduto}">
	<input type="hidden" name="tipo" value="${produtoModelo.tipo}">
	<input type="hidden" name="acao" value="addCarrinho">
	
	<input type="hidden" data-caracteristica="preco-base" value="${produtoModelo.preco}"/>
	<div class="h-100 border-0 card card-responsivo rounded-0 card-shadow">
		<div class="miniatura">
			<a href="produto.html?id=${produtoModelo.idProduto}">
				<img data-caracteristica="imagem" src="imagem/produto/${produtoModelo.img}"/>
			</a>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col text-center">
					<strong>
						<a href="produto.html?id=${produtoModelo.idProduto}">
							<span data-caracteristica="titulo"><c:out value="${produtoModelo.titulo}"/></span>
						</a>
					</strong>
				</div>
			</div>							
			<div class="row card-area-responsiva-descricao">
				<div class="col text-center">
					<span data-caracteristica="descricao"><c:out value="${produtoModelo.descricao}"/></span>
				</div>
			</div>			
			<hr>
			<div class="row card-area-responsiva-preco">
				<div class="col-12">
					<div class="row">
						<div class="col-12">
							<span data-caracteristica="quantidade"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<strong>
								R$ <span data-caracteristica="total">
								<fmt:formatNumber currencySymbol="" value = "${produtoModelo.preco}" type = "currency" minFractionDigits="2" pattern="######"/></span>
							</strong>
						</div>
					</div>
				</div>
				<div class="col-12">
					<c:set var="quantidade" value="0"></c:set>
					<c:set var="classeMuted" value="text-muted"></c:set>
					<c:forEach items="${sessionScope.carrinho}" var="c">
						<c:if test="${produtoModelo.idProduto == c.value.produtoVariedade.idProduto}">
							<c:set var="quantidade" value="${c.value.quantidade}"></c:set>
							<c:set var="classeMuted" value=""></c:set>
						</c:if>
					</c:forEach>
					<span class="font-monospace ${classeMuted}">(No <a class="${classeMuted}" href="carrinho.html">carrinho</a>: <strong>${quantidade}</strong>)</span>
				</div>
			</div>
			<hr>
			
			<label for="quantidade_${produtoModelo.idProduto}">Quantidade</label>
			<input data-caracteristica="quantidade-selecionada" name="quantidade-selecionada" id="quantidade_${produtoModelo.idProduto}" type="number" placeholder="Quantidade" min="1" max="99999" value="1" class="form-control">
			<div class="row mt-3">
				<div class="col">
				
					<c:if test="${produtoModelo.avaliacao != null}">
						<button type="button" onclick="criarModalAvaliacao('Reavaliação',${produtoModelo.idProduto},${produtoModelo.avaliacao.nota},'comentario-${produtoModelo.idProduto}')" class="ml-2 float-right btn btn-dark rounded border-0">Reavaliar</button>
						<textarea id="comentario-${produtoModelo.idProduto}" class="d-none"><c:out value='${produtoModelo.avaliacao.comentario}'></c:out></textarea>
					</c:if>
					<c:if test="${produtoModelo.avaliacao == null}">
						<c:if test="${produtoModelo.comprador == true}">
							<button type="button" onclick="criarModalAvaliacao('Avaliação', ${produtoModelo.idProduto})" class="ml-2 float-right btn btn-success">Avaliar</button>
						</c:if>
					</c:if>
					
					<button class="border-0 btn btn-pizza rounded float-right">Carrinho</button>
				</div>
			</div>
		</div>
		<div class="card-footer">
			<div class="row">
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
	</div>
</form>