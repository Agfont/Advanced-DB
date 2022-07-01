-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: e-commerce_company
-- ------------------------------------------------------
-- Server version	8.0.23

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

DROP SCHEMA IF EXISTS `e-commerce_company` ;
CREATE SCHEMA IF NOT EXISTS `e-commerce_company` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `e-commerce_company` ;

--
-- Table structure for table `acabado`
--

DROP TABLE IF EXISTS `acabado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acabado` (
  `idAcabado` int NOT NULL AUTO_INCREMENT,
  `nombreAcabado` varchar(45) NOT NULL,
  `idMaterial` int NOT NULL,
  `idColor` int NOT NULL,
  PRIMARY KEY (`idAcabado`),
  UNIQUE KEY `idAcabado_UNIQUE` (`idAcabado`),
  UNIQUE KEY `nombreAcabado_UNIQUE` (`nombreAcabado`),
  KEY `AcabadoIdMaterial_idx` (`idMaterial`),
  KEY `AcabadoIdColor_idx` (`idColor`),
  CONSTRAINT `AcabadoIdColor` FOREIGN KEY (`idColor`) REFERENCES `color` (`idColor`),
  CONSTRAINT `AcabadoIdMaterial` FOREIGN KEY (`idMaterial`) REFERENCES `material` (`idMaterial`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acabado`
--

LOCK TABLES `acabado` WRITE;
/*!40000 ALTER TABLE `acabado` DISABLE KEYS */;
INSERT INTO `acabado` VALUES (1,'Blanco Alpino',1,8),(2,'Negro',1,7),(3,'Latón Antik',5,1),(4,'Le corbusier Blanc',1,6),(5,'Antracita',3,1);
/*!40000 ALTER TABLE `acabado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen` (
  `idAlmacen` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  PRIMARY KEY (`idAlmacen`),
  UNIQUE KEY `idAlmacen_UNIQUE` (`idAlmacen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,'Hauptquartier','Avda. el Pla, 9','Lliçà de Vall','Barcelona'),(2,'Erste Abteilung','Calle Río Jarama, 40','Toledo','Toledo'),(3,'Zweite Abteilung','Calle 6, 19','Santovenia de la Valdocina','León');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(45) NOT NULL,
  `idComercial` int NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `idCliente_UNIQUE` (`idCliente`),
  KEY `ClienteDni_idx` (`dni`),
  KEY `ClienteIdComercial_idx` (`idComercial`),
  CONSTRAINT `ClienteDni` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`),
  CONSTRAINT `ClienteIdComercial` FOREIGN KEY (`idComercial`) REFERENCES `comercial` (`idComercial`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'98742964A',1),(2,'53248917D',2),(3,'32245437E',2),(4,'63209876R',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `idColor` int NOT NULL AUTO_INCREMENT,
  `nombreColor` varchar(45) NOT NULL,
  `colorHEX` varchar(6) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idColor`),
  UNIQUE KEY `idColor_UNIQUE` (`idColor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'N/A','0','Color vacío para materiales especiales.'),(2,'VERDE','00FF00','Color verde intenso'),(3,'AZUL','0000FF','Color azul intenso'),(4,'ROJO','FF0000','Color rojo intenso'),(5,'Rouge Vermillion','9C2128','Le Corbusier. The cinnabar red. A fiery shade which catches the eye and reduces the space.'),(6,'Blanc','FFF1CE','Le Corbusier. The cream white. Balanced, with stable aesthetics. The first mural \'Velvet\' shade.'),(7,'NEGRO','0','Color negro intenso.'),(8,'BLANCO ALPINO','FFFFFF','Color blanco intenso.');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comercial`
--

DROP TABLE IF EXISTS `comercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercial` (
  `idComercial` int NOT NULL,
  `oficina` varchar(50) NOT NULL,
  `telefonoEmpresa` int DEFAULT NULL,
  PRIMARY KEY (`idComercial`),
  UNIQUE KEY `dni_UNIQUE` (`idComercial`),
  CONSTRAINT `ComercialIdComercialIdTrabajador` FOREIGN KEY (`idComercial`) REFERENCES `trabajador` (`idTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercial`
--

LOCK TABLES `comercial` WRITE;
/*!40000 ALTER TABLE `comercial` DISABLE KEYS */;
INSERT INTO `comercial` VALUES (1,'Via Augusta, 124, Barcelona',966755423),(2,'Via Augusta, 124, Barcelona',698784512);
/*!40000 ALTER TABLE `comercial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compatibilidad`
--

DROP TABLE IF EXISTS `compatibilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compatibilidad` (
  `idCompatibilidad` int NOT NULL AUTO_INCREMENT,
  `idMarco` int NOT NULL,
  `idTapa` int NOT NULL,
  PRIMARY KEY (`idCompatibilidad`),
  UNIQUE KEY `TapaMarco` (`idTapa`,`idMarco`),
  KEY `CompatibilidadIdMarco` (`idMarco`),
  CONSTRAINT `CompatibilidadIdMarco` FOREIGN KEY (`idMarco`) REFERENCES `marco` (`idMarco`),
  CONSTRAINT `CompatibilidadIdTapa` FOREIGN KEY (`idTapa`) REFERENCES `tapa` (`idTapa`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compatibilidad`
--

LOCK TABLES `compatibilidad` WRITE;
/*!40000 ALTER TABLE `compatibilidad` DISABLE KEYS */;
INSERT INTO `compatibilidad` VALUES (1,1,2),(3,3,2),(2,1,4),(4,3,4),(5,5,6),(7,7,6),(6,5,8),(8,7,8);
/*!40000 ALTER TABLE `compatibilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encargo`
--

DROP TABLE IF EXISTS `encargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encargo` (
  `idEncargo` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `fechaEncargo` datetime NOT NULL,
  `completo` enum('Entregado','Parcialmente entregado','No entregado') NOT NULL DEFAULT 'No entregado',
  PRIMARY KEY (`idEncargo`),
  UNIQUE KEY `idEncargo_UNIQUE` (`idEncargo`),
  KEY `EncargoIdCliente` (`idCliente`),
  CONSTRAINT `EncargoIdCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encargo`
--

LOCK TABLES `encargo` WRITE;
/*!40000 ALTER TABLE `encargo` DISABLE KEYS */;
INSERT INTO `encargo` VALUES (1,1,'2021-05-10 00:00:00','Entregado'),(2,1,'2021-06-03 00:00:00','Parcialmente entregado'),(5,1,'2021-06-04 17:03:27','No entregado'),(6,3,'2021-06-07 16:43:54','Parcialmente entregado');
/*!40000 ALTER TABLE `encargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `idEntrega` int NOT NULL AUTO_INCREMENT,
  `idTransportista` int NOT NULL,
  `fechaEntrega` datetime NOT NULL,
  PRIMARY KEY (`idEntrega`),
  UNIQUE KEY `idEntrega_UNIQUE` (`idEntrega`),
  KEY `EntragaIdTransportista_idx` (`idTransportista`),
  CONSTRAINT `EntragaIdTransportista` FOREIGN KEY (`idTransportista`) REFERENCES `transportista` (`idTransportista`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (1,3,'2021-05-12 00:00:00'),(2,3,'2021-05-15 00:00:00'),(3,3,'2021-06-03 00:00:00');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factordeforma`
--

DROP TABLE IF EXISTS `factordeforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factordeforma` (
  `idFactorDeForma` int NOT NULL AUTO_INCREMENT,
  `idMecanismo` int NOT NULL,
  `idTapa` int NOT NULL,
  PRIMARY KEY (`idFactorDeForma`),
  UNIQUE KEY `TapaMecanismo` (`idMecanismo`,`idTapa`) /*!80000 INVISIBLE */,
  KEY `FactorDeFormaIdTapa_idx` (`idTapa`) /*!80000 INVISIBLE */,
  CONSTRAINT `FactorDeFormaIdMecanismo` FOREIGN KEY (`idMecanismo`) REFERENCES `mecanismo` (`idMecanismo`),
  CONSTRAINT `FactorDeFormaIdTapa` FOREIGN KEY (`idTapa`) REFERENCES `tapa` (`idTapa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factordeforma`
--

LOCK TABLES `factordeforma` WRITE;
/*!40000 ALTER TABLE `factordeforma` DISABLE KEYS */;
INSERT INTO `factordeforma` VALUES (1,11,2),(2,11,4),(3,11,6),(4,11,8),(5,13,14);
/*!40000 ALTER TABLE `factordeforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interfono`
--

DROP TABLE IF EXISTS `interfono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interfono` (
  `idInterfono` int NOT NULL,
  `idColor` int NOT NULL,
  PRIMARY KEY (`idInterfono`),
  UNIQUE KEY `idInterfono_UNIQUE` (`idInterfono`),
  KEY `InterfonoIdColor_idx` (`idColor`),
  CONSTRAINT `InterfonoIdColor` FOREIGN KEY (`idColor`) REFERENCES `color` (`idColor`),
  CONSTRAINT `InterfonoIdInterfonoIdProducto` FOREIGN KEY (`idInterfono`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interfono`
--

LOCK TABLES `interfono` WRITE;
/*!40000 ALTER TABLE `interfono` DISABLE KEYS */;
INSERT INTO `interfono` VALUES (12,8);
/*!40000 ALTER TABLE `interfono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineaencargo`
--

DROP TABLE IF EXISTS `lineaencargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineaencargo` (
  `idLineaEncargo` int NOT NULL AUTO_INCREMENT,
  `idEncargo` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidad` int NOT NULL,
  `completo` enum('Entregado','Parcialmente entregado','No entregado') NOT NULL DEFAULT 'No entregado',
  PRIMARY KEY (`idLineaEncargo`),
  KEY `LineaDeEncargoIdProducto_idx` (`idProducto`),
  KEY `LineaEncargoIdEncargo` (`idEncargo`),
  CONSTRAINT `LineaEncargoIdEncargo` FOREIGN KEY (`idEncargo`) REFERENCES `encargo` (`idEncargo`),
  CONSTRAINT `LineaEncargoIdProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineaencargo`
--

LOCK TABLES `lineaencargo` WRITE;
/*!40000 ALTER TABLE `lineaencargo` DISABLE KEYS */;
INSERT INTO `lineaencargo` VALUES (1,1,1,10,'Entregado'),(2,1,2,5,'Entregado'),(3,1,11,5,'Entregado'),(4,1,9,5,'Entregado'),(5,2,5,40,'Parcialmente entregado'),(6,2,6,25,'No entregado'),(7,2,11,25,'No entregado'),(8,2,10,15,'Entregado'),(9,6,12,5,'Entregado'),(10,6,4,20,'No entregado'),(11,6,3,20,'No entregado');
/*!40000 ALTER TABLE `lineaencargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineaentrega`
--

DROP TABLE IF EXISTS `lineaentrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineaentrega` (
  `idLineaEntrega` int NOT NULL AUTO_INCREMENT,
  `idEntrega` int NOT NULL,
  `idProducto` int NOT NULL,
  `idLineaEncargo` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`idLineaEntrega`),
  KEY `LineaDeEntregaIdProducto_idx` (`idProducto`),
  KEY `LineaEntregaIdLineaEncargo_idx` (`idLineaEncargo`),
  KEY `LineaEntregaIdEntrega` (`idEntrega`),
  CONSTRAINT `LineaEntregaIdEntrega` FOREIGN KEY (`idEntrega`) REFERENCES `entrega` (`idEntrega`),
  CONSTRAINT `LineaEntregaIdLineaEncargo` FOREIGN KEY (`idLineaEncargo`) REFERENCES `lineaencargo` (`idLineaEncargo`),
  CONSTRAINT `LineaEntregaIdProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`),
  CONSTRAINT `PedidoFabricaIdLineaEncargo` FOREIGN KEY (`idLineaEncargo`) REFERENCES `lineaencargo` (`idLineaEncargo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineaentrega`
--

LOCK TABLES `lineaentrega` WRITE;
/*!40000 ALTER TABLE `lineaentrega` DISABLE KEYS */;
INSERT INTO `lineaentrega` VALUES (1,1,1,1,10),(2,1,2,2,5),(3,2,11,3,5),(4,2,9,4,5),(5,3,5,5,15),(6,3,10,8,15),(7,3,12,9,5);
/*!40000 ALTER TABLE `lineaentrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marco`
--

DROP TABLE IF EXISTS `marco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marco` (
  `idMarco` int NOT NULL,
  `idSerieAcabado` int NOT NULL,
  PRIMARY KEY (`idMarco`),
  UNIQUE KEY `idMarco_UNIQUE` (`idMarco`),
  KEY `MarcoIdSerieAcabado_idx` (`idSerieAcabado`),
  CONSTRAINT `MarcoIdMarcoIdProducto` FOREIGN KEY (`idMarco`) REFERENCES `producto` (`id`),
  CONSTRAINT `MarcoIdSerieAcabado` FOREIGN KEY (`idSerieAcabado`) REFERENCES `serieacabado` (`idSerieAcabado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marco`
--

LOCK TABLES `marco` WRITE;
/*!40000 ALTER TABLE `marco` DISABLE KEYS */;
INSERT INTO `marco` VALUES (1,1),(3,9),(7,11),(5,12);
/*!40000 ALTER TABLE `marco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `idMaterial` int NOT NULL AUTO_INCREMENT,
  `nombreMaterial` varchar(45) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idMaterial`),
  UNIQUE KEY `idMaterial_UNIQUE` (`idMaterial`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'Termoplástico','Material resistente a golpes y a la meteorología.'),(2,'Aluminio','Material tradicional con un tacto frío y sofisticado.'),(3,'Antracita','Aluminio lacado con el color característico de la antracita.'),(4,'Latón Classic','Material resistente con un color dorado que no se mancha.'),(5,'Latón Antik','Material resistente con un color amaderado que no se mancha.');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanismo`
--

DROP TABLE IF EXISTS `mecanismo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanismo` (
  `idMecanismo` int NOT NULL,
  `tipoMecanismo` enum('Interruptor','Enchufe Schuko','eNet','Ethernet','Smart TV') NOT NULL,
  PRIMARY KEY (`idMecanismo`),
  UNIQUE KEY `idMecanismo_UNIQUE` (`idMecanismo`),
  CONSTRAINT `MecanismoIdMecanismoIdProducto` FOREIGN KEY (`idMecanismo`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanismo`
--

LOCK TABLES `mecanismo` WRITE;
/*!40000 ALTER TABLE `mecanismo` DISABLE KEYS */;
INSERT INTO `mecanismo` VALUES (9,'Enchufe Schuko'),(10,'Enchufe Schuko'),(11,'Interruptor'),(13,'Smart TV');
/*!40000 ALTER TABLE `mecanismo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidofabrica`
--

DROP TABLE IF EXISTS `pedidofabrica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidofabrica` (
  `idPedidoFabrica` int NOT NULL AUTO_INCREMENT,
  `idAlmacen` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidad` int NOT NULL,
  `fechaPedidoFabrica` datetime NOT NULL,
  `idLineaEncargo` int DEFAULT NULL,
  PRIMARY KEY (`idPedidoFabrica`),
  UNIQUE KEY `idPedidoFabrica_UNIQUE` (`idPedidoFabrica`),
  KEY `PedidoFacricaIdAlmacen_idx` (`idAlmacen`),
  KEY `PedidoFabricaIdProducto_idx` (`idProducto`),
  KEY `PedidoFabricaIdLineaEncargo_idx` (`idLineaEncargo`),
  CONSTRAINT `PedidoFabricaIdProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`),
  CONSTRAINT `PedidoFacricaIdAlmacen` FOREIGN KEY (`idAlmacen`) REFERENCES `almacen` (`idAlmacen`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidofabrica`
--

LOCK TABLES `pedidofabrica` WRITE;
/*!40000 ALTER TABLE `pedidofabrica` DISABLE KEYS */;
INSERT INTO `pedidofabrica` VALUES (1,2,10,235,'2021-06-03 00:00:00',NULL),(2,2,3,20,'2021-06-07 16:44:03',11),(3,2,4,20,'2021-06-07 16:44:03',10),(4,3,12,60,'2021-07-08 09:10:43',NULL);
/*!40000 ALTER TABLE `pedidofabrica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `dni` varchar(9) NOT NULL,
  `nombreCompleto` varchar(200) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `idPersona_UNIQUE` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('32245437E','Rafael Saez','Calle del Call, 17','Barcelona','Barcelona',974637476),('53248917D','Lucy Winchester','Calle Blai, 73','Barcelona','Barcelona',954641235),('56562745D','Thomas Müller','Calle Príncipe, 23','León','León',946653456),('56789775B','Avril Smith','Calle Viladomat, 40','Barcelona','Barcelona',956438753),('63209876R','Irene Lozano','Calle del Call, 23','Barcelona','Barcelona',970239701),('65675463F','Max Becker','Calle Asturias, 45','Barcelona','Barcelona',974563546),('65740123B','Naomi Bristol','Calle Verdi, 32','Barcelona','Barcelona',972958312),('98742964A','John Doe','Avda. Carlos III, 10','Toledo','Nambroca',986285478);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` float(8,2) NOT NULL,
  `stock` int NOT NULL,
  `fechaDiscontinuidad` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idProducto_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Marco blanco LS 981 WW',5.34,2,NULL),(2,'Tecla blanca simple LS 990 WW',2.26,2,NULL),(3,'Marco LeCorbusier Blanc LC 981 BL',8.66,12,NULL),(4,'Tecla LeCorbusier Blanc LC 990 BL',4.68,6,NULL),(5,'Marco Latón Classic CDP 581 LK',2.43,3,NULL),(6,'Tecla Latón Classic CDP 590 LK',1.65,2,'2020-12-01 00:00:00'),(7,'Marco Latón Classic CD 581 LK',2.20,3,NULL),(8,'Tecla Latón Classic CD 590 LK',1.39,8,NULL),(9,'Enchufe Schuko Blanco LS 1520 WW',5.34,2,NULL),(10,'Enchufe Schuko Latón CD 1520 LK ',5.34,1,NULL),(11,'Mecanismo tecla simple',2.47,4,NULL),(12,'Interfono blanco LS 627 WW',125.54,2,NULL),(13,'Mecanismo SmartTV',12.64,5,NULL),(14,'Cobertor SmartTV',0.40,2,NULL),(15,'Brilliant Watch',250.00,2,NULL),(16,'Old fashion cellphone',24.00,2,NULL),(17,'Modern iPhone',1000.00,2,NULL),(18,'Beautiful Sunglasses',12.00,2,NULL),(19,'Stylish Cup',8.00,2,NULL),(20,'Herb caps',12.00,2,NULL),(21,'Audiophile Headphones',550.00,2,NULL),(22,'Digital Camera',225.00,2,NULL),(23,'Empty Bluray Disc',5.00,2,NULL),(24,'256BG Pendrive',60.00,2,NULL);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serie`
--

DROP TABLE IF EXISTS `serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serie` (
  `idSerie` int NOT NULL AUTO_INCREMENT,
  `nombreSerie` varchar(45) NOT NULL,
  PRIMARY KEY (`idSerie`),
  UNIQUE KEY `idSerie_UNIQUE` (`idSerie`),
  UNIQUE KEY `nombreSerie_UNIQUE` (`nombreSerie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serie`
--

LOCK TABLES `serie` WRITE;
/*!40000 ALTER TABLE `serie` DISABLE KEYS */;
INSERT INTO `serie` VALUES (3,'CD 500'),(4,'CD Plus'),(1,'LS 990'),(2,'LS 990 Zero');
/*!40000 ALTER TABLE `serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serieacabado`
--

DROP TABLE IF EXISTS `serieacabado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serieacabado` (
  `idSerieAcabado` int NOT NULL AUTO_INCREMENT,
  `idAcabado` int NOT NULL,
  `idSerie` int NOT NULL,
  PRIMARY KEY (`idSerieAcabado`),
  UNIQUE KEY `SerieAcabadoUnique` (`idAcabado`,`idSerie`) /*!80000 INVISIBLE */,
  KEY `SerieAcabadoIdAcabado_idx` (`idAcabado`) /*!80000 INVISIBLE */,
  KEY `SerieAcabadoIdSerie_idx` (`idSerie`),
  CONSTRAINT `SerieAcabadoIdAcabado` FOREIGN KEY (`idAcabado`) REFERENCES `acabado` (`idAcabado`),
  CONSTRAINT `SerieAcabadoIdSerie` FOREIGN KEY (`idSerie`) REFERENCES `serie` (`idSerie`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serieacabado`
--

LOCK TABLES `serieacabado` WRITE;
/*!40000 ALTER TABLE `serieacabado` DISABLE KEYS */;
INSERT INTO `serieacabado` VALUES (1,1,1),(2,2,1),(3,1,2),(4,2,2),(5,1,3),(6,2,3),(7,1,4),(8,2,4),(9,4,1),(10,4,2),(11,3,3),(12,3,4);
/*!40000 ALTER TABLE `serieacabado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tapa`
--

DROP TABLE IF EXISTS `tapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tapa` (
  `idTapa` int NOT NULL,
  `idSerieAcabado` int NOT NULL,
  PRIMARY KEY (`idTapa`),
  UNIQUE KEY `idTapa_UNIQUE` (`idTapa`),
  KEY `TapaIdSerieAcabado_idx` (`idSerieAcabado`),
  CONSTRAINT `TapaIdSerieAcabado` FOREIGN KEY (`idSerieAcabado`) REFERENCES `serieacabado` (`idSerieAcabado`),
  CONSTRAINT `TapaIdTapaIdProducto` FOREIGN KEY (`idTapa`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tapa`
--

LOCK TABLES `tapa` WRITE;
/*!40000 ALTER TABLE `tapa` DISABLE KEYS */;
INSERT INTO `tapa` VALUES (2,1),(14,1),(4,9),(8,11),(6,12);
/*!40000 ALTER TABLE `tapa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajador` (
  `idTrabajador` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(9) NOT NULL,
  `sueldo` float(8,2) NOT NULL,
  `numeroSeguridadSocial` varchar(12) NOT NULL,
  PRIMARY KEY (`idTrabajador`),
  UNIQUE KEY `id_UNIQUE` (`idTrabajador`),
  KEY `TrabajadorDni_idx` (`dni`),
  CONSTRAINT `TrabajadorDni` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` VALUES (1,'65675463F',12000.00,'123456789012'),(2,'56789775B',5000.00,'123435765321'),(3,'56562745D',1500.00,'789354768421'),(4,'65740123B',3500.00,'345267920124');
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportista`
--

DROP TABLE IF EXISTS `transportista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportista` (
  `idTransportista` int NOT NULL,
  `provinciaReparto` varchar(45) NOT NULL,
  PRIMARY KEY (`idTransportista`),
  UNIQUE KEY `idTransportista_UNIQUE` (`idTransportista`),
  CONSTRAINT `TransportistaIdTransportistaIdTrabajador` FOREIGN KEY (`idTransportista`) REFERENCES `trabajador` (`idTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportista`
--

LOCK TABLES `transportista` WRITE;
/*!40000 ALTER TABLE `transportista` DISABLE KEYS */;
INSERT INTO `transportista` VALUES (3,'Barcelona'),(4,'Barcelona');
/*!40000 ALTER TABLE `transportista` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05 18:44:37
