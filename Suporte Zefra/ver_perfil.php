<?php
	if($_GET["id"] == 0)
		$local = "perfil";
	$tipo = "cliente";
	$perfil_leandro = Array("Leandro Rocha Musser Carneiro","(21)98531-4016","21740-666","Rua Tal, 80","Magalhães Bastos","RJ","leandro.musser@gmail.com");
	$perfil_carlita = Array("Carlita Mig","(21)98530-0001","21740-667","Rua Tal, 87","Bangu","RJ","carlita-okani@gmail.com");
	$perfil_marcela = Array("Marcela Neves","(21)98530-0002","21740-668","Rua Tal, 88","Madureira","RJ","marcela-neves-93@gmail.com");
	$perfil_nathalia = Array("Nathalia Silva","(21)98530-0003","21740-669","Rua Tal, 89","Méier","RJ","nathy91@gmail.com");
	$listaTecnicos = Array($perfil_leandro,$perfil_carlita,$perfil_marcela,$perfil_nathalia);
	

?>
<?php include "componentes/header.php"?>
<?php include "componentes/navbar.php"?>
<div class="container">
	<div class="row perfil">
		<div class="col-xs-12 col-sm-4">
			<img class="center-block img-responsive img-rounded" src="img/perfil_<?php echo $_GET["id"].".png"?>">
			<div class="row">
				<div class="col-xs-12 text-center">
					<h4><?php echo $listaTecnicos[$_GET["id"]][0];?></h4>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 text-center">
					<?php if($_GET["id"] == 0) echo 'Membro verificado <span class="glyphicon glyphicon-ok"></span></p>'; else echo 'Técnica verificada <span class="glyphicon glyphicon-ok"></span></p>'?>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-8 informacao">		
			<div class="row">
				<div class="col-xs-12">
					<span class="label-perfil">Telefone</span>
					<?php echo $listaTecnicos[$_GET["id"]][1];?>
				</div>
			</div>			
			<div class="row">
				<div class="col-xs-12">
					<span class="label-perfil">CEP</span>
					<?php echo $listaTecnicos[$_GET["id"]][2];?>
				</div>
			</div>			
			<div class="row">
				<div class="col-xs-12">
					<span class="label-perfil">Logradouro</span>
					<?php echo $listaTecnicos[$_GET["id"]][3];?>
				</div>
			</div>			
			<div class="row">
				<div class="col-xs-12">
					<span class="label-perfil">Bairro</span>
					<?php echo $listaTecnicos[$_GET["id"]][4];?>
				</div>
			</div>			
			<div class="row">
				<div class="col-xs-12">
					<span class="label-perfil">UF</span>
					<?php echo $listaTecnicos[$_GET["id"]][5];?>
				</div>
			</div>			
			<div class="row">
				<div class="col-xs-12">
					<span class="label-perfil">E-mail</span>
					<?php echo $listaTecnicos[$_GET["id"]][6];?>
				</div>
			</div>		
			<div class="row">
				<div class="col-xs-12">
					<?php if($_GET["id"] == 0) echo '<button type="button" class="btn btn-primary">Editar</button>'?>
				</div>
			</div>			
		</div>
	</div>
</div>
<?php include "componentes/footer.php"?>