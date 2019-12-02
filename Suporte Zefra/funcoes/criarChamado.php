<?php
	sleep(1);
	$target = uniqid("chamado_"); //Gera um ID aleatório para o chamado.
?>
<div id="<?php echo $target ?>">
	<div class="info-chamado">
		<div class="row data-chamado">
			<div class="col-xs-12">
				<?php
					date_default_timezone_set('America/Sao_Paulo');
					echo '<span class="data">'.date('d/m/Y').'</span> - '.'<span class="hora">'.date("H:i:s").'</span>';
				?>
			</div>
		</div>
	</div>
	<div class="row chamado">
		<div class="col-xs-3 col-sm-2">
			<img src="img/perfil_0.png" class="img-responsive img-rounded">
		</div>
		<div class="col-xs-9 col-sm-10">
			<div class="row">
				<div class="col-xs-9">
					<div class="row">
						<a href="ver_perfil.php?id=0">Leandro Rocha Musser Carneiro</a> <!-- Bug corrigido no dia 08/02/2018 às 15:50. Estava como ID 1 -->
					</div>
					<div class="row">
						Rio de Janeiro
						<hr>
					</div>
					<div class="row">
						<span class="msg-status" data-target="<?php echo $target?>">Aguardando algum técnico...</span>
					</div>
					<div class="row">
						ID: <span class="msg-id"><?php echo $target?></span>
					</div>
					<hr>
				</div>
				<div class="col-xs-3">
					<button data-target="#modalDeletar" data-toggle="modal" data-deletar="<?php echo $target?>" class="deletarChamado btn btn-danger pull-right"><span class="glyphicon glyphicon-remove"></span></button>
					<button data-toggle="modal" data-target="#modalEditar" class="editarChamado btn btn-primary pull-right" data-editar="<?php echo $target?>"><span class="glyphicon glyphicon-pencil"></span></button>
					<button data-toggle="modal" data-target="#modalNota" data-relatorio="<?php echo $target?>" class="verRelatorio btn btn-primary pull-right hidden"><span class="glyphicon glyphicon-list-alt"></span></button>
				</div>	
			</div>
			<div class="row hidden-xs">
				<div class="col-xs-12">
					<strong>Assunto:</strong> <span class="campo_assunto"><?php if ($_GET["assunto"] == "") echo "Assunto em branco"; else echo $_GET["assunto"]?></span>
				</div>
			</div>
			<div class="row hidden-xs">
				<div class="col-xs-12">
					<strong>Dispositivo:</strong> <span class="campo_equipamento"><?php if ($_GET["equipamento"] == "") echo "Equipamento em branco"; else echo $_GET["equipamento"]?></span> - <span class="campo_marca"><?php if ($_GET["marca"] == "") echo "Marca em branco"; else echo $_GET["marca"]?></span>
				</div>
			</div>
			<div class="row hidden-xs">
				<div class="col-xs-12">
					<strong>Descrição do problema:</strong> <span class="campo_problema"><?php if ($_GET["problema"] == "") echo "Problema em branco"; else echo $_GET["problema"]?></span>
				</div>
			</div>
		</div>
		<div class="col-xs-12 hidden-sm hidden-md hidden-lg hidden-xl">
			<strong>Assunto:</strong> <span class="campo_assunto"><?php if ($_GET["assunto"] == "") echo "Assunto em branco"; else echo $_GET["assunto"]?></span>
		</div>
		<div class="col-xs-12 hidden-sm hidden-md hidden-lg hidden-xl">
			<strong>Dispositivo:</strong> <span class="campo_equipamento"><?php if ($_GET["equipamento"] == "") echo "Equipamento em branco"; else echo $_GET["equipamento"]?></span> - <span class="campo_marca"><?php echo $_GET["marca"]?></span>
		</div>
		<div class="col-xs-12 hidden-sm hidden-md hidden-lg hidden-xl">
			<strong>Descrição do problema:</strong> <span class="campo_problema"><?php if ($_GET["problema"] == "") echo "Problema em branco"; else echo $_GET["problema"]?></span>
		</div>
	</div>
</div>
<script>
	atualizarIds();
	pegarChamado("<?php echo $target ?>");
</script>