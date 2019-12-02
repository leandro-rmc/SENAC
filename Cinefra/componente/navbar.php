<nav class="navbar navbar-inverse navbar-cinefra navbar-static-top">
  <div class="container-fluid">
	<div class="navbar-header">
	  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>                        
	  </button>
	  <a class="navbar-brand" href="#"><img src="<?php echo $level ?>img/logo.png"/></a>
	</div>
	<div class="collapse navbar-collapse" id="navbar">
	  <ul class="nav navbar-nav">
		<li class="<?php if($nome == 'inicio') echo 'active'?>"><a href="<?php echo $level ?>index.php"><i class="fas fa-home"></i> Início</a></li>
		<li class="<?php if($nome == 'filmes') echo 'active'?>"><a href="<?php echo $level ?>filmes.php"><i class="fas fa-film"></i> Filmes</a></li>
		<li class="<?php if($nome == 'programacao') echo 'active'?>"><a href="<?php echo $level ?>programacao.php"><i class="fas fa-list-alt"></i> Programação</a></li>
		<li class="<?php if($nome == 'valores') echo 'active'?>"><a href="<?php echo $level ?>valores.php"><i class="fas fa-dollar-sign"></i> Preços e Promoções</a></li>
		<li class="<?php if($nome == 'nos') echo 'active'?>"><a href="<?php echo $level ?>nos.php"><i class="fas fa-info-circle"></i> Nós</a></li>
	  </ul>
	  <?php
		if(!isset($_SESSION["logado"]) || !$_SESSION["logado"]){
	  ?>
	  <ul class="nav navbar-nav navbar-right">
		<li><a data-toggle="modal" data-target="#modalRegistro" href="#"><i class="fas fa-user"></i> Registrar</a></li>
		<li><a data-toggle="modal" data-target="#modalLogin" href="#"><i class="fas fa-sign-in-alt"></i> Logar</a></li>
	  </ul>
	  <?php
		}
		else{
	  ?>
	  <ul class="nav navbar-nav navbar-right">
	     <li><a id="deslogar" href="#"><i class="fas fa-sign-out-alt"></i> Deslogar</a></li>
	  </ul>
	  <?php
		}
	  ?>
	</div>
  </div>
</nav>