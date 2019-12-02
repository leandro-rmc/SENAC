<?php
	require_once "../../conexao.php";
	
	if(isset($_POST["registrar"])){
		$erro_senha = [];
		$erro_email = [];
		
		if (empty($_POST["r_email"]))
			array_push($erro_email,"Você precisa colocar um endereço de e-mail");
		elseif (!preg_match('/^[0-9A-Za-z\-\+\_\.\?\!]{1,}+@[0-9A-Za-z\-\+\_\.\?\!]{1,}$/',$_POST["r_email"]))
			array_push($erro_email,"Endereço de e-mail inválido");
		elseif (($_POST["r_email"] != $_POST["r_cemail"]))
			array_push($erro_email,"Endereços de e-mail não conferem");
		
		if (empty($_POST["r_senha"]))
			array_push($erro_senha,"Você precisa colocar uma senha");
		elseif (($_POST["r_senha"] != $_POST["r_csenha"]))
			array_push($erro_senha,"Senhas não conferem");
			
		if(count($erro_senha) == 0 && count($erro_email) == 0){
			isEmailExistente($_POST["r_email"]) ? array_push($erro_email,"Endereço de email já existe!") : criarConta($_POST["r_email"],$_POST["r_senha"]);
		}
		echo json_encode(array("erro_email" => $erro_email, "erro_senha" => $erro_senha));
	}
	
	if(isset($_POST["logar"])){
		$erro_email = [];
		$erro_senha = [];
		
		if (empty($_POST["l_email"]))
			array_push($erro_email,"Você precisa colocar um endereço de e-mail");
		if (empty($_POST["l_senha"]))
			array_push($erro_senha,"Você precisa colocar uma senha");
		
		if(count($erro_senha) == 0 && count($erro_email) == 0){
			if(isEmailExistente($_POST["l_email"]))
				if(loginOk($_POST["l_email"],$_POST["l_senha"])){
					if(!isset($_SESSION))
						session_start();
					$_SESSION["logado"] = true;
					$_SESSION["email"] = $_POST["l_email"];
				}
				else{
					array_push($erro_senha,"Senha inválida!"); 
				}
			else
				array_push($erro_email,"E-mail não registrado!"); 
		}
		echo json_encode(array("erro_email" => $erro_email, "erro_senha" => $erro_senha));
	}
	
	if(isset($_POST["deslogar"])){
		if(!isset($_SESSION))
			session_start();
		session_destroy();
	}
	
	function loginOk($email,$senha){
		global $mysqli;
		$senha = md5($senha);
		$stmt = $mysqli->prepare("SELECT id FROM conta WHERE email = ? AND senha = ?");
		if(!$stmt)
			exit();
		$stmt->bind_param("ss",$email,$senha);
		$stmt->execute();
		$stmt->store_result();
		return $stmt->num_rows > 0 ? true : false;
	}
	
	function isEmailExistente($email){
		global $mysqli;
		$stmt = $mysqli->prepare("SELECT email FROM conta WHERE email = ?");
		if(!$stmt)
			exit();
		$stmt->bind_param("s",$email);
		$stmt->execute();
		$stmt->store_result();
		return $stmt->num_rows > 0 ? true : false;
	}
	
	function criarConta($email,$senha){
		global $mysqli;
		$senha = md5($senha);
		date_default_timezone_set('America/Sao_Paulo');
		$data = date("Y-m-d");
		$hora = date("H:i:s");
		
		$stmt = $mysqli->prepare("INSERT INTO conta VALUES ('',?,?,?,?)");
		if(!$stmt)
			exit();
		$stmt->bind_param("ssss",$email,$senha,$data,$hora);
		$stmt->execute();
	}
?>