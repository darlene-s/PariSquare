-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 03 Février 2021 à 18:38
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `geosquare`
--

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE `joueur` (
  `ID_Joueur` int(10) NOT NULL,
  `Pseudo` varchar(20) CHARACTER SET utf8 NOT NULL,
  `MDP` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Meilleur_Score` int(10) NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `joueur`
--

INSERT INTO `joueur` (`ID_Joueur`, `Pseudo`, `MDP`, `Meilleur_Score`, `email`) VALUES
(1, 'Patate', '123123123', 0, 'patate@gmail.com'),
(2, 'Test', 'testtest', 0, 'test@gmail.com');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD PRIMARY KEY (`ID_Joueur`);

  -- CREATE OR REPLACE TRIGGER T_SCORE
-- BEFORE INSERT OR UPDATE ON `joueur`
-- FOR EACH ROW 
-- BEGIN
-- IF :OLD.Meilleur_Score < :NEW.Meilleur_Score
-- THEN :OLD.Meilleur_Score = :NEW.Meilleur_Score
-- END IF;
-- END;
--

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `joueur`
--
ALTER TABLE `joueur`
  MODIFY `ID_Joueur` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
