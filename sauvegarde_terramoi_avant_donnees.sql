/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Terramoi
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB-0+deb13u1 from Debian

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `annees`
--

DROP TABLE IF EXISTS `annees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `annees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `annee` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `annees_annee_unique` (`annee`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annees`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `annees` WRITE;
/*!40000 ALTER TABLE `annees` DISABLE KEYS */;
INSERT INTO `annees` VALUES
(1,2026,'2026-09-23 13:03:23','2026-09-23 13:03:23');
/*!40000 ALTER TABLE `annees` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES
(1,'2026-09-23 13:03:42','2026-09-23 13:03:42',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `demandes`
--

DROP TABLE IF EXISTS `demandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `demandes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `consultation` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `statut` varchar(255) NOT NULL DEFAULT 'Nouvelle demande',
  PRIMARY KEY (`id`),
  KEY `demandes_client_id_foreign` (`client_id`),
  CONSTRAINT `demandes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `demandes` WRITE;
/*!40000 ALTER TABLE `demandes` DISABLE KEYS */;
INSERT INTO `demandes` VALUES
(1,1,'Demande de renseignements','2026-09-23 13:06:55','2026-09-23 13:06:55','Nouvelle demande'),
(2,1,'Demande de renseignements','2026-09-23 13:07:21','2026-09-23 13:07:21','Nouvelle demande');
/*!40000 ALTER TABLE `demandes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `equipement_sites`
--

DROP TABLE IF EXISTS `equipement_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipement_sites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) unsigned NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipement_sites_site_id_foreign` (`site_id`),
  CONSTRAINT `equipement_sites_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipement_sites`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `equipement_sites` WRITE;
/*!40000 ALTER TABLE `equipement_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipement_sites` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `equipements`
--

DROP TABLE IF EXISTS `equipements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tarif_mensuel` decimal(8,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipements`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `equipements` WRITE;
/*!40000 ALTER TABLE `equipements` DISABLE KEYS */;
INSERT INTO `equipements` VALUES
(1,'Tracteur','2026-09-23 13:03:48','2026-09-23 13:03:48',0.00);
/*!40000 ALTER TABLE `equipements` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `date_paiement` date DEFAULT NULL,
  `date_location` date DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `equipement_id` bigint(20) unsigned NOT NULL,
  `parcelle_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_client_id_foreign` (`client_id`),
  KEY `locations_equipement_id_foreign` (`equipement_id`),
  KEY `locations_parcelle_id_foreign` (`parcelle_id`),
  CONSTRAINT `locations_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `locations_equipement_id_foreign` FOREIGN KEY (`equipement_id`) REFERENCES `equipements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `locations_parcelle_id_foreign` FOREIGN KEY (`parcelle_id`) REFERENCES `parcelles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES
(1,'2026-09-23',NULL,'2026-09-23',1,1,1,'2026-09-23 13:03:55','2026-09-23 13:03:55');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2026_09_23_143912_create_clients_table',2),
(5,'2026_09_23_143913_create_equipements_table',2),
(6,'2026_09_23_143914_create_sites_table',2),
(7,'2026_09_23_143915_create_type_parcelles_table',2),
(8,'2026_09_23_143916_create_annees_table',2),
(9,'2026_09_23_143917_create_parcelles_table',2),
(10,'2026_09_23_143918_create_locations_table',2),
(11,'2026_09_23_143919_create_equipement_sites_table',2),
(12,'2026_09_23_143920_create_type_parcelle_annees_table',2),
(13,'2026_09_23_143921_create_demandes_table',2),
(14,'2026_09_23_143922_create_prestations_table',2),
(15,'2026_09_23_150506_add_client_and_consultation_to_demandes_table',3),
(16,'TON_FICHIER_add_client_and_consultation_to_demandes_table',3),
(17,'2026_10_07_143655_add_information_to_clients_table',4),
(18,'2026_10_14_144947_add_details_to_clients_equipements_and_demandes_tables',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `parcelles`
--

DROP TABLE IF EXISTS `parcelles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcelles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) unsigned NOT NULL,
  `type_parcelle_id` bigint(20) unsigned NOT NULL,
  `statut` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parcelles_site_id_foreign` (`site_id`),
  KEY `parcelles_type_parcelle_id_foreign` (`type_parcelle_id`),
  CONSTRAINT `parcelles_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `parcelles_type_parcelle_id_foreign` FOREIGN KEY (`type_parcelle_id`) REFERENCES `type_parcelles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcelles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `parcelles` WRITE;
/*!40000 ALTER TABLE `parcelles` DISABLE KEYS */;
INSERT INTO `parcelles` VALUES
(1,1,1,'Disponible','2026-09-23 13:03:36','2026-09-23 13:03:36'),
(2,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(3,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(4,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(5,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(6,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(7,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(8,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(9,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(10,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(11,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(12,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(13,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(14,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(15,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(16,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(17,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(18,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(19,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(20,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(21,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(22,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(23,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(24,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(25,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(26,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(27,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(28,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(29,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(30,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(31,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(32,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(33,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(34,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(35,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(36,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(37,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(38,2,1,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(39,3,1,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(40,4,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(41,5,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(42,6,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(43,7,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(44,8,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(45,9,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(46,10,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(47,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(48,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(49,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(50,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(51,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(52,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(53,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(54,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(55,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(56,2,1,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(57,3,1,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(58,4,2,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(59,5,2,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(60,6,2,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(61,7,2,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(62,8,3,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(63,9,3,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(64,10,3,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(65,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(66,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(67,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(68,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(69,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(70,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(71,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(72,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(73,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(74,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(75,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(76,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(77,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(78,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(79,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(80,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(81,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(82,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(83,2,1,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(84,3,1,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(85,4,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(86,5,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(87,6,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(88,7,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(89,8,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(90,9,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(91,10,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(92,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(93,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(94,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(95,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(96,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(97,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(98,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(99,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(100,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(101,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(102,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(103,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(104,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(105,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(106,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(107,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(108,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(109,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(110,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(111,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(112,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(113,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(114,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(115,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(116,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(117,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(118,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(119,2,1,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(120,3,1,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(121,4,2,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(122,5,2,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(123,6,2,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(124,7,2,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(125,8,3,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(126,9,3,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(127,10,3,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(128,2,1,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(129,3,1,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(130,4,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(131,5,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(132,6,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(133,7,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(134,8,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(135,9,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(136,10,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(137,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(138,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(139,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(140,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(141,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(142,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(143,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(144,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(145,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(146,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(147,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(148,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(149,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(150,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(151,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(152,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(153,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(154,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(155,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(156,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(157,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(158,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(159,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(160,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(161,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(162,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(163,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(164,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(165,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(166,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(167,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(168,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(169,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(170,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(171,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(172,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(173,2,1,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(174,3,1,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(175,4,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(176,5,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(177,6,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(178,7,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(179,8,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(180,9,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(181,10,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(182,2,1,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(183,3,1,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(184,4,2,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(185,5,2,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(186,6,2,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(187,7,2,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(188,8,3,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(189,9,3,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(190,10,3,'En entretien','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(191,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(192,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(193,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(194,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(195,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(196,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(197,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(198,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(199,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(200,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(201,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(202,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(203,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(204,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(205,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(206,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(207,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(208,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(209,2,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(210,3,1,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(211,4,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(212,5,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(213,6,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(214,7,2,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(215,8,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(216,9,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(217,10,3,'Disponible','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(218,2,1,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(219,3,1,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(220,4,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(221,5,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(222,6,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(223,7,2,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(224,8,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(225,9,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(226,10,3,'Louée','2026-10-07 13:44:35','2026-10-07 13:44:35'),
(257,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(258,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(259,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(260,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(261,1,1,'Louée','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(262,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(263,1,1,'En entretien','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(264,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(265,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(266,1,1,'Louée','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(267,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(268,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(269,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(270,1,1,'En entretien','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(271,1,1,'Louée','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(272,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(273,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(274,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(275,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(276,1,1,'Louée','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(277,1,1,'En entretien','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(278,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(279,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05'),
(280,1,1,'Disponible','2026-10-07 13:45:05','2026-10-07 13:45:05');
/*!40000 ALTER TABLE `parcelles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `prestations`
--

DROP TABLE IF EXISTS `prestations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `demande_id` bigint(20) unsigned NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prestations_demande_id_foreign` (`demande_id`),
  CONSTRAINT `prestations_demande_id_foreign` FOREIGN KEY (`demande_id`) REFERENCES `demandes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `prestations` WRITE;
/*!40000 ALTER TABLE `prestations` DISABLE KEYS */;
INSERT INTO `prestations` VALUES
(1,1,250.00,'Étude','2026-09-23 13:07:54','2026-09-23 13:07:54');
/*!40000 ALTER TABLE `prestations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('1oSju34mEWwsEmyu8rZkThzO7TpUrDBPSVANaQ31',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101 Firefox/140.0','eyJfdG9rZW4iOiI5VlROWU9xUktkTkZDUGtoMEZocGQ5cUZyZlRJTHBLQkpaRFNIdXFpIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hZG1pbiIsInJvdXRlIjoiYWRtaW4uZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiOGEzNzFjMDA1ZTg3MjJlOWYzYmRiNDIwNTFiZWIxYjVmNTQ5Mjg0NTU3MjkyODU0ZmJjNGQ4NGU5ZThiYTkxYiJ9',1791988010);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES
(1,'Site 1','1 rue de Paris','2026-09-23 13:03:10','2026-09-23 13:03:10'),
(2,'Site 2','2 rue de Paris','2026-10-07 13:42:27','2026-10-07 13:42:27'),
(3,'Site 3','3 rue de Paris','2026-10-07 13:42:27','2026-10-07 13:42:27'),
(4,'Site 4','4 rue de Paris','2026-10-07 13:42:27','2026-10-07 13:42:27'),
(5,'Site 5','5 rue de Paris','2026-10-07 13:42:27','2026-10-07 13:42:27'),
(6,'Site 6','6 rue de Paris','2026-10-07 13:42:27','2026-10-07 13:42:27'),
(7,'Site 7','7 rue de Paris','2026-10-07 13:42:27','2026-10-07 13:42:27'),
(8,'Site 8','8 rue de Paris','2026-10-07 13:42:27','2026-10-07 13:42:27'),
(9,'Site 9','9 rue de Paris','2026-10-07 13:42:27','2026-10-07 13:42:27'),
(10,'Site 10','10 rue de Paris','2026-10-07 13:42:27','2026-10-07 13:42:27');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `type_parcelle_annees`
--

DROP TABLE IF EXISTS `type_parcelle_annees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_parcelle_annees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_parcelle_id` bigint(20) unsigned NOT NULL,
  `annee_id` bigint(20) unsigned NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_parcelle_annees_type_parcelle_id_annee_id_unique` (`type_parcelle_id`,`annee_id`),
  KEY `type_parcelle_annees_annee_id_foreign` (`annee_id`),
  CONSTRAINT `type_parcelle_annees_annee_id_foreign` FOREIGN KEY (`annee_id`) REFERENCES `annees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `type_parcelle_annees_type_parcelle_id_foreign` FOREIGN KEY (`type_parcelle_id`) REFERENCES `type_parcelles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_parcelle_annees`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `type_parcelle_annees` WRITE;
/*!40000 ALTER TABLE `type_parcelle_annees` DISABLE KEYS */;
INSERT INTO `type_parcelle_annees` VALUES
(1,1,1,1500.00,'2026-09-23 13:03:29','2026-09-23 13:03:29');
/*!40000 ALTER TABLE `type_parcelle_annees` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `type_parcelles`
--

DROP TABLE IF EXISTS `type_parcelles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_parcelles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `superficie` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_parcelles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `type_parcelles` WRITE;
/*!40000 ALTER TABLE `type_parcelles` DISABLE KEYS */;
INSERT INTO `type_parcelles` VALUES
(1,'Petite',250.00,'2026-09-23 13:03:16','2026-09-23 13:03:16'),
(2,'Moyenne',400.00,'2026-10-07 14:16:55','2026-10-07 14:16:55'),
(3,'Grande',600.00,'2026-10-07 14:16:55','2026-10-07 14:16:55');
/*!40000 ALTER TABLE `type_parcelles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('client','admin','gestionnaire','comptable') NOT NULL DEFAULT 'client',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Admin','admin@terramoi.fr','admin',NULL,'$2y$12$alub9CDVXao7XTXYB1qc/OXi0bsxvh7u70xA2fFm5RonCbhFtrGc2',NULL,'2026-09-30 12:30:34','2026-10-07 13:15:48'),
(2,'Gestionnaire','gestionnaire@terramoi.fr','gestionnaire',NULL,'$2y$12$UeFO.F8E43uI4iNnslPGfOG/1gABEMJvTfO6cPnEi2OJyu4o69HnS',NULL,'2026-09-30 12:30:43','2026-09-30 12:32:42'),
(3,'Client','client@terramoi.fr','client',NULL,'$2y$12$cM/YQFxKjBAXR0X2acKlCeN7WmsT/UqwYTy2Rmlo2r185wHjbrOvO',NULL,'2026-09-30 12:30:50','2026-09-30 12:30:50'),
(4,'Comptable','comptable@terramoi.fr','comptable',NULL,'$2y$12$poTPmKwe8UK8qbbjyAotCuakdjCTrgJp/2VWBS5JpBhT8SqGZScgS',NULL,'2026-09-30 12:32:50','2026-09-30 12:32:50');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-10-14 17:05:15
