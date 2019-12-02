		<div class="container-fluid">
			<div class="row">
				<nav class="navbar navbar-inverse">
					<div class="navbar-header">
						<a href="index.php" class="navbar-brand">ZEFRA</a>
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#Menu">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<div class="navbar-collapse collapse" id="Menu">
						<ul class="nav navbar-nav">
							<li class=<?php if($tipo == "home") echo "active"?>><a href="index.php">Home</a></li>
							<li class=<?php if($tipo == "perfil") echo "active"?>><a href="#">Perfil</a></li>
							<li class=<?php if($tipo == "comunidades") echo "active"?>><a href="comunidades.php">Comunidades</a></li> 
							<li class=<?php if($tipo == "pessoas") echo "active"?>><a href="pessoas.php">Pessoas</a></li>
							<li class=<?php if($tipo == "mensagens") echo "active"?>><a href="mensagens.php">Mensagens <span class="nonbold notificacao-mensagem-nav">(1)</span></a></li>
							<li><a href="#" data-toggle="modal" data-target="#notificacoes"><i class="fa fa-bell notificacao" aria-hidden="true"></i><span class="label">3</span></a></li>												
							<li class="dropdown hidden-xs">
							  <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
							  <ul class="dropdown-menu pull-right">
								<li class=<?php if($tipo == "configuracoes") echo "active"?>><a href="#"><i class="fa fa-cog" aria-hidden="true"></i> Configurações</a></li>
								<li><a href="index.php"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
							  </ul>
							</li>
							<hr>
							<li class="hidden-lg hidden-md hidden-sm "<?php if($tipo == "configuracoes") echo "active"?>><a href="#"><i class="fa fa-cog" aria-hidden="true"></i> Configurações</a></li>
							<li class="hidden-lg hidden-md hidden-sm"><a href="index.php"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
						</ul>
					</div>
				</nav>
			</div>
			<div class="modal fade" id="notificacoes">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title">Notificações</h3>
						</div>
						<div class="modal-body modal-notificacao">
						
							<div class="row caixa-notificacao bg-notificacao-nova">
								<div class="col-xs-4 col-sm-2">
									<img src="img/akira_perfil.png" class="img-responsive img-rounded">
								</div>
								<div class="col-xs-8 col-sm-10">
									<div class="row">
										<a href="#">Akira Zaizen</a> comentou uma <a href="#">publicação</a> que você segue.
									</div>
									<div class="row .tempo">
										11 minutos atrás.
									</div>
								</div>
							</div>
							
							<div class="row caixa-notificacao bg-notificacao-nova">
								<div class="col-xs-4 col-sm-2">
									<img src="img/blueangel_perfil.png" class="img-responsive img-rounded">
								</div>
								<div class="col-xs-8 col-sm-10">
									<div class="row">
										<a href="#">Aoi Zaizen</a> comentou sua <a href="#">publicação</a>.
									</div>
									<div class="row .tempo">
										17 minutos atrás.
									</div>
								</div>
							</div>
							
							<div class="row caixa-notificacao bg-notificacao-nova">
								<div class="col-xs-4 col-sm-2">
									<img src="img/blueangel_perfil.png" class="img-responsive img-rounded">
								</div>
								<div class="col-xs-8 col-sm-10">
									<div class="row">
										<a href="#">Aoi Zaizen</a> curtiu sua <a href="#">publicação</a>.
									</div>
									<div class="row .tempo">
										19 minutos atrás.
									</div>
								</div>
							</div>
							
							
							<div class="row caixa-notificacao">
								<div class="col-xs-4 col-sm-2">
									<img src="img/yusaku_perfil.png" class="img-responsive img-rounded">
								</div>
								<div class="col-xs-8 col-sm-10">
									<div class="row">
										<a href="perfil_2.php">Yusaku Fujiki</a> comentou uma <a href="#">publicação</a> que você segue na comunidade <a href="comunidade_2.php">Yu-Gi-Oh! VRAINS</a>.
									</div>
									<div class="row .tempo">
										44 minutos atrás.
									</div>
								</div>
							</div>
							
							<div class="row caixa-notificacao">
								<div class="col-xs-4 col-sm-2">
									<img src="img/leandrorocha_perfil.jpg" class="img-responsive img-rounded">
								</div>
								<div class="col-xs-8 col-sm-10">
									<div class="row">
										<a href="#">Leandro Rocha Musser</a> te convidou para jogar <a href="https://www.duelingbook.com/">Dueling Book</a>.
									</div>
									<div class="row .tempo">
										2 horas atrás.
									</div>
								</div>
							</div>
							<div class="row caixa-notificacao">
								<div class="col-xs-4 col-sm-2">
									<img src="img/goonizuka_perfil.png" class="img-responsive img-rounded">
								</div>
								<div class="col-xs-8 col-sm-10">
									<div class="row">
										<a href="#">Go Onizuka</a> curtiu sua <a href="#">publicação</a>.
									</div>
									<div class="row .tempo">
										4 horas atrás.
									</div>
								</div>
							</div>
							<div class="row caixa-notificacao">
								<div class="col-xs-4 col-sm-2">
									<img src="img/goonizuka_perfil.png" class="img-responsive img-rounded">
								</div>
								<div class="col-xs-8 col-sm-10">
									<div class="row">
										<a href="#">Go Onizuka</a> comentou uma <a href="#">publicação</a> que você segue na comunidade <a href="comunidade_2.php">Yu-Gi-Oh! VRAINS</a>.
									</div>
									<div class="row .tempo">
										5 horas atrás.
									</div>
								</div>
							</div>
							<div class="row caixa-notificacao">
								<div class="col-xs-4 col-sm-2">
									<img src="img/hitoshura_perfil.jpg" class="img-responsive img-rounded">
								</div>
								<div class="col-xs-8 col-sm-10">
									<div class="row">
										<a href="#">Hitoshura</a> respondeu seu <a href="#">comentário</a> na comunidade <a href="comunidade_2.php">Desenvolvimento Android</a>.
									</div>
									<div class="row .tempo">
										6 horas atrás.
									</div>
								</div>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>