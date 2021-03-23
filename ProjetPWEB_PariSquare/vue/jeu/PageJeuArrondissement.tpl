<!DOCTYPE html>
<html lang="fr">
<!--Métadonnées -->
<head>
    <!--Inclusion bibliothèques Leaflet -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
        integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
        crossorigin="" />
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
        integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
        crossorigin=""></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet-ajax/2.1.0/leaflet.ajax.min.js"></script>
    <script src="./geojson/arrondissements.geojson"></script>
    <script src="./geojson/lieux.geojson"></script>
    <meta charset="UTF-8">
</head>
<style>
  mark {
    background-color: black;
    color: white;
  }
  {* CSS pour la map (il faut une hauteur sinon ça apparaît pas) *}
  #carteArrondissement { 
    height: 500px; 
  }
</style>
<!-- Fin Métadonnées -->
<body>
    <!-- Navbar -->
    <nav>
        <?php require ("./NavbarJoueur.tpl"); ?>
    </nav>
    <!-- Fin Navbar -->
    <!-- Container -->
    <div class="jumbotron mb-0">
        <h1 class="display-3 text-center">PariSquare - Découvrir Paris en s'amusant !</h1>
        </h1>
        <hr class="my-5">
        <p class="text-center">Saurez vous retrouver l'arrondissement ?</p>
    </div>
    <!-- Fin Container -->
    <!-- Carte de jeu Arrondissement -->
    <div id="carteArrondissement"></div>
     <!-- Fin carte de jeu Arrondissement -->
    <!-- Footer -->
    <footer class="footer">
        <div class="footer text-center bg-dark">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <p class="text-white lead blockquote-footer py-5">© Par Gamo Christian, Merand Yoann et
                            Souccouchetty
                            Darlène</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
     <!-- Importer le script dans le body sinon ça ne marche pas -->
     <script src="./vue/js/rand.js"> </script>
    <script src="./vue/js/arrondissements.js"> </script>
    <script src="./vue/js/jeuArrondissement.js"></script>
    <!-- Fin Footer -->
</body>
