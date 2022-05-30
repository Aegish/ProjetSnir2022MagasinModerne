-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: magasin
-- ------------------------------------------------------
-- Server version	8.0.25

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
  `NomMarchandises` varchar(100) NOT NULL,
  `MarchandisesPrixOriginal` varchar(45) NOT NULL,
  `MarchandisesPrix` varchar(45) DEFAULT NULL,
  `MarchandisesCodeBarre` varchar(256) DEFAULT NULL,
  `MarchandisesImgId` varchar(2048) DEFAULT NULL,
  `ManchadisesType` varchar(45) NOT NULL,
  `MarchandisesMarque` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMarchandises`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marchandises`
--

LOCK TABLES `marchandises` WRITE;
/*!40000 ALTER TABLE `marchandises` DISABLE KEYS */;
INSERT INTO `marchandises` VALUES (1,'CocaCola','1.88','1.88','CocaColaClassique1,75L','https://firstpizz.fr/wp-content/uploads/2017/03/coca-cola-15l.png','Alimentaire','Coca-cola'),(2,'Machine à café Expresso','316.02','316.02','KRUPS ESSENTIAL NOIRE Machine à café à grain Machine à café broyeur grain Cafetière expresso 2 tasses Nettoyage automatique Buse vapeur Cappuccino YY8125FD','https://m.media-amazon.com/images/I/71ipJQftmEL._AC_SS450_.jpg','Cuisine et Maison','Expresso'),(3,'Sac à dos','35','35','SacADosPack','https://www.mesbagages.com/images/bagages/sac_dos-eastpak-666139.jpg','Sac à dos scolaire','EastPack'),(4,'Sauvage','150','110','Parfumrandom','https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw20feb020/images/hi-res/SKU/SKU_6/421405_swatch.jpg','Produit de beauté','DIOR'),(5,'Apple iPhone XS 64 Go Gris','280','279','Apple iPhone XS 64 Go Gris - Reconditionné - Apple','https://fr.shopping.rakuten.com/photo/1212720395.jpg','Téléphone mobile','Apple'),(6,'LEGO Harry Potter','70','69.99','LEGO Harry Potter - Visite du village de Pré-au-Lard - 76388 - Lego','https://fr.shopping.rakuten.com/photo/76388-visite-du-village-du-pre-au-lard-lego-harry-potter-1983230537_L.jpg','Jouets et Enfant','Lego');
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
  `OffresType` varchar(45) NOT NULL,
  `DateDebutValidite` date NOT NULL,
  `DateExpiration` date NOT NULL,
  `OffresStatuts` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOffres`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offres`
--

LOCK TABLES `offres` WRITE;
/*!40000 ALTER TABLE `offres` DISABLE KEYS */;
INSERT INTO `offres` VALUES (1,'-30%','2022-05-30','2022-06-15',NULL),(11,'-80%','2022-05-31','2022-06-21',NULL),(12,'-20%','2022-05-31','2022-06-21',NULL);
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
INSERT INTO `offres_has_marchandises` VALUES (12,3),(11,4);
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
  `Pseudo` varchar(45) NOT NULL,
  `Mail` varchar(45) NOT NULL,
  `Mdp` varchar(45) NOT NULL,
  `DateDeCreation` date NOT NULL,
  `Type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Client',
  `Prenom` varchar(45) NOT NULL,
  `Nom` varchar(45) NOT NULL,
  `Adresse` varchar(45) DEFAULT NULL,
  `Empreinte` varchar(45) DEFAULT NULL,
  `CarteFidelite` varchar(45) DEFAULT NULL,
  `IdImg` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idUtilisateurs`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (1,'dsqqsd','dsqqsd@fd.cee','ds','2022-03-01','Client','try','r','adsqddqs d23 ','dqsdqsdqsd','dsqdqsdqdqsdqsd',NULL),(2,'test','test@test.fr','test','2022-03-10','Client','test','test','test','test','test',NULL),(3,'Deranger','deranger@mail.com','mdp','2022-03-09','Admin','Beranger','Deranger','undefined',NULL,NULL,NULL),(4,'Lindaforce','lindar@mail.com','mdp','2020-05-15','Admin','Linda','Sylan',NULL,NULL,NULL,NULL),(5,'Aakash','aakash@akash.com','mdp','1999-06-17','Client','Prenom','Aakash',NULL,NULL,NULL,NULL),(6,'Gerant','gerant@gmail.com','Magasin2021-2022','2000-01-01','Gérant','Sielfried','Asthradhïr',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs_has_payements`
--

DROP TABLE IF EXISTS `utilisateurs_has_payements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateurs_has_payements` (
  `utilisateurs_idUtilisateurs` int NOT NULL,
  `payements_idPayements` int NOT NULL,
  PRIMARY KEY (`utilisateurs_idUtilisateurs`,`payements_idPayements`),
  KEY `fk_utilisateurs_has_payements_payements1_idx` (`payements_idPayements`),
  KEY `fk_utilisateurs_has_payements_utilisateurs1_idx` (`utilisateurs_idUtilisateurs`),
  CONSTRAINT `fk_utilisateurs_has_payements_payements1` FOREIGN KEY (`payements_idPayements`) REFERENCES `payements` (`idPayements`),
  CONSTRAINT `fk_utilisateurs_has_payements_utilisateurs1` FOREIGN KEY (`utilisateurs_idUtilisateurs`) REFERENCES `utilisateurs` (`idUtilisateurs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs_has_payements`
--

LOCK TABLES `utilisateurs_has_payements` WRITE;
/*!40000 ALTER TABLE `utilisateurs_has_payements` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateurs_has_payements` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-30 18:02:58
