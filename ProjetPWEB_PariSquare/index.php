<?php 
session_start();

//Hypothèse 2 paramètres d'entrée, controle et action, avec l'URL de index.php

if (isset($_GET['controle']) & isset($_GET['action'])) {
 	$controle = $_GET['controle'];
	$action= $_GET['action'];
	}
else { //Absence de paramètres : prévoir des valeurs par défaut
	$controle = "joueurController";
	$action= "accueil";
	}
	
//Inclure le fichier .php de contrôle 
//Lancer la fonction-action issue de ce fichier.	

	require ('./controle/' . $controle . '.php');   
	$action(); 
?>
