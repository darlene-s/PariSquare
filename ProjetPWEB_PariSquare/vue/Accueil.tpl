<!DOCTYPE html>
<html lang="fr">

<!--Métadonnées -->

<head>
    <meta charset="UTF-8">
</head>
<!-- Fin Métadonnées -->

<body>
    <style>
        mark {
            background-color: yellow;
            color: white;
        }
    </style>
    <nav>
        <?php  require ("./Navbar.tpl"); ?>
    </nav>
    <style>
        mark {
            background-color: black;
            color: white;
        }
    </style>
    <!-- Container -->
    <div class="jumbotron mb-0">
        <h1 class="display-3 text-center">Bienvenue sur PariSquare !</h1>
        <hr class="my-5">
        <p class="text-center">Envie de découvrir la ville de Paris ? Avec PariSquare, apprenez en vous amusant !</p>
    </div>
    <!-- Fin Container -->
    <!-- Carousel -->
    <div id="carousel" class="carousel slide carousel-fade " data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carousel" data-slide-to="0" class="active"></li>
            <li data-target="#carousel" data-slide-to="1"></li>
            <li data-target="#carousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                <div class="view">
                    <img class="d-block w-100" src="./vue/img/CarteParis.jpg" alt="Premiere slide" width="400"
                        height="1050">
                    <div class="mask rgba-black-light"></div>
                </div>
                <div class="carousel-caption">
                    <h3 class="h3-responsive mb-4"><mark>Arrondissements de Paris</mark></h3>
                    <a class="btn btn-success px-5 py-2" href="index.php?controle=joueurController&action=connectJoueur"
                        role="button"> Jouer </a>
                </div>
            </div>
            <div class="carousel-item">
                <div class="view">
                    <img class="d-block w-100" src="./vue/img/parismap.jpg" alt="Deuxieme slide" width="400"
                        height="1050">
                    <div class="mask rgba-black-strong"></div>
                </div>
                <div class="carousel-caption">
                    <h3 class="h3-responsive mb-4"><mark>Discover Paris</mark></h3>
                    <a class="btn btn-success px-5 py-2" href="index.php?controle=joueurController&action=connectJoueur"
                        role="button">Découvrir</a>
                </div>
            </div>
            <div class="carousel-item">
                <div class="view">
                    <img class="d-block w-100" src="./vue/img/parismap1.jpeg" alt="Troisieme slide" width="400"
                        height="1050">
                    <div class="mask rgba-black-slight"></div>
                </div>
                <div class="carousel-caption">
                    <h3 class="h3-responsive mb-4"><mark>Règles du jeu</mark></h3>
                    <a class="btn btn-success px-5 py-2"
                        href="index.php?controle=joueurController&action=reglesJeuJoueur" role="button"> Consulter </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Fin Carousel -->
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
</body>

</html>