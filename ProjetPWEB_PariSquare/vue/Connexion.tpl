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
    <form class="connexion" action="index.php?controle=joueurController&action=connectJoueur" method="post">
      <fieldset>
        <legend>Connexion</legend>
        <div class="form-group">
          <label for="EmailImput">Adresse mail</label>
          <input name="email" type="email" class="form-control" id="EmailImput" aria-describedby="aideEmail" placeholder="E-mail" value="<?php echo($email); ?>" required />
        </div>
        <div class="form-group">
          <label for="MdpImput">Mot de passe</label>
          <input name="MDP" type="password" class="form-control" id="MdpImput" value="<?php echo($MDP); ?>" required placeholder="Mot de passe" />
        </div>
        <button type="submit" class="btn btn-secondary" value="Se connecter">Se connecter</button>
        <p class="mt-3"><a class="text-muted" href="#">Mot de passe oublié ?</a></p>
      </fieldset>
    </form>
      <h2>Vous n'êtes pas encore inscrit ? Cliquez ici pour vous <a href="index.php?controle=joueurController&action=inscrireJoueur">Inscrire</a></h2>
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