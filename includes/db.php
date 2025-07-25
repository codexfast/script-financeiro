<?php

// Connection Database
$dbuser="ferrag82_admin";		 		//USUARIO MYSQL
$dbpassword="jIszTMdK)U[S"; 			//SENHA DO USUARIO
$dbname="ferrag82_financeiro"; 	//NOME DO BANCO DE DADOS
$dbhost="50.116.112.117";		//SERVIDOR MYSQL, GERALMENTE E LOCALHOST, MAS PODE MUDAR DEPENDENDO DA HOSPEDAGEM
//Connect
$mysqli = new mysqli($dbhost, $dbuser, $dbpassword, $dbname);
if (mysqli_connect_errno()) {
	printf("MySQLi connection failed: ", mysqli_connect_error());
	exit();
}

// Change character set to utf8
if (!$mysqli->set_charset('utf8')) {
	printf('Error loading character set utf8: %s\n', $mysqli->error);
}

?>
