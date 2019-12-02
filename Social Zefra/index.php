<?php $tipo = "index"?>
<?php include "componentes/header.php"?>
<?php include "componentes/navindex.php"?>
<div class="container-fluid">
	<div class="zefra-apresentacao">
		<h1 class="text-center">ZEFRA</h1>
		<p class="text-center nonbold">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non neque non mi pellentesque tincidunt nec pharetra diam. Nulla vitae nibh non justo congue euismod. Praesent eleifend, lacus eu facilisis aliquet, sapien mauris faucibus odio, cursus ullamcorper enim mauris at urna. Ut porttitor tortor quis consectetur porttitor. Nulla in aliquet lacus, aliquet viverra sapien. Vivamus vitae feugiat enim. Donec id justo consequat, gravida neque in, eleifend arcu.</p>
	</div>
</div>
<div class="container container-menor">
	<div id="caroulsel" class="carousel slide" data-ride="carousel">
	  <ol class="carousel-indicators carousel-bg">
		<li data-target="#caroulsel" data-slide-to="0" class="active"></li>
		<li data-target="#caroulsel" data-slide-to="1"></li>
		<li data-target="#caroulsel" data-slide-to="2"></li>
		<li data-target="#caroulsel" data-slide-to="3"></li>
		<li data-target="#caroulsel" data-slide-to="4"></li>
		<li data-target="#caroulsel" data-slide-to="5"></li>
		<li data-target="#caroulsel" data-slide-to="6"></li>
	  </ol>
	  <div class="carousel-inner">
		<div class="item active">
		  <img src="img/carr1.png" alt="Screenshot 1">
		</div>
		<div class="item">
		  <img src="img/carr2.png" alt="Screenshot 2">
		</div>
		<div class="item">
		  <img src="img/carr3.png" alt="Screenshot 3">
		</div>
		<div class="item">
		  <img src="img/carr4.png" alt="Screenshot 4"> 
		</div>
		<div class="item">
		  <img src="img/carr5.png" alt="Screenshot 5">
		</div>
		<div class="item">
		  <img src="img/carr6.png" alt="Screenshot 6">
		</div>
		<div class="item">
		  <img src="img/carr7.png" alt="Screenshot 7">
		</div>
	  </div>
	  <a class="left carousel-control" href="#caroulsel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left"></span>
	  </a>
	  <a class="right carousel-control" href="#caroulsel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right"></span>
	  </a>
	</div>
</div>
<?php include "componentes/footer.php"?>