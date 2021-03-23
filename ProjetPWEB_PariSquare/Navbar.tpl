<!DOCTYPE html>
<html lang="fr">

<!--Métadonnées -->
<head>
    <meta charset="UTF-8">
    <title>PariSquare - Découvrir Paris, en s'amusant ! </title>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>
    <link rel="stylesheet" type="text/css" href=".\vue\css\bootstrap.css" />
    <link rel="stylesheet" type="text/css" href=".\vue\css\bootstrap.min.css" />
    <link rel="icon" type="image/png" href=".\vue\img\icon.png" />
</head>
<!-- Fin Métadonnées -->
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <img src=".\vue\img\icon.png" width="90" class="d-inline-block align-middle mr-2"></a>
        <a class="navbar-brand" href="index.php?controle=joueurController&action=accueil">PariSquare</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02"
            aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarColor02">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.php?controle=joueurController&action=accueil">Menu
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?controle=joueurController&action=reglesJeu">Règles du jeu</a>
                </li>
            </ul>
            <form class="form-inline my-lg-3">
                <a class="btn btn-secondary my-sm-2 text-dark" type="submit"
                    href="index.php?controle=joueurController&action=inscrireJoueur" role="button">S'inscrire</a>
                <a class="btn btn-secondary ml-1 my-sm-4 text-dark" type="submit"
                    href="index.php?controle=joueurController&action=connectJoueur" role="button">Se connecter</a>
            </form>
        </div>
    </nav>
    <!-- Fin Navbar -->
</body>

</html>