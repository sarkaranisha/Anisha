-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: olympics
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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Barcelona'),(2,'London'),(3,'Antwerpen'),(4,'Paris'),(5,'Calgary'),(6,'Albertville'),(7,'Lillehammer'),(8,'Los Angeles'),(9,'Salt Lake City'),(10,'Helsinki'),(11,'Lake Placid'),(12,'Sydney'),(13,'Atlanta'),(14,'Stockholm'),(15,'Sochi'),(16,'Nagano'),(17,'Torino'),(18,'Beijing'),(19,'Rio de Janeiro'),(20,'Athina'),(21,'Squaw Valley'),(22,'Innsbruck'),(23,'Sarajevo'),(24,'Mexico City'),(25,'Munich'),(26,'Seoul'),(27,'Berlin'),(28,'Oslo'),(29,'Cortina d\'Ampezzo'),(30,'Melbourne'),(31,'Roma'),(32,'Amsterdam'),(33,'Montreal'),(34,'Moskva'),(35,'Tokyo'),(36,'Vancouver'),(37,'Grenoble'),(38,'Sapporo'),(39,'Chamonix'),(40,'St. Louis'),(41,'Sankt Moritz'),(42,'Garmisch-Partenkirchen');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-16 13:44:10
SELECT* FROM city;
SELECT* FROM competitor_event;
SELECT* FROM event;
SELECT* FROM games;
select * from games_city;
select * from games_competitor;
select * from medal;
select * from noc_region;
select * from person_region;
select * from sport;
--1--
SELECT
    c.city_name,
count(*) AS 'num_times_hosted'
FROM
    games_City as g
    inner join city as c on c.id=g.city_id
GROUP BY
    c.city_name
ORDER BY
    num_times_hosted DESC;
--1--    
SELECT season,games_name,
    games_year,
    LAG(games_year) OVER (ORDER BY games_year) AS previous_year,
    CASE WHEN LAG(games_year) OVER (ORDER BY games_year) IS NOT NULL THEN
       games_year - LAG(games_year) OVER (ORDER BY games_year)
    END AS duration_years
FROM
    games;
    

--2--
SELECT
    Summer.games_year AS Summer_Year,
    MIN(CASE WHEN Winter.season = 'Winter' THEN Winter.games_year END) AS Winter_Year,
    MIN(CASE WHEN Winter.season = 'Winter' THEN Winter.games_year END) - Summer.games_year AS Duration_Between_Summer_Winter
FROM games Summer
LEFT JOIN Games Winter
    ON Winter.games_year > Summer.games_year AND Winter.season = 'Winter'
WHERE Summer.season = 'Summer'
GROUP BY Summer.games_year
order by 1 asc;






--4--
SELECT DISTINCT S.sport_name
FROM Sport S
INNER JOIN Event E ON S.id = E.sport_id
INNER JOIN Competitor_Event CE ON CE.event_id = E.id
INNER JOIN Games_Competitor GC ON GC.id = CE.competitor_id
INNER JOIN Games G ON G.id = GC.games_id
WHERE G.games_year = 2016
AND S.id NOT IN (
    SELECT S2.id
    FROM Sport S2
    INNER JOIN Event E2 ON S2.id = E2.sport_id
    INNER JOIN Competitor_Event CE2 ON CE2.event_id = E2.id
    INNER JOIN Games_Competitor GC2 ON GC2.id = CE2.competitor_id
    INNER JOIN Games G2 ON G2.id = GC2.games_id
    WHERE G2.games_year < 2016
)
ORDER BY S.sport_name;



--7--
SELECT s.sport_name,
    p.gender,
    count(ce.event_id)
FROM
    event e
    join sport as s on e.sport_id=s.id
JOIN
    competitor_event ce ON e.id = ce.event_id
JOIN
    games_competitor gc ON ce.competitor_id = gc.id
JOIN
    person p ON gc.person_id = p.id
GROUP BY
    1,2;
    select * from competitor_event
