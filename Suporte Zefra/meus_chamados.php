<?php
	$local = "meus_chamados";
	$tipo = "cliente";
?>
<?php include "componentes/header.php"?>
<?php include "componentes/navbar.php"?>
<div class="container">
	<div class="row">
		<div class="col-xs-12">
			<button type="button" class="btn btn-bonito btn-lg" data-toggle="modal" data-target="#modalChamado"><span class="glyphicon glyphicon-plus"></span> Abrir chamado</button>
			<hr>
		</div>
	</div>
	<hr class="hidden-sm hidden-md hidden-lg hidden-xl">
	<div class="row">
		<div class="col-xs-12">
			<ul class="nav nav-pills">
				<li class="active btn-bonito"><a data-toggle="pill" href="#chamados-espera">Chamados em espera <span id="chamadosEmEspera" class="badge">1</span></a><br></a></li>
				<li class="btn-bonito"><a data-toggle="pill" href="#chamados-resolvidos">Chamados resolvidos <span class="badge">1</span></a><br></a></li>
			</ul>
			<hr>
		</div>
	</div>
		
	<div class="tab-content">
		<div id="chamados-espera" class="tab-pane fade in active">
			<span class="nenhumChamado"></span>
			
			<div id="chamado_999999999990">
				<div class="info-chamado">
					<div class="row data-chamado">
						<div class="col-xs-12">
							<span class="data">28/01/2018</span> - <span class="hora">19:41:26</span>
						</div>
					</div>
				</div>
				<div class="row chamado chamado-pego">
					<div class="col-xs-3 col-sm-2">
						<img src="img/perfil_0.png" class="img-responsive img-rounded">
					</div>
					<div class="col-xs-9 col-sm-10">
						<div class="row">
							<div class="col-xs-9">
								<div class="row">
									<a href="ver_perfil.php?id=0">Leandro Rocha Musser Carneiro</a>
								</div>
								<div class="row">
									Rio de Janeiro
									<hr>
								</div>
								<div class="row">
									<span class="msg-status" data-target="chamado_999999999990">Chamado atendido por: <a class="nome-tecnico" href="ver_perfil.php?id=1">Carlita Mig</a>.</span>
								</div>
								<div class="row">
									ID: <span class="msg-id">chamado_999999999990</span>
								</div>
								<hr>
							</div>
							<div class="col-xs-3">
								<button data-target="#modalDeletar" data-toggle="modal" data-deletar="chamado_999999999990" class="deletarChamado btn btn-danger pull-right"><span class="glyphicon glyphicon-remove"></span></button>
								<button data-toggle="modal" data-target="#modalEditar" class="editarChamado btn btn-primary pull-right" data-editar="chamado_999999999990"><span class="glyphicon glyphicon-pencil"></span></button>
								<button data-toggle="modal" data-relatorio="chamado_999999999990" data-target="#modalNota" class="verRelatorio btn btn-primary pull-right"><span class="glyphicon glyphicon-list-alt"></span></button>
							</div>	
						</div>
						<div class="row hidden-xs">
							<div class="col-xs-12">
								<strong>Assunto:</strong> <span class="campo_assunto">Problema com bateria</span>
							</div>
						</div>
						<div class="row hidden-xs">
							<div class="col-xs-12">
								<strong>Dispositivo:</strong> <span class="campo_equipamento">Celular</span> - <span class="campo_marca">Motorola Razr D1</span>
							</div>
						</div>
						<div class="row hidden-xs">
							<div class="col-xs-12">
								<strong>Descrição do problema:</strong> <span class="campo_problema">Bateria não carrega mais.</span>
							</div>
						</div>
					</div>
					<div class="col-xs-12 hidden-sm hidden-md hidden-lg hidden-xl">
						<strong>Assunto:</strong> <span class="campo_assunto">Problema com bateria</span>
					</div>
					<div class="col-xs-12 hidden-sm hidden-md hidden-lg hidden-xl">
						<strong>Dispositivo:</strong> <span class="campo_equipamento">Celular</span> - <span class="campo_marca">Motorola Razr D1</span>
					</div>
					<div class="col-xs-12 hidden-sm hidden-md hidden-lg hidden-xl">
						<strong>Descrição do problema:</strong> <span class="campo_problema">Bateria não carrega mais.</span>
					</div>
				</div>
			</div>
		</div>
		
		<div id="chamados-resolvidos" class="tab-pane">
			<div>
				<div class="row info-chamado data-chamado">
					<div class="col-xs-12">
						<span class="data">21/12/2017</span> - <span class="hora">12:35</span>
					</div>
				</div>
				<div class="row chamado chamado-resolvido">
					<div class="col-xs-3 col-sm-2">
						<img src="img/perfil_0.png" class="img-responsive img-rounded">
					</div>
					<div class="col-xs-9 col-sm-10">
						<div class="row">
							<div class="col-xs-12">
								<div class="row">
									<a href="ver_perfil.php?id=0">Leandro Rocha Musser Carneiro</a>
								</div>
								<div class="row">
									Rio de Janeiro
									<hr>
								</div>
								<div class="row hidden-xs msg-status">
									Resolvido por: <a class="nome-tecnico" href="ver_perfil.php?id=1">Carlita Mig</a>.
								</div>
								<div class="row">
									ID: <span class="msg-id">chamado_e99aAb9c999f</span>
								</div>
								<hr>
							</div>
						</div>
						<div class="row hidden-xs">
							<div class="col-xs-12">
								<strong>Assunto:</strong> Duis posuere vulputate.
							</div>
						</div>
						<div class="row hidden-xs">
							<div class="col-xs-12">
								<strong>Dispositívo: </strong>Nulla facilisi.
							</div>
						</div>
						<div class="row hidden-xs">
							<div class="col-xs-12">
								<strong>Descrição do problema: </strong> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et neque neque. Donec nec lorem tempor, tempor sem vitae, pellentesque sem. Nulla facilisi. Duis posuere vulputate augue et aliquam. Donec viverra tellus vulputate augue euismod rutrum. Etiam congue velit et leo varius varius. Donec vel sem in lacus dapibus cursus sed id erat. Sed vulputate arcu a porta faucibus. Mauris vel gravida mauris.
							</div>
						</div>							
					</div>
					<div class="col-xs-12 hidden-sm hidden-md hidden-lg hidden-xl">
						<hr>
						<strong>Assunto:</strong> Duis posuere vulputate.
					</div>
					<div class="col-xs-12 hidden-sm hidden-md hidden-lg hidden-xl">
						<strong>Dispositívo:</strong> Nulla facilisi.
					</div>
					<div class="col-xs-12 hidden-sm hidden-md hidden-lg hidden-xl">
						<strong>Descrição do problema:</strong> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et neque neque. Donec nec lorem tempor, tempor sem vitae, pellentesque sem. Nulla facilisi. Duis posuere vulputate augue et aliquam. Donec viverra tellus vulputate augue euismod rutrum. Etiam congue velit et leo varius varius. Donec vel sem in lacus dapibus cursus sed id erat. Sed vulputate arcu a porta faucibus. Mauris vel gravida mauris.
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="modalChamado">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">Novo chamado</h3>
				</div>
				<div class="modal-body">
					<form role="form">
						<div class="form-group">
							<label for="equipamento">Equipamento</label>
							<input id="equipamento" type="text" class="form-control" placeholder="Qual o equipamento?">
						</div>
						<div class="form-group">
							<label for="marca">Marca</label>
							<input id="marca" type="text" class="form-control" placeholder="Qual a marca do equipamento?">
						</div>
						<div class="form-group">
							<label for="assunto">Assunto</label>
							<input id="assunto" type="text" class="form-control" placeholder="Qual o assunto?">
						</div>
						<div class="form-group">
							<label for="problema">Descrição do problema</label>
							<textarea id="problema" rows="6" type="text" class="form-control" placeholder="Conte-nos o que há de errado com seu equipamento"></textarea>
						</div>
					</form>
					<div class="modal-footer">
						<button class="btn btn-primary btn-block" data-dismiss="modal" id="btnCriarChamado">Criar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="modalEditar">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">Editar chamado</h3>
				</div>
				<div class="modal-body">
					<form role="form">
						<div class="form-group">
							<label for="e_equipamento">Equipamento</label>
							<input id="e_equipamento" type="text" class="form-control" placeholder="Qual o equipamento?">
						</div>
						<div class="form-group">
							<label for="e_marca">Marca</label>
							<input id="e_marca" type="text" class="form-control" placeholder="Qual a marca do equipamento?">
						</div>
						<div class="form-group">
							<label for="e_assunto">Assunto</label>
							<input id="e_assunto" type="text" class="form-control" placeholder="Qual o assunto?">
						</div>
						<div class="form-group">
							<label for="e_problema">Descrição do problema</label>
							<textarea id="e_problema" rows="6" type="text" class="form-control" placeholder="Conte-nos o que há de errado com seu equipamento"></textarea>
						</div>
					</form>
					<div class="modal-footer">
						<button class="btn btn-primary btn-block" data-dismiss="modal" id="btnSalvarChamadoEditado">Salvar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="modalDeletar">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title text-center">Quer mesmo deletar este chamado?</h3>
				</div>
				<div class="modal-body">
					<form role="form">
						<div class="form-group">
							<div class="row">
								<div class="col-xs-6">
									<button class="form-control btn btn-danger" id="btnDeletarChamado" type="button" data-dismiss="modal">Sim</button>
								</div>									
								<div class="col-xs-6">
									<button class="form-control btn btn-primary" type="button" data-dismiss="modal">Não</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="modalNota">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title text-center">Nota de atendimento</h3>
				</div>
				<div class="modal-body">
					Olá, <strong>Leandro Rocha Musser Carneiro</strong>.<br> Seu chamado de ID "<strong><span class="modalChamadoId">chamado_99885471</span></strong>" foi atendido por <a class="modalChamadoTecnico" href="#">Carla Mig</a>.
					Informamos que a mesma irá entrar em contato com você em <strong><span class="modalDataAleatoria">3 dias úteis</span></strong> para efetuar o agendamento da visita técnica.
					<hr>
					<h3 class="text-center bg-primary">Detalhes da chamada</h3>
					<div class="row">
						<div class="col-xs-12">
							Data de abertura: <strong><span class="modalChamadoData">08/02/2018</span></strong> às <strong><span class="modalChamadoHora">12:47</span></strong>.
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							ID: <strong><span class="modalChamadoId">chamado_99885471</span></strong>.
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							Assunto: <strong><span class="modalChamadoAssunto">Problema com bateria</span></strong>;
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							Dispositivo: <strong><span class="modalChamadoEquipamento">Celular</span></strong> - <strong><span class="modalChamadoMarca">Motorola Razr D1</span></strong>;
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							Problema: <strong><span class="modalChamadoProblema">Não quer mais carregar</span></strong>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="modalLogado">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3 class="modal-title text-center">Logado com sucesso!</h3>
			</div>
			<div class="modal-body">
				<img class="img-responsive text-center" src="img/registrado.png">
			</div>
		</div>
	</div>
</div>
<?php include "componentes/footer.php"?>