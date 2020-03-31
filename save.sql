-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: ocpizza
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numero_rue` varchar(20) NOT NULL,
  `type_voie` varchar(20) DEFAULT NULL,
  `nom_rue` varchar(60) NOT NULL,
  `ville` varchar(60) NOT NULL,
  `code_postal` mediumint(8) unsigned NOT NULL,
  `type_batiment` varchar(30) NOT NULL,
  `pays` varchar(60) NOT NULL,
  `commentaire` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,'1','rue','Chantemerle','Poitiers',86000,'villa','France',''),(2,'14 BIS','rue','Gilbert Landry','Mirebeau',86110,'villa','France',''),(3,'9','avenue','Victor Hugo','Bordeaux',33000,'R├®sidence','France','Appartement 6'),(4,'43','Boulevard','Foulques Nerra','Toulouse',31120,'villa','France',''),(5,'22','place','R├®publique','Toulouse',31200,'Commerce','France',''),(6,'16','all├®e','Henri Reneaudeau','Limoges',87000,'Commerce','France','');
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue`
--

DROP TABLE IF EXISTS `catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pizzeria` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_catalogue_pizzeria` (`id_pizzeria`),
  CONSTRAINT `fk_catalogue_pizzeria` FOREIGN KEY (`id_pizzeria`) REFERENCES `pizzeria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue`
--

LOCK TABLES `catalogue` WRITE;
/*!40000 ALTER TABLE `catalogue` DISABLE KEYS */;
INSERT INTO `catalogue` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  `numero_tel` varchar(15) DEFAULT NULL,
  `id_adresse` int(10) unsigned NOT NULL,
  `id_compte` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_adresse` (`id_adresse`),
  KEY `fk_client_compte` (`id_compte`),
  CONSTRAINT `fk_client_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id`),
  CONSTRAINT `fk_client_compte` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Durand','0758412475',1,1),(2,'Le Goff','0641757524',2,2),(3,'Jardinier','0555791245',3,3),(4,'Legrand','0575794416',4,7);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_creation` datetime NOT NULL,
  `statut` varchar(50) NOT NULL,
  `paiement_effectue` tinyint(1) NOT NULL,
  `mode_livraison` varchar(30) NOT NULL,
  `id_paiement` int(10) unsigned NOT NULL,
  `id_client` int(10) unsigned NOT NULL,
  `id_pizzeria` int(10) unsigned NOT NULL,
  `id_adresse` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commande_paiement` (`id_paiement`),
  KEY `fk_commande_client` (`id_client`),
  KEY `fk_commande_pizzeria` (`id_pizzeria`),
  KEY `fk_commande_adresse` (`id_adresse`),
  CONSTRAINT `fk_commande_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id`),
  CONSTRAINT `fk_commande_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
  CONSTRAINT `fk_commande_paiement` FOREIGN KEY (`id_paiement`) REFERENCES `paiement` (`id`),
  CONSTRAINT `fk_commande_pizzeria` FOREIGN KEY (`id_pizzeria`) REFERENCES `pizzeria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,'2020-01-01 10:10:10','en attente de pr├®paration',0,'sur place',1,1,1,1),(2,'2020-03-05 20:54:37','en attente de livraison',1,'├á emporter',2,2,1,2),(3,'2019-12-12 20:54:37','d├®livr├®e',1,'├á emporter',3,3,2,3),(4,'2020-02-03 19:21:12','d├®livr├®e',1,'├á emporter',4,4,2,4);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composition_produit`
--

