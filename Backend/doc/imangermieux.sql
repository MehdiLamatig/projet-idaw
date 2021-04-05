-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 05 avr. 2021 à 22:30
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `imangermieux`
--

-- --------------------------------------------------------

--
-- Structure de la table `aliments`
--

DROP TABLE IF EXISTS `aliments`;
CREATE TABLE IF NOT EXISTS `aliments` (
  `Code` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) DEFAULT NULL,
  `Nom` varchar(50) NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `aliments`
--

INSERT INTO `aliments` (`Code`, `Type`, `Nom`) VALUES
(1, 'Féculent', 'Riz'),
(2, 'légume', 'carotte'),
(3, 'fruit', 'pomme'),
(4, 'herbe', 'persil'),
(5, 'fruit', 'kiwi'),
(6, 'épice', 'cumin');

-- --------------------------------------------------------

--
-- Structure de la table `apport`
--

DROP TABLE IF EXISTS `apport`;
CREATE TABLE IF NOT EXISTS `apport` (
  `ID_apport` int(11) NOT NULL,
  `Libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_apport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `associer`
--

DROP TABLE IF EXISTS `associer`;
CREATE TABLE IF NOT EXISTS `associer` (
  `Nom` int(11) NOT NULL,
  `ID_apport` int(11) NOT NULL,
  `Ratio` float NOT NULL,
  PRIMARY KEY (`Nom`,`ID_apport`),
  KEY `Associer_Apport0_FK` (`ID_apport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `composer`
--

DROP TABLE IF EXISTS `composer`;
CREATE TABLE IF NOT EXISTS `composer` (
  `Code` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `Quantite` int(11) NOT NULL,
  PRIMARY KEY (`Code`,`ID`),
  KEY `Composer_Repas0_FK` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `composer`
--

INSERT INTO `composer` (`Code`, `ID`, `Quantite`) VALUES
(2, 1, 100);

-- --------------------------------------------------------

--
-- Structure de la table `repas`
--

DROP TABLE IF EXISTS `repas`;
CREATE TABLE IF NOT EXISTS `repas` (
  `ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Heure` time DEFAULT NULL,
  `Login` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Repas_Utilisateur_FK` (`Login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `repas`
--

INSERT INTO `repas` (`ID`, `Date`, `Heure`, `Login`) VALUES
(1, '2021-04-06', '00:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sous_compose`
--

DROP TABLE IF EXISTS `sous_compose`;
CREATE TABLE IF NOT EXISTS `sous_compose` (
  `Nom` int(11) NOT NULL,
  `Nom_Aliments` int(11) NOT NULL,
  `pourcentage` int(11) NOT NULL,
  PRIMARY KEY (`Nom`,`Nom_Aliments`),
  KEY `sous_compose_Aliments0` (`Nom_Aliments`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `Login` int(11) NOT NULL,
  `tranche_d_age` int(11) DEFAULT NULL,
  `sexe` varchar(50) DEFAULT NULL,
  `niv_de_pratique_sportive` varchar(50) DEFAULT NULL,
  `Besoin_energetique` float DEFAULT NULL,
  PRIMARY KEY (`Login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `associer`
--
ALTER TABLE `associer`
  ADD CONSTRAINT `Associer_Aliemets_FK` FOREIGN KEY (`Nom`) REFERENCES `aliments` (`Code`),
  ADD CONSTRAINT `Associer_Apport0_FK` FOREIGN KEY (`ID_apport`) REFERENCES `apport` (`ID_apport`);

--
-- Contraintes pour la table `composer`
--
ALTER TABLE `composer`
  ADD CONSTRAINT `Composer_Aliments_FK` FOREIGN KEY (`Code`) REFERENCES `aliments` (`Code`),
  ADD CONSTRAINT `Composer_Repas0_FK` FOREIGN KEY (`ID`) REFERENCES `repas` (`ID`);

--
-- Contraintes pour la table `repas`
--
ALTER TABLE `repas`
  ADD CONSTRAINT `Repas_Utilisateur_FK` FOREIGN KEY (`Login`) REFERENCES `utilisateur` (`Login`);

--
-- Contraintes pour la table `sous_compose`
--
ALTER TABLE `sous_compose`
  ADD CONSTRAINT `sous_compose_Aliments0` FOREIGN KEY (`Nom_Aliments`) REFERENCES `aliments` (`Code`),
  ADD CONSTRAINT `sous_compose_Aliments_FK` FOREIGN KEY (`Nom`) REFERENCES `aliments` (`Code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
