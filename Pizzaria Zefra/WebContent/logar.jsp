<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Variáveis da página -->
<c:set var="paginaTitulo" value="Logar"></c:set>
<c:set var="paginaId" value="logar"></c:set>
<!-- Variáveis da página -->

<%@include file="componente/topo.jsp"%>

		<div class="container-fluid my-4">
			<div class="row">
				<div class="col-12 col-md-8 offset-0 offset-md-2">
					<div class="card my-4 card-shadow bg-dark text-light">
						<div class="card-header text-center">
							<h4>Acesse sua conta</h4>
						</div>
						<div class="row">
							<div class="card-body col-12 col-sm-8 offset-sm-2">
								<div id="login-conta">
									<form onsubmit="validarLogin(this); return false" method="POST" action="logar.html">
										<input type="hidden" name="acao" value="logar">										
										<div class="form-group">
										
											<label for="email">Email</label>
											
											<c:if test="${emailNovaConta == null}">
												<c:if test="${email == null}">
													<c:set var="autofocusemail" value="autofocus"></c:set>
												</c:if>
											</c:if>
											
											<c:if test="${emailNovaConta != null}">
												<c:set var="autofocussenha" value="autofocus"></c:set>
											</c:if>
											
											<c:if test="${email != null}">
												<c:set var="autofocussenha" value="autofocus"></c:set>
											</c:if>
											
											<input ${autofocusemail} data-campo="email" class="teste form-control ${requestScope.isInvalidEmail}" id="email" value="${emailNovaConta}${email}" name="email" type="email">
											<div data-campo="email" class="invalid-feedback">
												${requestScope.erroEmail}
											</div>
										</div>										
										<div class="form-group">
											<label data-campo="senha" class="text-center" for="senha">Senha</label>
											<input ${autofocussenha} data-campo="senha" class="form-control ${requestScope.isInvalidSenha}" id="senha" name="senha" type="password">
											<div data-campo="senha" class="invalid-feedback">
												${requestScope.erroSenha}
											</div>
										</div>									
										<div class="form-group">
											<div class="form-row">
												<div class="col-sm-6 mx-auto mt-2">
													<button class="btn btn-block btn-pizza btn-lg">Acessar</button>
												</div>
											</div>
										</div>
									</form>
									<a href="cadastrar.jsp" class="text-light btn mt-3 btn-ghost-laranjaescuro"><i class="fas fa-user-plus"></i> Não tenho uma conta
									</a>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="componente/rodape.jsp"%>
		<script charset="utf-8" src="js/validacao-login.js"></script>
	</body>
</html>