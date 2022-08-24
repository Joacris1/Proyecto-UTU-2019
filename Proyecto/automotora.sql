-- MySQL dump 10.13  Distrib 5.5.61, for Win32 (AMD64)
--
-- Host: localhost    Database: automotora
-- ------------------------------------------------------
-- Server version	5.5.61

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alquiler`
--

DROP TABLE IF EXISTS `alquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alquiler` (
  `codigo_a` int(15) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado_devolucion` varchar(15) NOT NULL,
  `estado_entrega` varchar(15) NOT NULL,
  `costo` double(6,2) NOT NULL,
  `matricula` varchar(8) NOT NULL,
  `cedula_c` int(8) NOT NULL,
  `cedula` int(8) NOT NULL,
  `codigo_g` int(11) NOT NULL,
  PRIMARY KEY (`codigo_a`),
  KEY `F_k_matricula` (`matricula`),
  KEY `F_k_cedula` (`cedula`),
  KEY `f_k_cedula_c` (`cedula_c`),
  KEY `f_k_codigo_g_2_idx` (`codigo_g`),
  CONSTRAINT `F_k_cedula` FOREIGN KEY (`cedula`) REFERENCES `usuario` (`cedula`),
  CONSTRAINT `f_k_cedula_c` FOREIGN KEY (`cedula_c`) REFERENCES `cliente` (`cedula_c`),
  CONSTRAINT `f_k_codigo_g_2` FOREIGN KEY (`codigo_g`) REFERENCES `garantia` (`codigo_g`),
  CONSTRAINT `F_k_matricula` FOREIGN KEY (`matricula`) REFERENCES `vehiculo` (`matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler`
--

LOCK TABLES `alquiler` WRITE;
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
INSERT INTO `alquiler` VALUES (5,'2019-10-23','2019-10-30','buena','buena ',122.00,'3123',1233,52665450,1),(6,'2019-12-21','2020-12-31','buena','buena ',544.00,'321',52201793,1234,1),(7,'2045-07-13','2091-07-13','mala','buena ',1012.00,'123333',52201793,1234,1),(9,'2025-07-11','2025-12-26','mala','buena ',12.00,'3123',123,1234,1);
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cedula_c` int(8) NOT NULL,
  `edad` int(3) NOT NULL,
  `libreta` varchar(15) DEFAULT NULL,
  `nombre` varchar(15) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `nacionalidad` varchar(20) NOT NULL,
  `contacto` varchar(20) NOT NULL,
  PRIMARY KEY (`cedula_c`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (123,132,NULL,'312','312','132','312'),(1233,132,NULL,'312','312','132','312'),(1234,312,NULL,'dsas','ad','sda','213'),(12334,132,NULL,'312','312','132','312'),(12355,3,NULL,'qdw','132','123','123'),(52201793,17,NULL,'Thony','Machin','Uruguay','092873205');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efectivo`
--

DROP TABLE IF EXISTS `efectivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `efectivo` (
  `moneda` varchar(15) NOT NULL,
  `monto` double(6,2) NOT NULL,
  `codigo_f` int(11) NOT NULL,
  KEY `f_k_codigo_f_idx` (`codigo_f`),
  CONSTRAINT `f_k_codigo_f` FOREIGN KEY (`codigo_f`) REFERENCES `formapago` (`codigo_f`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efectivo`
--

LOCK TABLES `efectivo` WRITE;
/*!40000 ALTER TABLE `efectivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `efectivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `espagada`
--

DROP TABLE IF EXISTS `espagada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `espagada` (
  `codigo_g` int(11) NOT NULL,
  `codigo_f` int(11) NOT NULL,
  PRIMARY KEY (`codigo_g`,`codigo_f`),
  KEY `f_k_codigo_g23_idx` (`codigo_g`),
  KEY `f_k_codigo_f2_idx` (`codigo_f`),
  CONSTRAINT `f_k_codigo_f2` FOREIGN KEY (`codigo_f`) REFERENCES `formapago` (`codigo_f`),
  CONSTRAINT `f_k_codigo_g23` FOREIGN KEY (`codigo_g`) REFERENCES `garantia` (`codigo_g`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `espagada`
--

LOCK TABLES `espagada` WRITE;
/*!40000 ALTER TABLE `espagada` DISABLE KEYS */;
/*!40000 ALTER TABLE `espagada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapago`
--

DROP TABLE IF EXISTS `formapago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formapago` (
  `codigo_f` int(15) NOT NULL AUTO_INCREMENT,
  `modopago` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo_f`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapago`
--

LOCK TABLES `formapago` WRITE;
/*!40000 ALTER TABLE `formapago` DISABLE KEYS */;
INSERT INTO `formapago` VALUES (1,'1 Tarjeta'),(2,'2 Tarjetas'),(3,'1 Tarjeta'),(4,'1 Tarjeta'),(5,'1 Tarjeta'),(6,'1 Tarjeta'),(7,'1 Tarjeta'),(8,'1 Tarjeta'),(9,'2 Tarjetas'),(10,'1 Tarjeta'),(11,'1 Tarjeta'),(12,'2 Tarjetas'),(13,'1 Tarjeta'),(14,'2 Tarjetas'),(15,'1 Tarjeta'),(16,'Efectivo'),(17,'Efectivo'),(18,'2 Tarjetas'),(19,'1 Tarjeta');
/*!40000 ALTER TABLE `formapago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garantia`
--

DROP TABLE IF EXISTS `garantia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `garantia` (
  `codigo_g` int(15) NOT NULL AUTO_INCREMENT,
  `precio_g` double(6,2) NOT NULL,
  PRIMARY KEY (`codigo_g`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garantia`
--

LOCK TABLES `garantia` WRITE;
/*!40000 ALTER TABLE `garantia` DISABLE KEYS */;
INSERT INTO `garantia` VALUES (1,213.00);
/*!40000 ALTER TABLE `garantia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta`
--

DROP TABLE IF EXISTS `oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oferta` (
  `codigo_o` int(15) NOT NULL,
  `fecha_envio` date NOT NULL,
  `duracion` date NOT NULL,
  `matricula` varchar(8) NOT NULL,
  `cedula_u` int(8) NOT NULL,
  PRIMARY KEY (`codigo_o`),
  KEY `F_k` (`matricula`,`cedula_u`) USING BTREE,
  KEY `f_k_cedula_u` (`cedula_u`),
  CONSTRAINT `fk_matricula` FOREIGN KEY (`matricula`) REFERENCES `vehiculo` (`matricula`),
  CONSTRAINT `f_k_cedula_u` FOREIGN KEY (`cedula_u`) REFERENCES `usuario` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta`
--

LOCK TABLES `oferta` WRITE;
/*!40000 ALTER TABLE `oferta` DISABLE KEYS */;
INSERT INTO `oferta` VALUES (0,'0000-00-00','0000-00-00','aaa',1234),(1,'0000-00-00','0000-00-00','aaa',1234),(2,'0000-00-00','0000-00-00','aaa',1234),(3,'0000-00-00','0000-00-00','aaa',1234),(5,'0000-00-00','0000-00-00','aaa',1234),(6,'0000-00-00','0000-00-00','aaa',1234);
/*!40000 ALTER TABLE `oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_envia`
--

DROP TABLE IF EXISTS `se_envia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_envia` (
  `cedula_c` int(8) NOT NULL,
  `codigo_o` int(11) NOT NULL,
  PRIMARY KEY (`cedula_c`,`codigo_o`),
  KEY `f_k_codigo_o2_idx` (`codigo_o`),
  CONSTRAINT `f_k_cedula_c_` FOREIGN KEY (`cedula_c`) REFERENCES `cliente` (`cedula_c`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_envia`
--

LOCK TABLES `se_envia` WRITE;
/*!40000 ALTER TABLE `se_envia` DISABLE KEYS */;
INSERT INTO `se_envia` VALUES (123,0),(123,1),(123,2),(1234,2),(1234,3);
/*!40000 ALTER TABLE `se_envia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `codigo_s` int(15) NOT NULL AUTO_INCREMENT,
  `tipo_s` varchar(10) NOT NULL,
  `proximo_s` double(6,2) NOT NULL,
  `matricula` varchar(7) NOT NULL,
  PRIMARY KEY (`codigo_s`),
  KEY `f_k` (`matricula`),
  CONSTRAINT `f_k_matricula_` FOREIGN KEY (`matricula`) REFERENCES `vehiculo` (`matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (27,'aceite',12.00,'321'),(28,'nasta',11.00,'123'),(29,'aceite',112.00,'123'),(30,'sdfsa',231.00,'123'),(31,'sdfsa',231.00,'123'),(32,'sdfsa',231.00,'123'),(33,'sdfsa',231.00,'123'),(34,'sdfsa',231.00,'123');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjeta` (
  `nrotarjeta` int(16) NOT NULL,
  `cvv` int(3) NOT NULL,
  `fecha_exp` date NOT NULL,
  `titular` varchar(15) NOT NULL,
  `moneda` varchar(15) NOT NULL,
  `codigo_f` int(11) NOT NULL,
  PRIMARY KEY (`nrotarjeta`),
  KEY `f_k_codigo_f3_idx` (`codigo_f`),
  CONSTRAINT `f_k_codigo_f_` FOREIGN KEY (`codigo_f`) REFERENCES `formapago` (`codigo_f`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` VALUES (123,321,'2019-10-03','213','Dolares',5),(132,312,'2019-10-09','dsad','Pesos',4),(234,12,'2019-10-02','ads','Pesos',11),(312,12,'2019-10-03','ads','Pesos',9),(32132,132,'2019-10-03','sdsda','Pesos',7),(52000,333,'2019-10-17','santi','Dolares',14),(321323,132,'2019-10-03','sdsda','Pesos',7),(2232131,322,'2019-10-11','Andres','Argentinos',18),(2349780,543,'2019-11-08','Santiago','Dolares',16),(3213234,132,'2019-10-03','sdsda','Pesos',7),(597887645,349,'2019-10-20','Thony Machin','Dolares',17);
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `cedula` int(8) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (345,'Admin','exit;','douskerearmy'),(1234,'Admin','santi','1234'),(12345,'Admin','ELVER GALARGA','PAGALDAYPUTO'),(52665450,'User','Santiago','1234'),(55601904,'Admin','Sebastian','3035');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `matricula` varchar(7) NOT NULL,
  `kilometraje` float(12,2) unsigned NOT NULL,
  `combustible` varchar(10) NOT NULL,
  `cilindrada` float(8,2) unsigned NOT NULL,
  `pasajeros` int(2) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `color` varchar(15) NOT NULL,
  `clase` varchar(4) NOT NULL,
  `modelo` varchar(19) NOT NULL,
  `marca` varchar(15) NOT NULL,
  `autonomia` float(8,2) unsigned NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES ('123',123.00,'123',123.00,12,'123','123','123','123','123',123.00),('123333',123.00,'132',12.00,123,'123','13234','132','132','123',123.00),('12345',2.00,'321',123.00,132,'321','1223','213','312','321',123.00),('123555',321.00,'123',321.00,132,'312','213','12','132','231',312.00),('3123',213.00,'321',123.00,12,'213','213','321','321','213',312312.00),('321',123.00,'213',321.00,213,'123','231','123','213','123',312.00),('32sda',132.00,'d',12.00,13,'d','asd','asd','das','sad',23.00),('aaa',33.00,'eee',25.00,5,'ewwe','www','eerr','rtrt','dfdf',14.00),('asd',4.20,'dsa',32.20,23,'sda','das','dsa','dsa','dsa',4.20),('bbbb',555.00,'eee',33.00,5,'ewwe','www','eerr','rtrt','dfdf',33.00),('qqq',12.00,'eee',12.00,5,'ewwe','www','eerr','rtrt','dfdf',14.00);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-26  4:00:52
