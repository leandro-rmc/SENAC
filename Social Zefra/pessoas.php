<?php $tipo = "pessoas"?> <!--Para a classe active da navbar functionar direito-->
<?php include "componentes/header.php"?>
<?php include "componentes/nav.php"?>
		<div class="container">
			<div class="row form-group">	
				<ul class="nav nav-pills">
					<li class="active"><a data-toggle="pill" href="#amigos">Amigos</a></li>
					<li><a data-toggle="pill" href="#encontrar-pessoas">Encontrar pessoas</a></li>
				</ul>
			</div>
			<div class="tab-content">
				<div id="amigos" class="tab-pane fade in active">
					<div class="row">
						<div class="input-group form-group">
							<input type="text" class="form-control" placeholder="Nome do amigo">
							<div class="input-group-btn">
							  <button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							  </button>
							</div>
						</div>
					</div>
					<div class="row caixa">
						<div class="col-sm-3 col-xs-12">
							<img class="img-rounded img-responsive img-responsive-center" src="img/yusaku_perfil.png">
						</div>
						<div class="col-sm-9 col-xs-12">
							<div class="row">
								<h3><a href="perfil_2.php">Yusaku Fujiki</a></h3>
							</div>
							<div class="row online">
								Online agora
							</div>
							<div class="row">
								<a href="#">Enviar mensagem</a>
							</div>
							<div class="row">
								<a href="#">Excluir dos amigos</a>
							</div>
						</div>
					</div>
					<div class="row caixa">
						<div class="col-sm-3 col-xs-12">
							<img class="img-rounded img-responsive img-responsive-center" src="img/leandrorocha_perfil.jpg">
						</div>
						<div class="col-sm-9 col-xs-12">
							<div class="row">
								<h3><a href="#">Leandro Rocha Musser</a></h3>
							</div>
							<div class="row online">
								Online agora
							</div>
							<div class="row">
								<a href="#">Enviar mensagem</a>
							</div>
							<div class="row">
								<a href="#">Excluir dos amigos</a>
							</div>
						</div>
					</div>
					<div class="row caixa">
						<div class="col-sm-3 col-xs-12">
							<img class="img-rounded img-responsive img-responsive-center" src="img/akira_perfil.png">
						</div>
						<div class="col-sm-9 col-xs-12">
							<div class="row">
								<h3><a href="#">Akira Zaizen</a></h3>
							</div>
							<div class="row online">
								Online agora
							</div>
							<div class="row">
								<a href="#">Enviar mensagem</a>
							</div>
							<div class="row">
								<a href="#">Excluir dos amigos</a>
							</div>
						</div>
					</div>
					<div class="row caixa">
						<div class="col-sm-3 col-xs-12">
							<img class="img-rounded img-responsive img-responsive-center" src="img/blueangel_perfil.png">
						</div>
						<div class="col-sm-9 col-xs-12">
							<div class="row">
								<h3><a href="#">Aoi Zaizen</a></h3>
							</div>
							<div class="row">
								Online há 26 minutos
							</div>
							<div class="row">
								<a href="#">Enviar mensagem</a>
							</div>
							<div class="row">
								<a href="#">Excluir dos amigos</a>
							</div>
						</div>
					</div>
					<div class="row caixa">
						<div class="col-sm-3 col-xs-12">
							<img class="img-rounded img-responsive img-responsive-center" src="img/goonizuka_perfil.png">
						</div>
						<div class="col-sm-9 col-xs-12">
							<div class="row">
								<h3><a href="#">Go Onizuka</a></h3>
							</div>
							<div class="row">
								Online há 6 dias
							</div>
							<div class="row">
								<a href="#">Enviar mensagem</a>
							</div>
							<div class="row">
								<a href="#">Excluir dos amigos</a>
							</div>
						</div>
					</div>
				</div>
				<div id="encontrar-pessoas" class="tab-pane fade">
				  	<div class="row">
						<div class="input-group form-group">
							<input type="text" class="form-control" placeholder="Nome da pessoa">
							<div class="input-group-btn">
							  <button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							  </button>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
<?php include "componentes/footer.php"?>