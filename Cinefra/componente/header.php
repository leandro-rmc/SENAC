<?php
	if(!isset($_SESSION))
		session_start();
?>
<html>
    <head>
        <title><?php echo $pagina_titulo?></title>
		<meta charset="UTF-8"/>
		<link rel="stylesheet" href="<?php echo $level ?>css/bootstrap.min.css">
		<link rel="stylesheet" href="<?php echo $level ?>css/estilo.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="<?php echo $level ?>js/fontawesome-all.js"></script>
    </head>
	<body>