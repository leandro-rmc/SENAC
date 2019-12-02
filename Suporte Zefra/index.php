<?php
	$tipo = "deslogado";
?>
<?php include "componentes/header.php"?>
<?php include "componentes/navbar.php"?>
<div class="container">
	<div class="row text-center">
		<h3>Bem-vindo à Zefra</h3>
	</div>
	<div class="row text-center">
		<p>Precisa de ajuda com algo relacionado a informática ou deseja ajudar quem precisa? Aqui é o seu lugar.</p>
	</div>
	<div class="row text-center">
		<p>Ainda não tem uma conta? <a href="registro.php">Registre-se</a></p>
		<p>Já tem uma conta? <a href="login.php">Efetue login</a></p>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 text-center caixa-stats">
			<div class="row">
				<h1 id="qtdPessoasAtendidas">197</h1>
			</div>			
			<div class="row">
				Pessoas sendo atendidas!
			</div>
		</div>
		<div class="col-xs-12 col-sm-6 text-center caixa-stats">
			<div class="row">
				<h1 id="qtdCasosSolucionados">27842</h1>
			</div>			
			<div class="row">
				Casos solucionados desde 15 de Dezembro de 2017!
			</div>
		</div>
	</div>
	<div id="caroulsel" class="carousel slide" data-ride="carousel">
	  <ol class="carousel-indicators carousel-bg">
		<li data-target="#caroulsel" data-slide-to="0" class="active"></li>
		<li data-target="#caroulsel" data-slide-to="1"></li>
		<li data-target="#caroulsel" data-slide-to="2"></li>
	  </ol>
	  <div class="carousel-inner">
		<div class="item active">
		  <img src="img/c1.png" alt="Screenshot 1">
		</div>
		<div class="item">
		  <img src="img/c2.png" alt="Screenshot 2">
		</div>
		<div class="item">
		  <img src="img/c3.png" alt="Screenshot 3">
		</div>
	  </div>
	  <a class="left carousel-control" href="#caroulsel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left"></span>
	  </a>
	  <a class="right carousel-control" href="#caroulsel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right"></span>
	  </a>
	</div>
</div>
<?php include "componentes/footer.php"?>