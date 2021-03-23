<?php
    $ps=htmlspecialchars($Pseudo);
    $em=htmlspecialchars($email);
    $mot=htmlspecialchars($MDP);
?>

<!DOCTYPE html>
<html lang="fr">
<!--Métadonnées -->
<head>
<meta charset="UTF-8">
</head>
<!-- Fin Métadonnées -->
<body>
  <!-- Navbar -->
    <nav>
        <?php require ("./Navbar.tpl"); ?>
    </nav> 
  <!-- Fin Navbar -->
    <!-- Container -->
  <div class="container pt-2 pb-5">
    <form class="inscription" action="index.php?controle=joueurController&action=inscrireJoueur" method="post">
      <fieldset>
        <legend>Inscription</legend>
        <div class="form-group">
          <label for="PseudoImput">Pseudo</label>
          <input name="Pseudo"  type="text"  class="form-control" id="PseudoImput" aria-describedby="aidePseudo" placeholder="Pseudo" value="<?php echo($ps); ?>" required />
        </div>
        <div class="form-group">
          <label for="EmailImput">Adresse mail</label>
          <input name="email" type="email" class="form-control" id="EmailImput" aria-describedby="aideEmail" placeholder="E-mail" value="<?php echo($em); ?>" required />
          <small id="aideEmail" class="form-text text-muted">Nous nous engageons à ne pas partager votre mail</small>
        </div>
        <div class="form-group">
          <label for="MdpImput">Mot de passe</label>
          <input name="MDP" type="password" class="form-control" id="MdpImput" placeholder="Mot de passe" value="<?php echo($mot); ?>" required />
          <small id="aideMdp" class="form-text text-muted"> Veuillez entrer un mot de passe de 8 caractères minimum et
            de 20 caractères maximum</small>
        </div>
        <button type="submit" class="btn btn-secondary">S'inscrire</button>
        <h2>Vous avez déjà un compte ? <a href="index.php?controle=joueurController&action=connectJoueur">S'identifier</a></h2>
      </fieldset>
    </form>
  </div>
  <!-- Fin Container -->
  <!-- Footer -->
  <footer class="footer fixed-bottom">
    <div class="footer text-center bg-dark">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <p class="text-white lead blockquote-footer py-5">© Par Gamo Christian, Merand Yoann et Souccouchetty
              Darlène</p>
          </div>
        </div>
      </div>
    </div>

  
  </footer>
  <!-- Fin Footer -->
</body>
</html>