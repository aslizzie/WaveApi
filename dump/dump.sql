-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: wave
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `content_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text,
  `banner_image` varchar(255) DEFAULT NULL,
  `hero_image` varchar(255) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,'Inception','A mind-bending thriller','movies/inception_poster.jpg','movies/inception_hero.jpg','Sci-Fi','2010-07-16','2024-07-26 01:48:13'),(2,'Breaking Bad','A high school teacher turns to making drugs','series/breaking_bad_poster.jpg','series/breaking_bad_hero.jpg','Drama','2008-01-20','2024-07-26 01:48:13'),(3,'The Matrix','A hacker discovers the reality is a simulation','movies/the_matrix_poster.jpg','movies/the_matrix_hero.jpg','Sci-Fi','1999-03-31','2024-07-26 01:48:13'),(4,'The Office','A mockumentary on a group of office workers','series/the_office_poster.jpg','series/the_office_hero.jpeg','Comedy','2005-03-24','2024-07-26 01:48:13'),(5,'Game of Thrones','Nine noble families fight for control over the lands of Westeros','series/game_of_thrones_poster.jpg','series/game_of_thrones_hero.jpg','Fantasy','2011-04-17','2024-07-26 01:48:13'),(6,'Interstellar','A team of explorers travel through a wormhole in space','movies/interstellar_poster.jpg','movies/interstellar_hero.jpeg','Sci-Fi','2014-11-07','2024-07-26 01:48:13'),(7,'Friends','Follows the personal and professional lives of six twenty to thirty-something friends','series/friends_poster.jpg','series/friends_hero.jpeg','Comedy','1994-09-22','2024-07-26 01:48:13'),(8,'The Dark Knight','Batman faces the Joker','movies/the_dark_knight_poster.jpg','movies/the_dark_knight_hero.jpeg','Action','2008-07-18','2024-07-26 01:48:13'),(9,'Stranger Things','A group of kids uncover supernatural mysteries in their town','series/stranger_things_poster.jpg','series/stranger_things_hero.jpg','Sci-Fi','2016-07-15','2024-07-26 01:48:13'),(10,'The Lord of the Rings: The Fellowship of the Ring','A meek Hobbit sets out on a journey to destroy a powerful ring','movies/the_lord_of_the_rings_poster.jpeg','movies/the_lord_of_the_rings_hero.jpg','Fantasy','2001-12-19','2024-07-26 01:48:13'),(11,'The Mandalorian','A lone gunfighter makes his way through the outer reaches of the galaxy','series/the_mandalorian_poster.jpg','series/the_mandalorian_hero.jpeg','Sci-Fi','2019-11-12','2024-07-26 01:48:13'),(12,'Black Mirror','An anthology series exploring a twisted, high-tech multiverse','series/black_mirror_poster.jpg','series/black_mirror_hero.jpg','Drama','2011-12-04','2024-07-26 01:48:13'),(13,'Sherlock','A modern update finds the famous sleuth and his doctor partner solving crime in 21st century London','series/sherlock_poster.jpg','series/sherlock_hero.jpg','Crime','2010-07-25','2024-07-26 01:48:13'),(14,'The Witcher','A monster hunter struggles to find his place in a world where people often prove more wicked than beasts','series/the_witcher_poster.jpg','series/the_witcher_hero.jpg','Fantasy','2019-12-20','2024-07-26 01:48:13'),(15,'The Simpsons','The satiric adventures of a working-class family in the misfit city of Springfield','series/the_simpons_poster.jpg','series/the_simpons_hero.jpg','Comedy','1989-12-17','2024-07-26 01:48:13');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episodes`
--

