/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.7.26-0ubuntu0.18.04.1 : Database - laravelDemo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laravelDemo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `laravelDemo`;

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `books` */

/*Table structure for table `code` */

DROP TABLE IF EXISTS `code`;

CREATE TABLE `code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) DEFAULT '0',
  `createdDate` datetime DEFAULT NULL,
  `updatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `code` */

insert  into `code`(`id`,`code`,`description`,`status`,`createdDate`,`updatedDate`) values (1,'Flat','flat',1,'2019-06-04 19:10:22','2019-06-04 19:10:40'),(2,'Shop',NULL,1,'2019-06-04 19:10:48','2019-06-04 19:10:50'),(3,'Bungalow',NULL,1,'2019-06-04 19:11:02','2019-06-04 19:11:04'),(4,'Plot',NULL,1,'2019-06-04 19:11:13','2019-06-04 19:11:15');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `inquiry` */

DROP TABLE IF EXISTS `inquiry`;

CREATE TABLE `inquiry` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contactNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inquiryFor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inquiry_emailid_unique` (`emailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `inquiry` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_resets_table',1),(6,'2019_05_02_135750_create_failed_jobs_table',1),(7,'2019_05_22_132149_alter_user_table',2),(8,'2019_06_04_111815_create_books_table',3),(9,'2019_06_04_111844_create_ratings_table',3),(10,'2019_06_04_133152_create_inquiries_table',4),(11,'2019_06_04_134605_add_votes_to_users_table',5),(19,'2016_06_01_000001_create_oauth_auth_codes_table',6),(20,'2016_06_01_000002_create_oauth_access_tokens_table',6),(21,'2016_06_01_000003_create_oauth_refresh_tokens_table',6),(22,'2016_06_01_000004_create_oauth_clients_table',6),(23,'2016_06_01_000005_create_oauth_personal_access_clients_table',6),(24,'2019_06_04_134646_alter_inquiry_table',6);

/*Table structure for table `oauth_access_tokens` */

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_access_tokens` */

insert  into `oauth_access_tokens`(`id`,`user_id`,`client_id`,`name`,`scopes`,`revoked`,`created_at`,`updated_at`,`expires_at`) values ('03db2c7e249e47077d8af28872fb96e6138cef9f7a3f42d46cfaeb6d475bcaae89d90381efd82633',1,1,'LaravelDemo','[]',0,'2019-06-06 11:38:33','2019-06-06 11:38:33','2020-06-06 11:38:33'),('0ecff5d9cc9f2b46c16235af0f9b26784244b47b3971a39deea04d85450af644c8d13118f3541265',1,1,'LaravelDemo','[]',0,'2019-06-06 11:37:26','2019-06-06 11:37:26','2020-06-06 11:37:26'),('12b3211ad2f74bc085548e3000d1d7d0340dda9b484197346c3dee9e9046c1e54c0051a261d1cbd6',1,1,'LaravelDemo','[]',0,'2019-06-06 11:42:30','2019-06-06 11:42:30','2020-06-06 11:42:30'),('52a5104c11c624ec3575087016e89ab645bbeafdfc7b1eeedaaa46dcbd1db36e97cf0c3d4d5b6273',1,1,'LaravelDemo','[]',0,'2019-06-06 11:44:14','2019-06-06 11:44:14','2020-06-06 11:44:14'),('576a7c416cbf8b3ca95b029455485baf25e870a540d2430eed5879b7eabf6ed2bd7f70890b96226e',1,1,'LaravelDemo','[]',0,'2019-06-06 11:38:32','2019-06-06 11:38:32','2020-06-06 11:38:32'),('753bb5632e4d1f5a9e69be0865789f94fa7eb71515b9678c9e9b0ff8483705d8433200783094d9e5',1,1,'LaravelDemo','[]',0,'2019-06-06 11:44:17','2019-06-06 11:44:17','2020-06-06 11:44:17'),('895db680d87e207fb0a5ea125308169119d7f8dd9ce60ba442ccccc2b9d495b244cb688f6c7b5f60',1,1,'LaravelDemo','[]',0,'2019-06-06 11:38:32','2019-06-06 11:38:32','2020-06-06 11:38:32'),('8a66b044ee7ac1ba3084fc5096140ee2df279b31cdc649d98b9b4abc9c6eb2a9d582581452d07fdd',3,1,'LaravelDemo','[]',0,'2019-06-06 12:31:02','2019-06-06 12:31:02','2020-06-06 12:31:02');

/*Table structure for table `oauth_auth_codes` */

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_auth_codes` */

/*Table structure for table `oauth_clients` */

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_clients` */

insert  into `oauth_clients`(`id`,`user_id`,`name`,`secret`,`redirect`,`personal_access_client`,`password_client`,`revoked`,`created_at`,`updated_at`) values (1,NULL,'LaravelDemo Personal Access Client','dOdyZ1QUngxhuUANWFtUynQNLwntZC5Q5W9fuQ9A','http://localhost',1,0,0,'2019-06-06 11:37:13','2019-06-06 11:37:13');

/*Table structure for table `oauth_personal_access_clients` */

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_personal_access_clients` */

insert  into `oauth_personal_access_clients`(`id`,`client_id`,`created_at`,`updated_at`) values (1,1,'2019-06-06 11:37:13','2019-06-06 11:37:13');

/*Table structure for table `oauth_refresh_tokens` */

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_refresh_tokens` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `ratings` */

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ratings` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`username`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`type`) values (1,'YogeshN','ysnayi','yogesh@sports-it.com',NULL,'$2y$10$uIxzpnc2yL0qy1.mzI3Y8eMT4Uim5eKJQjWXpZLZRZdS7mJiIC5XS',NULL,'2019-05-21 14:21:47','2019-05-22 13:18:27','admin'),(2,'demo','demo','demo@demo.com',NULL,'$2y$10$fi5tjVtiyOarH1DJCgyEK..eMFPSyvM2gAnnnWg.vMCrEVklrZO.u',NULL,'2019-06-06 12:29:12','2019-06-06 12:29:12','default'),(3,'demo','demo1','demo1@demo.com',NULL,'$2y$10$Hb.Vrq8fsBtG6HMPVCISRuMjY/YHB1Dw/Nv2rr9VNezfdgnmLHer.',NULL,'2019-06-06 12:31:02','2019-06-06 12:31:02','default');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
