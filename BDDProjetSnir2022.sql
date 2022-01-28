-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `marchandises`
--

DROP TABLE IF EXISTS `marchandises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marchandises` (
  `idMarchandises` int NOT NULL AUTO_INCREMENT,
  `NomMarchandises` varchar(45) NOT NULL,
  `MarchandisesPrixOriginal` varchar(45) DEFAULT NULL,
  `MarchandisesPrix` varchar(45) DEFAULT NULL,
  `MarchandisesCodeBarre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMarchandises`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marchandises`
--

LOCK TABLES `marchandises` WRITE;
/*!40000 ALTER TABLE `marchandises` DISABLE KEYS */;
/*!40000 ALTER TABLE `marchandises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offres`
--

DROP TABLE IF EXISTS `offres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offres` (
  `idOffres` int NOT NULL AUTO_INCREMENT,
  `OffresType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOffres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offres`
--

LOCK TABLES `offres` WRITE;
/*!40000 ALTER TABLE `offres` DISABLE KEYS */;
/*!40000 ALTER TABLE `offres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offres_has_marchandises`
--

DROP TABLE IF EXISTS `offres_has_marchandises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offres_has_marchandises` (
  `Offres_idOffres` int NOT NULL,
  `Marchandises_idMarchandises` int NOT NULL,
  PRIMARY KEY (`Offres_idOffres`,`Marchandises_idMarchandises`),
  KEY `fk_Offres_has_Marchandises_Marchandises1_idx` (`Marchandises_idMarchandises`),
  KEY `fk_Offres_has_Marchandises_Offres1_idx` (`Offres_idOffres`),
  CONSTRAINT `fk_Offres_has_Marchandises_Marchandises1` FOREIGN KEY (`Marchandises_idMarchandises`) REFERENCES `marchandises` (`idMarchandises`),
  CONSTRAINT `fk_Offres_has_Marchandises_Offres1` FOREIGN KEY (`Offres_idOffres`) REFERENCES `offres` (`idOffres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offres_has_marchandises`
--

LOCK TABLES `offres_has_marchandises` WRITE;
/*!40000 ALTER TABLE `offres_has_marchandises` DISABLE KEYS */;
/*!40000 ALTER TABLE `offres_has_marchandises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payements`
--

DROP TABLE IF EXISTS `payements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payements` (
  `idPayements` int NOT NULL AUTO_INCREMENT,
  `Valeur` varchar(45) NOT NULL,
  `Date` date NOT NULL,
  `PayementsType` varchar(45) NOT NULL,
  PRIMARY KEY (`idPayements`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payements`
--

LOCK TABLES `payements` WRITE;
/*!40000 ALTER TABLE `payements` DISABLE KEYS */;
/*!40000 ALTER TABLE `payements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payements_has_marchandises`
--

DROP TABLE IF EXISTS `payements_has_marchandises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payements_has_marchandises` (
  `Payements_idPayements` int NOT NULL,
  `Marchandises_idMarchandises` int NOT NULL,
  PRIMARY KEY (`Payements_idPayements`,`Marchandises_idMarchandises`),
  KEY `fk_Payements_has_Marchandises_Marchandises1_idx` (`Marchandises_idMarchandises`),
  KEY `fk_Payements_has_Marchandises_Payements1_idx` (`Payements_idPayements`),
  CONSTRAINT `fk_Payements_has_Marchandises_Marchandises1` FOREIGN KEY (`Marchandises_idMarchandises`) REFERENCES `marchandises` (`idMarchandises`),
  CONSTRAINT `fk_Payements_has_Marchandises_Payements1` FOREIGN KEY (`Payements_idPayements`) REFERENCES `payements` (`idPayements`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payements_has_marchandises`
--

LOCK TABLES `payements_has_marchandises` WRITE;
/*!40000 ALTER TABLE `payements_has_marchandises` DISABLE KEYS */;
/*!40000 ALTER TABLE `payements_has_marchandises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rayons`
--

DROP TABLE IF EXISTS `rayons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rayons` (
  `idRayons` int NOT NULL AUTO_INCREMENT,
  `Marchandises_idMarchandises` int NOT NULL,
  `IdBluetooth` varchar(45) NOT NULL,
  PRIMARY KEY (`idRayons`,`Marchandises_idMarchandises`),
  KEY `fk_Rayon_Marchandises_idx` (`Marchandises_idMarchandises`),
  CONSTRAINT `fk_Rayon_Marchandises` FOREIGN KEY (`Marchandises_idMarchandises`) REFERENCES `marchandises` (`idMarchandises`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rayons`
--

LOCK TABLES `rayons` WRITE;
/*!40000 ALTER TABLE `rayons` DISABLE KEYS */;
/*!40000 ALTER TABLE `rayons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateurs` (
  `idUtilisateurs` int NOT NULL AUTO_INCREMENT,
  `Payement_idPayement` int NOT NULL,
  `Prenom` varchar(45) NOT NULL,
  `Nom` varchar(45) NOT NULL,
  `Mail` varchar(45) NOT NULL,
  `Adresse` varchar(45) DEFAULT NULL,
  `DateDeCreation` date NOT NULL,
  `Mdp` varchar(45) NOT NULL,
  `Empreinte` varchar(45) NOT NULL,
  `CarteFidelite` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUtilisateurs`,`Payement_idPayement`),
  KEY `fk_Utilisateurs_Payement1_idx` (`Payement_idPayement`),
  CONSTRAINT `fk_Utilisateurs_Payement1` FOREIGN KEY (`Payement_idPayement`) REFERENCES `payements` (`idPayements`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-28 15:37:14
