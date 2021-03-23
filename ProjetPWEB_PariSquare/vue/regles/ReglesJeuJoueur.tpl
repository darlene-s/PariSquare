<!DOCTYPE html>
<html lang="fr">

<!--Métadonnées -->
<head>
<meta charset="UTF-8">
</head>
<!-- Fin Métadonnées -->

<body>
<nav>
    <?php require ("./NavbarJoueur.tpl"); ?>
</nav>
<!-- Container -->
  <div class="jumbotron mb-0">
    <h1 class="display-3 text-center">Règles du jeu</h1>
    <hr class="my-5">
    <p class="text-center">Envie de découvrir la ville de Paris ? Avec PariSquare, apprenez en vous amusant !</p>
  </div>
    <div class="container pt-3 w-90">
    <ul class="nav nav-tabs">
      <li class="nav-item">
        <a class="nav-link active  text-dark" data-toggle="tab" href="#regle">Trouver l'arrondissement</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-dark" data-toggle="tab" href="#modes"> Discover Paris</a>
      </li>
    </ul>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade active show pt-4" id="regle">
        <p class="text-justify">
         Connaissez-vous tous les arrondissements de Paris ? Pour savoir si vous êtes un incollable de la géographie, il est temps pour vous de 
         vous confronter au mode de jeu "Trouver l'arrondissement" proposé par PariSquare !
        </p>
      </div>
      <div class="tab-pane fade pt-4" id="modes">
        <p> Quelles informations le mode "Discover Paris" vous fera découvrir ?
          <br>- Les monuments et musées de Paris.
          <br>- Les grandes gares de Paris.
          <br>- Les mairies de Paris
          <br>- Des itinéraires vers vos lieux parisiens favoris !
        </p>
      </div>
    </div>
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