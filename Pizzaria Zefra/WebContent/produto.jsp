<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Variáveis da página -->
<c:set var="paginaTitulo" value="Produto"></c:set>
<c:set var="paginaId" value="produto"></c:set>
<c:set var="id" value="${param.id}"></c:set>
<c:set var="produtoModelo" value="${produto}"></c:set>
<!-- Título mudar de acordo com o GET -->

<!-- Variáveis da página -->
<%@include file="componente/topo.jsp"%>
<%@include file="componente/addSucessoModelo.jsp"%>

			<c:if test="${!empty produto}">
				<c:if test="${produto.tipo != 'pizza'}">
					<c:set var="cardClasses" value="mx-auto"></c:set>
					<div class="container mb-5">
						<%@include file="componente/pvModelo.jsp"%>	
					</div>
				</c:if>
			</c:if>
			
			<c:if test="${!empty produto}">
				<c:if test="${produto.tipo == 'pizza'}">
					<div class="container mb-5">
						<%@include file="componente/ppizzaModelo.jsp"%>	
					</div>
				</c:if>
			</c:if>
			
			<c:if test="${empty produto}">
				<div class="container py-5">
					<div class="py-5">
						<div class="row pt-5">
							<c:set var="erro_modelo_titulo" value="Ops!"></c:set>
							<c:set var="erro_modelo_mensagem" value="Produto não encontrado no nosso banco de dados."></c:set>
							<%@include file="componente/erroModelo.jsp"%>
						</div>
					</div>
				</div>
			</c:if>
			
			<div class="container mb-4">
				<section id="avaliacoes">
					
					<div class="d-flex flex-column-reverse mt-4">
						<c:forEach items="${avaliacoes}" var="a">
							<div class="col-12 offset-0 col-md-10 offset-md-1 ">
								<div class="card card-shadow mb-4">
									<c:set var="classevazio" value=""></c:set>
									<c:set var="classevazioborda" value=""></c:set>
									<c:if test="${a.comentario == ''}">
										<c:set var="classevazio" value="d-none border-0"></c:set>
										<c:set var="classevazioborda" value="border-0"></c:set>
									</c:if>
									<div class="card-header ${classevazioborda}">
										<div>
											<span class="d-block cards-title mr-auto font-weight-bold">
											<c:choose>
												<c:when test="${sessionScope.usuarioId == a.usuario.id}">
													<a href="perfil.html">
														<c:out value="${a.usuario.nome}"></c:out>
													</a>
												</c:when>
												<c:otherwise><c:out value="${a.usuario.nome}"></c:out></c:otherwise>
											</c:choose>
											</span>
											<span class="d-block text-muted font-monospace">
												${a.hora} - <fmt:formatDate pattern = 'dd-MM-yyyy' value = '${a.data}' />
											</span>
			
											<div class="mt-2 d-inline-block px-4 rounded text-center bg-light border border-secondary z-index-1 aval-container">
												<span class="text-center font-weight-bold"><i class="fas fa-heart"></i> ${a.nota}</span>
												<div class="bg-success aval-nota" style="width:${a.nota}0%;"></div>
											</div>
											
										</div>
									</div>
									<div class="card-body text-justify ${classevazio}">
										<c:if test="${a.comentario == ''}">
										
											<span class="font-monospace text-muted">Usuário não escreveu um comentário.</span>
										</c:if>
										<c:out value="${a.comentario}"></c:out>
									</div>
									<c:if test="${sessionScope.usuarioId == a.usuario.id}">
										<div class="card-footer mt-4">
											<form onsubmit="criarModalConfirmacao('Confirmação','Deseja realmente remover sua avaliação?',this,'ACAO_NEGATIVA'); return false" action="removeravaliacao.html" method="POST" class="float-right">
												<input type=hidden name="idAvaliacao" value="${a.id}">
												<button class="btn btn-danger mt-3"><i class="fa fa-trash" aria-hidden="true"></i></button>
											</form>
										</div>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				
			</section>
		</div>
		
		<%@include file="componente/rodape.jsp"%>
		<%@include file="componente/modalModelo.jsp"%>
		<script charset="utf-8" src="js/modal.js"></script>
		<script charset="utf-8" src="js/produto.js"></script>
		
		
		<c:if test="${sessionScope.carrinhoAddSucesso == true}">
			<c:set var="carrinhoAddSucesso" value="" scope="session"  />
			<script>
				//criarModalSucesso("Sucesso!", "O produto foi adicionado ao seu carrinho. <a href='carrinho.html'>Clique aqui</a> para visualizar.");
			</script>
		</c:if>
		
	</body>
</html>