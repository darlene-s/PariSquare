<?php
	
	$hostname = "locahost";	//ou localhost
	$base= "geosquare"; // Le nom de la base de donéne
	#$base="myDBPweb";
	$loginBD= "root";	//ou "root"
	$passBD="root"; // Mot de passe de phpmyadmin

try {

	$pdo = new PDO ("mysql:server=$hostname; dbname=$base", "$loginBD", "$passBD");
	
	
}

catch (PDOException $e) {
	die  ("Echec de connexion : " . $e->getMessage() . "\n");
}



?>