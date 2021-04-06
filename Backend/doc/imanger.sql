-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 06, 2021 at 06:31 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imanger`
--

-- --------------------------------------------------------

--
-- Table structure for table `aliments`
--

CREATE TABLE `aliments` (
  `Code` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aliments`
--

INSERT INTO `aliments` (`Code`, `Nom`, `Type`) VALUES
(0, 'carotte', 'légume'),
(1, 'courgette', 'légume'),
(2, 'concombre', 'salade'),
(4, 'poulet', 'viande'),
(5, 'boeuf', 'viande'),
(6, 'Poisson', 'viande blanche');

-- --------------------------------------------------------

--
-- Table structure for table `apport`
--

CREATE TABLE `apport` (
  `ID_apport` int(11) NOT NULL,
  `Libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `associer`
--

CREATE TABLE `associer` (
  `Code` int(11) NOT NULL,
  `ID_apport` int(11) NOT NULL,
  `Ratio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `composer`
--

CREATE TABLE `composer` (
  `Code` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `Quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `composer`
--

INSERT INTO `composer` (`Code`, `ID`, `Quantite`) VALUES
(1, 5, 20),
(4, 1, 250),
(5, 3, 250),
(6, 4, 150);

-- --------------------------------------------------------

--
-- Table structure for table `repas`
--

CREATE TABLE `repas` (
  `ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Heure` time DEFAULT NULL,
  `Login` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `repas`
--

INSERT INTO `repas` (`ID`, `Date`, `Heure`, `Login`) VALUES
(1, '2021-04-14', '20:00:00', NULL),
(3, '2021-04-06', '23:00:00', NULL),
(4, '2021-04-07', '13:00:00', NULL),
(5, '2021-04-09', '14:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sous_compose`
--

CREATE TABLE `sous_compose` (
  `Nom` int(11) NOT NULL,
  `Nom_Aliments` int(11) NOT NULL,
  `Nom_Aliments_sous_compose` int(11) NOT NULL,
  `Nom_Aliments_sous_compose_1` int(11) NOT NULL,
  `Ratio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `Login` int(11) NOT NULL,
  `tranche_d_age` int(11) DEFAULT NULL,
  `sexe` varchar(50) DEFAULT NULL,
  `niv_de_pratique_sportive` varchar(50) DEFAULT NULL,
  `Besoin_energetique` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aliments`
--
ALTER TABLE `aliments`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `apport`
--
ALTER TABLE `apport`
  ADD PRIMARY KEY (`ID_apport`);

--
-- Indexes for table `associer`
--
ALTER TABLE `associer`
  ADD PRIMARY KEY (`Code`,`ID_apport`),
  ADD KEY `Associer_Apport0_FK` (`ID_apport`);

--
-- Indexes for table `composer`
--
ALTER TABLE `composer`
  ADD PRIMARY KEY (`Code`,`ID`),
  ADD KEY `Composer_Repas0_FK` (`ID`);

--
-- Indexes for table `repas`
--
ALTER TABLE `repas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Repas_Utilisateur_FK` (`Login`);

--
-- Indexes for table `sous_compose`
--
ALTER TABLE `sous_compose`
  ADD PRIMARY KEY (`Nom`,`Nom_Aliments`,`Nom_Aliments_sous_compose`,`Nom_Aliments_sous_compose_1`),
  ADD KEY `sous_compose_Aliments0_FK` (`Nom_Aliments`),
  ADD KEY `sous_compose_Aliments1_FK` (`Nom_Aliments_sous_compose`),
  ADD KEY `sous_compose_Aliments2_FK` (`Nom_Aliments_sous_compose_1`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`Login`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `associer`
--
ALTER TABLE `associer`
  ADD CONSTRAINT `Associer_Aliments_FK` FOREIGN KEY (`Code`) REFERENCES `aliments` (`Code`),
  ADD CONSTRAINT `Associer_Apport0_FK` FOREIGN KEY (`ID_apport`) REFERENCES `apport` (`ID_apport`);

--
-- Constraints for table `composer`
--
ALTER TABLE `composer`
  ADD CONSTRAINT `Composer_Aliments_FK` FOREIGN KEY (`Code`) REFERENCES `aliments` (`Code`),
  ADD CONSTRAINT `Composer_Repas0_FK` FOREIGN KEY (`ID`) REFERENCES `repas` (`ID`);

--
-- Constraints for table `repas`
--
ALTER TABLE `repas`
  ADD CONSTRAINT `Repas_Utilisateur_FK` FOREIGN KEY (`Login`) REFERENCES `utilisateur` (`Login`);

--
-- Constraints for table `sous_compose`
--
ALTER TABLE `sous_compose`
  ADD CONSTRAINT `sous_compose_Aliments0_FK` FOREIGN KEY (`Nom_Aliments`) REFERENCES `aliments` (`Code`),
  ADD CONSTRAINT `sous_compose_Aliments1_FK` FOREIGN KEY (`Nom_Aliments_sous_compose`) REFERENCES `aliments` (`Code`),
  ADD CONSTRAINT `sous_compose_Aliments2_FK` FOREIGN KEY (`Nom_Aliments_sous_compose_1`) REFERENCES `aliments` (`Code`),
  ADD CONSTRAINT `sous_compose_Aliments_FK` FOREIGN KEY (`Nom`) REFERENCES `aliments` (`Code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
