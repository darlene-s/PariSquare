<?php

// Permet d'inserer un joueur dans la base de donnée. On y insère le Pseudo, l'email ainsi que le mot de passe
function ajt_joueur($Pseudo,$email,$MDP, &$inscrit){
    require("modele/connect.php");
    $sql="INSERT INTO `joueur`(Pseudo, email, MDP, Meilleur_Score) VALUES (:Pseudo, :email, :MDP, 0)";
    
    try{
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':Pseudo', $Pseudo, PDO::PARAM_STR);
        $commande->bindParam(':email', $email, PDO::PARAM_STR);
        $commande->bindParam(':MDP', $MDP, PDO::PARAM_STR);
        $commande->execute();
        
        if($commande->rowCount() > 0){
            $inscrit = $commande->fetch(PDO::FETCH_ASSOC);
            return true;
        }
        else{return false;}
        
    }
    catch(PDOException $e){
        echo utf8_encode("Echec d'insert :" . $e->getMessage() ."\n");
        die();
    }
}

// L'adresse email etant UNIQUE, on utilise celle-ci pour reconnaitre quel utilisateur essaye de se connecter
   function verif_mail($email, &$profil){
        require("modele/connect.php");
        $sql="SELECT * FROM `joueur`WHERE email=:email";
        try{
            $commande =$pdo->prepare($sql);
            $commande->bindParam(':email', $email, PDO::PARAM_STR);
            $commande->execute();
            
            if($commande->rowCount()>0){
                $profil =$commande->fetch(PDO::FETCH_ASSOC);
                return true;
            }
            else{return false;}
        }
        catch (PDOException $e){
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
        }
    }
// Permet à un utilisateur de se connecter sur le site en y insérant son adresse mail et son mot de passe
    function connexionJoueur($email, $MDP, &$profil){
        require("modele/connect.php");
        $sql="SELECT * FROM `joueur` WHERE email=:email AND MDP=:MDP";
        
        try{
            $commande= $pdo->prepare($sql);
            $commande->bindParam(':email', $email, PDO::PARAM_STR);            
            $commande->bindParam(':MDP', $MDP, PDO::PARAM_STR);
            $commande->execute();
            
            if ($commande->rowCount() > 0) {  //compte le nb d'enregistrement
				$profil = $commande->fetchAll(); //svg du profil
				return true;
			}
			else {return false;} 
        }
		
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}  
    }

?>