-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 07 juin 2019 à 16:28
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `schoolbdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `anneescolaire`
--

DROP TABLE IF EXISTS `anneescolaire`;
CREATE TABLE IF NOT EXISTS `anneescolaire` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `anneescolaire`
--

INSERT INTO `anneescolaire` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `bulletin`
--

DROP TABLE IF EXISTS `bulletin`;
CREATE TABLE IF NOT EXISTS `bulletin` (
  `id` int(11) NOT NULL,
  `appreciation` varchar(255) COLLATE latin1_bin NOT NULL,
  `trimestreid` int(11) NOT NULL,
  `inscriptionid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trimestreid` (`trimestreid`),
  KEY `bulletin_ibfk_1` (`inscriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE latin1_bin NOT NULL,
  `ecoleid` int(11) NOT NULL,
  `niveauid` int(11) NOT NULL,
  `anneescolaireid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecoleid` (`ecoleid`),
  KEY `niveauid` (`niveauid`),
  KEY `anneescolaireid` (`anneescolaireid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id`, `nom`, `ecoleid`, `niveauid`, `anneescolaireid`) VALUES
(1, 'CM2A', 1, 1, 1),
(2, 'CE1A', 2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `detailbulletin`
--

DROP TABLE IF EXISTS `detailbulletin`;
CREATE TABLE IF NOT EXISTS `detailbulletin` (
  `id` int(11) NOT NULL,
  `appreciation` varchar(255) COLLATE latin1_bin NOT NULL,
  `bulletinid` int(11) NOT NULL,
  `enseignementid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bulletinid` (`bulletinid`),
  KEY `enseignementid` (`enseignementid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Structure de la table `discipline`
--

DROP TABLE IF EXISTS `discipline`;
CREATE TABLE IF NOT EXISTS `discipline` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `discipline`
--

INSERT INTO `discipline` (`id`, `nom`) VALUES
(1, 'Histoire'),
(2, 'Informatique');

-- --------------------------------------------------------

--
-- Structure de la table `ecole`
--

DROP TABLE IF EXISTS `ecole`;
CREATE TABLE IF NOT EXISTS `ecole` (
  `id_ecole` int(11) NOT NULL,
  `nom_ecole` varchar(255) COLLATE latin1_bin NOT NULL,
  `loc_ecole` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id_ecole`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Structure de la table `enseignement`
--

DROP TABLE IF EXISTS `enseignement`;
CREATE TABLE IF NOT EXISTS `enseignement` (
  `id` int(11) NOT NULL,
  `classeid` int(11) NOT NULL,
  `disciplineid` int(11) NOT NULL,
  `personneid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classeid` (`classeid`),
  KEY `disciplineid` (`disciplineid`),
  KEY `personneid` (`personneid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `enseignement`
--

INSERT INTO `enseignement` (`id`, `classeid`, `disciplineid`, `personneid`) VALUES
(1, 1, 1, 96),
(2, 1, 2, 94);

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `id` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `appreciation` varchar(255) COLLATE latin1_bin NOT NULL,
  `detailbulletinid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `detailbulletinid` (`detailbulletinid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `id` int(11) NOT NULL,
  `classeid` int(11) NOT NULL,
  `personneid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `personneid` (`personneid`),
  KEY `classeid` (`classeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `classeid`, `personneid`) VALUES
(1, 1, 1),
(2, 2, 92);

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`id`, `nom`) VALUES
(1, 'CM2'),
(2, 'CE1');

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE latin1_bin NOT NULL,
  `prenom` varchar(255) COLLATE latin1_bin NOT NULL,
  `type` varchar(255) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id`, `nom`, `prenom`, `type`) VALUES
(1, 'Barreira', 'Paulo', 'Etudiant'),
(92, 'Goku', 'Sayan', 'Etudiant'),
(93, 'Son', 'Gohan', 'Etudiant'),
(94, 'Super', 'Luigi', 'Professeur'),
(95, 'Poke', 'Mon', 'Etudiant'),
(96, 'Pika', 'Chu', 'Professeur');

-- --------------------------------------------------------

--
-- Structure de la table `trimestre`
--

DROP TABLE IF EXISTS `trimestre`;
CREATE TABLE IF NOT EXISTS `trimestre` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `debut` date NOT NULL,
  `fin` date NOT NULL,
  `anneescolaireid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `anneescolaireid` (`anneescolaireid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bulletin`
--
ALTER TABLE `bulletin`
  ADD CONSTRAINT `bulletin_ibfk_1` FOREIGN KEY (`inscriptionid`) REFERENCES `inscription` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bulletin_ibfk_2` FOREIGN KEY (`trimestreid`) REFERENCES `trimestre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_2` FOREIGN KEY (`niveauid`) REFERENCES `niveau` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classe_ibfk_3` FOREIGN KEY (`anneescolaireid`) REFERENCES `anneescolaire` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `detailbulletin`
--
ALTER TABLE `detailbulletin`
  ADD CONSTRAINT `detailbulletin_ibfk_1` FOREIGN KEY (`bulletinid`) REFERENCES `bulletin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detailbulletin_ibfk_2` FOREIGN KEY (`enseignementid`) REFERENCES `enseignement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `enseignement`
--
ALTER TABLE `enseignement`
  ADD CONSTRAINT `enseignement_ibfk_1` FOREIGN KEY (`classeid`) REFERENCES `classe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enseignement_ibfk_2` FOREIGN KEY (`disciplineid`) REFERENCES `discipline` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enseignement_ibfk_3` FOREIGN KEY (`personneid`) REFERENCES `personne` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`detailbulletinid`) REFERENCES `detailbulletin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_3` FOREIGN KEY (`personneid`) REFERENCES `personne` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `trimestre`
--
ALTER TABLE `trimestre`
  ADD CONSTRAINT `trimestre_ibfk_1` FOREIGN KEY (`anneescolaireid`) REFERENCES `anneescolaire` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
