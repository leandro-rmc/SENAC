<?php
	$pagina_titulo = "Cinefra - Início";
	$nome = "inicio";
	$level = "";
?>
	<?php include $level."componente/header.php"; ?>
	<?php include $level."componente/navbar.php"; ?>
	<?php include $level."funcao/funcao_php/funcao_filme.php"; ?>
	<?php include $level."funcao/funcao_php/funcao_imagem.php"; ?>
	
		<?php $carousel = getImagem("carousel"); ?>
		<div class="container-fluid">
		
			<?php
				if(count($carousel) > 0){
			?>
		
			<div class="row carousel_r">
				<div class="col-xs-12 col-sm-10 col-sm-offset-1">
				  <div id="carousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
					
					  <?php
						$i = 0;
						foreach($carousel as $c){
					  ?>
					  <li data-target="#carousel" data-slide-to="<?php echo $i ?>" class="<?php if($i == 0) echo 'active' ?>"></li>
					  <?php
							$i++;
						}
					  ?>
					  
					</ol>

					
					<div class="carousel-inner">
						<?php
							$i = 0;
							foreach($carousel as $c){
						?>
							  <div class="item <?php if($i == 0) echo 'active' ?>">
								<img src="<?php echo glob($level."img/carousel/$c[id].*")[0]; ?>" alt="<?php echo $c["titulo"] ?>">
							  </div>
						<?php
								$i++;
							}
						?>
					</div>
					
					<a class="left carousel-control" href="#carousel" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
						<span class="sr-only">Anterior</span>
					</a>
					<a class="right carousel-control" href="#carousel" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
						<span class="sr-only">Próximo</span>
					</a>
					
				  </div>
				</div>
			</div>
			
			<?php
				}
			?>

		</div>
		<div class="separador"></div>
		<div class="container container-filme">
				
			<div class="row">
				<div class="col-xs-12">
					<i class="fas fa-trophy"></i> Filmes recomendados
				</div>
			</div>
			<div class="row">
			<?php
				$top_filmes = getTopFilmes();
				foreach($top_filmes as $filme){
			?>
			
				<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
					<div class="poster-filme">
						<span class="poster-titulo">TOP <i class="fas fa-trophy"></i></span>
						<a href="<?php echo $level."filme.php?id=".$filme["id"] ?>"><img class="img-responsive" src="<?php echo glob($level."img/poster/$filme[id].*")[0] ?>"/></a>
					</div>
				</div>
			<?php
				}
				if(count($top_filmes) == 0){
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