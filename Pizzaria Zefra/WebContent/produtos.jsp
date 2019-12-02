<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Variáveis da página -->
<c:set var="paginaTitulo" value="Produtos"></c:set>
<c:set var="paginaId" value="produtos"></c:set>
<c:set var="param.tipo" value="${fn:toLowerCase(requestScope.tipo)}"></c:set>
<!-- Título mudar de acordo com o GET. Tipo acima é igual ao GET -->

<!-- Variáveis da página -->
<%@include file="componente/topo.jsp"%>

<!--
<c:forEach items="${sessionScope.carrinho}" var="c">
	${c.value.quantidade}
	${c.value.produtoVariedade.titulo}
	${c.value.valor}
</c:forEach>
-->
		<%@include file="componente/addSucessoModelo.jsp"%>

		<div class="container mb-5">
			<div class="row">
				<c:if test="${param.tipo != 'pizza'}">
					<c:forEach items="${produtos}" var="produtoModelo">
						<%@include file="componente/pvModelo.jsp"%>			
					</c:forEach>
				</c:if>
			</div>
			<c:if test="${param.tipo == 'pizza'}">
				<c:forEach items="${produtos}" var="produtoModelo">
					<%@include file="componente/ppizzaModelo.jsp"%>			
				</c:forEach>
			</c:if>
		</div>
		
		<c:if test="${fn:length(produtos) == 0 }">
			<div class="container py-5">
				<div class="row">
					<c:set var="erro_modelo_titulo" value="Ops!"></c:set>
					<c:set var="erro_modelo_mensagem" value="Não encontramos produtos a venda com esta categoria. Sentimos muito pelo transtorno."></c:set>
					<%@include file="componente/erroModelo.jsp"%>
				</div>
			</div>
		</c:if>
		<%@include file="componente/modalModelo.jsp"%>
		<%@include file="componente/rodape.jsp"%>
		<script charset="utf-8" src="js/modal.js"></script>
		<script charset="utf-8" src="js/produto.js"></script>
		
		<c:if test="${sessionScope.carrinhoAddSucesso == true}">
			<c:set var="carrinhoAddSucesso" value="" scope="session"  />
			<script>
				criarModalSucesso("Sucesso!", "O produto foi adicionado ao seu carrinho. <a href='carrinho.html'>Clique aqui</a> para visualizar.");
			</script>
		</c:if>
		
	</body>
</html>