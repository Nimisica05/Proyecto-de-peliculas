-- MySQL dump 10.13  Distrib 9.0.1, for Win64 (x86_64)
--
-- Host: localhost    Database: proyectopeliculas
-- ------------------------------------------------------
-- Server version	9.0.1

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (7,'Alfred Hitchcock'),(16,'Chloe Zhao'),(1,'Christopher Nolan'),(18,'Coralie Fargeat'),(14,'David Fincher'),(15,'Greta Gerwig'),(12,'Hayao Miyazaki'),(17,'Henry Selick'),(3,'James Cameron'),(8,'Martin Scorsese'),(2,'Michael Bay'),(4,'Michael Mann'),(13,'Peter Jackson'),(10,'Quentin Tarantino'),(5,'Randal Kleiser'),(6,'Stanley Kubrick'),(9,'Steven Spielberg'),(11,'Tim Burton');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'acción'),(2,'Ciencia ficción'),(3,'Romance'),(4,'Aventura'),(5,'Comedia'),(6,'Drama'),(7,'Fantasia'),(8,'Musical'),(9,'Terror'),(10,'Documentales'),(11,'Suspenso'),(12,'Crimen'),(13,'Animacion');
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
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idpelicula`,`genero_idgenero`,`director_iddirector`),
  UNIQUE KEY `idpelicula_UNIQUE` (`idpelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (1,'Interestelar',2014,169,2,1,'https://m.media-amazon.com/images/M/MV5BYzdjMDAxZGItMjI2My00ODA1LTlkNzItOWFjMDU5ZDJlYWY3XkEyXkFqcGc@._V1_.jpg'),(2,'Bad Boys',1995,119,1,2,'https://pics.filmaffinity.com/Bad_Boys_Ride_or_Die-369563611-large.jpg'),(3,'Titanic',1997,194,3,3,'https://play-lh.googleusercontent.com/560-H8NVZRHk00g3RltRun4IGB-Ndl0I0iKy33D7EQ0cRRwH78-c46s90lZ1ho_F1so=w240-h480-rw'),(4,'Heat',1995,170,12,4,'https://upload.wikimedia.org/wikipedia/en/6/6c/Heatposter.jpg'),(5,'Grease',1978,105,3,4,'https://m.media-amazon.com/images/M/MV5BNGY0NzE0ZTctN2YzNC00M2IwLWI0OWYtMTAwZWU2NjZhMTQwXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),(6,'2001: A Space Odyssey',1968,148,2,6,'https://es.web.img3.acsta.net/pictures/210/073/21007309_20130521161735454.jpg'),(7,'A Clockwork Orange',1971,136,2,6,'https://play-lh.googleusercontent.com/TYJZg1kLv_HRh-3o0kexlLZVx-sn1lK2ie3ewswePaYcS7FDbz9l_5Sp9pMw4bnX7xo'),(8,'The Shining',1980,146,9,6,'https://m.media-amazon.com/images/M/MV5BNmM5ZThhY2ItOGRjOS00NzZiLWEwYTItNDgyMjFkOTgxMmRiXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),(9,'Psycho',1960,109,9,7,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrq2V7juyWd1dZdsd81xxE490gGpF4fYzDaQ&s'),(10,'Vertigo',1958,128,11,7,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0FDJ4BcpR1TnaXYkqC2lAf4JG6jedtMJpeg&s'),(11,'Rear Window',1954,112,11,7,'https://m.media-amazon.com/images/S/pv-target-images/30a76601accaf5eaf1135b09b6ccbe7c1016af19674a97b7bb5347d93222f278.jpg'),(12,'Taxi Driver',1976,114,6,8,'https://pics.filmaffinity.com/Taxi_Driver-173769074-large.jpg'),(13,'Goodfellas',1990,146,12,8,'https://m.media-amazon.com/images/M/MV5BN2E5NzI2ZGMtY2VjNi00YTRjLWI1MDUtZGY5OWU1MWJjZjRjXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),(14,'The Departed',2006,151,12,8,'https://m.media-amazon.com/images/M/MV5BMTI1MTY2OTIxNV5BMl5BanBnXkFtZTYwNjQ4NjY3._V1_FMjpg_UX1000_.jpg'),(15,'Jurassic Park',1993,127,2,9,'https://m.media-amazon.com/images/M/MV5BMjM2MDgxMDg0Nl5BMl5BanBnXkFtZTgwNTM2OTM5NDE@._V1_.jpg'),(16,'E.T. the Extra-Terrestrial',1982,115,4,9,'https://m.media-amazon.com/images/S/pv-target-images/8da09fea47590d604cc871a98b28960b4f77c3f08a004c8669c4c6c9f96793f5.jpg'),(17,'Jaws',1975,124,9,9,'https://mediaproxy.tvtropes.org/width/1200/https://static.tvtropes.org/pmwiki/pub/images/jaws_movie_poster.jpg'),(18,'Pulp Fiction',1994,154,12,10,'https://pics.filmaffinity.com/Pulp_Fiction-210382116-large.jpg'),(19,'Inglourious Basterds',2009,153,1,10,'https://m.media-amazon.com/images/M/MV5BODZhMWJlNjYtNDExNC00MTIzLTllM2ItOGQ2NGVjNDQ3MzkzXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),(20,'Kill Bill: Vol. 1',2003,111,1,10,'https://pics.filmaffinity.com/Kill_Bill_Volumen_1-216872360-large.jpg'),(21,'The Hateful Eight',2015,168,2,10,'https://m.media-amazon.com/images/M/MV5BMjA1MTc1NTg5NV5BMl5BanBnXkFtZTgwOTM2MDEzNzE@._V1_.jpg'),(22,'The Nightmare Before Christmas',1993,76,13,17,'https://m.media-amazon.com/images/M/MV5BNmYxOTAzZWYtOGI3Yi00ODc3LTk5ZjYtZTY0MzVkZTg3YmRiXkEyXkFqcGc@._V1_.jpg'),(23,'Edward Scissorhands',1990,105,7,11,'https://upload.wikimedia.org/wikipedia/en/thumb/3/3b/Edwardscissorhandsposter.JPG/220px-Edwardscissorhandsposter.JPG'),(24,'Spirited Away',2001,125,13,12,'https://m.media-amazon.com/images/M/MV5BNTEyNmEwOWUtYzkyOC00ZTQ4LTllZmUtMjk0Y2YwOGUzYjRiXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),(25,'My Neighbor Totoro',1988,86,13,12,'https://m.media-amazon.com/images/M/MV5BYWM3MDE3YjEtMzIzZC00ODE5LTgxNTItNmUyMTBkM2M2NmNiXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),(26,'Princess Mononoke',1997,134,13,12,'https://upload.wikimedia.org/wikipedia/en/8/8c/Princess_Mononoke_Japanese_poster.png'),(27,'The Lord of the Rings: The Fellowship of the Ring',2001,178,7,13,'https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg'),(28,'The Lord of the Rings: The Two Towers',2002,179,7,13,'https://m.media-amazon.com/images/M/MV5BNzU2ODUxODgtNTdkYi00OTFmLWExNTctYWQ1NGVmYmQxNjMxXkEyXkFqcGc@._V1_.jpg'),(29,'The Lord of the Rings: The Return of the King',2003,201,7,13,'https://m.media-amazon.com/images/M/MV5BMTZkMjBjNWMtZGI5OC00MGU0LTk4ZTItODg2NWM3NTVmNWQ4XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),(30,'Fight Club',1999,139,6,14,'https://m.media-amazon.com/images/M/MV5BOTgyOGQ1NDItNGU3Ny00MjU3LTg2YWEtNmEyYjBiMjI1Y2M5XkEyXkFqcGc@._V1_.jpg'),(31,'Se7en',1995,127,12,14,'https://m.media-amazon.com/images/M/MV5BN2U5ZDE4OTgtYzY4ZC00MWFhLTg2ZjUtNDQ2ZGE0MDUyNmVkXkEyXkFqcGc@._V1_.jpg'),(32,'The Social Network',2010,120,6,14,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrYq6cOcIgGq9oHSy9UgGVBlQdOkmVecoEgw&s'),(33,'Gone Girl',2014,149,11,14,'https://m.media-amazon.com/images/M/MV5BMTk0MDQ3MzAzOV5BMl5BanBnXkFtZTgwNzU1NzE3MjE@._V1_FMjpg_UX1000_.jpg'),(34,'The Girl with the Dragon Tattoo',2011,158,11,14,'https://m.media-amazon.com/images/M/MV5BMTc2Mjc0MDg3MV5BMl5BanBnXkFtZTcwMjUzMDkxMw@@._V1_.jpg'),(35,'Zodiac',2007,157,12,14,'https://upload.wikimedia.org/wikipedia/en/3/3a/Zodiac2007Poster.jpg'),(36,'Lady Bird',2017,94,5,15,'https://pics.filmaffinity.com/Lady_Bird-546261513-large.jpg'),(37,'Little Women',2019,135,6,15,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg5xC2AYD348G4bWQVWL9DlMCdgxkiJXRc0Q&s'),(38,'Barbie',2023,114,7,15,'https://decine21.com/img/upload/obras/barbie-45463/barbie-45463-c.jpg'),(39,'Nomadland',2020,107,6,16,'https://play-lh.googleusercontent.com/AS3pAU3RZ0FyXvne18ievyWWi-Zda7yCQw5z48ue0kJp8pcEPS86E_D8iueRvaGmK-bxgtLC83UwAR0ZwkE'),(40,'The Rider',2017,104,6,16,'https://pics.filmaffinity.com/The_Rider-161245100-large.jpg'),(41,'The Aviator',2004,170,4,8,'https://upload.wikimedia.org/wikipedia/en/f/fa/The_Aviator_%282004%29.png'),(42,'Shutter Island',2010,138,11,8,'https://m.media-amazon.com/images/M/MV5BN2FjNWExYzEtY2YzOC00YjNlLTllMTQtNmIwM2Q1YzBhOWM1XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),(43,'The Wolf of Wall Street',2013,180,5,8,'https://m.media-amazon.com/images/M/MV5BMjIxMjgxNTk0MF5BMl5BanBnXkFtZTgwNjIyOTg2MDE@._V1_.jpg'),(44,'Casino',1995,178,12,8,'https://pics.filmaffinity.com/Casino-348445329-large.jpg'),(45,'Raging Bull',1980,129,6,8,'https://m.media-amazon.com/images/M/MV5BMjlkYmYyZWQtNTZkOS00ZjA0LWEwNWUtNzE2ZGNiYjg0MjA2XkEyXkFqcGc@._V1_.jpg'),(46,'Gangs of New York',2002,167,6,8,'https://m.media-amazon.com/images/M/MV5BMTQ0MDA0MTUtYzkzMi00NDY3LThhZDEtNGM4MWUwYzMyZDk5XkEyXkFqcGc@._V1_.jpg'),(47,'The Irishman',2019,209,12,8,'https://m.media-amazon.com/images/M/MV5BMTY2YThkNmQtOWJhYy00ZDc3LWEzOGEtMmQwNzM0YjFmZWIyXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),(48,'The Curious Case of Benjamin Button',2008,166,6,14,'https://m.media-amazon.com/images/M/MV5BYjIyNDExOWItM2Y4ZC00NmY3LWFlN2ItYTJlZDQ1NTJlZTUwXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),(49,'Catch Me If You Can',2002,141,4,9,'https://m.media-amazon.com/images/M/MV5BMTY5MzYzNjc5NV5BMl5BanBnXkFtZTYwNTUyNTc2._V1_.jpg'),(50,'Django Unchained',2012,165,12,10,'https://m.media-amazon.com/images/M/MV5BMjIyNTQ5NjQ1OV5BMl5BanBnXkFtZTcwODg1MDU4OA@@._V1_FMjpg_UX1000_.jpg'),(51,'Once Upon a Time in Hollywood',2019,161,5,10,'https://m.media-amazon.com/images/M/MV5BMzMzNmViNjYtN2ViNi00NDM3LWFlMmItNDYyMGIzY2EzZjE2XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),(52,'Beetlejuice',1988,92,7,11,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzLjz5Dxql_BR3Czsnkx7YwYt9vw16YMzm_w&s'),(53,'Corpse Bride',2005,77,13,11,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm0PuLVhuBZYLB55T3zrIxpj7oUSnme97ZPg&s'),(54,'Sweeney Todd: The Demon Barber of Fleet Street',2007,116,8,11,'https://m.media-amazon.com/images/M/MV5BMTg3NjUxMzM5NV5BMl5BanBnXkFtZTcwMzQ1NjQzMw@@._V1_FMjpg_UX1000_.jpg'),(55,'La sustancia',2024,140,2,18,'https://pics.filmaffinity.com/La_sustancia-265285928-large.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma_de_streaming`
--

LOCK TABLES `plataforma_de_streaming` WRITE;
/*!40000 ALTER TABLE `plataforma_de_streaming` DISABLE KEYS */;
INSERT INTO `plataforma_de_streaming` VALUES (1,'Netflix','https://www.netflix.com'),(2,'HBO Max','https://www.max.com'),(3,'Disney+','https://www.disneyplus.com'),(4,'Amazon Prime','https://www.primevideo.com'),(5,'Apple TV+','https://www.apple.com');
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
INSERT INTO `plataforma_de_streaming_has_pelicula` VALUES (1,2),(1,17),(1,18),(1,24),(1,25),(1,26),(1,32),(1,46),(1,47),(1,50),(2,1),(2,6),(2,7),(2,8),(2,10),(2,11),(2,12),(2,13),(2,14),(2,19),(2,27),(2,28),(2,29),(2,31),(2,34),(2,35),(2,36),(2,38),(2,41),(2,43),(2,52),(2,53),(3,3),(3,4),(3,15),(3,22),(3,23),(3,30),(3,33),(3,39),(4,5),(4,16),(4,20),(4,21),(4,37),(4,40),(4,42),(4,44),(4,45),(4,48),(4,49),(4,51),(4,54),(4,55),(5,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Louis_28','LouisT@gmail.com','$2y$10$Sgk0muDyqpZysz3wyW9.yeQUhJAXnCtHPXC.JOSUJm.fQiRbSP/S.'),(2,'liset','liset@gmail.com','$2y$10$t2GvkFwAT.kD3.hUQlPZueKJIflEWESdqSn9/gEPBNmdP3AR9swGW'),(4,'nathalie','nathalie28gonzalez@gmail.com','$2y$10$.8p4Q0/25j36qTYM2hREheDI2XvmXxuBxYJ.L9VQKXGvULTeZ1q42'),(5,'liss','lisethgon1409@gmail.com','$2y$10$4JZ40E3SN8eGQ0ZiV/HJJOagl/vx4VsyLET.kg3xLTHJH2tUTK3rO');
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

-- Dump completed on 2024-12-07 16:27:27
