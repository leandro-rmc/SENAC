<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:if test="${sessionScope.carrinhoAddSucesso == true}">
	<div class="text-center p-4 rounded-0 alert alert-success alert-dismissible fade show" role="alert">
	  <h4 class="alert-heading">Sucesso!</h4>

  		Enviamos para o seu <a href="carrinho.html" class="alert-link">carrinho de compras</a> 
  		<c:out value="${sessionScope.sucessoQuantidadeProduto}"/>
  		<c:choose>
  			<c:when test="${sessionScope.sucessoQuantidadeProduto > 1}">
  				unidades 
  			</c:when>
  			<c:otherwise>
  				unidade 
  			</c:otherwise>
  		</c:choose>
  		
  		<c:choose>
  			<c:when test="${sessionScope.sucessoTipoProduto == 'pizza'}">
  				da pizza de sabor <c:out value="${sessionScope.sucessoNomeProduto}"/>, com as caracteristicas escolhidas.
  			</c:when>
  			<c:otherwise>
  				do produto <c:out value="${sessionScope.sucessoNomeProduto}"/>.
  			</c:otherwise>
  		</c:choose>
  		
  		<c:if test="${sessionScope.sucessoProdutoMesclado == true}">
 				<c:choose>
 					<c:when test="${sessionScope.sucessoTipoProduto == 'pizza'}">
 						<span class="d-block">Como você já tinha em seu <a href="carrinho.html" class="alert-link">carrinho de compras</a> uma pizza com exatamente as mesmas caracteristicas escolhidas por você, nós a juntamos com a que está lá.</span> 
 					</c:when>
 					<c:otherwise>
 						<span class="d-block">Como você já tinha em seu <a href="carrinho.html" class="alert-link">carrinho de compras</a> um produto igual, nós o juntamos com o que está lá.</span>
 					</c:otherwise>
 				</c:choose>
 			</c:if>
	  	
	  <button type="button" class="close" data-dismiss="alert">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
	<c:set var="carrinhoAddSucesso" value="" scope="session"/>
	<c:set var="sucessoProdutoMesclado" value="" scope="session"/>
	<c:set var="sucessoQuantidadeProduto" value="" scope="session"/>
	<c:set var="sucessoTipoProduto" value="" scope="session"/>
	<c:set var="sucessoIdProduto" value="" scope="session"/>
	<c:set var="sucessoNomeProduto" value="" scope="session"/>
</c:if>