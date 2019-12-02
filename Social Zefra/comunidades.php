<?php $tipo = "comunidades"?> <!--Para a classe active da navbar functionar direito-->
<?php include "componentes/header.php"?>
<?php include "componentes/nav.php"?>
		<div class="container">
			<div class="row form-group">	
				<ul class="nav nav-pills">
					<li class="active"><a data-toggle="pill" href="#minhas-comunidades">Minhas comunidades</a></li>
					<li><a data-toggle="pill" href="#novas-comunidades">Pesquisar comunidades</a></li>
				</ul>
			</div>
			<div class="tab-content">
				<div id="minhas-comunidades" class="tab-pane fade in active">
					<div class="row">
						<div class="input-group form-group">
							<input type="text" class="form-control" placeholder="Pesquisa por nome da comunidade">
							<div class="input-group-btn">
							  <button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							  </button>
							</div>
						</div>
					</div>
					<div class="row caixa">
						<div class="col-xs-12 col-sm-3">
							<img class="img-rounded img-responsive img-responsive-center" src="img/comunidade_2.jpg">
						</div>
						<div class="col-xs-12 col-sm-9">
							<div class="row">
								<h3><a href="comunidade_2.php">Yu-Gi-Oh! VRAINS</a></h3>
							</div>
							<div class="row">
								143 participantes
								<hr>
							</div>
							<div class="row">
								Comunidade criada para os fãs de Yu-Gi-Oh! VRAINS que blá blá blá lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tincidunt nunc sit amet mi ultricies iaculis. Aenean vehicula quam non gravida... <a href="#">Ler mais</a>
							</div>
						</div>
					</div>
					<div class="row caixa">
						<div class="col-xs-12 col-sm-3">
							<img class="img-rounded img-responsive img-responsive-center" src="img/comunidade_3.jpg">
						</div>
						<div class="col-xs-12 col-sm-9">
							<div class="row">
								<h3><a href="comunidade_2.php">Desenvolvimento Android</a></h3>
							</div>
							<div class="row">
								789 participantes
								<hr>
							</div>
							<div class="row">
								Todos que tiverem interesse no Desenvolvimento Android são bem-vindos. Regras da comunidade: <a href="#">https://www.zefra.com.br/comunidade-3/topico-1.php</a> Leiam antes de participarem.
							</div>
						</div>
					</div>
				</div>
				<div id="novas-comunidades" class="tab-pane fade">
					<div class="row">
						<div class="input-group form-group">
							<input type="text" class="form-control" placeholder="Pesquisa por nome da comunidade">
							<div class="input-group-btn">
							  <button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							  </button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<?php include "componentes/footer.php"?>