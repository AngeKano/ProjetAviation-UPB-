-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 17 fév. 2022 à 11:42
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
-- Base de données : `aviation`
--

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

DROP TABLE IF EXISTS `avion`;
CREATE TABLE IF NOT EXISTS `avion` (
  `idavion` int(10) NOT NULL,
  `nom` int(11) NOT NULL,
  `capacite` int(11) NOT NULL,
  `taille` int(11) NOT NULL,
  `etat` varchar(12) NOT NULL,
  `idcompagnie` int(10) NOT NULL,
  PRIMARY KEY (`idavion`),
  KEY `idcompagnie` (`idcompagnie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `compagnie`
--

DROP TABLE IF EXISTS `compagnie`;
CREATE TABLE IF NOT EXISTS `compagnie` (
  `idcompagnie` int(10) NOT NULL,
  `nom` varchar(12) NOT NULL,
  `localisation` varchar(12) NOT NULL,
  PRIMARY KEY (`idcompagnie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `piste`
--

DROP TABLE IF EXISTS `piste`;
CREATE TABLE IF NOT EXISTS `piste` (
  `idpiste` int(10) NOT NULL,
  `nom` varchar(12) NOT NULL,
  `distance` int(20) NOT NULL,
  `capacite` int(20) NOT NULL,
  PRIMARY KEY (`idpiste`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `responsable`
--

DROP TABLE IF EXISTS `responsable`;
CREATE TABLE IF NOT EXISTS `responsable` (
  `idresponsable` int(10) NOT NULL,
  `nom` varchar(12) NOT NULL,
  `prenom` varchar(12) NOT NULL,
  `age` int(10) NOT NULL,
  `poste` varchar(12) NOT NULL,
  PRIMARY KEY (`idresponsable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

DROP TABLE IF EXISTS `vol`;
CREATE TABLE IF NOT EXISTS `vol` (
  `idvol` int(10) NOT NULL,
  `idpiste` int(10) NOT NULL,
  `idcompagnie` int(10) NOT NULL,
  `h_depart` time NOT NULL,
  `h_arriver` time NOT NULL,
  `lieu_depart` varchar(12) NOT NULL,
  `lieu_arriver` varchar(12) NOT NULL,
  `idresponsable` int(10) NOT NULL,
  `numpersonnel` int(10) NOT NULL,
  PRIMARY KEY (`idvol`),
  KEY `idpiste` (`idpiste`),
  KEY `idresponsable` (`idresponsable`),
  KEY `idcompagnie` (`idcompagnie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `avion_ibfk_1` FOREIGN KEY (`idcompagnie`) REFERENCES `compagnie` (`idcompagnie`);

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `vol_ibfk_1` FOREIGN KEY (`idpiste`) REFERENCES `piste` (`idpiste`),
  ADD CONSTRAINT `vol_ibfk_2` FOREIGN KEY (`idresponsable`) REFERENCES `responsable` (`idresponsable`),
  ADD CONSTRAINT `vol_ibfk_3` FOREIGN KEY (`idcompagnie`) REFERENCES `compagnie` (`idcompagnie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
