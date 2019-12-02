<div class="container-fluid">
	<div class="row">
		<nav class="navbar navbar-inverse navbar-static-top">
			<div class="navbar-header">
				<a href="index.php" class="navbar-brand">ZEFRA</a>
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menuRL">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse" id="menuRL">
				<ul class="nav navbar-nav">
					<?php
						if($tipo == "deslogado"){
					?>
					<li class="<?php if ($local == "registro") echo "active"?>"><a href="registro.php">Registro</a></li>
					<li class="<?php if ($local == "login") echo "active"?>"><a href="login.php">Login</a></li>
					<?php
						}
					?>
					
					<?php
						if($tipo == "cliente"){
					?>
						<li class="<?php if ($local == "meus_chamados") echo "active"?>"><a href="meus_chamados.php">Meus chamados</a></li>
						<li class="<?php if ($local == "perfil") echo "active"?>"><a href="ver_perfil.php?id=0">Meu Perfil</a></li>
						<li><a href="index.php"><span class="glyphicon glyphicon-off"></span></a></li>
					<?php
						}
					?>
				</ul>
			</div>
		</nav>
	</div>
</div>