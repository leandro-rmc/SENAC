<?php
	$pagina_titulo = "Cinefra - Filmes";
	$nome = "filmes";
	$level = "";
?>
	<?php include $level."componente/header.php"; ?>
	<?php include $level."componente/navbar.php"; ?>
	<?php include $level."funcao/funcao_php/funcao_filme.php"; ?>
	
		<div class="container container-filme">
			<div class="row">
				<div class="col-xs-12">
					<i class="fas fa-film"></i> Filmes em cartaz
				</div>
			</div>
			<div class="row">
			<?php
				$cartaz_filmes = getFilmesEmCartaz();
				foreach($cartaz_filmes as $filme){
			?>
				<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
					<div class="poster-filme">
						<?php
							if($filme["top"]){
						?>
						<span class="poster-titulo">TOP <i class="fas fa-trophy"></i></span>
						<?php
							}
						?>
						<a href="<?php echo $level."filme.php?id=".$filme["id"] ?>"><img class="img-responsive" src="<?php echo glob($level."img/poster/$filme[id].*")[0] ?>"/></a>
					</div>
				</div>
			<?php
				}
				if(count($cartaz_filmes) == 0){
			?>
				<div class="col-xs-12 nenhum-filme">
					<span>Nenhum filme encontrado.</span>
				</div>
			<?php
				}
			?>
			</div>
		</div>
		
		<div class="container container-filme">
			<div class="row">
				<div class="col-xs-12">
					<i class="fas fa-film"></i> Próximos lançamentos
				</div>
			</div>
			<div class="row">
				<?php
					$proximos_lancamentos = getProximosLancamentos();
					foreach($proximos_lancamentos as $filme){
				?>
				<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
					<div class="poster-filme">
						<span class="poster-titulo">
							<?php 
								
								$data = explode("-",$filme["lancamento"]);
								echo $data[2]."/".$data[1]."/".$data[0];
							
							?>
						</span>
						<a href="<?php echo $level."filme.php?id=".$filme["id"] ?>"><img class="img-responsive" src="<?php echo glob($level."img/poster/$filme[id].*")[0] ?>"/></a>
					</div>
				</div>
			<?php
				}
				if(count($proximos_lancamentos) == 0){
			?>
				<div class="col-xs-12 nenhum-filme">
					<span>Nenhum filme encontrado.</span>
				</div>
			<?php
				}
			?>
			</div>
		</div>
	
	<?php include $level."componente/footer.php"; ?>