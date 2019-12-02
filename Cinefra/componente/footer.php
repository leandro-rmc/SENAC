		 <?php
			if(!isset($_SESSION["logado"]) || !$_SESSION["logado"]){
		 ?>
		 <div class="modal" id="modalLogin" role="dialog">
			<div class="modal-dialog">
			
			  <div class="modal-content modal-cinefra">
				<div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal">x</button>
				  <h4 class="modal-title">Logar</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="l_email">E-mail:</label>
							<input placeholder="Digite seu e-mail" type="email" class="form-control" id="l_email">
							<div class="caixa-erro-form caixa-erro-form-email"></div>
						</div>
						<div class="form-group">
							<label for="l_senha">Senha:</label>
							<input placeholder="Digite sua senha" type="password" class="form-control" id="l_senha">
							<div class="caixa-erro-form caixa-erro-form-senha"></div>
						</div>
						<div class="form-group">
							<button id="logar" type="button" class="btn btn-success">Logar</button>
							<button type="reset" class="btn btn-warning">Limpar</button>
						</div>
					</form>
				</div>
			  </div>
			  
			</div>
		  </div>
		  
		  <div class="modal" id="modalRegistro" role="dialog">
			<div class="modal-dialog">
			
			  <div class="modal-content modal-cinefra">
				<div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal">x</button>
				  <h4 class="modal-title">Registrar</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="r_email">E-mail:</label>
							<input type="email" placeholder="Digite seu e-mail" class="form-control" id="r_email">
							<label for="r_cemail">Confirmar e-mail:</label>
							<input type="email" placeholder="Digite seu e-mail novamente" class="form-control" id="r_cemail">
							<div class="caixa-erro-form caixa-erro-form-email"></div>
						</div>
						<div class="form-group">
							<label for="r_senha">Senha:</label>
							<input placeholder="Digite sua senha" type="password" class="form-control" id="r_senha">
							<label for="r_csenha">Confirmar senha:</label>
							<input placeholder="Digite sua senha novamente" type="password" class="form-control" id="r_csenha">
							<div class="caixa-erro-form caixa-erro-form-senha"></div>
						</div>
						<div class="form-group">
							<button id="registrar" type="button" class="btn btn-success">Registrar</button>
							<button type="reset" class="btn btn-warning">Limpar</button>
						</div>
					</form>
				</div>
			  </div>
			  
			</div>
		  </div>
		  
		  <div class="modal" id="modalRegistroSucesso" role="dialog">
			<div class="modal-dialog">
			
			 <div class="modal-content modal-cinefra">
				<div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal">x</button>
				  <h4 class="modal-title">Sucesso!</h4>
				</div>
				<div class="modal-body">
					Sua conta foi registrada com sucesso! Clique <a id="registroSucessoMsg" href="#">aqui</a> para logar.
				</div>
			  </div>
			  
			</div>
		  </div>
		  <?php
			}
		  ?>
		  
		  
		  
		  <footer>
			  <div class="container-fluid">
				<div class="row">
					<div class="col-md-4 col-footer">
						<div class="row">
							<div class="col-xs-12">
								<h3>Contato e Localização</h3>
							</div>
						</div>			
						<div class="row">
							<div class="col-xs-12 col-subtitulo">
								Tem perguntas? Não tem nosso endereço?
							</div>
						</div>
						<div class="row col-acao">
							<div class="col-xs-12">
								<a href="<?php echo $level ?>nos.php" class="btn btn-primary">Sobre nós</a>
							</div>
						</div>
					</div>
					
					<div class="col-md-4 col-footer">
						<div class="row">
							<div class="col-xs-12">
								<h3>Conecte-se conosco</h3>
							</div>
						</div>			
						<div class="row">
							<div class="col-xs-12 col-subtitulo">
								Siga nossas redes sociais
							</div>
						</div>
						<div class="row col-acao">
							<div class="col-xs-12">
								<div class="col-xs-4 col-sm-2">
									<a href="#"><i class="fab fa-youtube youtube"></i></a>
								</div>	
								<div class="col-xs-4 col-sm-2">
									<a href="#"><i class="fab fa-facebook facebook"></i></a>
								</div>	
								<div class="col-xs-4 col-sm-2">
									<a href="#"><i class="fab fa-twitter twitter"></i></a>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-4 col-footer">
						<div class="row">
							<div class="col-xs-12">
								<h3>Cinefra</h3>
							</div>
						</div>			
						<div class="row">
							<div class="col-xs-12 col-subtitulo">
								<i>Somos um cinema de alta qualidade localizado em Campo Grande, RJ. Com preços acessíveis, excelentes funcionários e infraestrutura, estamos aos poucos conseguindo um lugar merecido no mercado.</i>
							</div>
						</div>
					</div>
					
				</div>
				<div class="row footer-copyright">
					<div class="col-xs-12">
						Copyright <i class="far fa-copyright"></i> 2018 - Leandro Rocha
					</div>
				</div>
			  </div>
		  </footer>
		  
		  <script src="<?php echo $level ?>js/jquery-3.3.1.min.js"></script>
		  <script src="<?php echo $level ?>js/bootstrap.min.js"></script>
		  <script src="<?php echo $level ?>funcao/funcao_js/funcao_conta.js"></script>
	</body>
</html>