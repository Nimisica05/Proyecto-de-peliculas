-- MySQL dump 10.13  Distrib 8.4.0, for Win64 (x86_64)
--
-- Host: localhost    Database: proyectopeliculas
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `iddirector` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`iddirector`),
  UNIQUE KEY `id_Director_UNIQUE` (`iddirector`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Christopher Nolan'),(3,'James Cameron'),(2,'Michael Bay');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `idgenero` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idgenero`),
  UNIQUE KEY `id_Genero_UNIQUE` (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'acción'),(2,'Ciencia ficción'),(3,'Romance');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `idpelicula` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `año` int DEFAULT NULL,
  `duracion` int DEFAULT NULL,
  `genero_idgenero` int NOT NULL,
  `director_iddirector` int NOT NULL,
  PRIMARY KEY (`idpelicula`,`genero_idgenero`,`director_iddirector`),
  UNIQUE KEY `idpelicula_UNIQUE` (`idpelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (1,'Interestelar',2014,169,2,1),(2,'Bad Boys',1995,119,1,2),(3,'Titanic',1997,194,3,3);
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataforma_de_streaming`
--

DROP TABLE IF EXISTS `plataforma_de_streaming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataforma_de_streaming` (
  `idplataforma_de_streaming` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`idplataforma_de_streaming`),
  UNIQUE KEY `id_plataforma_de_streaming_UNIQUE` (`idplataforma_de_streaming`),
  UNIQUE KEY `Nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma_de_streaming`
--

LOCK TABLES `plataforma_de_streaming` WRITE;
/*!40000 ALTER TABLE `plataforma_de_streaming` DISABLE KEYS */;
INSERT INTO `plataforma_de_streaming` VALUES (1,'Netflix','https://www.netflix.com'),(2,'HBO Max','https://www.max.com'),(3,'Disney+','https://www.disneyplus.com');
/*!40000 ALTER TABLE `plataforma_de_streaming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataforma_de_streaming_has_pelicula`
--

DROP TABLE IF EXISTS `plataforma_de_streaming_has_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataforma_de_streaming_has_pelicula` (
  `plataforma_de_streaming_idplataforma_de_streaming` int NOT NULL,
  `pelicula_idpelicula` int NOT NULL,
  PRIMARY KEY (`plataforma_de_streaming_idplataforma_de_streaming`,`pelicula_idpelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma_de_streaming_has_pelicula`
--

LOCK TABLES `plataforma_de_streaming_has_pelicula` WRITE;
/*!40000 ALTER TABLE `plataforma_de_streaming_has_pelicula` DISABLE KEYS */;
INSERT INTO `plataforma_de_streaming_has_pelicula` VALUES (1,2),(2,1),(3,3);
/*!40000 ALTER TABLE `plataforma_de_streaming_has_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  UNIQUE KEY `correo_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Louis_28','LouisT@gmail.com','$2y$10$Sgk0muDyqpZysz3wyW9.yeQUhJAXnCtHPXC.JOSUJm.fQiRbSP/S.'),(2,'liset','liset@gmail.com','$2y$10$t2GvkFwAT.kD3.hUQlPZueKJIflEWESdqSn9/gEPBNmdP3AR9swGW');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-25  9:22:31
