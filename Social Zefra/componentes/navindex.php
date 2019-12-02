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
							<li class=<?php if($tipo == "registrar") echo "active"?>><a href="registrar.php"><i class="fa fa-circle" aria-hidden="true"></i> Registrar</a></li>
							<li class=<?php if($tipo == "login") echo "active"?>><a href="#" data-toggle="modal" data-target="#logar"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a></li> <!--Redireciona para pessoas.php só para demonstração do site-->
						</ul>
					</div>
				</nav>
			</div>
			<div class="modal fade" id="logar">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title">Login</h3>
						</div>
						<div class="modal-body">
							<form role="form">
								<div class="form-group">
									<input type="email" class="form-control" placeholder="Digite seu e-mail">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" placeholder="Digite sua senha">
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary btn-block">Entrar</button>
							<a href="pessoas.php" class="btn btn-primary btn-block">Acessar demonstração do site</a>
						</div>
					</div>
				</div>
			</div>
		</div>