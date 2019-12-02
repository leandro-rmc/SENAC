<?php
	$pagina_titulo = "Cinefra - Filme";
	$nome = "filme";
	$level = "";
?>
	<?php include $level."componente/header.php"; ?>
	<?php include $level."componente/navbar.php"; ?>
	<?php include $level."funcao/funcao_php/funcao_filme.php"; ?>
		
		<?php
			if(isset($_GET["id"]) && !empty($_GET["id"])){
				$filme = getFilme($_GET["id"]);
				if(count($filme) > 0){
		?>
		<div class="container-fluid pagina-filme-container">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-4">
					<img class="img-responsive img-rounded pagina-filme-poster" src="<?php echo glob($level."img/poster/$filme[id].*")[0] ?>"/>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-8">
					<div class="row">
						<div class="col-xs-12 pagina-filme-titulo">
							<?php echo $filme["titulo"] ?>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-12 pagina-filme-linha">
							<?php 
								if($filme["duracao"] == -1)
									echo "<span class='bold'>Duração: </span>Desconhecida.";
								else
									echo "<span class='bold'>Duração: </span>".$filme["duracao"]." min.";
							?>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-12 pagina-filme-linha">
							<?php 
								echo "<span>Categoria: </span>".$filme["categoria"].".";
							?>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-12 pagina-filme-linha">
							<?php 
								if($filme["classificacao_indicativa"] == "?")
									echo "<span>Classificação indicativa: </span>Desconhecida.";
								elseif($filme["classificacao_indicativa"] == "L")
									echo "<span>Classificação indicativa: </span>".$filme["classificacao_indicativa"].".";
								else
									echo "<span>Classificação indicativa: </span>".$filme["classificacao_indicativa"]." anos.";
							?>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-12 pagina-filme-linha">
							<?php 
								$data = explode("-",$filme["lancamento"]);
								echo "<span>Lançamento: </span>".$data[2]."/".$data[1]."/".$data[0].".";
							?>
						</div>
					</div>		

					<div class="row">
						<div class="col-xs-12 pagina-filme-linha">
							<?php 
								echo "<span>Sinopse: </span>".$filme["sinopse"];
							?>
						</div>
					</div>

					<div class="row">
						<div class="col-xs-12 pagina-filme-variavel">
							<?php 
								if($filme["legendado"])
									echo "<span>DUB</span>";
								if($filme["dublado"])
									echo "<span>LEG</span>";
							?>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-12 pagina-filme-variavel">
							<?php 
								if($filme["2d"])
									echo "<span>2D</span>";
								if($filme["3d"])
									echo "<span>3D</span>";
							?>
						</div>
					</div>
					
					<div class="pagina-filme-salas">
						<div class="row pagina-filme-sala">
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
						<div class="row pagina-filme-sala">
							<div class="col-xs-12 pagina-filme-sala-local">
								SALA 01 - 17:30
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
						
						<div class="row pagina-filme-sala">
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
					
				</div>
			</div>
			
		</div>
	
		<?php
			}
			else{
				header("Location: index.php");
			}
				}
				else{
					header("Location: index.php");
				}
		?>
	<?php include $level."componente/footer.php"; ?>