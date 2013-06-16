# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.29)
# Database: yousef
# Generation Time: 2013-06-16 23:19:22 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table craft_assetfiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetfiles`;

CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` smallint(6) unsigned DEFAULT NULL,
  `height` smallint(6) unsigned DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  KEY `craft_assetfiles_folderId_fk` (`folderId`),
  CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetfiles` WRITE;
/*!40000 ALTER TABLE `craft_assetfiles` DISABLE KEYS */;

INSERT INTO `craft_assetfiles` (`id`, `sourceId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(5,1,1,'ellie.jpg','image',1000,600,95674,'2013-06-16 18:16:12','2013-06-16 18:16:12','2013-06-16 18:16:12','f5f8ce43-d726-444a-9639-6c9074829bb6'),
	(6,1,1,'coxon.jpg','image',1000,600,146245,'2013-06-16 18:16:13','2013-06-16 18:16:13','2013-06-16 18:16:13','cf2c1d8a-1f85-42f5-a984-d9a1a459e0cc'),
	(7,1,1,'1200x700.gif','image',1200,700,4937,'2013-06-16 18:16:52','2013-06-16 18:16:52','2013-06-16 18:16:52','839b1526-92ed-4564-82c6-cd4dcac5dcd0'),
	(10,1,1,'htc.jpg','image',1000,600,179947,'2013-06-16 23:10:38','2013-06-16 23:10:39','2013-06-16 23:10:39','f6e8b050-73c0-403b-83b2-e03784b70dd8');

/*!40000 ALTER TABLE `craft_assetfiles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_assetfolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetfolders`;

CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  KEY `craft_assetfolders_parentId_fk` (`parentId`),
  KEY `craft_assetfolders_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetfolders` WRITE;
/*!40000 ALTER TABLE `craft_assetfolders` DISABLE KEYS */;

INSERT INTO `craft_assetfolders` (`id`, `parentId`, `sourceId`, `name`, `fullPath`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'Projects','','2013-06-16 18:07:53','2013-06-16 18:07:53','497b4279-b89b-4bcb-8461-b171336ce5e6');

/*!40000 ALTER TABLE `craft_assetfolders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetindexdata`;

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  KEY `craft_assetindexdata_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_assetsources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetsources`;

CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetsources` WRITE;
/*!40000 ALTER TABLE `craft_assetsources` DISABLE KEYS */;

INSERT INTO `craft_assetsources` (`id`, `name`, `type`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Projects','Local','{\"path\":\"\\/Users\\/sean\\/sites\\/yousef\\/public\\/assets\\/projects\\/\",\"url\":\"http:\\/\\/yousef\\/assets\\/projects\\/\"}',1,'2013-06-16 18:07:53','2013-06-16 18:07:53','4f67d426-5624-4ee9-9be1-c4bf02116273');

/*!40000 ALTER TABLE `craft_assetsources` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransformindex`;

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) NOT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assettransformindex` WRITE;
/*!40000 ALTER TABLE `craft_assettransformindex` DISABLE KEYS */;

INSERT INTO `craft_assettransformindex` (`id`, `fileId`, `location`, `sourceId`, `fileExists`, `inProgress`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,6,'_100x100_crop_center-center',1,1,0,'2013-06-16 18:16:13','2013-06-16 18:16:13','2013-06-16 18:16:15','4c553404-498f-4ac1-b539-2f1f296af367'),
	(2,6,'_200x200_crop_center-center',1,1,0,'2013-06-16 18:16:13','2013-06-16 18:16:13','2013-06-16 18:16:15','5ff2be33-47e6-4dd5-ae5b-f97d43fb6127'),
	(3,5,'_100x100_crop_center-center',1,1,0,'2013-06-16 18:16:13','2013-06-16 18:16:13','2013-06-16 18:16:15','cedb369c-bc2c-4a32-8c62-2635565aaead'),
	(4,5,'_200x200_crop_center-center',1,1,0,'2013-06-16 18:16:13','2013-06-16 18:16:13','2013-06-16 18:16:15','0a5e7b0f-d1a5-4b82-b9bb-d0a36be0188c'),
	(5,7,'_100x100_crop_center-center',1,1,0,'2013-06-16 18:16:53','2013-06-16 18:16:53','2013-06-16 18:16:55','71933993-8861-4ca2-a088-420bdad4f219'),
	(6,7,'_200x200_crop_center-center',1,1,0,'2013-06-16 18:16:53','2013-06-16 18:16:53','2013-06-16 18:16:54','c2bb6cff-fe1e-4ec8-b68d-4d044d0f23c8'),
	(10,7,'_projectImages',1,1,0,'2013-06-16 22:27:46','2013-06-16 22:27:46','2013-06-16 22:27:54','4b302098-0dc4-46a7-9f7a-07677ed7bfb9'),
	(11,6,'_projectImages',1,1,0,'2013-06-16 22:27:46','2013-06-16 22:27:46','2013-06-16 22:27:53','9ff87569-99c5-4470-b552-68f1c831a0e7'),
	(12,5,'_projectImages',1,1,0,'2013-06-16 22:27:46','2013-06-16 22:27:46','2013-06-16 22:27:53','1dbbe504-990f-42f0-9364-29017f01b493'),
	(13,10,'_projectImages',1,1,0,'2013-06-16 23:12:09','2013-06-16 23:12:09','2013-06-16 23:12:13','9040e733-a93e-4aca-9020-2a447f299f8d');

/*!40000 ALTER TABLE `craft_assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransforms`;

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assettransforms` WRITE;
/*!40000 ALTER TABLE `craft_assettransforms` DISABLE KEYS */;

INSERT INTO `craft_assettransforms` (`id`, `name`, `handle`, `mode`, `position`, `height`, `width`, `dimensionChangeTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Project Images','projectImages','crop','center-center',600,1000,'2013-06-16 22:27:40','2013-06-16 18:09:21','2013-06-16 22:27:40','adff5a62-5cc2-4e72-9e63-9f7631e65f55');

/*!40000 ALTER TABLE `craft_assettransforms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_content`;

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `projectDescription` text COLLATE utf8_unicode_ci,
  `caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `videoPhotos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `videoLink` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_content_locale_fk` (`locale`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `heading`, `body`, `projectDescription`, `caption`, `videoPhotos`, `videoLink`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,2,'en_gb','Welcome to Yousef!','<p>It’s true, this site doesn’t have a whole lot of content yet, but don’t worry. Our web developers have just installed the CMS, and they’re setting things up for the content editors this very moment. Soon Yousef will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.</p>',NULL,NULL,NULL,NULL,'2013-06-16 16:04:15','2013-06-16 16:04:15','2ca7ba61-746e-4011-ba9d-b1107569344b'),
	(2,3,'en_gb',NULL,'<p>Craft is the CMS that’s powering Yousef. It’s beautiful, powerful, flexible, and easy-to-use, and it’s made by Pixel &amp; Tonic. We can’t wait to dive in and see what it’s capabl</p><!--pagebreak--><p>This is even more captivating content, which you couldn’t see on the News index page because it was entered after a Page Break, and the News index template only likes to show the content on the first page.</p><p>Craft: a nice alternative to Word, if you’re making a website.</p>','<p>\r\n	   A selection of portraits taken over the last number of years.\r\n</p>',NULL,'photos','','2013-06-16 16:04:15','2013-06-16 22:57:34','b41422e0-a50a-4828-a70c-c2ff81ed8bba'),
	(3,4,'en_gb',NULL,NULL,'<p>\r\n	      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae, repellat culpa illo necessitatibus. Aspernatur, esse, vero, at, necessitatibus omnis deleniti praesentium accusamus repudiandae delectus porro hic alias libero reiciendis architecto ea sapiente dolorum tempora a facere aut eveniet quod provident harum error quidem.\r\n</p>',NULL,'video','<iframe src=\"http://player.vimeo.com/video/13192795\" width=\"1000\" height=\"600\" frameborder=\"0\" webkitallowfullscreen=\"\" mozallowfullscreen=\"\" allowfullscreen=\"\">\r\n</iframe>','2013-06-16 18:05:15','2013-06-16 22:55:56','173aeb06-a83b-41ff-9804-572aea72f30f'),
	(4,7,'en_gb',NULL,NULL,NULL,'Placeholder caption',NULL,NULL,'2013-06-16 18:17:14','2013-06-16 18:47:13','977308fa-d833-4318-adff-612042c4cd41'),
	(5,6,'en_gb',NULL,NULL,NULL,'Graham Coxon',NULL,NULL,'2013-06-16 18:17:19','2013-06-16 18:47:20','4848bb34-34fd-4015-b137-d77547b22c10'),
	(6,8,'en_gb',NULL,NULL,'<p>\r\n	   General photos\r\n</p>',NULL,'photos','','2013-06-16 20:06:48','2013-06-16 22:58:05','da69d547-4cac-40f5-9c1a-f33ecadd5ff6'),
	(7,9,'en_gb',NULL,NULL,'<p>\r\n	 Project Description\r\n</p>',NULL,'video','<iframe src=\"http://player.vimeo.com/video/41414855?title=0&amp;byline=0&amp;portrait=0&amp;color=ffffff\" width=\"1000\" height=\"600\" frameborder=\"0\" webkitallowfullscreen=\"\" mozallowfullscreen=\"\" allowfullscreen=\"\">\r\n</iframe>','2013-06-16 23:08:33','2013-06-16 23:11:40','ea1b8ad8-88c7-4f51-9845-a049441e7fd7');

/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements`;

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_idx` (`archived`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;

INSERT INTO `craft_elements` (`id`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'User',1,0,'2013-06-16 16:04:14','2013-06-16 16:04:14','69970d13-6785-462f-a429-656bb9c5c887'),
	(2,'GlobalSet',1,0,'2013-06-16 16:04:15','2013-06-16 16:04:15','c1921393-9018-47d9-93f1-7588569725b0'),
	(3,'Entry',1,0,'2013-06-16 16:04:15','2013-06-16 22:57:34','c2a7e005-2116-4466-a2a7-4358ad48cdf7'),
	(4,'Entry',1,0,'2013-06-16 18:05:15','2013-06-16 22:55:56','67611268-fb9f-4932-a882-c04ca199e9c6'),
	(5,'Asset',1,0,'2013-06-16 18:16:12','2013-06-16 18:16:12','7517408c-0d02-40b0-ac6d-c0d95f2c8497'),
	(6,'Asset',1,0,'2013-06-16 18:16:13','2013-06-16 18:16:13','11a07cd7-0037-4d55-8dfb-1bee1a1bf84f'),
	(7,'Asset',1,0,'2013-06-16 18:16:52','2013-06-16 18:16:52','7ca52530-c616-499a-ac58-8ae0591a5b92'),
	(8,'Entry',1,0,'2013-06-16 20:06:48','2013-06-16 22:58:05','2f4e6b88-dc15-4c72-a9c0-a4a82eb362be'),
	(9,'Entry',1,0,'2013-06-16 23:08:33','2013-06-16 23:11:40','d57f2327-1c03-4b1d-a9fa-156b7bf4f547'),
	(10,'Asset',1,0,'2013-06-16 23:10:39','2013-06-16 23:10:39','75464839-de54-40a9-aa37-6edb4bf4d0ea');

/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_elements_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements_i18n`;

CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  KEY `craft_elements_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_elements_i18n` WRITE;
/*!40000 ALTER TABLE `craft_elements_i18n` DISABLE KEYS */;

INSERT INTO `craft_elements_i18n` (`id`, `elementId`, `locale`, `uri`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,3,'en_gb','book-two','2013-06-16 16:04:15','2013-06-16 22:57:34','14d88103-c02b-4059-8b19-7e0125edc6f9'),
	(2,4,'en_gb','henry-holland','2013-06-16 18:05:15','2013-06-16 22:55:56','21d1ae9f-e522-4084-85ea-8435e45958ec'),
	(3,8,'en_gb','book-one','2013-06-16 20:06:48','2013-06-16 22:58:05','776f59f7-3a01-416b-b6e4-6c10c5d1cc39'),
	(4,9,'en_gb','htc-challenge','2013-06-16 23:08:33','2013-06-16 23:11:40','7c677858-279b-40a4-8320-adb131197256');

/*!40000 ALTER TABLE `craft_elements_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_emailmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_emailmessages`;

CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entries`;

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_fk` (`authorId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;

INSERT INTO `craft_entries` (`id`, `sectionId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,1,1,'2013-06-16 16:04:00',NULL,'2013-06-16 16:04:15','2013-06-16 22:57:34','7edf98a2-4675-49d2-a4b0-35d78aeeff9d'),
	(4,1,1,'2013-06-16 20:10:00',NULL,'2013-06-16 18:05:15','2013-06-16 22:55:56','1e976a8d-bc92-46ad-9ad3-14c1a3c4b139'),
	(8,1,1,'2013-06-16 20:06:00',NULL,'2013-06-16 20:06:48','2013-06-16 22:58:05','e28d6841-cf7d-402d-838b-c1f35d0f0f77'),
	(9,1,1,'2013-06-16 23:08:00',NULL,'2013-06-16 23:08:33','2013-06-16 23:11:40','ab560c9f-eec6-47ed-ac98-778ede9a11d1');

/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_entries_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entries_i18n`;

CREATE TABLE `craft_entries_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entries_i18n_entryId_locale_unq_idx` (`entryId`,`locale`),
  UNIQUE KEY `craft_entries_i18n_slug_sectionId_locale_unq_idx` (`slug`,`sectionId`,`locale`),
  KEY `craft_entries_i18n_title_idx` (`title`),
  KEY `craft_entries_i18n_sectionId_fk` (`sectionId`),
  KEY `craft_entries_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_entries_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entries_i18n_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entries_i18n` WRITE;
/*!40000 ALTER TABLE `craft_entries_i18n` DISABLE KEYS */;

INSERT INTO `craft_entries_i18n` (`id`, `entryId`, `sectionId`, `locale`, `title`, `slug`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,3,1,'en_gb','Book Two','book-two','2013-06-16 16:04:15','2013-06-16 22:57:34','739519a7-e016-4635-829c-2038840870d9'),
	(2,4,1,'en_gb','Henry Holland','henry-holland','2013-06-16 18:05:15','2013-06-16 22:55:56','2f2e8eac-be7e-49bf-a752-0277dc601a6c'),
	(3,8,1,'en_gb','Book One','book-one','2013-06-16 20:06:48','2013-06-16 22:58:05','fea1d7c7-0a44-4f95-aa83-46b0db5374c0'),
	(4,9,1,'en_gb','HTC Challenge','htc-challenge','2013-06-16 23:08:33','2013-06-16 23:11:40','fd3e35a0-5003-4de9-b694-10864f64d2f6');

/*!40000 ALTER TABLE `craft_entries_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_entrydrafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrydrafts`;

CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  KEY `craft_entrydrafts_locale_fk` (`locale`),
  CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`),
  CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_entrytags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrytags`;

CREATE TABLE `craft_entrytags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(10) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entrytags_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_entrytags_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrytags_entries`;

CREATE TABLE `craft_entrytags_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrytags_entries_tagId_fk` (`tagId`),
  KEY `craft_entrytags_entries_entryId_fk` (`entryId`),
  CONSTRAINT `craft_entrytags_entries_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrytags_entries_tagId_fk` FOREIGN KEY (`tagId`) REFERENCES `craft_entrytags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_entryversions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entryversions`;

CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  KEY `craft_entryversions_locale_fk` (`locale`),
  CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`),
  CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entryversions` WRITE;
/*!40000 ALTER TABLE `craft_entryversions` DISABLE KEYS */;

INSERT INTO `craft_entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `locale`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,4,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"Henry Holland\",\"slug\":\"henry-holland\",\"postDate\":1371405914,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"4\":\"<p>\\r\\n\\t<span style=\\\"font-family: Arial, Helvetica, Verdana, Tahoma, sans-serif;\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae, repellat culpa illo necessitatibus. Aspernatur, esse, vero, at, necessitatibus omnis deleniti praesentium accusamus repudiandae delectus porro hic alias libero reiciendis architecto ea sapiente dolorum tempora a facere aut eveniet quod provident harum error quidem. Libero, aliquid, illum, harum quidem reiciendis nisi labore dolore aspernatur dignissimos nam ipsum ex dolores reprehenderit sequi debitis repellat iusto modi maiores possimus quia alias deserunt consequatur tempora. Temporibus, adipisci, optio ea assumenda obcaecati numquam fugit iste quidem dolore aspernatur commodi earum quam autem veritatis id labore beatae impedit rem cupiditate est. Necessitatibus alias optio odit impedit.<\\/span>\\r\\n<\\/p>\"}}','2013-06-16 18:05:15','2013-06-16 18:05:15','fa047c02-10d5-4dd2-83bd-8c37feb88415'),
	(2,4,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"Henry Holland\",\"slug\":\"henry-holland\",\"postDate\":1371405900,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"4\":\"<p>\\r\\n\\t Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae, repellat culpa illo necessitatibus. Aspernatur, esse, vero, at, necessitatibus omnis deleniti praesentium accusamus repudiandae delectus porro hic alias libero reiciendis architecto ea sapiente dolorum tempora a facere aut eveniet quod provident harum error quidem. Libero, aliquid, illum, harum quidem reiciendis nisi labore dolore aspernatur dignissimos nam ipsum ex dolores reprehenderit sequi debitis repellat iusto modi maiores possimus quia alias deserunt consequatur tempora. Temporibus, adipisci, optio ea assumenda obcaecati numquam fugit iste quidem dolore aspernatur commodi earum quam autem veritatis id labore beatae impedit rem cupiditate est. Necessitatibus alias optio odit impedit.\\r\\n<\\/p>\",\"5\":[\"5\"]}}','2013-06-16 18:19:51','2013-06-16 18:19:51','b8a0d29a-c592-418e-b9c9-4d7bb7107888'),
	(3,3,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"We just installed Craft!\",\"slug\":\"we-just-installed-craft\",\"postDate\":1371398640,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"2\":\"<p>Craft is the CMS that\\u2019s powering Yousef. It\\u2019s beautiful, powerful, flexible, and easy-to-use, and it\\u2019s made by Pixel &amp; Tonic. We can\\u2019t wait to dive in and see what it\\u2019s capabl<\\/p><!--pagebreak--><p>This is even more captivating content, which you couldn\\u2019t see on the News index page because it was entered after a Page Break, and the News index template only likes to show the content on the first page.<\\/p><p>Craft: a nice alternative to Word, if you\\u2019re making a website.<\\/p>\",\"4\":\"<p>\\r\\n\\tSome text here\\r\\n<\\/p>\",\"5\":[\"6\"],\"8\":\"\",\"7\":\"video\"}}','2013-06-16 19:29:17','2013-06-16 19:29:17','17b78341-682f-434a-b915-5961a38c116d'),
	(4,4,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"Henry Holland\",\"slug\":\"henry-holland\",\"postDate\":1371405900,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"4\":\"<p>\\r\\n\\t  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae, repellat culpa illo necessitatibus. Aspernatur, esse, vero, at, necessitatibus omnis deleniti praesentium accusamus repudiandae delectus porro hic alias libero reiciendis architecto ea sapiente dolorum tempora a facere aut eveniet quod provident harum error quidem. Libero, aliquid, illum, harum quidem reiciendis nisi labore dolore aspernatur dignissimos nam ipsum ex dolores reprehenderit sequi debitis repellat iusto modi maiores possimus quia alias deserunt consequatur tempora. Temporibus, adipisci, optio ea assumenda obcaecati numquam fugit iste quidem dolore aspernatur commodi earum quam autem veritatis id labore beatae impedit rem cupiditate est. Necessitatibus alias optio odit impedit.\\r\\n<\\/p>\",\"5\":[\"5\"],\"8\":\"\",\"7\":\"photos\"}}','2013-06-16 19:29:24','2013-06-16 19:29:24','9ef41aef-8efb-47b8-a7b1-c5fec6ab51ed'),
	(5,4,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"Henry Holland\",\"slug\":\"henry-holland\",\"postDate\":1371405900,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"4\":\"<p>\\r\\n\\t   Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae, repellat culpa illo necessitatibus. Aspernatur, esse, vero, at, necessitatibus omnis deleniti praesentium accusamus repudiandae delectus porro hic alias libero reiciendis architecto ea sapiente dolorum tempora a facere aut eveniet quod provident harum error quidem. Libero, aliquid, illum, harum quidem reiciendis nisi labore dolore aspernatur dignissimos nam ipsum ex dolores reprehenderit sequi debitis repellat iusto modi maiores possimus quia alias deserunt consequatur tempora. Temporibus, adipisci, optio ea assumenda obcaecati numquam fugit iste quidem dolore aspernatur commodi earum quam autem veritatis id labore beatae impedit rem cupiditate est. Necessitatibus alias optio odit impedit.\\r\\n<\\/p>\",\"5\":[\"5\"],\"8\":\"\",\"7\":\"photos\"}}','2013-06-16 19:46:04','2013-06-16 19:46:04','527981e3-17fb-4ec9-b7a8-f72de20e18aa'),
	(6,3,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"We just installed Craft!\",\"slug\":\"we-just-installed-craft\",\"postDate\":1371398640,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"2\":\"<p>Craft is the CMS that\\u2019s powering Yousef. It\\u2019s beautiful, powerful, flexible, and easy-to-use, and it\\u2019s made by Pixel &amp; Tonic. We can\\u2019t wait to dive in and see what it\\u2019s capabl<\\/p><!--pagebreak--><p>This is even more captivating content, which you couldn\\u2019t see on the News index page because it was entered after a Page Break, and the News index template only likes to show the content on the first page.<\\/p><p>Craft: a nice alternative to Word, if you\\u2019re making a website.<\\/p>\",\"4\":\"<p>\\r\\n\\t Some text here\\r\\n<\\/p>\",\"5\":[\"6\"],\"8\":\"\",\"7\":\"video\"}}','2013-06-16 19:46:10','2013-06-16 19:46:10','954aa8ff-90f5-492c-9358-277d402cda94'),
	(7,8,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"This is the Title\",\"slug\":\"this-is-the-title\",\"postDate\":1371413208,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"4\":\"<p>\\r\\n\\tsome text\\r\\n<\\/p>\",\"5\":[\"7\"],\"8\":\"\",\"7\":\"photos\"}}','2013-06-16 20:06:48','2013-06-16 20:06:48','03547bbe-47b2-4d04-8066-01bb83171b67'),
	(8,8,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"This is the Title\",\"slug\":\"this-is-the-title\",\"postDate\":1371413160,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"4\":\"<p>\\r\\n\\t some text\\r\\n<\\/p>\",\"5\":[\"7\",\"6\",\"5\"],\"8\":\"\",\"7\":\"photos\"}}','2013-06-16 20:34:27','2013-06-16 20:34:27','496c67c4-8b09-405d-a1ec-3530c2b8db3d'),
	(9,4,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"Henry Holland\",\"slug\":\"henry-holland\",\"postDate\":1371405900,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"4\":\"<p>\\r\\n\\t    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae, repellat culpa illo necessitatibus. Aspernatur, esse, vero, at, necessitatibus omnis deleniti praesentium accusamus repudiandae delectus porro hic alias libero reiciendis architecto ea sapiente dolorum tempora a facere aut eveniet quod provident harum error quidem.\\r\\n<\\/p>\",\"5\":[\"5\"],\"8\":\"<iframe src=\\\"http:\\/\\/player.vimeo.com\\/video\\/13192795\\\" width=\\\"1000\\\" height=\\\"600\\\" frameborder=\\\"0\\\" webkitAllowFullScreen mozallowfullscreen allowFullScreen><\\/iframe>\",\"7\":\"video\"}}','2013-06-16 21:56:18','2013-06-16 21:56:18','5b9d7eda-b993-49b4-92e0-013992c84114'),
	(10,4,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"Henry Holland\",\"slug\":\"henry-holland\",\"postDate\":1371405900,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"4\":\"<p>\\r\\n\\t     Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae, repellat culpa illo necessitatibus. Aspernatur, esse, vero, at, necessitatibus omnis deleniti praesentium accusamus repudiandae delectus porro hic alias libero reiciendis architecto ea sapiente dolorum tempora a facere aut eveniet quod provident harum error quidem.\\r\\n<\\/p>\",\"5\":[\"5\"],\"8\":\"<iframe src=\\\"http:\\/\\/player.vimeo.com\\/video\\/13192795\\\" width=\\\"1000\\\" height=\\\"600\\\" frameborder=\\\"0\\\" webkitallowfullscreen=\\\"\\\" mozallowfullscreen=\\\"\\\" allowfullscreen=\\\"\\\">\\r\\n<\\/iframe>\",\"7\":\"video\"}}','2013-06-16 22:06:00','2013-06-16 22:06:00','f859a025-3466-4dc6-a794-e7972bf6f291'),
	(11,4,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"Henry Holland\",\"slug\":\"henry-holland\",\"postDate\":1371413400,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"4\":\"<p>\\r\\n\\t      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae, repellat culpa illo necessitatibus. Aspernatur, esse, vero, at, necessitatibus omnis deleniti praesentium accusamus repudiandae delectus porro hic alias libero reiciendis architecto ea sapiente dolorum tempora a facere aut eveniet quod provident harum error quidem.\\r\\n<\\/p>\",\"5\":[\"5\"],\"8\":\"<iframe src=\\\"http:\\/\\/player.vimeo.com\\/video\\/13192795\\\" width=\\\"1000\\\" height=\\\"600\\\" frameborder=\\\"0\\\" webkitallowfullscreen=\\\"\\\" mozallowfullscreen=\\\"\\\" allowfullscreen=\\\"\\\">\\r\\n<\\/iframe>\",\"7\":\"video\"}}','2013-06-16 22:55:56','2013-06-16 22:55:56','7da62e98-115b-410f-8f94-89012c94edcf'),
	(12,8,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"Book One\",\"slug\":\"book-one\",\"postDate\":1371413160,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"4\":\"<p>\\r\\n\\t  some text\\r\\n<\\/p>\",\"5\":[\"7\",\"6\",\"5\"],\"8\":\"\",\"7\":\"photos\"}}','2013-06-16 22:56:26','2013-06-16 22:56:26','5c910d99-93cd-408d-9ab9-d1cd98c41765'),
	(13,3,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"Book Two\",\"slug\":\"we-just-installed-craft\",\"postDate\":1371398640,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"2\":\"<p>Craft is the CMS that\\u2019s powering Yousef. It\\u2019s beautiful, powerful, flexible, and easy-to-use, and it\\u2019s made by Pixel &amp; Tonic. We can\\u2019t wait to dive in and see what it\\u2019s capabl<\\/p><!--pagebreak--><p>This is even more captivating content, which you couldn\\u2019t see on the News index page because it was entered after a Page Break, and the News index template only likes to show the content on the first page.<\\/p><p>Craft: a nice alternative to Word, if you\\u2019re making a website.<\\/p>\",\"4\":\"<p>\\r\\n\\t  A selection of portraits taken over the last number of years.\\r\\n<\\/p>\",\"5\":[\"6\"],\"8\":\"\",\"7\":\"photos\"}}','2013-06-16 22:56:59','2013-06-16 22:56:59','fe3726ef-6cb8-4a31-af47-897058f23558'),
	(14,3,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"Book Two\",\"slug\":\"book-two\",\"postDate\":1371398640,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"2\":\"<p>Craft is the CMS that\\u2019s powering Yousef. It\\u2019s beautiful, powerful, flexible, and easy-to-use, and it\\u2019s made by Pixel &amp; Tonic. We can\\u2019t wait to dive in and see what it\\u2019s capabl<\\/p><!--pagebreak--><p>This is even more captivating content, which you couldn\\u2019t see on the News index page because it was entered after a Page Break, and the News index template only likes to show the content on the first page.<\\/p><p>Craft: a nice alternative to Word, if you\\u2019re making a website.<\\/p>\",\"4\":\"<p>\\r\\n\\t   A selection of portraits taken over the last number of years.\\r\\n<\\/p>\",\"5\":[\"6\"],\"8\":\"\",\"7\":\"photos\"}}','2013-06-16 22:57:35','2013-06-16 22:57:35','41934b8f-7c93-4c68-a97a-670ffae24cce'),
	(15,8,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"Book One\",\"slug\":\"book-one\",\"postDate\":1371413160,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"4\":\"<p>\\r\\n\\t   General photos\\r\\n<\\/p>\",\"5\":[\"7\",\"6\",\"5\"],\"8\":\"\",\"7\":\"photos\"}}','2013-06-16 22:58:05','2013-06-16 22:58:05','e08f80a4-1a42-4986-ac8a-75ca527fdd55'),
	(16,9,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"HTC Challenge\",\"slug\":\"htc-challenge\",\"postDate\":1371424112,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"4\":\"<p>\\r\\n\\tProject Description\\r\\n<\\/p>\",\"8\":\"<iframe src=\\\"http:\\/\\/player.vimeo.com\\/video\\/41414855?title=0&amp;byline=0&amp;portrait=0&amp;color=ffffff\\\" width=\\\"1000\\\" height=\\\"600\\\" frameborder=\\\"0\\\" webkitallowfullscreen=\\\"\\\" mozallowfullscreen=\\\"\\\" allowfullscreen=\\\"\\\">\\r\\n<\\/iframe>\",\"7\":\"video\"}}','2013-06-16 23:08:33','2013-06-16 23:08:33','8cd1e355-e2b4-40e8-9a2c-6931d43ef54e'),
	(17,9,1,1,'en_gb',NULL,'{\"authorId\":\"1\",\"title\":\"HTC Challenge\",\"slug\":\"htc-challenge\",\"postDate\":1371424080,\"expiryDate\":null,\"enabled\":1,\"tags\":[],\"fields\":{\"4\":\"<p>\\r\\n\\t Project Description\\r\\n<\\/p>\",\"5\":[\"10\"],\"8\":\"<iframe src=\\\"http:\\/\\/player.vimeo.com\\/video\\/41414855?title=0&amp;byline=0&amp;portrait=0&amp;color=ffffff\\\" width=\\\"1000\\\" height=\\\"600\\\" frameborder=\\\"0\\\" webkitallowfullscreen=\\\"\\\" mozallowfullscreen=\\\"\\\" allowfullscreen=\\\"\\\">\\r\\n<\\/iframe>\",\"7\":\"video\"}}','2013-06-16 23:11:40','2013-06-16 23:11:40','7942130c-cb9c-4335-b7df-f422c86fc243');

/*!40000 ALTER TABLE `craft_entryversions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldgroups`;

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Default','2013-06-16 16:04:14','2013-06-16 16:04:14','5e76841c-824d-4bee-a864-83d7630e9a2e');

/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,NULL,1,0,1,'2013-06-16 16:04:15','2013-06-16 16:04:15','670dd333-6cca-4e87-a8d5-3a867f8dbdec'),
	(2,1,NULL,2,0,2,'2013-06-16 16:04:15','2013-06-16 16:04:15','021a14f2-54b7-47ce-bed9-262cc93c4189'),
	(26,13,12,4,1,1,'2013-06-16 20:03:43','2013-06-16 20:03:43','de5a0fc5-0d5f-416e-8768-c0ef72deb558'),
	(27,13,12,7,1,2,'2013-06-16 20:03:43','2013-06-16 20:03:43','65de27cc-d8d8-4855-af12-d3ce65ae6c88'),
	(28,13,12,8,0,3,'2013-06-16 20:03:43','2013-06-16 20:03:43','ad4fce9a-bfb9-4468-934f-b88076e957c9'),
	(29,13,12,5,0,4,'2013-06-16 20:03:43','2013-06-16 20:03:43','e8860708-30cc-449c-8356-b28fcbb0bb12');

/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouts`;

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'GlobalSet','2013-06-16 16:04:15','2013-06-16 16:04:15','6701a076-96e0-49e4-ad32-b1521b90e27f'),
	(13,'Entry','2013-06-16 20:03:43','2013-06-16 20:03:43','9fa4e215-f1fc-4003-bd81-ca2e8f221e62'),
	(14,'Asset','2013-06-16 23:09:02','2013-06-16 23:09:02','56459090-345e-4387-b9b1-a1b555e9fd2f');

/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(12,13,'Project',1,'2013-06-16 20:03:43','2013-06-16 20:03:43','5d103b69-7a22-4618-a86b-e7b99a148d65');

/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fields`;

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `handle` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_unq_idx` (`handle`),
  KEY `craft_fields_groupId_fk` (`groupId`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `instructions`, `translatable`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Heading','heading',NULL,1,'PlainText',NULL,'2013-06-16 16:04:14','2013-06-16 16:04:14','c94f86fd-1355-4cac-ba8a-891963eed9c7'),
	(2,1,'Body','body',NULL,1,'RichText','{\"configFile\":\"Standard.json\"}','2013-06-16 16:04:14','2013-06-16 16:04:14','47ec4234-e2db-4a58-9c4b-87281074d06a'),
	(4,1,'Project Description','projectDescription','',0,'RichText','{\"configFile\":\"Standard.json\",\"cleanupHtml\":\"1\"}','2013-06-16 16:24:00','2013-06-16 16:33:44','59f28ee8-5142-4d27-b776-e9f622aefef8'),
	(5,1,'Project Images','projectImages','',0,'Assets','{\"sources\":\"*\",\"limit\":\"\"}','2013-06-16 16:29:17','2013-06-16 18:19:10','6220daea-be4b-43d3-98e9-095521369ec8'),
	(6,1,'Caption','caption','',0,'PlainText','{\"placeholder\":\"Image Caption...\",\"multiline\":\"\",\"initialRows\":\"4\"}','2013-06-16 18:46:18','2013-06-16 18:46:18','e40a15af-6345-499b-81f2-bb312f770bf4'),
	(7,1,'Video or Photos','videoPhotos','',0,'RadioButtons','{\"options\":[{\"label\":\"video\",\"value\":\"video\",\"default\":\"\"},{\"label\":\"photos\",\"value\":\"photos\",\"default\":\"\"}]}','2013-06-16 18:53:02','2013-06-16 19:19:02','ecd93fbb-8045-4594-9543-27ee2c4eb5dd'),
	(8,1,'Video Link','videoLink','Get the embed code from vimeo and paste in here. Make sure the dimensions are set to 1000 x 600',0,'RichText','{\"configFile\":\"\",\"cleanupHtml\":\"1\"}','2013-06-16 18:54:42','2013-06-16 22:04:03','faf2adfc-e2fd-44b3-9c9a-b1cde28e5d7a');

/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_globalsets`;

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `handle` char(45) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;

INSERT INTO `craft_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,'Homepage','homepage',1,'2013-06-16 16:04:15','2013-06-16 16:04:15','4f1991a8-8761-47b4-8116-50d877c14573');

/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_info`;

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `build` int(11) unsigned NOT NULL,
  `packages` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `releaseDate` datetime NOT NULL,
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `track` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;

INSERT INTO `craft_info` (`id`, `version`, `build`, `packages`, `releaseDate`, `siteName`, `siteUrl`, `timezone`, `on`, `maintenance`, `track`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'1.0',2270,'PublishPro','2013-06-12 00:50:53','Yousef Eldin','http://yousef','UTC',1,0,'stable','2013-06-16 16:04:13','2013-06-16 16:10:19','59c33569-a9ce-4de8-a90f-dc49a3e73254');

/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_locales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_locales`;

CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_locales` WRITE;
/*!40000 ALTER TABLE `craft_locales` DISABLE KEYS */;

INSERT INTO `craft_locales` (`locale`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	('en_gb',1,'2013-06-16 16:04:13','2013-06-16 16:04:13','522095af-de1a-4dac-be80-78b7f77f83aa');

/*!40000 ALTER TABLE `craft_locales` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_migrations`;

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  KEY `craft_migrations_pluginId_fk` (`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;

INSERT INTO `craft_migrations` (`id`, `pluginId`, `version`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'m000000_000000_base','2013-06-16 16:04:13','2013-06-16 16:04:13','2013-06-16 16:04:13','05f8c678-4b5c-4b65-a30e-9ddd241de340');

/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_plugins`;

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_rackspaceaccess
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_rackspaceaccess`;

CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_relations`;

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `parentId` int(11) NOT NULL,
  `childId` int(11) NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_parentId_childId_unq_idx` (`fieldId`,`parentId`,`childId`),
  KEY `craft_relations_parentId_fk` (`parentId`),
  KEY `craft_relations_childId_fk` (`childId`),
  CONSTRAINT `craft_relations_childId_fk` FOREIGN KEY (`childId`) REFERENCES `craft_elements` (`id`),
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`),
  CONSTRAINT `craft_relations_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_elements` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;

INSERT INTO `craft_relations` (`id`, `fieldId`, `parentId`, `childId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(12,5,4,5,1,'2013-06-16 22:55:56','2013-06-16 22:55:56','9e99a177-f6a7-45e3-a154-ec52e797fb22'),
	(17,5,3,6,1,'2013-06-16 22:57:35','2013-06-16 22:57:35','86c56e6d-5ea3-4800-9b15-52d7e75466e0'),
	(18,5,8,7,1,'2013-06-16 22:58:05','2013-06-16 22:58:05','172094e0-ad50-420d-b93c-2a503f4d4459'),
	(19,5,8,6,2,'2013-06-16 22:58:05','2013-06-16 22:58:05','daf1ee84-30f1-403b-9601-c170b7122851'),
	(20,5,8,5,3,'2013-06-16 22:58:05','2013-06-16 22:58:05','61486b98-5f53-458d-88ab-bfd70376711d'),
	(21,5,9,10,1,'2013-06-16 23:11:40','2013-06-16 23:11:40','7b9e8802-133d-4b54-a589-a8164ab8ce85');

/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_routes`;

CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_routes_urlPattern_unq_idx` (`urlPattern`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_searchindex`;

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `locale`, `keywords`)
VALUES
	(1,'username',0,'en_gb',' smngy '),
	(1,'email',0,'en_gb',' sean aokstudio com '),
	(2,'field',2,'en_gb',' it s true this site doesn t have a whole lot of content yet but don t worry our web developers have just installed the cms and they re setting things up for the content editors this very moment soon yousef will be an oasis of fresh perspectives sharp analyses and astute opinions that will keep you coming back again and again '),
	(2,'field',1,'en_gb',' welcome to yousef '),
	(3,'title',0,'en_gb',' book two '),
	(3,'slug',0,'en_gb',' book two '),
	(3,'field',2,'en_gb',' craft is the cms that s powering yousef it s beautiful powerful flexible and easy to use and it s made by pixel tonic we can t wait to dive in and see what it s capablthis is even more captivating content which you couldn t see on the news index page because it was entered after a page break and the news index template only likes to show the content on the first page craft a nice alternative to word if you re making a website '),
	(4,'title',0,'en_gb',' henry holland '),
	(4,'slug',0,'en_gb',' henry holland '),
	(4,'field',4,'en_gb',' lorem ipsum dolor sit amet consectetur adipisicing elit repudiandae repellat culpa illo necessitatibus aspernatur esse vero at necessitatibus omnis deleniti praesentium accusamus repudiandae delectus porro hic alias libero reiciendis architecto ea sapiente dolorum tempora a facere aut eveniet quod provident harum error quidem '),
	(9,'title',0,'en_gb',' htc challenge '),
	(9,'slug',0,'en_gb',' htc challenge '),
	(9,'field',4,'en_gb',' project description '),
	(9,'field',7,'en_gb',' video '),
	(10,'filename',0,'en_gb',' htc jpg '),
	(10,'extension',0,'en_gb',' jpg '),
	(5,'filename',0,'en_gb',' ellie jpg '),
	(5,'extension',0,'en_gb',' jpg '),
	(5,'kind',0,'en_gb',' image '),
	(6,'filename',0,'en_gb',' coxon jpg '),
	(6,'extension',0,'en_gb',' jpg '),
	(6,'kind',0,'en_gb',' image '),
	(7,'filename',0,'en_gb',' 1200x700 gif '),
	(7,'extension',0,'en_gb',' gif '),
	(7,'kind',0,'en_gb',' image '),
	(7,'field',5,'en_gb',' 7 1 2013 06 16 2013 06 16 1 1 1200x700 gif image 1000 583 4937 2013 06 16 '),
	(6,'field',5,'en_gb',' 6 1 2013 06 16 2013 06 16 1 1 coxon jpg image 1000 600 146245 2013 06 16 '),
	(4,'field',5,'en_gb',' 5 1 0 2013 06 16 2013 06 16 1 1 ellie jpg image 1000 600 95674 2013 06 16 '),
	(7,'field',6,'en_gb',' placeholder caption '),
	(6,'field',6,'en_gb',' graham coxon '),
	(3,'field',4,'en_gb',' a selection of portraits taken over the last number of years '),
	(3,'field',5,'en_gb',' 6 1 0 2013 06 16 2013 06 16 1 1 coxon jpg image 1000 600 146245 2013 06 16 '),
	(3,'field',7,'en_gb',' photos '),
	(4,'field',7,'en_gb',' video '),
	(8,'title',0,'en_gb',' book one '),
	(8,'slug',0,'en_gb',' book one '),
	(8,'field',4,'en_gb',' general photos '),
	(8,'field',5,'en_gb',' 7 1 0 2013 06 16 2013 06 16 1 1 1200x700 gif image 1200 700 4937 2013 06 16 6 1 0 2013 06 16 2013 06 16 1 1 coxon jpg image 1000 600 146245 2013 06 16 5 1 0 2013 06 16 2013 06 16 1 1 ellie jpg image 1000 600 95674 2013 06 16 '),
	(8,'field',7,'en_gb',' photos '),
	(10,'kind',0,'en_gb',' image '),
	(9,'field',5,'en_gb',' 10 1 0 2013 06 16 2013 06 16 1 1 htc jpg image 1000 600 179947 2013 06 16 ');

/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections`;

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `handle` char(45) COLLATE utf8_unicode_ci NOT NULL,
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Title',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  KEY `craft_sections_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_sections_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;

INSERT INTO `craft_sections` (`id`, `name`, `handle`, `titleLabel`, `hasUrls`, `template`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Work','work','Project Title',1,'project.html',13,'2013-06-16 16:04:15','2013-06-16 20:03:43','a2c16d70-7bf4-4fa7-ac65-dc43e9393153');

/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sections_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections_i18n`;

CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  KEY `craft_sections_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sections_i18n` WRITE;
/*!40000 ALTER TABLE `craft_sections_i18n` DISABLE KEYS */;

INSERT INTO `craft_sections_i18n` (`id`, `sectionId`, `locale`, `urlFormat`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'en_gb','{slug}','2013-06-16 16:04:15','2013-06-16 16:21:59','721fd6c6-5756-4ded-813d-571b9fb3ef0c');

/*!40000 ALTER TABLE `craft_sections_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sessions`;

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_fk` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'$2a$08$2nq0xYEBMUM7Vd3fMqZo0OyrdAijBei4NlAOBjhI.Jx5sfkds/PP.','2013-06-16 16:04:14','2013-06-16 16:04:14','0f74a4d2-ad08-4e5e-b963-f7bdca938dcc'),
	(2,1,'$2a$08$YgnwGNbO6bQuRq.ErbiFTe5pYyNMFSNfpRM1hmi.zFdpUVwFSbqEm','2013-06-16 17:50:42','2013-06-16 17:50:42','7cafb95e-ad4b-4131-8705-d6404b3440c2');

/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_shunnedmessages`;

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_systemsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_systemsettings`;

CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_systemsettings` WRITE;
/*!40000 ALTER TABLE `craft_systemsettings` DISABLE KEYS */;

INSERT INTO `craft_systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'email','{\"protocol\":\"php\",\"emailAddress\":\"sean@aokstudio.com\",\"senderName\":\"Yousef Eldin\"}','2013-06-16 16:04:14','2013-06-16 16:04:14','91883c00-75ce-4ab5-8723-8c829b3692f5');

/*!40000 ALTER TABLE `craft_systemsettings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups`;

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `handle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups_users`;

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_fk` (`userId`),
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions`;

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_users`;

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_fk` (`userId`),
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_users`;

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encType` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` enum('locked','suspended','pending','active','archived') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_preferredLocale_fk` (`preferredLocale`),
  CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;

INSERT INTO `craft_users` (`id`, `username`, `photo`, `firstName`, `lastName`, `email`, `password`, `encType`, `preferredLocale`, `admin`, `status`, `lastLoginDate`, `lastLoginAttemptIPAddress`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `verificationCode`, `verificationCodeIssuedDate`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'smngy',NULL,NULL,NULL,'sean@aokstudio.com','$2a$08$zP2atljt7SxS3A/VuBAwhunzrILAQ9f0m6BQHrn4D3PgPxmC8U.Jy','blowfish',NULL,1,'active','2013-06-16 17:50:42','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-06-16 16:04:14','2013-06-16 16:04:14','2013-06-16 17:50:42','f3c870c2-44b4-4135-83a1-ba6a7a3b60c4');

/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_widgets`;

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_fk` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'QuickPost',1,'{\"section\":\"1\"}',1,'2013-06-16 16:04:56','2013-06-16 16:04:56','528388c1-73a6-4a61-aab2-f405faa12364'),
	(2,1,'RecentEntries',2,'[]',0,'2013-06-16 16:04:56','2013-06-16 16:05:12','81becb3d-c48d-44d2-aaae-16a7137c317a'),
	(3,1,'Feed',3,'{\"url\":\"http:\\/\\/feeds.feedburner.com\\/blogandtonic\",\"title\":\"Blog & Tonic\"}',1,'2013-06-16 16:04:56','2013-06-16 16:04:56','06651948-f460-431b-98ae-085e3c5d3028'),
	(4,1,'Updates',4,NULL,1,'2013-06-16 16:04:56','2013-06-16 16:04:56','9ffaefda-452a-4473-bff5-148036056bbd'),
	(5,1,'GetHelp',5,NULL,1,'2013-06-16 16:04:56','2013-06-16 16:04:56','6ecdd1c3-8aa1-446c-9c1a-71fb59fa3d22');

/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
