<?php
	require_once $level."conexao.php";
	
	function getTopFilmes(){
		global $mysqli;
		date_default_timezone_set('America/Sao_Paulo');
		$data = date("Y-m-d");
		$stmt = $mysqli->prepare("SELECT id, titulo FROM filme WHERE top = true AND saida > ?");
		$stmt->bind_param("s",$data);
		if(!$stmt)
			exit();
		$stmt->execute();
		$resultado = $stmt->get_result();
		return $resultado->fetch_all(MYSQLI_ASSOC);
	}
	
	function getFilmesEmCartaz(){
		global $mysqli;
		date_default_timezone_set('America/Sao_Paulo');
		$data = date("Y-m-d");
		$stmt = $mysqli->prepare("SELECT id, titulo, top FROM filme WHERE ? >= lancamento AND ? < saida");
		if(!$stmt)
			exit();
		$stmt->bind_param("ss",$data,$data);
		$stmt->execute();
		$resultado = $stmt->get_result();
		return $resultado->fetch_all(MYSQLI_ASSOC);
	}
	
	function getProximosLancamentos(){
		global $mysqli;
		date_default_timezone_set('America/Sao_Paulo');
		$data = date("Y-m-d");
		$stmt = $mysqli->prepare("SELECT id, titulo, lancamento FROM filme WHERE lancamento > ?");
		if(!$stmt)
			exit();
		$stmt->bind_param("s",$data);
		$stmt->execute();
		$resultado = $stmt->get_result();
		return $resultado->fetch_all(MYSQLI_ASSOC);
	}
	
	function getFilme($id){
		global $mysqli;
		$stmt = $mysqli->prepare("SELECT * FROM filme WHERE id = ?");
		if(!$stmt)
			exit();
		$stmt->bind_param("s",$id);
		$stmt->execute();
		$resultado = $stmt->get_result();
		return $resultado->fetch_assoc();
	}
?>