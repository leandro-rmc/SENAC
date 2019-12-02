<?php $tipo = "pessoas"?> <!--Para a classe active da navbar functionar direito-->
<?php include "componentes/header.php"?>
<?php include "componentes/nav.php"?>
	<div class="container">
		<div class="row caixa caixa-perfil">
			<div class="col-xs-12 col-sm-4" style="background-color:#f2f2f2;">
				<div class="thumbnail thumbnail-perfil">
					<img src="img/yusaku_perfil.png" class="img-responsive img-responsive-center img-rounded">
					<div class="row">
						<h3><a href="perfil_2.php">Yusaku Fujiki</a></h3>
					</div>
					<div class="row">
						<i class="fa fa-circle" aria-hidden="true"></i> Cidade: <a href="#" class="nonbold">Den City</a>
					</div>
					<div class="row">
						<i class="fa fa-circle" aria-hidden="true"></i> Idade: <span class="nonbold">16 anos</span>
					</div>
					<div class="row">
						<i class="fa fa-circle" aria-hidden="true"></i> Estuda em: <a class="nonbold" href="#">Den City High School</a>
					</div>
					<div class="row">
						<i class="fa fa-circle" aria-hidden="true"></i> É um membro da <span class="zefra-titulo">ZEFRA</span> desde 15/12/2017.
					</div>
					<div class="row online">
						<i class="fa fa-circle" aria-hidden="true"></i> Online agora
					</div>
					<div class="row">
						<hr>
						<a href="#">Excluir dos amigos</a>
					</div>
					<div class="row">
						<a href="#">Enviar mensagem</a>
					</div>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-3 col-sm-offset-1 hidden-xs">
				<div class="thumbnail perfil-icone-menu">
					<div class="caption text-center">
						<h4>Fotos</h4>
					</div>
					<a href="#"><img src="img/fotos-icone.png" class="img-responsive"></a>
				</div>
			</div>
			<div class="col-xs-12 col-sm-3  hidden-xs">
				<div class="thumbnail perfil-icone-menu">
					<div class="caption text-center">
						<h4>Amigos</h4>
					</div>
					<a href="#"><img src="img/amigos-icone.png" class="img-responsive"></a>
				</div>
			</div>
			<div class="col-xs-12 col-sm-3 col-sm-offset-1  hidden-xs">
				<div class="thumbnail perfil-icone-menu">
					<div class="caption text-center">
						<h4>Comunidades</h4>
					</div>
					<a href="#"><img src="img/comunidades-icone.png" class="img-responsive"></a>
				</div>
			</div>
		</div>
		<div class="row menuMobile hidden-sm hidden-md hidden-lg hidden-xl">
			<div class="row">
				<a href="#"><i class="fa fa-camera" aria-hidden="true"></i> Fotos</a>
			</div>
			<div class="row">
				<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Amigos</a>
			</div>
			<div class="row">
				<a href="#"><i class="fa fa-users" aria-hidden="true"></i> Comunidades</a>
			</div>
		</div>
		<hr>
			<div class="row postagem-perfil">
				<div class="col-xs-3 col-sm-2">
					<img src="img/yusaku_perfil.png" class="img-responsive img-rounded">
				</div>
				<div class="col-xs-9 col-sm-10">
					<div class="row">
						<a href="perfil_2.php">Yusaku Fujiki</a> 
					</div>
					<div class="row">
						<span class="tempo">37 minutos atrás</a>
					</div>
					<div class="row">
						<a href="#">5 curtidas</a>
					</div>
					<div class="row postagem-perfil-mensagem">
						Spectre tem mostrado ser um dos melhores personagens do anime. Episódio muito bom <a href="#">#VRAINS35</a>
					</div>
					<div class="row">
						<a href="#">Responder (2)</a>
					</div>
				</div>
			</div>
			<div class="row postagem-perfil">
				<div class="col-xs-3 col-sm-2">
					<img src="img/yusaku_perfil.png" class="img-responsive img-rounded">
				</div>
				<div class="col-xs-9 col-sm-10">
					<div class="row">
						<a href="perfil_2.php">Yusaku Fujiki</a> 
					</div>
					<div class="row">
						<span class="tempo">2 horas atrás</a>
					</div>
					<div class="row">
						<a href="#">3 curtidas</a>
					</div>
					<div class="row postagem-perfil-mensagem">
						Participe da nossa comunidade de Yu-Gi-Oh! VRAINS: <a href="comunidade_2.php">https://zefra.com.br/comunidade_2.php</a>
					</div>
					<div class="row">
						<a href="#">Responder</a>
					</div>
				</div>
			</div>
			<div class="row postagem-perfil">
				<div class="col-xs-3 col-sm-2">
					<img src="img/yusaku_perfil.png" class="img-responsive img-rounded">
				</div>
				<div class="col-xs-9 col-sm-10">
					<div class="row">
						<a href="perfil_2.php">Yusaku Fujiki</a> 
					</div>
					<div class="row">
						<span class="tempo">5 horas atrás</a>
					</div>
					<div class="row">
						<a href="#">1 curtidas</a>
					</div>
					<div class="row postagem-perfil-mensagem">
						Para os novatos no Speed Duel, deixo aqui um tutorial: <a href="#">http://yugioh.wikia.com/wiki/Speed_Duel_(format)</a>
					</div>
					<div class="row">
						<a href="#">Responder (1)</a>
					</div>
				</div>
			</div>
	</div>
<?php include "componentes/footer.php"?>