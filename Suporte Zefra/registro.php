<?php
	$local = "registro";
	$tipo = "deslogado";
?>
<?php include "componentes/header.php"?>
<?php include "componentes/navbar.php"?>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<a id="cadastroCliente" class="btn btn-primary btn-bonito">Registro de cliente</a>
			<a id="cadastroTecnico" class="btn btn-bonito">Registro de técnico</a>
		</div>
	</div>
	<hr>
	<form action="/registro.php" id="formRegistro" method="POST">
		<div class="form-group row">
			<div class="form-group col-sm-6">
				<label for="nome">Nome:</label>
				<input type="text" class="form-control" id="nome" name="nome">
				<span class="mensagem-erro"></span>
			</div>
			<div class="form-group col-sm-6">
				<label for="celular">Celular:</label>
				<input type="text" class="form-control" id="celular" name="celular">
				<span class="mensagem-erro"></span>
			</div>
		</div>
		<div id="formTecnico" class="row">
			<div class="form-group col-sm-6">
				<label for="matricula">Matrícula:</label>
				<input type="text" class="form-control" id="matricula" name="matricula">
				<span class="mensagem-erro"></span>
			</div>
			<div class="form-group col-sm-6">
				<label for="funcao">Função</label>
				<input type="text" class="form-control" id="funcao" name="funcao">
				<span class="mensagem-erro"></span>
			</div>
		</div>
		<div class="form-group row">
			<div class="form-group col-sm-2">
				<label for="cep">CEP:</label>
				<input type="text" class="form-control" id="cep" name="cep">
				<span class="mensagem-erro"></span>
			</div>
			<div class="form-group col-sm-4">
				<label for="endereco">Endereço:</label>
				<input type="text" class="form-control" id="endereco" name="endereco">
				<span class="mensagem-erro"></span>
			</div>
			<div class="form-group col-sm-4">
				<label for="bairro">Bairro:</label>
				<input type="text" class="form-control" id="bairro" name="bairro">
				<span class="mensagem-erro"></span>
			</div>
			<div class="form-group col-sm-2">
				<label for="uf">UF:</label>
				<input type="text" class="form-control" id="uf" name="uf">
				<span class="mensagem-erro"></span>
			</div>
		</div>
		<div class="form-group">
		  <label for="email">E-mail:</label>
		  <input type="email" class="form-control" id="email" name="email">
		  <span class="mensagem-erro"></span>
		</div>
		<div class="form-group">
		  <label for="cemail">Confirme seu e-mail:</label>
		  <input type="email" class="form-control" id="cemail" name="cemail">
		  <span class="mensagem-erro"></span>
		</div>
		<div class="form-group">
		  <label for="senha">Senha:</label>
		  <input type="password" class="form-control" id="senha" name="senha">
		  <span class="mensagem-erro"></span>
		</div>
		<div class="form-group">
		  <label for="senha">Confirme sua senha:</label>
		  <input type="password" class="form-control" id="csenha" name="csenha">
		  <span class="mensagem-erro"></span>
		</div>
		<button id="btnRegistrar" class="btn btn-primary">Registrar</button>
	</form>
	<hr>
	<div class="modal fade" id="modalRegistrado">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title text-center">Registrado com sucesso!</h3>
				</div>
				<div class="modal-body">
					<img class="img-responsive text-center" src="img/registrado.png">
				</div>
			</div>
		</div>
	</div>
</div>
<?php include "componentes/footer.php"?>
<?php
		$cadastro = "";
	if (!empty($_POST["senha"])){
		$cadastro .= "Nome: ".$_POST["nome"]."\r\n";
		$cadastro .= "Celular: ".$_POST["celular"]."\r\n";
		$cadastro .= "Endereço: ".$_POST["endereco"]."\r\n";
		$cadastro .= "Bairro: ".$_POST["bairro"]."\r\n";
		$cadastro .= "UF: ".$_POST["uf"]."\r\n";
		$cadastro .= "E-mail: ".$_POST["email"]."\r\n";
		$cadastro .= "Senha: ".$_POST["senha"]."\r\n";
		if(!empty($_POST["matricula"])){
			$cadastro .= "Matrícula: ".$_POST["matricula"]."\r\n";
			$cadastro .= "Função: ".$_POST["funcao"]."\r\n";
			$cadastro .= "\r\n";
			file_put_contents("tecnicos.txt",$cadastro,FILE_APPEND);
		}
		else{
			$cadastro .= "\r\n";
			file_put_contents("clientes.txt",$cadastro,FILE_APPEND);
		}
		echo $cadastro;
?>
<script>
	$('#modalRegistrado').modal('show');
</script>
<?php
	}
?>