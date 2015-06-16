# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.6.19)
# Database: wca
# Generation Time: 2015-06-16 02:15:53 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20150522192707'),
	('20150612183227'),
	('20150616014317');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `access` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_active` datetime DEFAULT '2015-06-16 00:53:31',
  `login_count` int(11) DEFAULT '0',
  `gamertag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password_digest`, `access`, `created_at`, `updated_at`, `last_active`, `login_count`, `gamertag`)
VALUES
	(1,'Will Robinson','will@wambl.com','$2a$10$W8Xa6Fjqx3EyMq7pMZLsde.RPWFw57VFN7hFbhZDHlINXi0cqMwq.',0,'2015-06-16 01:03:17','2015-06-16 02:06:41','2015-06-16 02:06:41',2,'AthleteInAction'),
	(2,'Brad Huff','octavarium_xx@wca.com','$2a$10$K88Ya9GLIxp6/Pb1i.DR9eATreID9iAMSUQtUah1Ka6r8KWL/c70.',0,'2015-06-16 01:53:53','2015-06-16 01:55:05','2015-06-16 00:53:31',0,'Octavarium XX'),
	(3,'Matt Arevalo','dafdhunter@wca.com','$2a$10$ANKu31jZOyOXVabJUVl6Gex/Uk2jbL1UPU4/6Vuk2RIsQQwMJdqIW',0,'2015-06-16 01:54:49','2015-06-16 01:54:49','2015-06-16 00:53:31',0,'DafDHunter'),
	(4,'Jason','jhabanaro@wca.com','$2a$10$t77KUoYG/TzxO9okQFQhSub3RPcNZdmI.nbRN3AmZQkR35UW.ACV.',0,'2015-06-16 01:55:39','2015-06-16 01:55:39','2015-06-16 00:53:31',0,'JHABANARO'),
	(5,'Ari Shapiro','finchpoker@wca.com','$2a$10$M6WmslgA8NYxdx7dpUIT9.0L4F.UIS3vl9a8ud582H8kXADi083Ou',0,'2015-06-16 01:57:18','2015-06-16 01:57:18','2015-06-16 00:53:31',0,'Finchpoker'),
	(6,'Paul','digs510@wca.com','$2a$10$7som2EYwI2bXdJMswMslu.2QjKiCrXn.h7/FFyyWrpMenJf2nxbyS',0,'2015-06-16 01:57:58','2015-06-16 01:57:58','2015-06-16 00:53:31',0,'Digs510');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
