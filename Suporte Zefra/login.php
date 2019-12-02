<?php
	$local = "login";
	$tipo = "deslogado";
?>
<?php include "componentes/header.php"?>
<?php include "componentes/navbar.php"?>
	<div class="container">
		<div class="row">
			<div class="col-xs-6 col-xs-offset-3 col-sm-offset-0 col-sm-6">
				<img src="img/logo.png" class="img-responsive">
			</div>			
			<div class="col-xs-12 col-sm-6">
				<form method="POST" id="formLogin" action="meus_chamados.php">
					<div class="form-group">
						<label for="l_email">E-Mail:</label>
						<input id="l_email" name="l_email" class="form-control" type="email" placeholder="Digite seu endereço de e-mail">
					</div>				
					<div class="form-group">
						<label for="l_senha">Senha:</label>
						<input id="l_senha" name="l_senha" class="form-control" type="password" placeholder="Digite sua senha">
						Ainda não tem uma conta? <a href="registro.php">Registre-se</a><br>
					</div>
					<button type="submit" id="loginBtn" class="btn btn-primary">Logar</button>
				</form>
				<div class="row">
					<div class="col-xs-12">
						<hr>
						<a href="meus_chamados.php">Logar como Leandro Rocha</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<?php include "componentes/footer.php"?>