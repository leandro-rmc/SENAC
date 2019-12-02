<?php $tipo = "mensagens"?> <!--Para a classe active da navbar functionar direito-->
<?php include "componentes/header.php"?>
<?php include "componentes/nav.php"?>
<div class="container">
	<div class="row form-group">
		<button class="btn btn-primary" type="button">Enviar nova mensagem</button>
	</div>
	<div class="row">
		<div class="input-group form-group">
			<input type="text" class="form-control" placeholder="Pesquisar por mensagem">
			<div class="input-group-btn">
			  <button class="btn btn-default" type="button">
				<i class="glyphicon glyphicon-search"></i>
			  </button>
			</div>
		</div>
	</div>
	<div class="row caixa nao-lida">
		<div class="col-xs-12 col-sm-3">
			<img class="img-responsive img-rounded img-responsive-center" src="img/akira_perfil.png">
		</div>
		<div class="col-xs-12 col-sm-9">
			<div class="row">
				<a href="#">Akira Zaizen</a>
			</div>
			<div class="row online">
				Online agora
			</div>			
			<div class="row">
				Última mensagem (18/01/2018 - 07:47): "<span class="nonbold">Bom dia. Eu preciso daquele Card que retorna todas as Spells e Traps setadas no campo para a mão, só que não consigo lembrar o nome. Será que voc...</span>"
			</div>		<hr>	
			<div class="row">
				<a href="#">Responder</a>
			</div>
		</div>
	</div>
	<div class="row caixa lida">
		<div class="col-xs-12 col-sm-3">
			<img class="img-responsive img-rounded img-responsive-center" src="img/blueangel_perfil.png">
		</div>
		<div class="col-xs-12 col-sm-9">
			<div class="row">
				<a href="#">Aoi Zaizen</a>
			</div>
			<div class="row">
				Online há 26 minutos
			</div>			
			<div class="row">
				Última mensagem (17/01/2018 - 19:02): "<span class="nonbold">Ok, obrigada ^^</span>"
			</div>		<hr>	
			<div class="row">
				<a href="#">Responder</a>
			</div>
		</div>
	</div>
	<div class="row caixa">
		<div class="col-xs-12 col-sm-3">
			<img class="img-responsive img-rounded img-responsive-center" src="img/leandrorocha_perfil.jpg">
		</div>
		<div class="col-xs-12 col-sm-9">
			<div class="row">
				<a href="#" class="criador">Leandro Rocha Musser</a>
			</div>
			<div class="row online">
				Online agora
			</div>			
			<div class="row">
				Última mensagem (15/12/2017 - 15:47): "<span class="nonbold">Olá, eu sou o criador da ZEFRA, seja bem vindo(a). Qualquer dúvida, sugestão ou reclamação, fique à vontade para mandar mensagem. Meu e-mail: leandro.musser@gmail.com</span>"
			</div>		<hr>	
			<div class="row">
				<a href="#">Responder</a>
			</div>
		</div>
	</div>
</div>
<?php include "componentes/footer.php"?>