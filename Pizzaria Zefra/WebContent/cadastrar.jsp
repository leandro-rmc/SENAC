<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Variáveis da página -->
<c:set var="paginaTitulo" value="Cadastrar"></c:set>
<c:set var="paginaId" value="cadastrar"></c:set>
<!-- Variáveis da página -->
<jsp:useBean id="data" class="java.util.Date" />
<c:set var="anoAtual" value=""></c:set>

<%@include file="componente/topo.jsp"%>
		<div class="container-fluid my-4">
			<div class="row">
				<div class="col-12 col-md-8 offset-0 offset-md-2">
					<div class="card my-4 card-shadow bg-dark text-light">
						<div class="card-header text-center">
							<h4>Crie sua conta</h4>
						</div>
						<div class="row">
							<div class="card-body col-12 col-sm-10 offset-sm-1">
								<div id="cadastro-conta">
									<form onsubmit="validarCadastro(this); return false" method="POST" action="cadastrar.html">
										<input type="hidden" name="acao" value="cadastrar">
										<div class="form-group">
											<label for="nome">Nome completo</label>
											<input data-campo="nome" class="form-control ${requestScope.isInvalidNome}" value="${nome}" id="nome" name="nome" type="text" min="5" placeholder="Min. 5 caracteres">
											<div data-campo="nome" class="invalid-feedback">
												${requestScope.erroNome}
											</div>
										</div>
										
										<div class="form-group">
											<label for="email">Email</label>
											<input data-campo="email" class="form-control ${requestScope.isInvalidEmail}" id="email" value="${email}" type="email" name="email">
											<div data-campo="email" class="invalid-feedback">
												${requestScope.erroEmail}
											</div>
										</div>
										<div class="form-group">										
											<div class="form-row">
												<div class="col-12 mb-3 mb-sm-0 col-sm-6">
													<label for="senha">Senha</label>
													<input data-campo="senha" class="form-control ${requestScope.isInvalidSenha}" id="senha" value="${senha}" type="password" name="senha">
													<div data-campo="senha" class="invalid-feedback">
														${requestScope.erroSenha}
													</div>
												</div>
												<div class="col-12 col-sm-6">
													<label for="confirmarSenha">Confirmar senha</label>
													<input data-campo="confirmarSenha" class="form-control ${requestScope.isInvalidConfirmarSenha}" id="confirmarSenha" value="${confirmarSenha}" name="confirmarSenha" type="password">
													<div data-campo="confirmarSenha" class="invalid-feedback">
														${requestScope.erroConfirmarSenha}
													</div>
												</div>
											</div>			
										</div>	
										
										<div class="form-group my-4">	
											<label for="diaNascimento">Data de nascimento <span class="text-muted">(opcional)</span></label>			
											<div class="form-row">
												<div class="mb-3 mb-xl-0 col-xl-4">
													<label for="diaNascimento">Dia</label>
													<input data-campo="diaNascimento" class="form-control ${requestScope.isInvalidDiaNascimento}" max="31" id="diaNascimento" value="${diaNascimento}" type="number" name="diaNascimento" placeholder="Só números">
													<div data-campo="diaNascimento" class="invalid-feedback">
														${requestScope.erroDiaNascimento}
													</div>
												</div>
												<div class="mb-3 mb-xl-0 col-xl-4">
													<label for="mesNascimento">Mês</label>
													<input data-campo="mesNascimento" class="form-control ${requestScope.isInvalidMesNascimento}" max="12" id="mesNascimento" value="${mesNascimento}" type="number" name="mesNascimento" placeholder="Só números">
													<div data-campo="mesNascimento" class="invalid-feedback">
														${requestScope.erroMesNascimento}
													</div>
												</div>
												<div class=" mb-3 mb-xl-0 col-xl-4">
													<label for="anoNascimento">Ano</label>
													<input data-campo="anoNascimento" class="form-control ${requestScope.isInvalidAnoNascimento}" max="<fmt:formatDate value='${data}' pattern='yyyy' />" id="anoNascimento" value="${anoNascimento}" type="number" name="anoNascimento" placeholder="Só números">
													<div data-campo="anoNascimento" class="invalid-feedback">
														${requestScope.erroAnoNascimento}
													</div>
												</div>
											</div>		
										</div>
																			
										<div class="form-group">										
											<label for="telefone">Telefone com DDD<span class="text-muted"> (opcional)</span></label>
											<input data-campo="telefone" class="form-control ${requestScope.isInvalidTelefone}" id="telefone" value="${telefone}" maxlength="14" name="telefone" type="tel" placeholder="Só números">
											<div data-campo="telefone" class="invalid-feedback">
												${requestScope.erroTelefone}
											</div>
										</div>
										<div class="form-group">
											<label for="celular">Celular com DDD<span class="text-muted"> (opcional)</span></label>
											<input data-campo="celular" class="form-control ${requestScope.isInvalidCelular}" id="celular" value="${celular}" maxlength="14" name="celular" type="tel" placeholder="Só números">
											<div data-campo="celular" class="invalid-feedback">
												${requestScope.erroCelular}
											</div>
										</div>
										<hr>
										
										<div class="form-group">				
											<label for="cep">CEP <span class="text-muted">(opcional)</span></label>
											<input data-campo="cep" class="form-control ${requestScope.isInvalidCep}" id="cep" value="${cep}" type="text" name="cep" placeholder="Só números">
											<div data-campo="cep" class="invalid-feedback">
												${requestScope.erroCep}
											</div>	
										</div>	
										
										<div class="form-group">
											<label for="cidade">Cidade <span class="text-muted">(opcional)</span></label>
											<input data-campo="cidade" class="form-control ${requestScope.isInvalidCidade}" id="cidade" value="${cidade}" type="text" name="cidade">
											<div data-campo="cidade" class="invalid-feedback">
												${requestScope.erroCidade}
											</div>
										</div>	
										
										
										<div class="form-group">
											<label for="bairro">Bairro <span class="text-muted">(opcional)</span></label>
											<input data-campo="bairro" class="form-control ${requestScope.isInvalidBairro}" id="bairro" value="${bairro}" type="text" name="bairro">
											<div data-campo="bairro" class="invalid-feedback">
												${requestScope.erroBairro}
											</div>
										</div>	
										
										<div class="form-group">				
											<div class="form-row">
												<div class="mb-3 mb-sm-0 col-sm-8 col-md-9">
													<label for="logradouro">Logradouro</label>
													<input data-campo="logradouro" class="form-control ${requestScope.isInvalidLogradouro}" id="logradouro" value="${logradouro}" type="text" name="logradouro">
													<div data-campo="logradouro" class="invalid-feedback">
														${requestScope.erroLogradouro}
													</div>
												</div>
												<div class="col-sm-4 col-md-3">
													<label for="numero">Número</label>
													<input data-campo="numero" class="form-control ${requestScope.isInvalidNumero}" id="numero" value="${numero}" type="number" name="numero">
													<div data-campo="numero" class="invalid-feedback">
														${requestScope.erroNumero}
													</div>
												</div>
											</div>		
										</div>	
										
										<div class="form-group">
											<label for="complemento">Complemento <span class="text-muted">(opcional)</span></label>
											<input data-campo="complemento" class="form-control ${requestScope.isInvalidComplemento}" id="complemento" value="${complemento}" type="text" name="complemento">
											<div data-campo="complemento" class="invalid-feedback">
												${requestScope.erroComplemento}
											</div>
										</div>
			
										<div class="form-group">
											<div class="form-row">
												<div class="col-sm-6 mx-auto mt-2">
													<button class="btn btn-block btn-pizza btn-lg">Criar</button>
												</div>
											</div>
										</div>
									</form>
									<a href="logar.jsp" class="text-light mt-3 btn-ghost-laranjaescuro btn"><i class="fas fa-sign-in-alt"></i> Já tenho uma conta</a>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="componente/rodape.jsp"%>
		<script charset="utf-8" src="js/validacao-cadastro.js"></script>
		<%@include file="componente/modalModelo.jsp"%>
		<script charset="utf-8" src="js/modal.js"></script>
		
		<c:if test="${sucesso == true}">
			<%@include file="componente/modalModelo.jsp"%>
			<script src="js/modal.js"></script>
			<script>
				criarModalSucesso("Sucesso!", "Sua conta foi cadastrada com sucesso! Você já pode efetuar o login. <a href='logar.jsp'>Clique aqui</a> para logar.");
			</script>
		</c:if>
		<c:if test="${erro == true}">
			<%@include file="componente/modalModelo.jsp"%>
			<script src="js/modal.js"></script>
			<script>
				criarModalErro("Erro!","Um ou mais campos inválidos. Nós os marcamos para que você possa corrigir.");
			</script>
		</c:if>
		<c:set var="sucesso" value="false"/>
		<c:set var="erro" value="false"/>
	</body>
</html>