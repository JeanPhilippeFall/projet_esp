-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2018 at 02:08 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `espaceetu`
--

-- --------------------------------------------------------

--
-- Table structure for table `absence`
--

CREATE TABLE IF NOT EXISTS `absence` (
  `IdAbs` int(11) NOT NULL AUTO_INCREMENT,
  `Dat` date DEFAULT NULL,
  `Matiere` varchar(30) DEFAULT NULL,
  `IdEtu` int(11) NOT NULL,
  PRIMARY KEY (`IdAbs`),
  KEY `fk_IdEtu_Abs` (`IdEtu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `IdAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) DEFAULT NULL,
  `Prenom` varchar(30) DEFAULT NULL,
  `Login` varchar(30) DEFAULT NULL,
  `MotDePasse` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdAdmin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `administrateur`
--

INSERT INTO `administrateur` (`IdAdmin`, `Nom`, `Prenom`, `Login`, `MotDePasse`) VALUES
(1, 'GUEYE', 'AG', 'login', 'passer');

-- --------------------------------------------------------

--
-- Table structure for table `bulletin`
--

CREATE TABLE IF NOT EXISTS `bulletin` (
  `IdBultin` int(11) NOT NULL AUTO_INCREMENT,
  `IdEtu` int(11) NOT NULL,
  `IdSem` int(11) NOT NULL,
  PRIMARY KEY (`IdBultin`),
  KEY `fk_IdEtu_bultin` (`IdEtu`),
  KEY `fk_IdSem` (`IdSem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE IF NOT EXISTS `classe` (
  `IdClasse` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) DEFAULT NULL,
  `IdDep` int(30) NOT NULL,
  PRIMARY KEY (`IdClasse`),
  KEY `fk_IdDep_classe` (`IdDep`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`IdClasse`, `Nom`, `IdDep`) VALUES
(1, 'DUT2 info', 1);

-- --------------------------------------------------------

--
-- Table structure for table `departement`
--

CREATE TABLE IF NOT EXISTS `departement` (
  `IdDep` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdDep`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `departement`
--

INSERT INTO `departement` (`IdDep`, `Nom`) VALUES
(1, 'DGI'),
(2, 'DGE');

-- --------------------------------------------------------

--
-- Table structure for table `ec`
--

CREATE TABLE IF NOT EXISTS `ec` (
  `IdEc` int(11) NOT NULL AUTO_INCREMENT,
  `Cc` varchar(30) DEFAULT NULL,
  `DS` varchar(30) DEFAULT NULL,
  `idEtu` int(11) NOT NULL,
  PRIMARY KEY (`IdEc`),
  UNIQUE KEY `idEtu` (`idEtu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ecclasse`
--

CREATE TABLE IF NOT EXISTS `ecclasse` (
  `IdEc` int(11) NOT NULL,
  `IdClasse` int(11) NOT NULL,
  PRIMARY KEY (`IdEc`,`IdClasse`),
  KEY `fk_IdClasse_ECClasse` (`IdClasse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ecens`
--

CREATE TABLE IF NOT EXISTS `ecens` (
  `IdEc` int(11) NOT NULL,
  `IdEns` int(11) NOT NULL,
  PRIMARY KEY (`IdEc`,`IdEns`),
  KEY `fk_IdEns_ECEns` (`IdEns`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ecsemestre`
--

CREATE TABLE IF NOT EXISTS `ecsemestre` (
  `IdEc` int(11) NOT NULL,
  `IdSem` int(11) NOT NULL,
  PRIMARY KEY (`IdEc`,`IdSem`),
  KEY `fk_IdSem_ECSem` (`IdSem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enseignant`
--

CREATE TABLE IF NOT EXISTS `enseignant` (
  `IdEns` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) DEFAULT NULL,
  `Prenom` varchar(30) DEFAULT NULL,
  `Login` varchar(30) DEFAULT NULL,
  `MotDePasse` varchar(30) DEFAULT NULL,
  `IdAdmin` int(11) NOT NULL,
  PRIMARY KEY (`IdEns`),
  KEY `fk_IdAdmin_Ens` (`IdAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `enseignantclasse`
--

CREATE TABLE IF NOT EXISTS `enseignantclasse` (
  `IdEns` int(11) NOT NULL,
  `IdClasse` int(11) NOT NULL,
  PRIMARY KEY (`IdEns`,`IdClasse`),
  KEY `fk_IdClasse_EnseignantClasse` (`IdClasse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
  `IdEtu` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) DEFAULT NULL,
  `Prenom` varchar(30) DEFAULT NULL,
  `Adresse` varchar(30) DEFAULT NULL,
  `Tel` varchar(30) DEFAULT NULL,
  `DatNes` date DEFAULT NULL,
  `Genre` varchar(30) DEFAULT NULL,
  `Login` varchar(30) DEFAULT NULL,
  `MotDePasse` varchar(30) DEFAULT NULL,
  `IdClasse` int(11) NOT NULL,
  `IdDep` int(11) NOT NULL,
  `IdAdmin` int(11) NOT NULL,
  PRIMARY KEY (`IdEtu`),
  KEY `fk_IdClasse_Etu` (`IdClasse`),
  KEY `fk_IdDep_Etu` (`IdDep`),
  KEY `fk_IdAdmin_Etu` (`IdAdmin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`IdEtu`, `Nom`, `Prenom`, `Adresse`, `Tel`, `DatNes`, `Genre`, `Login`, `MotDePasse`, `IdClasse`, `IdDep`, `IdAdmin`) VALUES
(1, 'GUEYE', 'Aliou', 'fann-Dakar', '77 111 11 11 ', '1996-01-02', 'M', 'alioucbd', 'passer', 1, 1, 1),
(2, 'FALL', 'Jean philippe', 'fann-Dakar', '77 000 00 00', '1996-07-02', 'M', 'jeanPF', 'passer', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `IdInfo` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(30) DEFAULT NULL,
  `Contenu` varchar(30) DEFAULT NULL,
  `IdSec` int(11) NOT NULL,
  PRIMARY KEY (`IdInfo`),
  KEY `fk_IdSec_Info` (`IdSec`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `secretaire`
--

CREATE TABLE IF NOT EXISTS `secretaire` (
  `IdSec` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) DEFAULT NULL,
  `Prenom` varchar(30) DEFAULT NULL,
  `Login` varchar(30) DEFAULT NULL,
  `MotDePasse` varchar(30) DEFAULT NULL,
  `IdAdmin` int(11) NOT NULL,
  PRIMARY KEY (`IdSec`),
  KEY `fk_IdAdmin_Sec` (`IdAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `semestre`
--

CREATE TABLE IF NOT EXISTS `semestre` (
  `IdSem` int(11) NOT NULL AUTO_INCREMENT,
  `NomSemestre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdSem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `fk_IdEtu_Abs` FOREIGN KEY (`IdEtu`) REFERENCES `etudiant` (`IdEtu`) ON UPDATE CASCADE;

--
-- Constraints for table `bulletin`
--
ALTER TABLE `bulletin`
  ADD CONSTRAINT `fk_IdEtu_bultin` FOREIGN KEY (`IdEtu`) REFERENCES `etudiant` (`IdEtu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_IdSem` FOREIGN KEY (`IdSem`) REFERENCES `semestre` (`IdSem`) ON UPDATE CASCADE;

--
-- Constraints for table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `fk_IdDep_classe` FOREIGN KEY (`IdDep`) REFERENCES `departement` (`IdDep`) ON UPDATE CASCADE;

--
-- Constraints for table `ec`
--
ALTER TABLE `ec`
  ADD CONSTRAINT `fk_idEt` FOREIGN KEY (`idEtu`) REFERENCES `etudiant` (`IdEtu`) ON UPDATE CASCADE;

--
-- Constraints for table `ecclasse`
--
ALTER TABLE `ecclasse`
  ADD CONSTRAINT `fk_IdClasse_ECClasse` FOREIGN KEY (`IdClasse`) REFERENCES `classe` (`IdClasse`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_IdECClasse` FOREIGN KEY (`IdEc`) REFERENCES `ec` (`IdEc`) ON UPDATE CASCADE;

--
-- Constraints for table `ecens`
--
ALTER TABLE `ecens`
  ADD CONSTRAINT `fk_IdEc_ECEns` FOREIGN KEY (`IdEc`) REFERENCES `ec` (`IdEc`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_IdEns_ECEns` FOREIGN KEY (`IdEns`) REFERENCES `enseignant` (`IdEns`) ON UPDATE CASCADE;

--
-- Constraints for table `ecsemestre`
--
ALTER TABLE `ecsemestre`
  ADD CONSTRAINT `fk_IdEc_ECSem` FOREIGN KEY (`IdEc`) REFERENCES `ec` (`IdEc`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_IdSem_ECSem` FOREIGN KEY (`IdSem`) REFERENCES `semestre` (`IdSem`) ON UPDATE CASCADE;

--
-- Constraints for table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `fk_IdAdmin_Ens` FOREIGN KEY (`IdAdmin`) REFERENCES `administrateur` (`IdAdmin`) ON UPDATE CASCADE;

--
-- Constraints for table `enseignantclasse`
--
ALTER TABLE `enseignantclasse`
  ADD CONSTRAINT `fk_IdClasse_EnseignantClasse` FOREIGN KEY (`IdClasse`) REFERENCES `classe` (`IdClasse`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_IdEns_EnseignantClasse` FOREIGN KEY (`IdEns`) REFERENCES `enseignant` (`IdEns`) ON UPDATE CASCADE;

--
-- Constraints for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `fk_IdAdmin_Etu` FOREIGN KEY (`IdAdmin`) REFERENCES `administrateur` (`IdAdmin`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_IdClasse_Etu` FOREIGN KEY (`IdClasse`) REFERENCES `classe` (`IdClasse`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_IdDep_Etu` FOREIGN KEY (`IdDep`) REFERENCES `departement` (`IdDep`) ON UPDATE CASCADE;

--
-- Constraints for table `information`
--
ALTER TABLE `information`
  ADD CONSTRAINT `fk_IdSec_Info` FOREIGN KEY (`IdSec`) REFERENCES `secretaire` (`IdSec`) ON UPDATE CASCADE;

--
-- Constraints for table `secretaire`
--
ALTER TABLE `secretaire`
  ADD CONSTRAINT `fk_IdAdmin_Sec` FOREIGN KEY (`IdAdmin`) REFERENCES `administrateur` (`IdAdmin`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