DROP TABLE IF EXISTS `episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episodes` (
  `episode_id` int NOT NULL AUTO_INCREMENT,
  `serie_id` int DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `season_number` int DEFAULT NULL,
  `episode_number` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `duration` int DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`episode_id`),
  KEY `episodes_ibfk_1` (`serie_id`),
  CONSTRAINT `episodes_ibfk_1` FOREIGN KEY (`serie_id`) REFERENCES `series` (`serie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodes`
--

LOCK TABLES `episodes` WRITE;
/*!40000 ALTER TABLE `episodes` DISABLE KEYS */;
INSERT INTO `episodes` VALUES (1,1,'Pilot',1,1,NULL,'The first episode of Breaking Bad',58,'2008-01-20'),(2,1,'Cat\'s in the Bag...',1,2,NULL,'Walt and Jesse attempt to dispose of the two bodies in the RV',48,'2008-01-27'),(3,1,'...And the Bag\'s in the River',1,3,NULL,'Walt and Jesse clean up the mess after the first cook',48,'2008-02-10'),(4,2,'Pilot',1,1,NULL,'The premiere of the American version of The Office',22,'2005-03-24'),(5,2,'Diversity Day',1,2,NULL,'Michael\'s attempt to celebrate diversity backfires',22,'2005-03-29'),(6,2,'Health Care',1,3,NULL,'Dwight is put in charge of choosing the new health care plan for the office',22,'2005-04-05'),(7,3,'Winter Is Coming',1,1,NULL,'The Stark family prepares for the arrival of the king',62,'2011-04-17'),(8,3,'The Kingsroad',1,2,NULL,'The Lannisters plot to ensure Bran\'s silence',56,'2011-04-24'),(9,3,'Lord Snow',1,3,NULL,'Ned Stark arrives at King\'s Landing',58,'2011-05-01'),(10,4,'The One Where Monica Gets a Roommate',1,1,NULL,'Monica and the gang introduce Rachel to the \"real world\"',22,'1994-09-22'),(11,4,'The One with the Sonogram at the End',1,2,NULL,'Ross finds out his ex-wife is pregnant',22,'1994-09-29'),(12,4,'The One with the Thumb',1,3,NULL,'Monica accidentally buys drugs for Rachel',22,'1994-10-06'),(13,5,'Chapter One: The Vanishing of Will Byers',1,1,NULL,'A young boy disappears, leading to a series of supernatural events',47,'2016-07-15'),(14,5,'Chapter Two: The Weirdo on Maple Street',1,2,NULL,'Mike hides the mysterious girl in his house',55,'2016-07-15'),(15,5,'Chapter Three: Holly, Jolly',1,3,NULL,'An increasingly concerned Nancy looks for Barb and finds out what Jonathan\'s been up to',51,'2016-07-15'),(16,6,'Chapter 1: The Mandalorian',1,1,NULL,'A Mandalorian bounty hunter tracks a target for a well-paying client',39,'2019-11-12'),(17,6,'Chapter 2: The Child',1,2,NULL,'Target in-hand, the Mandalorian must now contend with scavengers',32,'2019-11-15'),(18,6,'Chapter 3: The Sin',1,3,NULL,'The battered Mandalorian returns to his client for reward',37,'2019-11-22'),(19,7,'The National Anthem',1,1,NULL,'The Prime Minister faces a shocking dilemma',44,'2011-12-04'),(20,7,'Fifteen Million Merits',1,2,NULL,'In a bleak, automated future, a young man dreams of a better life',62,'2011-12-11'),(21,7,'The Entire History of You',1,3,NULL,'In the near future, everyone has access to a memory implant that records everything they do',49,'2011-12-18'),(22,8,'A Study in Pink',1,1,NULL,'Sherlock Holmes and John Watson meet and tackle the case of the \"serial suicides\"',88,'2010-07-25'),(23,8,'The Blind Banker',1,2,NULL,'Sherlock must solve a mystery involving a Chinese smuggling ring',89,'2010-08-01'),(24,8,'The Great Game',1,3,NULL,'Sherlock must solve multiple cases as Moriarty sets a series of puzzles for him',90,'2010-08-08'),(25,9,'The End\'s Beginning',1,1,NULL,'A monster hunter, Geralt of Rivia, struggles to find his place in a world where people often prove more wicked than beasts',61,'2019-12-20'),(26,9,'Four Marks',1,2,NULL,'Yennefer of Vengerberg is sold to Tissaia de Vries',61,'2019-12-20'),(27,9,'Betrayer Moon',1,3,NULL,'Geralt takes on another Witcher\'s unfinished business in a kingdom stalked by a ferocious beast',67,'2019-12-20'),(28,10,'Simpsons Roasting on an Open Fire',1,1,NULL,'Homer is forced to become a department store Santa',23,'1989-12-17'),(29,10,'Bart the Genius',1,2,NULL,'Bart is sent to a school for gifted children',23,'1990-01-14'),(30,10,'Homer\'s Odyssey',1,3,NULL,'Homer becomes a safety advocate after being fired from the power plant',23,'1990-01-21');
/*!40000 ALTER TABLE `episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `user_id` int NOT NULL,
  `content_id` int NOT NULL,
  `added_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`,`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (0,15,NULL),(1,2,NULL),(1,3,NULL),(1,4,NULL),(1,5,NULL),(1,7,NULL);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `content_id` int DEFAULT NULL,
  `director` varchar(100) DEFAULT NULL,
  `classification` varchar(10) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  KEY `content_id` (`content_id`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `content` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (2,1,'Christopher Nolan','PG-13',148),(3,3,'Lana Wachowski, Lilly Wachowski','R',136),(4,6,'Christopher Nolan','PG-13',169),(5,8,'Christopher Nolan','PG-13',152),(6,10,'Peter Jackson','PG-13',178);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `serie_id` int NOT NULL AUTO_INCREMENT,
  `content_id` int DEFAULT NULL,
  `seasons` int DEFAULT NULL,
  `episodes` int DEFAULT NULL,
  PRIMARY KEY (`serie_id`),
  KEY `content_id` (`content_id`),
  CONSTRAINT `series_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `content` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,2,5,62),(2,4,9,201),(3,5,8,73),(4,7,10,236),(5,9,4,34),(6,11,2,16),(7,12,5,22),(8,13,4,13),(9,14,3,24),(10,15,33,750);
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birth` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'testuser','hola','test@email.com','testpassword','2001-10-18','2024-08-22 04:34:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-25 22:53:41
