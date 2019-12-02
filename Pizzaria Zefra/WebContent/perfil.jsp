<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Variáveis da página -->
<c:set var="paginaTitulo" value="Meu perfil"></c:set>
<c:set var="paginaId" value="perfil"></c:set>
<!-- Variáveis da página -->

<c:set var="estilo" value="text-light bg-dark"></c:set>
<c:if test="${param.acao != 'editar'}">
	<c:set var="readonly" value="readonly"></c:set>
	<c:set var="estilo" value="text-dark"></c:set>
</c:if>

<%@include file="componente/topo.jsp"%>
		<div class="container-fluid my-4">
			<div class="row">
				<div class="col-12 col-md-8 offset-0 offset-md-2">
					<div class="card my-4 card-shadow ${estilo}">
						<div class="card-header text-center">
							<c:if test="${param.acao != 'editar'}">
								<h4>Meus dados</h4>
							</c:if>
							<c:if test="${param.acao == 'editar'}">
								<h4>Edite seus dados</h4>
							</c:if>
						</div>
						<div class="row">
							<div class="card-body col-12 col-sm-10 offset-sm-1">
								<div id="cadastro-conta">
<!-- Alterar formulário -->			<form onsubmit="validarCadastro(this); return false" method="POST" action="perfil.html">
										<c:if test="${param.acao == 'editar'}">
											<input type="hidden" name="acao" value="salvarEdicao">
										</c:if>
										<div class="form-group">
											<label for="nome">Nome completo</label>
											<input ${readonly} data-campo="nome" class="${requestScope.isInvalidNome} form-control" value="${nome}" id="nome" name="nome" type="text">
											<c:if test="${param.acao == 'editar'}">
												<div data-campo="nome" class="invalid-feedback">
													${requestScope.erroNome}
												</div>
											</c:if>
										</div>	
										
										<c:if test="${param.acao != 'editar'}">
											<div class="form-group">
												<label for="dataNascimento">Data de nascimento <span class="text-muted"></span></label>
												<input ${readonly} class=" form-control" id="dataNascimento" value="<fmt:formatDate pattern = 'dd-MM-yyyy' value = '${dataNascimento}' />" name="dataNascimento" type="text">
											</div>
										</c:if>
										
										<c:if test="${param.acao == 'editar'}">
											<div class="form-group my-4">	
												<label for="diaNascimento">Data de nascimento <span class="text-muted">(opcional)</span></label>			
												<div class="form-row">
													<div class="mb-3 mb-xl-0 col-xl-4">
														<label for="diaNascimento">Dia</label>
														<input data-campo="diaNascimento" class="form-control ${requestScope.isInvalidDiaNascimento}" max="31" id="diaNascimento" value="${diaNascimento}" type="number" name="diaNascimento" placeholder="Só números">
														<c:if test="${param.acao == 'editar'}">
															<div data-campo="diaNascimento" class="invalid-feedback">
																${requestScope.erroDiaNascimento}
															</div>
														</c:if>
													</div>
													<div class="mb-3 mb-xl-0 col-xl-4">
														<label for="mesNascimento">Mês</label>
														<input data-campo="mesNascimento" class="form-control ${requestScope.isInvalidMesNascimento}" max="12" id="mesNascimento" value="${mesNascimento}" type="number" name="mesNascimento" placeholder="Só números">
														<c:if test="${param.acao == 'editar'}">
															<div data-campo="mesNascimento" class="invalid-feedback">
																${requestScope.erroMesNascimento}
															</div>
														</c:if>
													</div>
													<div class=" mb-3 mb-xl-0 col-xl-4">
														<label for="anoNascimento">Ano</label>
														<input data-campo="anoNascimento" class="form-control ${requestScope.isInvalidAnoNascimento}" max="<fmt:formatDate value='${data}' pattern='yyyy' />" id="anoNascimento" value="${anoNascimento}" type="number" name="anoNascimento" placeholder="Só números">
														<c:if test="${param.acao == 'editar'}">
															<div data-campo="anoNascimento" class="invalid-feedback">
																${requestScope.erroAnoNascimento}
															</div>
														</c:if>
													</div>
												</div>		
											</div>
										</c:if>
																		
										<div class="form-group">										
											<div class="form-row">
												<div class="col-12 mb-3 mb-sm-0 col-sm-6">
													<label for="telefone">Telefone <span class="text-muted"></span></label>
													<input data-campo="telefone" ${readonly} class="${requestScope.isInvalidTelefone} form-control" id="telefone" value="${telefone}" name="telefone" type="tel" maxlength="14" >
													<c:if test="${param.acao == 'editar'}">
														<div data-campo="telefone" class="invalid-feedback">
															${requestScope.erroTelefone}
														</div>
													</c:if>
												</div>
												<div class="col-12 col-sm-6">
													<label for="celular">Celular <span class="text-muted"></span></label>
													<input data-campo="celular" ${readonly} class="${requestScope.isInvalidCelular} form-control" id="celular" value="${celular}" name="celular" type="tel" maxlength="14" >
													<c:if test="${param.acao == 'editar'}">
														<div data-campo="celular" class="invalid-feedback">
															${requestScope.erroCelular}
														</div>
													</c:if>
												</div>
											</div>			
										</div>
																				
										<div class="form-group">
											<label for="email">Email</label>
											<input data-campo="email" ${readonly} class="${requestScope.isInvalidEmail} form-control" id="email" value="${email}" type="email" name="email">
											<c:if test="${param.acao == 'editar'}">
												<div data-campo="email" class="invalid-feedback">
													${requestScope.erroEmail}
												</div>
											</c:if>
										</div>
										<hr>
										
										<div class="form-group">				
											<label for="cep">CEP <span class="text-muted"></span></label>
											<input data-campo="cep" ${readonly} class="${requestScope.isInvalidCep} form-control" id="cep" value="${cep}" type="text" name="cep">
											<c:if test="${param.acao == 'editar'}">
												<div data-campo="cep" class="invalid-feedback">
													${requestScope.erroCep}
												</div>
											</c:if>
										</div>
										
										<div class="form-group">
											<label for="cidade">Cidade <span class="text-muted"></span></label>
											<input data-campo="cidade" ${readonly} class="${requestScope.isInvalidCidade} form-control" id="cidade" value="${cidade}" type="text" name="cidade">
											<c:if test="${param.acao == 'editar'}">
												<div data-campo="cidade" class="invalid-feedback">
													${requestScope.erroCidade}
												</div>
											</c:if>
										</div>	
										
										
										<div class="form-group">
											<label for="bairro">Bairro <span class="text-muted"></span></label>
											<input data-campo="bairro" ${readonly} class="${requestScope.isInvalidBairro} form-control" id="bairro" value="${bairro}" type="text" name="bairro">
											<c:if test="${param.acao == 'editar'}">
												<div data-campo="bairro" class="invalid-feedback">
													${requestScope.erroBairro}
												</div>
											</c:if>
										</div>	
										
										<div class="form-group">				
											<div class="form-row">
												<div class="mb-3 mb-sm-0 col-sm-8 col-md-9">
													<label for="logradouro">Logradouro</label>
													<input data-campo="logradouro" ${readonly} class="${requestScope.isInvalidLogradouro} form-control" id="logradouro" value="${logradouro}" type="text" name="logradouro">
													<c:if test="${param.acao == 'editar'}">
														<div data-campo="logradouro" class="invalid-feedback">
															${requestScope.erroLogradouro}
														</div>
													</c:if>
												</div>
												<div class="col-sm-4 col-md-3">
													<label for="numero">Número</label>
													<input data-campo="numero" ${readonly} class="${requestScope.isInvalidNumero} form-control" id="numero" value="${numero}" type="number" name="numero">
													<c:if test="${param.acao == 'editar'}">
														<div data-campo="numero" class="invalid-feedback">
															${requestScope.erroNumero}
														</div>
													</c:if>
												</div>
											</div>		
										</div>	
										
										<div class="form-group">
											<label for="complemento">Complemento <span class="text-muted"></span></label>
											<input data-campo="complemento" ${readonly} class="${requestScope.isInvalidComplemento} form-control" id="complemento" value="${complemento}" type="text" name="complemento">
											<c:if test="${param.acao == 'editar'}">
												<div data-campo="complemento" class="invalid-feedback">
													${requestScope.erroComplemento}
												</div>
											</c:if>
										</div>
			
										<div class="form-group">
											<c:if test="${param.acao != 'editar'}">	
												<a href="perfil.html?acao=editar">
													<button type="button" class="btn btn-pizza btn-lg">Editar</button>
												</a>
											</c:if>
											<c:if test="${param.acao == 'editar'}">
												<button class="btn btn-pizza btn-lg">Salvar</button>
											</c:if>
										</div>
									</form>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="componente/rodape.jsp"%>
		<c:if test="${param.acao == 'editar'}">
			<script charset="utf-8" src="js/validacao-editarPerfil.js"></script>
			<%@include file="componente/modalModelo.jsp"%>
			<script charset="utf-8" src="js/modal.js"></script>
		</c:if>
	</body>
</html>