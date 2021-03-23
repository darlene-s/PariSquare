<?php


// fonction accueilJoueur : renvoie la page d'accueil d'un joueur connecté
function accueilJoueur()
{
    require("./modele/joueurBD.php");

    require("./vue/AccueilJoueur.tpl");
}
// fonction accueil : renvoie la page d'accueil d'un utilisateur
function accueil()
{
    require("./modele/joueurBD.php");

    require("./vue/Accueil.tpl");
}
// fonction reglesJeu : renvoie la page Regle de jeu d'un utilisateur
function reglesJeu()
{
    require("./modele/joueurBD.php");

    require("./vue/regles/ReglesJeu.tpl");
}
// fonction reglesJeuJoueur : renvoie la page Regle de jeu d'un joueur connecté
function reglesJeuJoueur()
{
    require("./modele/joueurBD.php");

    require("./vue/regles/ReglesJeuJoueur.tpl");
}
// fonction jeuArrondissement : renvoie la page 'Page Jeu Arrondissement' d'un joueur connecté
function jeuArrondissement()
{
    require("./modele/joueurBD.php");

    require("./vue/jeu/PageJeuArrondissement.tpl");
}
// fonction discoverParis : renvoie la page 'Page DiscoverParis' d'un joueur connecté
function discoverParis()
{
    require("./modele/joueurBD.php");

    require("./vue/jeu/PageDiscoverParis.tpl");
}


// On y ajoute les contraintes liés à l'inscription sur le pseudo, l'adresse mail et le mot de passe
function inscrireJoueur()
{

    $Pseudo = isset($_POST['Pseudo']) ? ($_POST['Pseudo']) : '';
    $email = isset($_POST['email']) ? ($_POST['email']) : '';
    $MDP = isset($_POST['MDP']) ? ($_POST['MDP']) : '';
    $msg = '';

    if (count($_POST) == 0)
        require("./vue/Inscription.tpl");
    else {
        $profil = array();
        $inscrit = array();
        require("./modele/joueurBD.php");
        if (verif_mail($email, $profil)) {
            $msg = "Cette adresse mail a déjà été utilisé";
            require("./vue/Inscription.tpl");
        } else {

            if (isset($_POST['Pseudo'], $_POST['email'], $_POST['MDP'])) {
                if (!preg_match("/^[a-zA-Z0-9 ]+$/", $_POST["Pseudo"])) {
                    $msg = "Le pseudo doit être renseigné sans accents ni caractères spéciaux";
                    require("./vue/Inscription.tpl");
                } elseif (strlen($_POST['Pseudo']) > 20) {  // Le pseudo doit faire 20 caractères maxiumum
                    $msg = "Le pseudo ne doit pas dépasser 20 caractères";
                    require("./vue/Inscription.tpl");
                } elseif (strlen($_POST['MDP']) < 8) { // Le mot de passe ne doit pas faire moins de 8 caractères
                    $msg = "Votre mot de passe est trop court !";
                    require('./vue/Inscription.tpl');
                } elseif (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
                    $msg = "L'e-mail saisi n'est pas valide !"; // l'email doit contenir un @ ainsi qu'un point pour être valide
                    require("./vue/Inscription.tpl");
                } else {

                    if (ajt_joueur($Pseudo, $email, $MDP, $inscrit)) { // Lorsque toutes les conditions sont réunis insère le nouveau joueur dans la BD
                        $msg = ("Bonjour! Bienvenue sur GeoSquare $Pseudo !");
                        require("./vue/Connexion.tpl"); // Après avoir appuyé sur le bouton s'inscrire, cela nous envoie sur la page de connexion
                    }
                }
            }
        }
    }
}
// Vérifie les contraintes précisées ci-dessous pour pouvoir se connecter
function connectJoueur()
{
    $email =  isset($_POST['email']) ? ($_POST['email']) : '';
    $MDP =  isset($_POST['MDP']) ? ($_POST['MDP']) : '';
    $msg = '';
    if (count($_POST) == 0)
        require("./vue/Connexion.tpl");

    else {

        require("./modele/joueurBD.php");
        $profil = array();

        if (!connexionJoueur($email, $MDP, $profil)) {
            $msg = "erreur de saisie, l'email ou le mot de passe est incorrect";
            require("./vue/connexion.tpl");
        } else {
            $ID_Joueur = "";
            echo ('ici');
            var_dump($profil);
            $_SESSION['profil'] = $profil;
            foreach ($profil as $p) :
                $ID_Joueur = $p[0];
            endforeach;

            $url = "index.php?controle=joueurController&action=accueilJoueur&ID_Joueur=$ID_Joueur";
            header("Location:" . $url);
        }
    }
}
// Permet de déconnecter le joueur 
function clear_session()
{
    session_unset();
    session_destroy();
    $url = "index.php?controle=joueurController&action=accueil";
    header("Location:" . $url);
}
