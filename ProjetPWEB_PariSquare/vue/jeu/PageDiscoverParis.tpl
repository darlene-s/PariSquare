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

    <script src="https://unpkg.com/@esri/arcgis-rest-request@3.0.0/dist/umd/request.umd.js"></script>
    <script src="https://unpkg.com/@esri/arcgis-rest-routing@3.0.0/dist/umd/routing.umd.js"></script>
    <script src="https://unpkg.com/@esri/arcgis-rest-auth@3.0.0/dist/umd/auth.umd.js"></script>

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.2.0/dist/leaflet.css" />
    <meta charset="UTF-8">
</head>
<style>
     #directions {
        position: absolute;
        z-index: 1000;
        width: 30%;
        max-height: 50%;
        right: 20px;
        top: 20px;
        overflow-y: auto; /* Affiche une scrollbar si nécessaire */
        background: white;
        font-family: Arial, Helvetica, Verdana;
        line-height: 1.5;
        font-size: 14px;
        padding: 10px;
      }
    mark {
        background-color: black;
        color: white;
    }

    {* CSS pour la map (il faut une hauteur sinon ça apparaît pas) *}
    #carteDiscoverParis {
        height: 500px;
    }
</style>

<body onload="initialize()">
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
        <div class="text-center">
            <form>
                <fieldset>
                    <legend>Catégories</legend>
                    <div class="form-group text-center">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="mairies" value="mairies"
                                onclick="mairiesDisplay()">
                            <label class="custom-control-label" for="mairies">Mairies</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="monuments" value="monuments"
                                onclick="monumentsDisplay()">
                            <label class="custom-control-label" for="monuments">Monuments</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="gares" value="gares"
                                onclick="garesDisplay()">
                            <label class="custom-control-label" for="gares">Gares</label>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <!-- Fin Container -->
    <!-- Carte Discover Paris-->
    <div id="carteDiscoverParis"></div>
    <!-- Fin carte Discover Paris -->
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
    <script src="./vue/js/discoverParis.js"></script>
    <!-- Fin Footer -->
</body>