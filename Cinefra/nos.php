<?php
	$pagina_titulo = "Cinefra - Nós";
	$nome = "nos";
	$level = "";
?>
	<?php include $level."componente/header.php"; ?>
	<?php include $level."componente/navbar.php"; ?>
	<?php include $level."funcao/funcao_php/funcao_imagem.php"; ?>

		<div class="container container-endereco">
			<div class="row">
				<div class="col-sm-3">
					<fieldset>
						<legend><i class="fas fa-map-marker-alt"></i> Endereço</legend>
						<div class="row">
							<div class="col-xs-12">
								Estrada do Mendanha, 401
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								Campo Grande
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								Rio de Janeiro - RJ
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								23087-284
							</div>
						</div>
					</fieldset>
				</div>
				<div class="col-sm-3">
					<fieldset>
						<legend><i class="fas fa-phone"></i> Telefones</legend>
						<div class="row">
							<div class="col-xs-12">
								SAC #1: (21) 2414-7417
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								SAC #2: (21) 2414-7416
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								Call Center: (21) 3003-4175
							</div>
						</div>
					</fieldset>
				</div>
				<div class="col-sm-3">
					<fieldset class="fieldset-redes">
						<legend><i class="fas fa-users"></i> Redes sociais</legend>
						<div class="row">
							<div class="col-xs-2 col-sm-4">
								<a href="#"><i class="fab fa-twitter twitter"></i></a>
							</div>
							<div class="col-xs-2 col-sm-4">
								<a href="#"><i class="fab fa-facebook facebook"></i></a>
							</div>
							<div class="col-xs-2 col-sm-4">
								<a href="#"><i class="fab fa-youtube youtube"></i></a>
							</div>
						</div>
					</fieldset>
				</div>
				<div class="col-sm-3">
					<fieldset>
						<legend><i class="far fa-envelope"></i> E-mail</legend>
						<div class="row">
							<div class="col-xs-12">
								cinefra@gmail.com
							</div>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1837.889607156281!2d-43.55729055655066!3d-22.884612984983022!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9be1630ab2093b%3A0x59b3f4fab028404e!2sKinoplex+West+Shopping!5e0!3m2!1spt-BR!2sbr!4v1523971743592" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		</div>

		<div class="separador"></div>
		<?php $carousel = getImagem("galeria"); ?>
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
								<img src="<?php echo glob($level."img/galeria/$c[id].*")[0]; ?>" alt="<?php echo $c["titulo"] ?>">
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
		
	<?php include $level."componente/footer.php"; ?>