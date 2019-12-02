<?php
	require_once $level."conexao.php";
	
	function getImagem($tipo){
		global $mysqli;
		$stmt = $mysqli->prepare("SELECT * FROM imagem WHERE tipo = ?");
		if(!$stmt)
			exit();
		$stmt->bind_param("s",$tipo);
		$stmt->execute();
		$resultado = $stmt->get_result();
		return $resultado->fetch_all(MYSQLI_ASSOC);
	}
?>