DROP TABLE IF EXISTS `composition_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composition_produit` (
  `id_produit` int(10) unsigned NOT NULL,
  `id_ingredient` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_produit`,`id_ingredient`),
  KEY `fk_compo_ingredient` (`id_ingredient`),
  CONSTRAINT `fk_compo_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `fk_compo_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composition_produit`
--

LOCK TABLES `composition_produit` WRITE;
/*!40000 ALTER TABLE `composition_produit` DISABLE KEYS */;
INSERT INTO `composition_produit` VALUES (1,1),(1,2),(2,2),(3,2),(1,4),(2,4),(3,4),(4,4),(2,5),(4,5),(4,10),(1,11),(3,11),(5,12),(6,13),(7,14);
/*!40000 ALTER TABLE `composition_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte`
--

DROP TABLE IF EXISTS `compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compte` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte`
--

LOCK TABLES `compte` WRITE;
/*!40000 ALTER TABLE `compte` DISABLE KEYS */;
INSERT INTO `compte` VALUES (1,'durand.patrick@live.fr','bestpassword'),(2,'vincent.legoff@gmail.com','thinkimsafewiththat'),(3,'nelly.jardinier@laposte.net','nelly24700'),(4,'pablo.rossi@live.fr','KJ65SD4F4SDF1S'),(5,'martin.petit@hotmail.com','84SDF5WDFSD4DF'),(6,'tony.leroy@gmail.com','98F7D22F1SDF4G'),(7,'martin.legrand@gmail.com','22F1SDF1DFS65');
/*!40000 ALTER TABLE `compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(80) NOT NULL,
  `unite_mesure` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'sauce tomate','litre'),(2,'jambon','kilo'),(3,'gruy├¿re','kilo'),(4,'mozzarella','kilo'),(5,'cr├¿me fraiche','kilo'),(6,'olvie noire','kilo'),(7,'olvie verte','kilo'),(8,'oeuf','nombre'),(9,'chorizo','kilo'),(10,'saumon fum├®','kilo'),(11,'champignons de paris','kilo'),(12,'th├® glac├®','litre'),(13,'coca','litre'),(14,'cappuccino','litre');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligne_stock`
--

DROP TABLE IF EXISTS `ligne_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ligne_stock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantite_ingredient` mediumint(9) NOT NULL,
  `id_ingredient` int(10) unsigned NOT NULL,
  `id_pizzeria` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_ingredient` (`id_ingredient`),
  KEY `fk_stock_pizzeria` (`id_pizzeria`),
  CONSTRAINT `fk_stock_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `fk_stock_pizzeria` FOREIGN KEY (`id_pizzeria`) REFERENCES `pizzeria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne_stock`
--

LOCK TABLES `ligne_stock` WRITE;
/*!40000 ALTER TABLE `ligne_stock` DISABLE KEYS */;
INSERT INTO `ligne_stock` VALUES (1,10,1,1),(2,9,2,1),(3,10,4,1),(4,10,11,1),(5,7,5,1),(6,10,10,1),(7,7,12,1),(8,7,13,1),(9,7,2,2),(10,4,4,2),(11,5,5,2),(12,10,10,2),(13,10,11,2),(14,7,12,2),(15,7,14,2);
/*!40000 ALTER TABLE `ligne_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paiement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `montant` int(11) NOT NULL,
  `moyen_paiement` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiement`
--

LOCK TABLES `paiement` WRITE;
/*!40000 ALTER TABLE `paiement` DISABLE KEYS */;
INSERT INTO `paiement` VALUES (1,1448,'carte'),(2,999,'esp├¿ces'),(3,5645,'ch├¿que'),(4,2500,'carte');
/*!40000 ALTER TABLE `paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzeria`
--

DROP TABLE IF EXISTS `pizzeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzeria` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_adresse` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pizzeria_adresse` (`id_adresse`),
  CONSTRAINT `fk_pizzeria_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzeria`
--

LOCK TABLES `pizzeria` WRITE;
/*!40000 ALTER TABLE `pizzeria` DISABLE KEYS */;
INSERT INTO `pizzeria` VALUES (1,4),(2,5);
/*!40000 ALTER TABLE `pizzeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(80) NOT NULL,
  `prix` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'Calzone',1050),(2,'Sp├®ciale',1250),(3,'Reine',999),(4,'2 Saumons',1299),(5,'Th├® glac├®',199),(6,'Coca',199),(7,'Cappuccino',149);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits_commandes`
--

DROP TABLE IF EXISTS `produits_commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produits_commandes` (
  `id_commande` int(10) unsigned NOT NULL,
  `id_produit` int(10) unsigned NOT NULL,
  `quantite_produit` smallint(6) NOT NULL,
  PRIMARY KEY (`id_commande`,`id_produit`),
  KEY `fk_produit` (`id_produit`),
  CONSTRAINT `fk_commande` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`),
  CONSTRAINT `fk_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits_commandes`
--

LOCK TABLES `produits_commandes` WRITE;
/*!40000 ALTER TABLE `produits_commandes` DISABLE KEYS */;
INSERT INTO `produits_commandes` VALUES (1,4,1),(1,7,1),(2,3,1),(3,2,2),(3,4,2),(3,5,2),(3,7,1),(4,2,2),(4,7,1);
/*!40000 ALTER TABLE `produits_commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  `type` varchar(30) NOT NULL,
  `id_compte` int(10) unsigned NOT NULL,
  `id_pizzeria` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_staff_compte` (`id_compte`),
  KEY `fk_staff_pizzeria` (`id_pizzeria`),
  CONSTRAINT `fk_staff_compte` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id`),
  CONSTRAINT `fk_staff_pizzeria` FOREIGN KEY (`id_pizzeria`) REFERENCES `pizzeria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Rossi','Pizzaiolo',4,1),(2,'Petit','Responsable',5,1),(3,'Leroy','Livreur',6,2);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-31 11:49:38
