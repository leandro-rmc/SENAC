<?php $tipo = "registrar"?> <!--Para a classe active da navbar functionar direito-->
<?php include "componentes/header.php"?>
<?php include "componentes/navindex.php"?>
		<div class="container container-menor-ainda">
			<form class="formulario-registro" method="POST">
				<div class="row">
					<div class="col-xs-6">
						<input type="text" id="nome" name="nome" class="form-control" placeholder="Nome">
					</div>
					<div class="col-xs-6">
						<input type="text" name="sobrenome" class="form-control" placeholder="Sobrenome">
					</div>
				</div>
				<hr>
				<div class="row">
					<input type="text" id="email" name="email" class="form-control" placeholder="E-mail">
				</div>
				<div class="row">
					<input type="text" class="form-control" placeholder="Confirme seu e-mail">	
				</div>
				<hr>
				<div class="row">
						<input type="password" name="senha" class="form-control" placeholder="Senha">
				</div>
				<div class="row">
						<input type="password" class="form-control" placeholder="Confirme sua senha">	
				</div>
				<hr>
					<button class="btn btn-primary form-control">Registrar</button>
					
			</form>
		</div>
<?php include "componentes/footer.php"?>