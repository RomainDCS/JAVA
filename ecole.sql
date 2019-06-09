-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 20, 2019 at 04:33 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecole`
--

-- --------------------------------------------------------

--
-- Table structure for table `tab_etudiant_etu`
--

DROP TABLE IF EXISTS `tab_etudiant_etu`;
CREATE TABLE IF NOT EXISTS `tab_etudiant_etu` (
  `ETU_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ETU_NAME` varchar(255) NOT NULL,
  `ETU_MAT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ETU_ID`),
  KEY `ETU_MAT_ID` (`ETU_MAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tab_matiere_mat`
--

DROP TABLE IF EXISTS `tab_matiere_mat`;
CREATE TABLE IF NOT EXISTS `tab_matiere_mat` (
  `MAT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MAT_NAME` varchar(255) NOT NULL,
  `MAT_PRO_ID` int(11) NOT NULL,
  PRIMARY KEY (`MAT_ID`),
  KEY `tab_matiere_mat_ibfk_1` (`MAT_PRO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tab_professeur_pro`
--

DROP TABLE IF EXISTS `tab_professeur_pro`;
CREATE TABLE IF NOT EXISTS `tab_professeur_pro` (
  `PRO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRO_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PRO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tab_professeur_pro`
--

INSERT INTO `tab_professeur_pro` (`PRO_ID`, `PRO_NAME`) VALUES
(1, 'Sebastien'),
(2, 'sébastien');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tab_etudiant_etu`
--
ALTER TABLE `tab_etudiant_etu`
  ADD CONSTRAINT `tab_etudiant_etu_ibfk_1` FOREIGN KEY (`ETU_MAT_ID`) REFERENCES `tab_matiere_mat` (`MAT_ID`);

--
-- Constraints for table `tab_matiere_mat`
--
ALTER TABLE `tab_matiere_mat`
  ADD CONSTRAINT `tab_matiere_mat_ibfk_1` FOREIGN KEY (`MAT_PRO_ID`) REFERENCES `tab_professeur_pro` (`PRO_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
