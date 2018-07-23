-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2018 at 01:20 PM
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
  `IdSeance` int(11) NOT NULL,
  `IdEtu` int(11) NOT NULL,
  PRIMARY KEY (`IdAbs`),
  KEY `fk_IdEtu_Abs` (`IdEtu`),
  KEY `fk_IdSeance_Abs` (`IdSeance`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `absence`
--

INSERT INTO `absence` (`IdAbs`, `IdSeance`, `IdEtu`) VALUES
(3, 1, 1),
(4, 2, 2),
(5, 8, 1),
(6, 10, 1),
(11, 15, 2),
(12, 16, 1),
(13, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `IdAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) DEFAULT NULL,
  `Prenom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `fk_IdSem_bultin` (`IdSem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE IF NOT EXISTS `classe` (
  `IdClasse` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) DEFAULT NULL,
  `IdDep` int(11) NOT NULL,
  `IdNiv` int(11) NOT NULL,
  PRIMARY KEY (`IdClasse`),
  KEY `IdDep` (`IdDep`),
  KEY `IdNiv` (`IdNiv`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`IdClasse`, `Nom`, `IdDep`, `IdNiv`) VALUES
(3, 'DUT1 info', 1, 1),
(4, 'DUT1 TR', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `classeec`
--

CREATE TABLE IF NOT EXISTS `classeec` (
  `IdClasse` int(11) NOT NULL,
  `IdEc` int(11) NOT NULL,
  PRIMARY KEY (`IdClasse`,`IdEc`),
  KEY `fk_IdEc_classeec` (`IdEc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classeec`
--

INSERT INTO `classeec` (`IdClasse`, `IdEc`) VALUES
(3, 3),
(3, 4);

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
(1, 'Genie Informatique'),
(2, 'Genie Electrique');

-- --------------------------------------------------------

--
-- Table structure for table `diplôme`
--

CREATE TABLE IF NOT EXISTS `diplôme` (
  `IdDip` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) DEFAULT NULL,
  `IdNiv` int(11) NOT NULL,
  PRIMARY KEY (`IdDip`),
  KEY `fk_IdNiv_Diplome` (`IdNiv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ec`
--

CREATE TABLE IF NOT EXISTS `ec` (
  `IdEc` int(11) NOT NULL AUTO_INCREMENT,
  `Matiere` varchar(30) DEFAULT NULL,
  `IdUe` int(11) NOT NULL,
  `IdClasse` int(11) DEFAULT NULL,
  `IdEns` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdEc`),
  KEY `fk_IdUe_EC` (`IdUe`),
  KEY `IdClasse` (`IdClasse`),
  KEY `IdEns` (`IdEns`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ec`
--

INSERT INTO `ec` (`IdEc`, `Matiere`, `IdUe`, `IdClasse`, `IdEns`) VALUES
(3, 'langage C', 1, 3, 1),
(4, 'algo', 1, 4, 1);

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

--
-- Dumping data for table `ecsemestre`
--

INSERT INTO `ecsemestre` (`IdEc`, `IdSem`) VALUES
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `enseignant`
--

CREATE TABLE IF NOT EXISTS `enseignant` (
  `IdEns` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) DEFAULT NULL,
  `Prenom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdEns`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `enseignant`
--

INSERT INTO `enseignant` (`IdEns`, `Nom`, `Prenom`) VALUES
(1, 'Diop', 'Mr');

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

--
-- Dumping data for table `enseignantclasse`
--

INSERT INTO `enseignantclasse` (`IdEns`, `IdClasse`) VALUES
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `enseignantec`
--

CREATE TABLE IF NOT EXISTS `enseignantec` (
  `IdEns` int(11) NOT NULL,
  `IdEc` int(11) NOT NULL,
  PRIMARY KEY (`IdEns`,`IdEc`),
  KEY `fk_IdEc_enseignantec` (`IdEc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enseignantec`
--

INSERT INTO `enseignantec` (`IdEns`, `IdEc`) VALUES
(1, 3),
(1, 4);

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
  `IdClasse` int(11) NOT NULL,
  `IdNiv` int(11) NOT NULL,
  PRIMARY KEY (`IdEtu`),
  KEY `fk_IdClasse_Etu` (`IdClasse`),
  KEY `fk_IdNiv_Etu` (`IdNiv`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`IdEtu`, `Nom`, `Prenom`, `Adresse`, `Tel`, `DatNes`, `IdClasse`, `IdNiv`) VALUES
(1, 'GUEYE', 'Aliou', 'fann-Dakar', '77 000 00 00', '1996-01-02', 3, 1),
(2, 'FALL', 'Jean ', 'ESP-DAKAR', '77 111 11 11', '1996-05-03', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `identifiant`
--

CREATE TABLE IF NOT EXISTS `identifiant` (
  `IdId` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(30) NOT NULL,
  `motDePasse` varchar(100) NOT NULL,
  `IdAdmin` int(11) DEFAULT NULL,
  `IdEtu` int(11) DEFAULT NULL,
  `IdEns` int(11) DEFAULT NULL,
  `IdSec` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdId`),
  KEY `fk_IdAdmin_Administrateur` (`IdAdmin`),
  KEY `fk_IdEtu_Etudiant` (`IdEtu`),
  KEY `fk_IdEns_Enseignant` (`IdEns`),
  KEY `fk_IdSec_Secretaire` (`IdSec`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `identifiant`
--

INSERT INTO `identifiant` (`IdId`, `Login`, `motDePasse`, `IdAdmin`, `IdEtu`, `IdEns`, `IdSec`) VALUES
(1, 'ens@ens.com', 'passer', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `IdInfo` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(30) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `IdSec` int(11) NOT NULL,
  PRIMARY KEY (`IdInfo`),
  KEY `fk_IdSec_Info` (`IdSec`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `niveau`
--

CREATE TABLE IF NOT EXISTS `niveau` (
  `IdNiv` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdNiv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `niveau`
--

INSERT INTO `niveau` (`IdNiv`, `Nom`) VALUES
(1, 'DUT1'),
(2, 'DUT2');

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

CREATE TABLE IF NOT EXISTS `note` (
  `IdNote` int(11) NOT NULL AUTO_INCREMENT,
  `Cc` double DEFAULT NULL,
  `Ds` double DEFAULT NULL,
  `Tp` double DEFAULT NULL,
  `IdEc` int(11) NOT NULL,
  `IdEtu` int(11) NOT NULL,
  PRIMARY KEY (`IdNote`),
  KEY `fk_IdEc_Note` (`IdEc`),
  KEY `fk_IdEtu_Note` (`IdEtu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `note`
--

INSERT INTO `note` (`IdNote`, `Cc`, `Ds`, `Tp`, `IdEc`, `IdEtu`) VALUES
(8, 12, 15, 12, 3, 2),
(10, 11, 19, 17, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `seancedecours`
--

CREATE TABLE IF NOT EXISTS `seancedecours` (
  `IdSeance` int(11) NOT NULL AUTO_INCREMENT,
  `dat` varchar(100) NOT NULL,
  `IdEc` int(11) NOT NULL,
  PRIMARY KEY (`IdSeance`),
  KEY `IdEc` (`IdEc`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `seancedecours`
--

INSERT INTO `seancedecours` (`IdSeance`, `dat`, `IdEc`) VALUES
(1, '2018-07-09', 3),
(2, '2018-07-05', 4),
(5, '2018-07-05', 3),
(6, '2018-07-05', 3),
(7, '2018-07-28', 3),
(8, '2018-07-16', 3),
(9, '2018-07-16', 3),
(10, '2018-07-04', 3),
(15, '2018-07-02', 3),
(16, '2018-07-22', 3),
(17, '2018-07-23', 3);

-- --------------------------------------------------------

--
-- Table structure for table `secretaire`
--

CREATE TABLE IF NOT EXISTS `secretaire` (
  `IdSec` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) DEFAULT NULL,
  `Prenom` varchar(30) DEFAULT NULL,
  `IdDep` int(11) NOT NULL,
  PRIMARY KEY (`IdSec`),
  KEY `fk_IdDep_Sec` (`IdDep`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `semestre`
--

CREATE TABLE IF NOT EXISTS `semestre` (
  `IdSem` int(11) NOT NULL AUTO_INCREMENT,
  `NomSemestre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdSem`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `semestre`
--

INSERT INTO `semestre` (`IdSem`, `NomSemestre`) VALUES
(1, 'Semestre 1'),
(2, 'Semestre 2');

-- --------------------------------------------------------

--
-- Table structure for table `ue`
--

CREATE TABLE IF NOT EXISTS `ue` (
  `IdUe` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdUe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ue`
--

INSERT INTO `ue` (`IdUe`, `Nom`) VALUES
(1, 'Informatique'),
(2, 'mathematique');

-- --------------------------------------------------------

--
-- Table structure for table `ueniveau`
--

CREATE TABLE IF NOT EXISTS `ueniveau` (
  `IdUe` int(11) NOT NULL,
  `IdNiv` int(11) NOT NULL,
  PRIMARY KEY (`IdUe`,`IdNiv`),
  KEY `fk_IdNiv_UeNiveau` (`IdNiv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `fk_IdEtu_Abs` FOREIGN KEY (`IdEtu`) REFERENCES `etudiant` (`IdEtu`),
  ADD CONSTRAINT `fk_IdSeance_Abs` FOREIGN KEY (`IdSeance`) REFERENCES `seancedecours` (`IdSeance`);

--
-- Constraints for table `bulletin`
--
ALTER TABLE `bulletin`
  ADD CONSTRAINT `fk_IdEtu_bultin` FOREIGN KEY (`IdEtu`) REFERENCES `etudiant` (`IdEtu`),
  ADD CONSTRAINT `fk_IdSem_bultin` FOREIGN KEY (`IdSem`) REFERENCES `semestre` (`IdSem`);

--
-- Constraints for table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `fk_idDep_Classe` FOREIGN KEY (`IdDep`) REFERENCES `departement` (`IdDep`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_IdNIv_classe` FOREIGN KEY (`IdNiv`) REFERENCES `niveau` (`idNiv`) ON UPDATE CASCADE;

--
-- Constraints for table `classeec`
--
ALTER TABLE `classeec`
  ADD CONSTRAINT `fk_Idclasse_classeec` FOREIGN KEY (`IdClasse`) REFERENCES `classe` (`IdClasse`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_IdEc_classeec` FOREIGN KEY (`IdEc`) REFERENCES `ec` (`IdEc`) ON UPDATE CASCADE;

--
-- Constraints for table `diplôme`
--
ALTER TABLE `diplôme`
  ADD CONSTRAINT `fk_IdNiv_Diplome` FOREIGN KEY (`IdNiv`) REFERENCES `niveau` (`idNiv`);

--
-- Constraints for table `ec`
--
ALTER TABLE `ec`
  ADD CONSTRAINT `fk_IdClasse_ec` FOREIGN KEY (`IdClasse`) REFERENCES `classe` (`IdClasse`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_IdUe_EC` FOREIGN KEY (`IdUe`) REFERENCES `ue` (`idUe`);

--
-- Constraints for table `ecsemestre`
--
ALTER TABLE `ecsemestre`
  ADD CONSTRAINT `fk_IdEc_ECSem` FOREIGN KEY (`IdEc`) REFERENCES `ec` (`IdEc`),
  ADD CONSTRAINT `fk_IdSem_ECSem` FOREIGN KEY (`IdSem`) REFERENCES `semestre` (`IdSem`);

--
-- Constraints for table `enseignantclasse`
--
ALTER TABLE `enseignantclasse`
  ADD CONSTRAINT `fk_IdClasse_EnseignantClasse` FOREIGN KEY (`IdClasse`) REFERENCES `classe` (`IdClasse`),
  ADD CONSTRAINT `fk_IdEns_EnseignantClasse` FOREIGN KEY (`IdEns`) REFERENCES `enseignant` (`IdEns`);

--
-- Constraints for table `enseignantec`
--
ALTER TABLE `enseignantec`
  ADD CONSTRAINT `fk_IdEc_enseignantec` FOREIGN KEY (`IdEc`) REFERENCES `ec` (`IdEc`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_IdEtu_enseignantec` FOREIGN KEY (`IdEns`) REFERENCES `enseignant` (`IdEns`) ON UPDATE CASCADE;

--
-- Constraints for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `fk_IdClasse_Etu` FOREIGN KEY (`IdClasse`) REFERENCES `classe` (`IdClasse`),
  ADD CONSTRAINT `fk_IdNiv_Etu` FOREIGN KEY (`IdNiv`) REFERENCES `niveau` (`idNiv`);

--
-- Constraints for table `identifiant`
--
ALTER TABLE `identifiant`
  ADD CONSTRAINT `fk_IdAdmin_Administrateur` FOREIGN KEY (`IdAdmin`) REFERENCES `administrateur` (`IdAdmin`),
  ADD CONSTRAINT `fk_IdEns_Enseignant` FOREIGN KEY (`IdEns`) REFERENCES `enseignant` (`IdEns`),
  ADD CONSTRAINT `fk_IdEtu_Etudiant` FOREIGN KEY (`IdEtu`) REFERENCES `etudiant` (`IdEtu`),
  ADD CONSTRAINT `fk_IdSec_Secretaire` FOREIGN KEY (`IdSec`) REFERENCES `secretaire` (`IdSec`);

--
-- Constraints for table `information`
--
ALTER TABLE `information`
  ADD CONSTRAINT `fk_IdSec_Info` FOREIGN KEY (`IdSec`) REFERENCES `secretaire` (`IdSec`);

--
-- Constraints for table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `fk_IdEc_Note` FOREIGN KEY (`IdEc`) REFERENCES `ec` (`IdEc`),
  ADD CONSTRAINT `fk_IdEtu_Note` FOREIGN KEY (`IdEtu`) REFERENCES `etudiant` (`IdEtu`);

--
-- Constraints for table `secretaire`
--
ALTER TABLE `secretaire`
  ADD CONSTRAINT `fk_IdDep_Sec` FOREIGN KEY (`IdDep`) REFERENCES `departement` (`IdDep`);

--
-- Constraints for table `ueniveau`
--
ALTER TABLE `ueniveau`
  ADD CONSTRAINT `fk_IdNiv_UeNiveau` FOREIGN KEY (`IdNiv`) REFERENCES `niveau` (`idNiv`),
  ADD CONSTRAINT `fk_IdUe_UeNiveau` FOREIGN KEY (`IdUe`) REFERENCES `ue` (`idUe`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
