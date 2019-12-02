<?php
	$pagina_titulo = "Cinefra - Programação";
	$nome = "programacao";
	$level = "";
?>
	<?php include $level."componente/header.php"; ?>
	<?php include $level."componente/navbar.php"; ?>
	<?php include $level."funcao/funcao_php/funcao_imagem.php"; ?>
	
	<div class="container-fluid">
		<div class="pagina-filme-salas">
			<div class="row pagina-filme-sala">
				<div class="hidden-xs col-sm-2 col-lg-1">
					<a href="<?php echo $level."filme.php?id=4" ?>"><img class="img-responsive img-rounded" src="<?php echo glob($level."img/poster/4.*")[0] ?>"/></a>
				</div>
				<div class="col-xs-12 col-sm-10 col-lg-11">
					<div class="col-xs-12 pagina-filme-sala-titulo">
						<a href="<?php echo $level."filme.php?id=4" ?>">Vingadores: Guerra Infinita</a>
					</div>	
					<div class="col-xs-12 pagina-filme-sala-local">
						SALA 01 - 14:00
					</div>					
					<div class="col-xs-12 pagina-filme-sala-vagas pagina-filme-sala-esgotado">
						ESGOTADO
					</div>
					<div class="col-xs-12 pagina-filme-variavel">
						<span>2D</span>
						<span>DUB</span>
					</div>
				</div>
			</div>				
			<div class="row pagina-filme-sala">
				<div class="hidden-xs col-sm-2 col-lg-1">
					<a href="<?php echo $level."filme.php?id=4" ?>"><img class="img-responsive img-rounded" src="<?php echo glob($level."img/poster/4.*")[0] ?>"/></a>
				</div>
				<div class="col-xs-12 col-sm-10 col-lg-11">
					<div class="col-xs-12 pagina-filme-sala-titulo">
						<a href="<?php echo $level."filme.php?id=4" ?>">Vingadores: Guerra Infinita</a>
					</div>
					<div class="col-xs-12 pagina-filme-sala-local">
						SALA 01 - 17:00
					</div>		
					<div class="col-xs-12 btn-comprar">
						<a href="#"><i class="fas fa-shopping-cart"></i> Comprar ingresso</a>
					</div>						
					<div class="col-xs-12 pagina-filme-sala-vagas">
						(17 vagas restantes)
					</div>
					<div class="col-xs-12 pagina-filme-variavel">
						<span>2D</span>
						<span>DUB</span>
					</div>
				</div>
			</div>			
			<div class="row pagina-filme-sala">
				<div class="hidden-xs col-sm-2 col-lg-1">
					<a href="<?php echo $level."filme.php?id=3" ?>"><img class="img-responsive img-rounded" src="<?php echo glob($level."img/poster/3.*")[0] ?>"/></a>
				</div>
				<div class="col-xs-12 col-sm-10 col-lg-11">
					<div class="col-xs-12 pagina-filme-sala-titulo">
						<a href="<?php echo $level."filme.php?id=3" ?>">Capitão América: Guerra Civil</a>
					</div>	
					<div class="col-xs-12 pagina-filme-sala-local">
						SALA 02 - 14:30
					</div>		
					<div class="col-xs-12 btn-comprar">
						<a href="#"><i class="fas fa-shopping-cart"></i> Comprar ingresso</a>
					</div>						
					<div class="col-xs-12 pagina-filme-sala-vagas">
						(29 vagas restantes)
					</div>
					<div class="col-xs-12 pagina-filme-variavel">
						<span>3D</span>
						<span>LEG</span>
					</div>
				</div>
			</div>				
			<div class="row pagina-filme-sala">
				<div class="hidden-xs col-sm-2 col-lg-1">
					<a href="<?php echo $level."filme.php?id=2" ?>"><img class="img-responsive img-rounded" src="<?php echo glob($level."img/poster/2.*")[0] ?>"/></a>
				</div>
				<div class="col-xs-12 col-sm-10 col-lg-11">
					<div class="col-xs-12 pagina-filme-sala-titulo">
						<a href="<?php echo $level."filme.php?id=2" ?>">Rampage: Destruição Total</a>
					</div>	
					<div class="col-xs-12 pagina-filme-sala-local">
						SALA 02 - 16:50
					</div>		
					<div class="col-xs-12 btn-comprar">
						<a href="#"><i class="fas fa-shopping-cart"></i> Comprar ingresso</a>
					</div>						
					<div class="col-xs-12 pagina-filme-sala-vagas">
						(41 vagas restantes)
					</div>
					<div class="col-xs-12 pagina-filme-variavel">
						<span>2D</span>
						<span>DUB</span>
					</div>
				</div>
			</div>			
		</div>
	</div>
	
	<?php include $level."componente/footer.php"; ?>