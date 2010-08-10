-- MySQL dump 10.13  Distrib 5.1.49, for apple-darwin10.4.0 (i386)
--
-- Host: localhost    Database: iphone_drupal
-- ------------------------------------------------------
-- Server version	5.1.49

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `mask` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `callback` varchar(255) NOT NULL DEFAULT '',
  `parameters` longtext NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES ('comment_unpublish_action','comment','comment_unpublish_action','','Unpublish comment'),('node_publish_action','node','node_publish_action','','Publish post'),('node_unpublish_action','node','node_unpublish_action','','Unpublish post'),('node_make_sticky_action','node','node_make_sticky_action','','Make post sticky'),('node_make_unsticky_action','node','node_make_unsticky_action','','Make post unsticky'),('node_promote_action','node','node_promote_action','','Promote post to front page'),('node_unpromote_action','node','node_unpromote_action','','Remove post from front page'),('node_save_action','node','node_save_action','','Save post'),('user_block_user_action','user','user_block_user_action','','Block current user'),('user_block_ip_action','user','user_block_ip_action','','Ban IP address of current user'),('comment_publish_action','comment','comment_publish_action','','Publish comment');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions_aid`
--

DROP TABLE IF EXISTS `actions_aid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions_aid` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions_aid`
--

LOCK TABLES `actions_aid` WRITE;
/*!40000 ALTER TABLE `actions_aid` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions_aid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authmap`
--

DROP TABLE IF EXISTS `authmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authmap` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `authname` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authmap`
--

LOCK TABLES `authmap` WRITE;
/*!40000 ALTER TABLE `authmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `authmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `batch` longtext,
  PRIMARY KEY (`bid`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocks` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` varchar(32) NOT NULL DEFAULT '0',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  `region` varchar(64) NOT NULL DEFAULT '',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `pages` text NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES (1,'user','0','garland',1,0,'left',0,0,0,'','',-1),(2,'user','1','garland',1,0,'left',0,0,0,'','',-1),(3,'system','0','garland',1,10,'footer',0,0,0,'','',-1);
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks_roles`
--

DROP TABLE IF EXISTS `blocks_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocks_roles` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks_roles`
--

LOCK TABLES `blocks_roles` WRITE;
/*!40000 ALTER TABLE `blocks_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocks_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boxes`
--

DROP TABLE IF EXISTS `boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boxes` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext,
  `info` varchar(128) NOT NULL DEFAULT '',
  `format` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boxes`
--

LOCK TABLES `boxes` WRITE;
/*!40000 ALTER TABLE `boxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_block`
--

DROP TABLE IF EXISTS `cache_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_block` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_block`
--

LOCK TABLES `cache_block` WRITE;
/*!40000 ALTER TABLE `cache_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_content`
--

DROP TABLE IF EXISTS `cache_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_content` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_content`
--

LOCK TABLES `cache_content` WRITE;
/*!40000 ALTER TABLE `cache_content` DISABLE KEYS */;
INSERT INTO `cache_content` VALUES ('content_type_info:en','a:4:{s:11:\"field types\";a:3:{s:4:\"date\";a:4:{s:5:\"label\";s:4:\"Date\";s:11:\"description\";s:89:\"Store a date in the database as an ISO date, recommended for historical or partial dates.\";s:6:\"module\";s:4:\"date\";s:10:\"formatters\";a:5:{s:7:\"default\";a:4:{s:5:\"label\";s:7:\"Default\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}s:15:\"format_interval\";a:4:{s:5:\"label\";s:11:\"As Time Ago\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}s:4:\"long\";a:4:{s:5:\"label\";s:4:\"Long\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}s:6:\"medium\";a:4:{s:5:\"label\";s:6:\"Medium\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}s:5:\"short\";a:4:{s:5:\"label\";s:5:\"Short\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}}}s:9:\"datestamp\";a:4:{s:5:\"label\";s:9:\"Datestamp\";s:11:\"description\";s:87:\"Store a date in the database as a timestamp, deprecated format to suppport legacy data.\";s:6:\"module\";s:4:\"date\";s:10:\"formatters\";a:5:{s:7:\"default\";a:4:{s:5:\"label\";s:7:\"Default\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}s:15:\"format_interval\";a:4:{s:5:\"label\";s:11:\"As Time Ago\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}s:4:\"long\";a:4:{s:5:\"label\";s:4:\"Long\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}s:6:\"medium\";a:4:{s:5:\"label\";s:6:\"Medium\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}s:5:\"short\";a:4:{s:5:\"label\";s:5:\"Short\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}}}s:8:\"datetime\";a:4:{s:5:\"label\";s:8:\"Datetime\";s:11:\"description\";s:125:\"Store a date in the database as a datetime field, recommended for complete dates and times that may need timezone conversion.\";s:6:\"module\";s:4:\"date\";s:10:\"formatters\";a:5:{s:7:\"default\";a:4:{s:5:\"label\";s:7:\"Default\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}s:15:\"format_interval\";a:4:{s:5:\"label\";s:11:\"As Time Ago\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}s:4:\"long\";a:4:{s:5:\"label\";s:4:\"Long\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}s:6:\"medium\";a:4:{s:5:\"label\";s:6:\"Medium\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}s:5:\"short\";a:4:{s:5:\"label\";s:5:\"Short\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:6:\"module\";s:4:\"date\";}}}}s:12:\"widget types\";a:2:{s:11:\"date_select\";a:5:{s:5:\"label\";s:11:\"Select List\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:9:\"callbacks\";a:1:{s:13:\"default value\";i:4;}s:6:\"module\";s:4:\"date\";}s:9:\"date_text\";a:5:{s:5:\"label\";s:35:\"Text Field with custom input format\";s:11:\"field types\";a:3:{i:0;s:4:\"date\";i:1;s:9:\"datestamp\";i:2;s:8:\"datetime\";}s:15:\"multiple values\";i:1;s:9:\"callbacks\";a:1:{s:13:\"default value\";i:4;}s:6:\"module\";s:4:\"date\";}}s:6:\"fields\";a:0:{}s:13:\"content types\";a:2:{s:4:\"page\";a:18:{s:4:\"type\";s:4:\"page\";s:4:\"name\";s:4:\"Page\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:4:\"page\";s:7:\"url_str\";s:4:\"page\";s:6:\"fields\";a:0:{}s:6:\"tables\";a:0:{}s:5:\"extra\";a:7:{s:5:\"title\";a:3:{s:5:\"label\";s:5:\"Title\";s:11:\"description\";s:17:\"Node module form.\";s:6:\"weight\";i:-5;}s:10:\"body_field\";a:4:{s:5:\"label\";s:4:\"Body\";s:11:\"description\";s:17:\"Node module form.\";s:6:\"weight\";i:0;s:4:\"view\";s:4:\"body\";}s:20:\"revision_information\";a:3:{s:5:\"label\";s:20:\"Revision information\";s:11:\"description\";s:17:\"Node module form.\";s:6:\"weight\";i:20;}s:6:\"author\";a:3:{s:5:\"label\";s:21:\"Authoring information\";s:11:\"description\";s:17:\"Node module form.\";s:6:\"weight\";i:20;}s:7:\"options\";a:3:{s:5:\"label\";s:18:\"Publishing options\";s:11:\"description\";s:17:\"Node module form.\";s:6:\"weight\";i:25;}s:16:\"comment_settings\";a:3:{s:5:\"label\";s:16:\"Comment settings\";s:11:\"description\";s:20:\"Comment module form.\";s:6:\"weight\";i:30;}s:4:\"menu\";a:3:{s:5:\"label\";s:13:\"Menu settings\";s:11:\"description\";s:17:\"Menu module form.\";s:6:\"weight\";i:-2;}}}s:5:\"story\";a:18:{s:4:\"type\";s:5:\"story\";s:4:\"name\";s:5:\"Story\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:392:\"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:5:\"story\";s:7:\"url_str\";s:5:\"story\";s:6:\"fields\";a:0:{}s:6:\"tables\";a:0:{}s:5:\"extra\";a:7:{s:5:\"title\";a:3:{s:5:\"label\";s:5:\"Title\";s:11:\"description\";s:17:\"Node module form.\";s:6:\"weight\";i:-5;}s:10:\"body_field\";a:4:{s:5:\"label\";s:4:\"Body\";s:11:\"description\";s:17:\"Node module form.\";s:6:\"weight\";i:0;s:4:\"view\";s:4:\"body\";}s:20:\"revision_information\";a:3:{s:5:\"label\";s:20:\"Revision information\";s:11:\"description\";s:17:\"Node module form.\";s:6:\"weight\";i:20;}s:6:\"author\";a:3:{s:5:\"label\";s:21:\"Authoring information\";s:11:\"description\";s:17:\"Node module form.\";s:6:\"weight\";i:20;}s:7:\"options\";a:3:{s:5:\"label\";s:18:\"Publishing options\";s:11:\"description\";s:17:\"Node module form.\";s:6:\"weight\";i:25;}s:16:\"comment_settings\";a:3:{s:5:\"label\";s:16:\"Comment settings\";s:11:\"description\";s:20:\"Comment module form.\";s:6:\"weight\";i:30;}s:4:\"menu\";a:3:{s:5:\"label\";s:13:\"Menu settings\";s:11:\"description\";s:17:\"Menu module form.\";s:6:\"weight\";i:-2;}}}}}',0,1281445449,'',1);
/*!40000 ALTER TABLE `cache_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_filter`
--

DROP TABLE IF EXISTS `cache_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_filter` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_filter`
--

LOCK TABLES `cache_filter` WRITE;
/*!40000 ALTER TABLE `cache_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_form`
--

DROP TABLE IF EXISTS `cache_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_form` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_form`
--

LOCK TABLES `cache_form` WRITE;
/*!40000 ALTER TABLE `cache_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_menu`
--

DROP TABLE IF EXISTS `cache_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_menu`
--

LOCK TABLES `cache_menu` WRITE;
/*!40000 ALTER TABLE `cache_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_page`
--

DROP TABLE IF EXISTS `cache_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_page`
--

LOCK TABLES `cache_page` WRITE;
/*!40000 ALTER TABLE `cache_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_update`
--

DROP TABLE IF EXISTS `cache_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_update` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_update`
--

LOCK TABLES `cache_update` WRITE;
/*!40000 ALTER TABLE `cache_update` DISABLE KEYS */;
INSERT INTO `cache_update` VALUES ('update_project_projects','a:7:{s:5:\"admin\";a:7:{s:4:\"name\";s:5:\"admin\";s:4:\"info\";a:6:{s:4:\"name\";s:5:\"Admin\";s:7:\"package\";s:14:\"Administration\";s:7:\"version\";s:13:\"6.x-2.0-beta4\";s:7:\"project\";s:5:\"admin\";s:9:\"datestamp\";s:10:\"1277312104\";s:16:\"_info_file_ctime\";i:1281444407;}s:9:\"datestamp\";s:10:\"1277312104\";s:8:\"includes\";a:1:{s:5:\"admin\";s:5:\"Admin\";}s:12:\"project_type\";s:6:\"module\";s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}s:8:\"autoload\";a:7:{s:4:\"name\";s:8:\"autoload\";s:4:\"info\";a:5:{s:4:\"name\";s:8:\"Autoload\";s:7:\"version\";s:7:\"6.x-1.3\";s:7:\"project\";s:8:\"autoload\";s:9:\"datestamp\";s:10:\"1237327502\";s:16:\"_info_file_ctime\";i:1281442910;}s:9:\"datestamp\";s:10:\"1237327502\";s:8:\"includes\";a:1:{s:8:\"autoload\";s:8:\"Autoload\";}s:12:\"project_type\";s:6:\"module\";s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}s:6:\"drupal\";a:7:{s:4:\"name\";s:6:\"drupal\";s:4:\"info\";a:6:{s:4:\"name\";s:5:\"Block\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.17\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:16:\"_info_file_ctime\";i:1281444407;}s:9:\"datestamp\";s:10:\"1275505216\";s:8:\"includes\";a:13:{s:5:\"block\";s:5:\"Block\";s:5:\"color\";s:5:\"Color\";s:7:\"comment\";s:7:\"Comment\";s:5:\"dblog\";s:16:\"Database logging\";s:6:\"filter\";s:6:\"Filter\";s:4:\"help\";s:4:\"Help\";s:4:\"menu\";s:4:\"Menu\";s:4:\"node\";s:4:\"Node\";s:6:\"system\";s:6:\"System\";s:8:\"taxonomy\";s:8:\"Taxonomy\";s:6:\"update\";s:13:\"Update status\";s:4:\"user\";s:4:\"User\";s:7:\"garland\";s:7:\"Garland\";}s:12:\"project_type\";s:4:\"core\";s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}s:3:\"cck\";a:7:{s:4:\"name\";s:3:\"cck\";s:4:\"info\";a:6:{s:4:\"name\";s:7:\"Content\";s:7:\"package\";s:3:\"CCK\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1276685405\";s:16:\"_info_file_ctime\";i:1281444407;}s:9:\"datestamp\";s:10:\"1276685405\";s:8:\"includes\";a:1:{s:7:\"content\";s:7:\"Content\";}s:12:\"project_type\";s:6:\"module\";s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}s:6:\"ctools\";a:7:{s:4:\"name\";s:6:\"ctools\";s:4:\"info\";a:6:{s:4:\"name\";s:11:\"Chaos tools\";s:7:\"package\";s:16:\"Chaos tool suite\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1275441007\";s:16:\"_info_file_ctime\";i:1281444407;}s:9:\"datestamp\";s:10:\"1275441007\";s:8:\"includes\";a:1:{s:6:\"ctools\";s:11:\"Chaos tools\";}s:12:\"project_type\";s:6:\"module\";s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}s:4:\"date\";a:7:{s:4:\"name\";s:4:\"date\";s:4:\"info\";a:6:{s:4:\"name\";s:4:\"Date\";s:7:\"package\";s:9:\"Date/Time\";s:7:\"version\";s:7:\"6.x-2.4\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1253103320\";s:16:\"_info_file_ctime\";i:1281444407;}s:9:\"datestamp\";s:10:\"1253103320\";s:8:\"includes\";a:3:{s:4:\"date\";s:4:\"Date\";s:8:\"date_api\";s:8:\"Date API\";s:13:\"date_timezone\";s:13:\"Date Timezone\";}s:12:\"project_type\";s:6:\"module\";s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}s:5:\"devel\";a:7:{s:4:\"name\";s:5:\"devel\";s:4:\"info\";a:6:{s:4:\"name\";s:5:\"Devel\";s:7:\"package\";s:11:\"Development\";s:7:\"version\";s:8:\"6.x-1.20\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1271886306\";s:16:\"_info_file_ctime\";i:1281444407;}s:9:\"datestamp\";s:10:\"1271886306\";s:8:\"includes\";a:2:{s:5:\"devel\";s:5:\"Devel\";s:14:\"devel_generate\";s:14:\"Devel generate\";}s:12:\"project_type\";s:6:\"module\";s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}}',1281471373,1281467773,NULL,1);
/*!40000 ALTER TABLE `cache_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(64) NOT NULL DEFAULT '',
  `comment` longtext NOT NULL,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `format` smallint(6) NOT NULL DEFAULT '0',
  `thread` varchar(255) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `pid` (`pid`),
  KEY `nid` (`nid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_node_field`
--

DROP TABLE IF EXISTS `content_node_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_node_field` (
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `type` varchar(127) NOT NULL DEFAULT '',
  `global_settings` mediumtext NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `multiple` tinyint(4) NOT NULL DEFAULT '0',
  `db_storage` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(127) NOT NULL DEFAULT '',
  `db_columns` mediumtext NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_node_field`
--

LOCK TABLES `content_node_field` WRITE;
/*!40000 ALTER TABLE `content_node_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_node_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_node_field_instance`
--

DROP TABLE IF EXISTS `content_node_field_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_node_field_instance` (
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `widget_type` varchar(32) NOT NULL DEFAULT '',
  `widget_settings` mediumtext NOT NULL,
  `display_settings` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `widget_module` varchar(127) NOT NULL DEFAULT '',
  `widget_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_name`,`type_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_node_field_instance`
--

LOCK TABLES `content_node_field_instance` WRITE;
/*!40000 ALTER TABLE `content_node_field_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_node_field_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctools_css_cache`
--

DROP TABLE IF EXISTS `ctools_css_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctools_css_cache` (
  `cid` varchar(128) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `css` longtext,
  `filter` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctools_css_cache`
--

LOCK TABLES `ctools_css_cache` WRITE;
/*!40000 ALTER TABLE `ctools_css_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctools_css_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctools_object_cache`
--

DROP TABLE IF EXISTS `ctools_object_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctools_object_cache` (
  `sid` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `obj` varchar(32) NOT NULL,
  `updated` int(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`sid`,`obj`,`name`),
  KEY `updated` (`updated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctools_object_cache`
--

LOCK TABLES `ctools_object_cache` WRITE;
/*!40000 ALTER TABLE `ctools_object_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctools_object_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_format_locale`
--

DROP TABLE IF EXISTS `date_format_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_format_locale` (
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(200) NOT NULL,
  `language` varchar(12) NOT NULL,
  PRIMARY KEY (`type`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_format_locale`
--

LOCK TABLES `date_format_locale` WRITE;
/*!40000 ALTER TABLE `date_format_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `date_format_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_format_types`
--

DROP TABLE IF EXISTS `date_format_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_format_types` (
  `type` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_format_types`
--

LOCK TABLES `date_format_types` WRITE;
/*!40000 ALTER TABLE `date_format_types` DISABLE KEYS */;
INSERT INTO `date_format_types` VALUES ('long','Long',1),('medium','Medium',1),('short','Short',1);
/*!40000 ALTER TABLE `date_format_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_formats`
--

DROP TABLE IF EXISTS `date_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_formats` (
  `dfid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(200) NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dfid`),
  UNIQUE KEY `formats` (`format`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_formats`
--

LOCK TABLES `date_formats` WRITE;
/*!40000 ALTER TABLE `date_formats` DISABLE KEYS */;
INSERT INTO `date_formats` VALUES (1,'Y-m-d H:i','short',1),(2,'m/d/Y - H:i','short',1),(3,'d/m/Y - H:i','short',1),(4,'Y/m/d - H:i','short',1),(5,'d.m.Y - H:i','short',1),(6,'m/d/Y - g:ia','short',1),(7,'d/m/Y - g:ia','short',1),(8,'Y/m/d - g:ia','short',1),(9,'M j Y - H:i','short',1),(10,'j M Y - H:i','short',1),(11,'Y M j - H:i','short',1),(12,'M j Y - g:ia','short',1),(13,'j M Y - g:ia','short',1),(14,'Y M j - g:ia','short',1),(15,'D, Y-m-d H:i','medium',1),(16,'D, m/d/Y - H:i','medium',1),(17,'D, d/m/Y - H:i','medium',1),(18,'D, Y/m/d - H:i','medium',1),(19,'F j, Y - H:i','medium',1),(20,'j F, Y - H:i','medium',1),(21,'Y, F j - H:i','medium',1),(22,'D, m/d/Y - g:ia','medium',1),(23,'D, d/m/Y - g:ia','medium',1),(24,'D, Y/m/d - g:ia','medium',1),(25,'F j, Y - g:ia','medium',1),(26,'j F Y - g:ia','medium',1),(27,'Y, F j - g:ia','medium',1),(28,'j. F Y - G:i','medium',1),(29,'l, F j, Y - H:i','long',1),(30,'l, j F, Y - H:i','long',1),(31,'l, Y,  F j - H:i','long',1),(32,'l, F j, Y - g:ia','long',1),(33,'l, j F Y - g:ia','long',1),(34,'l, Y,  F j - g:ia','long',1),(35,'l, j. F Y - G:i','long',1);
/*!40000 ALTER TABLE `date_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devel_queries`
--

DROP TABLE IF EXISTS `devel_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devel_queries` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `function` varchar(255) NOT NULL DEFAULT '',
  `query` text NOT NULL,
  `hash` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`hash`),
  KEY `qid` (`qid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devel_queries`
--

LOCK TABLES `devel_queries` WRITE;
/*!40000 ALTER TABLE `devel_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `devel_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devel_times`
--

DROP TABLE IF EXISTS `devel_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devel_times` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL DEFAULT '0',
  `time` float DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `qid` (`qid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devel_times`
--

LOCK TABLES `devel_times` WRITE;
/*!40000 ALTER TABLE `devel_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `devel_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filemime` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_formats`
--

DROP TABLE IF EXISTS `filter_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_formats` (
  `format` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `roles` varchar(255) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`format`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_formats`
--

LOCK TABLES `filter_formats` WRITE;
/*!40000 ALTER TABLE `filter_formats` DISABLE KEYS */;
INSERT INTO `filter_formats` VALUES (1,'Filtered HTML',',1,2,',1),(2,'Full HTML','',1);
/*!40000 ALTER TABLE `filter_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filters` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `format` int(11) NOT NULL DEFAULT '0',
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `fmd` (`format`,`module`,`delta`),
  KEY `list` (`format`,`weight`,`module`,`delta`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,'filter',2,0),(2,1,'filter',0,1),(3,1,'filter',1,2),(4,1,'filter',3,10),(5,2,'filter',2,0),(6,2,'filter',1,1),(7,2,'filter',3,10);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flood`
--

DROP TABLE IF EXISTS `flood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flood` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `allow` (`event`,`hostname`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flood`
--

LOCK TABLES `flood` WRITE;
/*!40000 ALTER TABLE `flood` DISABLE KEYS */;
/*!40000 ALTER TABLE `flood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_custom`
--

DROP TABLE IF EXISTS `menu_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`menu_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_custom`
--

LOCK TABLES `menu_custom` WRITE;
/*!40000 ALTER TABLE `menu_custom` DISABLE KEYS */;
INSERT INTO `menu_custom` VALUES ('navigation','Navigation','The navigation menu is provided by Drupal and is the main interactive menu for any site. It is usually the only menu that contains personalized links for authenticated users, and is often not even visible to anonymous users.'),('primary-links','Primary links','Primary links are often used at the theme layer to show the major sections of a site. A typical representation for primary links would be tabs along the top.'),('secondary-links','Secondary links','Secondary links are often used for pages like legal notices, contact details, and other secondary navigation items that play a lesser role than primary links'),('devel','Development','Development links.'),('admin','Admin','Admin links.');
/*!40000 ALTER TABLE `menu_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_links`
--

DROP TABLE IF EXISTS `menu_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `mlid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plid` int(10) unsigned NOT NULL DEFAULT '0',
  `link_path` varchar(255) NOT NULL DEFAULT '',
  `router_path` varchar(255) NOT NULL DEFAULT '',
  `link_title` varchar(255) NOT NULL DEFAULT '',
  `options` text,
  `module` varchar(255) NOT NULL DEFAULT 'system',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `external` smallint(6) NOT NULL DEFAULT '0',
  `has_children` smallint(6) NOT NULL DEFAULT '0',
  `expanded` smallint(6) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `depth` smallint(6) NOT NULL DEFAULT '0',
  `customized` smallint(6) NOT NULL DEFAULT '0',
  `p1` int(10) unsigned NOT NULL DEFAULT '0',
  `p2` int(10) unsigned NOT NULL DEFAULT '0',
  `p3` int(10) unsigned NOT NULL DEFAULT '0',
  `p4` int(10) unsigned NOT NULL DEFAULT '0',
  `p5` int(10) unsigned NOT NULL DEFAULT '0',
  `p6` int(10) unsigned NOT NULL DEFAULT '0',
  `p7` int(10) unsigned NOT NULL DEFAULT '0',
  `p8` int(10) unsigned NOT NULL DEFAULT '0',
  `p9` int(10) unsigned NOT NULL DEFAULT '0',
  `updated` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=MyISAM AUTO_INCREMENT=287 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_links`
--

LOCK TABLES `menu_links` WRITE;
/*!40000 ALTER TABLE `menu_links` DISABLE KEYS */;
INSERT INTO `menu_links` VALUES ('navigation',1,0,'batch','batch','','a:0:{}','system',-1,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0),('admin',276,219,'admin/content/taxonomy/edit/term','admin/content/taxonomy/edit/term','Edit term','a:0:{}','system',-1,0,0,0,0,4,0,177,179,219,276,0,0,0,0,0,0),('navigation',3,0,'node','node','Content','a:0:{}','system',-1,0,0,0,0,1,0,3,0,0,0,0,0,0,0,0,0),('navigation',4,0,'logout','logout','Log out','a:0:{}','system',0,0,0,0,10,1,0,4,0,0,0,0,0,0,0,0,0),('navigation',5,0,'rss.xml','rss.xml','RSS feed','a:0:{}','system',-1,0,0,0,0,1,0,5,0,0,0,0,0,0,0,0,0),('navigation',6,0,'user','user','User account','a:0:{}','system',-1,0,0,0,0,1,0,6,0,0,0,0,0,0,0,0,0),('navigation',7,0,'node/%','node/%','','a:0:{}','system',-1,0,0,0,0,1,0,7,0,0,0,0,0,0,0,0,0),('navigation',9,0,'filter/tips','filter/tips','Compose tips','a:0:{}','system',1,0,0,0,0,1,0,9,0,0,0,0,0,0,0,0,0),('admin',274,208,'admin/settings/oauth/%/enable','admin/settings/oauth/%/enable','','a:0:{}','system',-1,0,0,0,0,4,0,177,184,208,274,0,0,0,0,0,0),('admin',275,215,'admin/build/services/%/disable','admin/build/services/%/disable','','a:0:{}','system',-1,0,0,0,0,4,0,177,183,215,275,0,0,0,0,0,0),('navigation',11,0,'node/add','node/add','Create content','a:0:{}','system',0,0,1,0,1,1,0,11,0,0,0,0,0,0,0,0,0),('navigation',12,0,'comment/delete','comment/delete','Delete comment','a:0:{}','system',-1,0,0,0,0,1,0,12,0,0,0,0,0,0,0,0,0),('navigation',13,0,'comment/edit','comment/edit','Edit comment','a:0:{}','system',-1,0,0,0,0,1,0,13,0,0,0,0,0,0,0,0,0),('navigation',14,0,'system/files','system/files','File download','a:0:{}','system',-1,0,0,0,0,1,0,14,0,0,0,0,0,0,0,0,0),('admin',273,208,'admin/settings/oauth/%/disable','admin/settings/oauth/%/disable','','a:0:{}','system',-1,0,0,0,0,4,0,177,184,208,273,0,0,0,0,0,0),('admin',272,0,'admin/build/menu-customize/%/delete','admin/build/menu-customize/%/delete','Delete menu','a:0:{}','system',-1,0,0,0,0,1,0,272,0,0,0,0,0,0,0,0,0),('admin',270,208,'admin/settings/oauth/ahah/add-auth-level','admin/settings/oauth/ahah/add-auth-level','','a:0:{}','system',-1,0,0,0,0,4,0,177,184,208,270,0,0,0,0,0,0),('admin',271,215,'admin/build/services/%/delete','admin/build/services/%/delete','Delete endpoint','a:0:{}','system',-1,0,0,0,0,4,0,177,183,215,271,0,0,0,0,0,0),('navigation',19,0,'user/autocomplete','user/autocomplete','User autocomplete','a:0:{}','system',-1,0,0,0,0,1,0,19,0,0,0,0,0,0,0,0,0),('navigation',21,0,'user/%','user/%','My account','a:0:{}','system',0,0,0,0,0,1,0,21,0,0,0,0,0,0,0,0,0),('admin',269,196,'admin/settings/date-time/delete/%','admin/settings/date-time/delete/%','Delete date format type','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:52:\"Allow users to delete a configured date format type.\";}}','system',-1,0,0,0,0,4,0,177,184,196,269,0,0,0,0,0,0),('admin',268,208,'admin/settings/oauth/%/delete','admin/settings/oauth/%/delete','Delete context','a:0:{}','system',-1,0,0,0,0,4,0,177,184,208,268,0,0,0,0,0,0),('admin',266,0,'admin/content/node-type/story/delete','admin/content/node-type/story/delete','Delete','a:0:{}','system',-1,0,0,0,0,1,0,266,0,0,0,0,0,0,0,0,0),('admin',267,187,'admin/settings/actions/delete/%','admin/settings/actions/delete/%','Delete action','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:17:\"Delete an action.\";}}','system',-1,0,0,0,0,4,0,177,184,187,267,0,0,0,0,0,0),('admin',265,0,'admin/content/node-type/page/delete','admin/content/node-type/page/delete','Delete','a:0:{}','system',-1,0,0,0,0,1,0,265,0,0,0,0,0,0,0,0,0),('admin',263,215,'admin/build/services/ahah/security-options','admin/build/services/ahah/security-options','','a:0:{}','system',-1,0,0,0,0,4,0,177,183,215,263,0,0,0,0,0,0),('admin',264,196,'admin/settings/date-time/formats/lookup','admin/settings/date-time/formats/lookup','Date and time lookup','a:0:{}','system',-1,0,0,0,0,4,0,177,184,196,264,0,0,0,0,0,0),('admin',262,179,'admin/content/node-type/story','admin/content/node-type/story','Story','a:0:{}','system',-1,0,0,0,0,3,0,177,179,262,0,0,0,0,0,0,0),('admin',261,218,'admin/reports/status/sql','admin/reports/status/sql','SQL','a:0:{}','system',-1,0,0,0,0,4,0,177,182,218,261,0,0,0,0,0,0),('admin',259,187,'admin/settings/actions/orphan','admin/settings/actions/orphan','Remove orphans','a:0:{}','system',-1,0,0,0,0,4,0,177,184,187,259,0,0,0,0,0,0),('admin',260,218,'admin/reports/status/run-cron','admin/reports/status/run-cron','Run cron','a:1:{s:5:\"alter\";b:1;}','system',-1,0,0,0,0,4,0,177,182,218,260,0,0,0,0,0,0),('admin',257,179,'admin/content/node-type/page','admin/content/node-type/page','Page','a:0:{}','system',-1,0,0,0,0,3,0,177,179,257,0,0,0,0,0,0,0),('admin',258,211,'admin/content/node-settings/rebuild','admin/content/node-settings/rebuild','Rebuild permissions','a:0:{}','system',-1,0,0,0,0,4,0,177,179,211,258,0,0,0,0,0,0),('navigation',31,0,'node/%/delete','node/%/delete','Delete','a:0:{}','system',-1,0,0,0,1,1,0,31,0,0,0,0,0,0,0,0,0),('navigation',32,21,'user/%/delete','user/%/delete','Delete','a:0:{}','system',-1,0,0,0,0,2,0,21,32,0,0,0,0,0,0,0,0),('admin',255,189,'admin/reports/updates/check','admin/reports/updates/check','Manual update check','a:0:{}','system',-1,0,0,0,0,4,0,177,182,189,255,0,0,0,0,0,0),('admin',256,218,'admin/reports/status/php','admin/reports/status/php','PHP','a:0:{}','system',-1,0,0,0,0,4,0,177,182,218,256,0,0,0,0,0,0),('admin',254,219,'admin/content/taxonomy/%','admin/content/taxonomy/%','List terms','a:0:{}','system',-1,0,0,0,0,4,0,177,179,219,254,0,0,0,0,0,0),('admin',252,214,'admin/user/roles/edit','admin/user/roles/edit','Edit role','a:0:{}','system',-1,0,0,0,0,4,0,177,185,214,252,0,0,0,0,0,0),('admin',253,186,'admin/user/rules/edit','admin/user/rules/edit','Edit rule','a:0:{}','system',-1,0,0,0,0,4,0,177,185,186,253,0,0,0,0,0,0),('admin',250,186,'admin/user/rules/delete','admin/user/rules/delete','Delete rule','a:0:{}','system',-1,0,0,0,0,4,0,177,185,186,250,0,0,0,0,0,0),('admin',251,182,'admin/reports/event/%','admin/reports/event/%','Details','a:0:{}','system',-1,0,0,0,0,3,0,177,182,251,0,0,0,0,0,0,0),('admin',248,190,'admin/build/block/delete','admin/build/block/delete','Delete block','a:0:{}','system',-1,0,0,0,0,4,0,177,183,190,248,0,0,0,0,0,0),('admin',249,204,'admin/settings/filters/delete','admin/settings/filters/delete','Delete input format','a:0:{}','system',-1,0,0,0,0,4,0,177,184,204,249,0,0,0,0,0,0),('admin',247,196,'admin/settings/date-time/lookup','admin/settings/date-time/lookup','Date and time lookup','a:0:{}','system',-1,0,0,0,0,4,0,177,184,196,247,0,0,0,0,0,0),('admin',246,205,'admin/settings/logging/dblog','admin/settings/logging/dblog','Database logging','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:169:\"Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.\";}}','system',0,0,0,0,0,4,0,177,184,205,246,0,0,0,0,0,0),('admin',244,190,'admin/build/block/configure','admin/build/block/configure','Configure block','a:0:{}','system',-1,0,0,0,0,4,0,177,183,190,244,0,0,0,0,0,0),('admin',245,183,'admin/build/menu-customize/%','admin/build/menu-customize/%','Customize menu','a:0:{}','system',-1,0,0,0,0,3,0,177,183,245,0,0,0,0,0,0,0),('admin',243,187,'admin/settings/actions/configure','admin/settings/actions/configure','Configure an advanced action','a:0:{}','system',-1,0,0,0,0,4,0,177,184,187,243,0,0,0,0,0,0),('admin',241,204,'admin/settings/filters/%','admin/settings/filters/%','','a:0:{}','system',-1,0,0,0,0,4,0,177,184,204,241,0,0,0,0,0,0),('admin',242,191,'admin/settings/clean-urls/check','admin/settings/clean-urls/check','Clean URL check','a:0:{}','system',-1,0,0,0,0,4,0,177,184,191,242,0,0,0,0,0,0),('admin',238,181,'admin/help/taxonomy','admin/help/taxonomy','taxonomy','a:0:{}','system',-1,0,0,0,0,3,0,177,181,238,0,0,0,0,0,0,0),('admin',239,181,'admin/help/update','admin/help/update','update','a:0:{}','system',-1,0,0,0,0,3,0,177,181,239,0,0,0,0,0,0,0),('admin',240,181,'admin/help/user','admin/help/user','user','a:0:{}','system',-1,0,0,0,0,3,0,177,181,240,0,0,0,0,0,0,0),('navigation',44,0,'comment/reply/%','comment/reply/%','Reply to comment','a:0:{}','system',-1,0,0,0,0,1,0,44,0,0,0,0,0,0,0,0,0),('admin',237,181,'admin/help/system','admin/help/system','system','a:0:{}','system',-1,0,0,0,0,3,0,177,181,237,0,0,0,0,0,0,0),('admin',234,181,'admin/help/menu','admin/help/menu','menu','a:0:{}','system',-1,0,0,0,0,3,0,177,181,234,0,0,0,0,0,0,0),('admin',235,181,'admin/help/node','admin/help/node','node','a:0:{}','system',-1,0,0,0,0,3,0,177,181,235,0,0,0,0,0,0,0),('admin',236,181,'admin/help/services','admin/help/services','services','a:0:{}','system',-1,0,0,0,0,3,0,177,181,236,0,0,0,0,0,0,0),('admin',232,181,'admin/help/filter','admin/help/filter','filter','a:0:{}','system',-1,0,0,0,0,3,0,177,181,232,0,0,0,0,0,0,0),('admin',233,181,'admin/help/help','admin/help/help','help','a:0:{}','system',-1,0,0,0,0,3,0,177,181,233,0,0,0,0,0,0,0),('admin',230,181,'admin/help/dblog','admin/help/dblog','dblog','a:0:{}','system',-1,0,0,0,0,3,0,177,181,230,0,0,0,0,0,0,0),('admin',231,181,'admin/help/devel','admin/help/devel','devel','a:0:{}','system',-1,0,0,0,0,3,0,177,181,231,0,0,0,0,0,0,0),('admin',229,181,'admin/help/date','admin/help/date','date','a:0:{}','system',-1,0,0,0,0,3,0,177,181,229,0,0,0,0,0,0,0),('admin',226,181,'admin/help/color','admin/help/color','color','a:0:{}','system',-1,0,0,0,0,3,0,177,181,226,0,0,0,0,0,0,0),('admin',227,181,'admin/help/comment','admin/help/comment','comment','a:0:{}','system',-1,0,0,0,0,3,0,177,181,227,0,0,0,0,0,0,0),('admin',228,181,'admin/help/content','admin/help/content','content','a:0:{}','system',-1,0,0,0,0,3,0,177,181,228,0,0,0,0,0,0,0),('admin',225,181,'admin/help/block','admin/help/block','block','a:0:{}','system',-1,0,0,0,0,3,0,177,181,225,0,0,0,0,0,0,0),('admin',224,185,'admin/user/user','admin/user/user','Users','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:26:\"List, add, and edit users.\";}}','system',0,0,0,0,0,3,0,177,185,224,0,0,0,0,0,0,0),('admin',223,185,'admin/user/settings','admin/user/settings','User settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:101:\"Configure default behavior of users, including registration requirements, e-mails, and user pictures.\";}}','system',0,0,0,0,0,3,0,177,185,223,0,0,0,0,0,0,0),('admin',222,182,'admin/reports/page-not-found','admin/reports/page-not-found','Top \'page not found\' errors','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:36:\"View \'page not found\' errors (404s).\";}}','system',0,0,0,0,0,3,0,177,182,222,0,0,0,0,0,0,0),('admin',221,182,'admin/reports/access-denied','admin/reports/access-denied','Top \'access denied\' errors','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:35:\"View \'access denied\' errors (403s).\";}}','system',0,0,0,0,0,3,0,177,182,221,0,0,0,0,0,0,0),('admin',220,183,'admin/build/themes','admin/build/themes','Themes','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:57:\"Change which theme your site uses or allows users to set.\";}}','system',0,0,0,0,0,3,0,177,183,220,0,0,0,0,0,0,0),('admin',219,179,'admin/content/taxonomy','admin/content/taxonomy','Taxonomy','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:67:\"Manage tagging, categorization, and classification of your content.\";}}','system',0,0,0,0,0,3,0,177,179,219,0,0,0,0,0,0,0),('admin',218,182,'admin/reports/status','admin/reports/status','Status report','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:74:\"Get a status report about your site\'s operation and any detected problems.\";}}','system',0,0,0,0,10,3,0,177,182,218,0,0,0,0,0,0,0),('admin',217,184,'admin/settings/site-maintenance','admin/settings/site-maintenance','Site maintenance','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:63:\"Take the site off-line for maintenance or bring it back online.\";}}','system',0,0,0,0,0,3,0,177,184,217,0,0,0,0,0,0,0),('admin',216,184,'admin/settings/site-information','admin/settings/site-information','Site information','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:107:\"Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.\";}}','system',0,0,0,0,0,3,0,177,184,216,0,0,0,0,0,0,0),('admin',215,183,'admin/build/services','admin/build/services','Services','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:58:\"Manage how external applications communicates with Drupal.\";}}','system',0,0,0,0,0,3,0,177,183,215,0,0,0,0,0,0,0),('admin',214,185,'admin/user/roles','admin/user/roles','Roles','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:30:\"List, edit, or add user roles.\";}}','system',0,0,0,0,0,3,0,177,185,214,0,0,0,0,0,0,0),('admin',213,182,'admin/reports/dblog','admin/reports/dblog','Recent log entries','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"View events that have recently been logged.\";}}','system',0,0,0,0,-1,3,0,177,182,213,0,0,0,0,0,0,0),('admin',212,179,'admin/content/rss-publishing','admin/content/rss-publishing','RSS publishing','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:92:\"Configure the number of items per feed and whether feeds should be titles/teasers/full-text.\";}}','system',0,0,0,0,0,3,0,177,179,212,0,0,0,0,0,0,0),('admin',211,179,'admin/content/node-settings','admin/content/node-settings','Post settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:126:\"Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.\";}}','system',0,0,0,0,0,3,0,177,179,211,0,0,0,0,0,0,0),('navigation',81,0,'user/reset/%/%/%','user/reset/%/%/%','Reset password','a:0:{}','system',-1,0,0,0,0,1,0,81,0,0,0,0,0,0,0,0,0),('navigation',83,0,'node/%/revisions/%/delete','node/%/revisions/%/delete','Delete earlier revision','a:0:{}','system',-1,0,0,0,0,1,0,83,0,0,0,0,0,0,0,0,0),('navigation',84,0,'node/%/revisions/%/revert','node/%/revisions/%/revert','Revert to earlier revision','a:0:{}','system',-1,0,0,0,0,1,0,84,0,0,0,0,0,0,0,0,0),('navigation',85,0,'node/%/revisions/%/view','node/%/revisions/%/view','Revisions','a:0:{}','system',-1,0,0,0,0,1,0,85,0,0,0,0,0,0,0,0,0),('admin',210,185,'admin/user/permissions','admin/user/permissions','Permissions','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:64:\"Determine access to features by selecting permissions for roles.\";}}','system',0,0,0,0,0,3,0,177,185,210,0,0,0,0,0,0,0),('admin',209,184,'admin/settings/performance','admin/settings/performance','Performance','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:101:\"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.\";}}','system',0,0,0,0,0,3,0,177,184,209,0,0,0,0,0,0,0),('admin',208,184,'admin/settings/oauth','admin/settings/oauth','OAuth','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:18:\"Settings for OAuth\";}}','system',0,0,0,0,0,3,0,177,184,208,0,0,0,0,0,0,0),('admin',207,183,'admin/build/modules','admin/build/modules','Modules','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:47:\"Enable or disable add-on modules for your site.\";}}','system',0,0,0,0,0,3,0,177,183,207,0,0,0,0,0,0,0),('navigation',92,0,'taxonomy/autocomplete','taxonomy/autocomplete','Autocomplete taxonomy','a:0:{}','system',-1,0,0,0,0,1,0,92,0,0,0,0,0,0,0,0,0),('admin',206,183,'admin/build/menu','admin/build/menu','Menus','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:116:\"Control your site\'s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.\";}}','system',0,0,0,0,0,3,0,177,183,206,0,0,0,0,0,0,0),('navigation',95,0,'taxonomy/term/%','taxonomy/term/%','Taxonomy term','a:0:{}','system',-1,0,0,0,0,1,0,95,0,0,0,0,0,0,0,0,0),('admin',205,184,'admin/settings/logging','admin/settings/logging','Logging and alerts','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:156:\"Settings for logging and alerts modules. Various modules can route Drupal\'s system events to different destination, such as syslog, database, email, ...etc.\";}}','system',0,0,1,0,0,3,0,177,184,205,0,0,0,0,0,0,0),('admin',204,184,'admin/settings/filters','admin/settings/filters','Input formats','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:127:\"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.\";}}','system',0,0,0,0,0,3,0,177,184,204,0,0,0,0,0,0,0),('admin',202,180,'admin/generate/user','admin/generate/user','Generate users','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:66:\"Generate a given number of users. Optionally delete current users.\";}}','system',0,0,0,0,0,3,0,177,180,202,0,0,0,0,0,0,0),('admin',203,184,'admin/settings/image-toolkit','admin/settings/image-toolkit','Image toolkit','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:74:\"Choose which image toolkit to use if you have installed optional toolkits.\";}}','system',0,0,0,0,0,3,0,177,184,203,0,0,0,0,0,0,0),('admin',201,180,'admin/generate/content','admin/generate/content','Generate content','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:79:\"Generate a given number of nodes and comments. Optionally delete current items.\";}}','system',0,0,0,0,0,3,0,177,180,201,0,0,0,0,0,0,0),('admin',200,180,'admin/generate/taxonomy','admin/generate/taxonomy','Generate categories','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:88:\"Generate a given number of vocabularies and terms. Optionally delete current categories.\";}}','system',0,0,0,0,0,3,0,177,180,200,0,0,0,0,0,0,0),('admin',199,184,'admin/settings/file-system','admin/settings/file-system','File system','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:68:\"Tell Drupal where to store uploaded files and how they are accessed.\";}}','system',0,0,0,0,0,3,0,177,184,199,0,0,0,0,0,0,0),('navigation',106,11,'node/add/page','node/add/page','Page','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";}}','system',0,0,0,0,0,2,0,11,106,0,0,0,0,0,0,0,0),('navigation',107,11,'node/add/story','node/add/story','Story','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:392:\"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.\";}}','system',0,0,0,0,0,2,0,11,107,0,0,0,0,0,0,0,0),('admin',198,184,'admin/settings/error-reporting','admin/settings/error-reporting','Error reporting','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:93:\"Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.\";}}','system',0,0,0,0,0,3,0,177,184,198,0,0,0,0,0,0,0),('admin',197,184,'admin/settings/devel','admin/settings/devel','Devel settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:164:\"Helper functions, pages, and blocks to assist Drupal developers. The devel blocks can be managed via the <a href=\"/admin/build/block\">block administration</a> page.\";}}','system',0,0,0,0,0,3,0,177,184,197,0,0,0,0,0,0,0),('navigation',116,0,'crossdomain.xml','crossdomain.xml','','a:0:{}','system',-1,0,0,0,0,1,0,116,0,0,0,0,0,0,0,0,0),('navigation',117,0,'content/js_add_more','content/js_add_more','','a:0:{}','system',-1,0,0,0,0,1,0,117,0,0,0,0,0,0,0,0,0),('navigation',118,0,'oauth/authorize','oauth/authorize','','a:0:{}','system',-1,0,0,0,0,1,0,118,0,0,0,0,0,0,0,0,0),('navigation',119,0,'oauth/access_token','oauth/access_token','','a:0:{}','system',-1,0,0,0,0,1,0,119,0,0,0,0,0,0,0,0,0),('navigation',120,0,'oauth/request_token','oauth/request_token','','a:0:{}','system',-1,0,0,0,0,1,0,120,0,0,0,0,0,0,0,0,0),('navigation',121,0,'oauth/authorized','oauth/authorized','Authorization finished','a:0:{}','system',-1,0,0,0,0,1,0,121,0,0,0,0,0,0,0,0,0),('navigation',122,0,'cobalt/clear-cache','cobalt/clear-cache','Clear cache','a:0:{}','system',-1,0,0,0,0,1,0,122,0,0,0,0,0,0,0,0,0),('navigation',123,0,'cobalt/update','cobalt/update','Cobalt update','a:0:{}','system',-1,0,0,0,0,1,0,123,0,0,0,0,0,0,0,0,0),('devel',124,0,'devel/queries','devel/queries','Database queries','a:0:{}','system',0,0,1,0,0,1,0,124,0,0,0,0,0,0,0,0,0),('devel',125,0,'devel/source','devel/source','Display the PHP code of any file in your Drupal installation','a:0:{}','system',-1,0,0,0,0,1,0,125,0,0,0,0,0,0,0,0,0),('devel',126,0,'devel/php','devel/php','Execute PHP Code','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:21:\"Execute some PHP code\";}}','system',0,0,0,0,0,1,0,126,0,0,0,0,0,0,0,0,0),('navigation',127,0,'cobalt/alias','cobalt/alias','Forward to the correct alias','a:0:{}','system',-1,0,0,0,0,1,0,127,0,0,0,0,0,0,0,0,0),('devel',128,0,'devel/reference','devel/reference','Function reference','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:73:\"View a list of currently defined user functions with documentation links.\";}}','system',0,0,0,0,0,1,0,128,0,0,0,0,0,0,0,0,0),('admin',196,184,'admin/settings/date-time','admin/settings/date-time','Date and time','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:89:\"Settings for how Drupal displays date and time, as well as the system\'s default timezone.\";}}','system',0,0,0,0,0,3,0,177,184,196,0,0,0,0,0,0,0),('devel',130,0,'devel/elements','devel/elements','Hook_elements()','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:51:\"View the active form/render elements for this site.\";}}','system',0,0,0,0,0,1,0,130,0,0,0,0,0,0,0,0,0),('devel',131,0,'devel/phpinfo','devel/phpinfo','PHPinfo()','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:36:\"View your server\'s PHP configuration\";}}','system',0,0,0,0,0,1,0,131,0,0,0,0,0,0,0,0,0),('navigation',132,0,'cobalt/rebuild-permissions','cobalt/rebuild-permissions','Rebuild permissions','a:0:{}','system',-1,0,0,0,0,1,0,132,0,0,0,0,0,0,0,0,0),('devel',133,0,'devel/reinstall','devel/reinstall','Reinstall modules','a:2:{s:10:\"attributes\";a:1:{s:5:\"title\";s:64:\"Run hook_uninstall() and then hook_install() for a given module.\";}s:5:\"alter\";b:1;}','system',0,0,0,0,0,1,0,133,0,0,0,0,0,0,0,0,0),('devel',134,0,'devel/session','devel/session','Session viewer','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:31:\"List the contents of $_SESSION.\";}}','system',0,0,0,0,0,1,0,134,0,0,0,0,0,0,0,0,0),('devel',135,0,'devel/switch','devel/switch','Switch user','a:0:{}','system',-1,0,0,0,0,1,0,135,0,0,0,0,0,0,0,0,0),('navigation',136,0,'user/timezone','user/timezone','User timezone','a:0:{}','system',-1,0,0,0,0,1,0,136,0,0,0,0,0,0,0,0,0),('devel',137,0,'devel/variable','devel/variable','Variable editor','a:2:{s:10:\"attributes\";a:1:{s:5:\"title\";s:31:\"Edit and delete site variables.\";}s:5:\"alter\";b:1;}','system',0,0,0,0,0,1,0,137,0,0,0,0,0,0,0,0,0),('navigation',138,0,'oauth/test/valid-access-token','oauth/test/valid-access-token','','a:0:{}','system',-1,0,0,0,0,1,0,138,0,0,0,0,0,0,0,0,0),('navigation',139,0,'ctools/autocomplete/node','ctools/autocomplete/node','','a:0:{}','system',-1,0,0,0,0,1,0,139,0,0,0,0,0,0,0,0,0),('navigation',140,0,'oauth/test/valid-consumer','oauth/test/valid-consumer','','a:0:{}','system',-1,0,0,0,0,1,0,140,0,0,0,0,0,0,0,0,0),('admin',195,179,'admin/content/types','admin/content/types','Content types','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:82:\"Manage posts by content type, including default status, front page promotion, etc.\";}}','system',0,0,0,0,0,3,0,177,179,195,0,0,0,0,0,0,0),('admin',194,179,'admin/content/node','admin/content/node','Content','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"View, edit, and delete your site\'s content.\";}}','system',0,0,0,0,0,3,0,177,179,194,0,0,0,0,0,0,0),('devel',143,0,'devel/cache/clear','devel/cache/clear','Empty cache','a:2:{s:10:\"attributes\";a:1:{s:5:\"title\";s:100:\"Clear the CSS cache and all database cache tables which store page, node, theme and variable caches.\";}s:5:\"alter\";b:1;}','system',0,0,0,0,0,1,0,143,0,0,0,0,0,0,0,0,0),('devel',144,124,'devel/queries/empty','devel/queries/empty','Empty database queries','a:0:{}','system',0,0,0,0,0,2,0,124,144,0,0,0,0,0,0,0,0),('admin',192,184,'admin/settings/cobalt','admin/settings/cobalt','Cobalt configuration','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:44:\"Settings for cobalt appearance and behaviour\";}}','system',0,0,0,0,0,3,0,177,184,192,0,0,0,0,0,0,0),('admin',193,179,'admin/content/comment','admin/content/comment','Comments','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:61:\"List and edit site comments and the comment moderation queue.\";}}','system',0,0,0,0,0,3,0,177,179,193,0,0,0,0,0,0,0),('admin',191,184,'admin/settings/clean-urls','admin/settings/clean-urls','Clean URLs','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"Enable or disable clean URLs for your site.\";}}','system',0,0,0,0,0,3,0,177,184,191,0,0,0,0,0,0,0),('admin',190,183,'admin/build/block','admin/build/block','Blocks','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:79:\"Configure what block content appears in your site\'s sidebars and other regions.\";}}','system',0,0,0,0,0,3,0,177,183,190,0,0,0,0,0,0,0),('devel',149,0,'devel/menu/reset','devel/menu/reset','Rebuild menus','a:2:{s:10:\"attributes\";a:1:{s:5:\"title\";s:113:\"Rebuild menu based on hook_menu() and revert any custom changes. All menu items return to their default settings.\";}s:5:\"alter\";b:1;}','system',0,0,0,0,0,1,0,149,0,0,0,0,0,0,0,0,0),('navigation',150,0,'cobalt/data/menu_json','cobalt/data/menu_json','Serialized menu','a:0:{}','system',-1,0,0,0,0,1,0,150,0,0,0,0,0,0,0,0,0),('admin',189,182,'admin/reports/updates','admin/reports/updates','Available updates','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:82:\"Get a status report about available updates for your installed modules and themes.\";}}','system',0,0,0,0,10,3,0,177,182,189,0,0,0,0,0,0,0),('devel',152,0,'devel/theme/registry','devel/theme/registry','Theme registry','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:63:\"View a list of available theme functions across the whole site.\";}}','system',0,0,0,0,0,1,0,152,0,0,0,0,0,0,0,0,0),('admin',188,184,'admin/settings/admin','admin/settings/admin','Administration tools','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:39:\"Settings for site administration tools.\";}}','system',0,0,0,0,0,3,0,177,184,188,0,0,0,0,0,0,0),('admin',187,184,'admin/settings/actions','admin/settings/actions','Actions','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:41:\"Manage the actions defined for your site.\";}}','system',0,0,0,0,0,3,0,177,184,187,0,0,0,0,0,0,0),('navigation',157,0,'ctools/context/ajax/add','ctools/context/ajax/add','','a:0:{}','system',-1,0,0,0,0,1,0,157,0,0,0,0,0,0,0,0,0),('navigation',158,0,'ctools/context/ajax/delete','ctools/context/ajax/delete','','a:0:{}','system',-1,0,0,0,0,1,0,158,0,0,0,0,0,0,0,0,0),('navigation',159,0,'ctools/context/ajax/configure','ctools/context/ajax/configure','','a:0:{}','system',-1,0,0,0,0,1,0,159,0,0,0,0,0,0,0,0,0),('devel',160,137,'devel/variable/edit/%','devel/variable/edit/%','Variable editor','a:0:{}','system',-1,0,0,0,0,2,0,137,160,0,0,0,0,0,0,0,0),('navigation',162,0,'ctools/context/ajax/access/add','ctools/context/ajax/access/add','','a:0:{}','system',-1,0,0,0,0,1,0,162,0,0,0,0,0,0,0,0,0),('navigation',163,0,'ctools/context/ajax/access/delete','ctools/context/ajax/access/delete','','a:0:{}','system',-1,0,0,0,0,1,0,163,0,0,0,0,0,0,0,0,0),('navigation',164,0,'ctools/context/ajax/access/configure','ctools/context/ajax/access/configure','','a:0:{}','system',-1,0,0,0,0,1,0,164,0,0,0,0,0,0,0,0,0),('admin',186,185,'admin/user/rules','admin/user/rules','Access rules','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:80:\"List and create rules to disallow usernames, e-mail addresses, and IP addresses.\";}}','system',0,0,0,0,0,3,0,177,185,186,0,0,0,0,0,0,0),('admin',185,177,'admin/user','admin/user','User management','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:61:\"Manage your site\'s users, groups and access to site features.\";}}','system',0,0,1,0,0,2,0,177,185,0,0,0,0,0,0,0,0),('admin',184,177,'admin/settings','admin/settings','Site configuration','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:40:\"Adjust basic site configuration options.\";}}','system',0,0,1,0,-5,2,0,177,184,0,0,0,0,0,0,0,0),('admin',183,177,'admin/build','admin/build','Site building','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:38:\"Control how your site looks and feels.\";}}','system',0,0,1,0,-10,2,0,177,183,0,0,0,0,0,0,0,0),('admin',181,177,'admin/help','admin/help','Help','a:0:{}','system',0,0,0,0,9,2,0,177,181,0,0,0,0,0,0,0,0),('admin',182,177,'admin/reports','admin/reports','Reports','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:59:\"View reports from system logs and other status information.\";}}','system',0,0,1,0,5,2,0,177,182,0,0,0,0,0,0,0,0),('admin',180,177,'admin/generate','admin/generate','Generate items','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:40:\"Populate your database with dummy items.\";}}','system',0,0,1,0,0,2,0,177,180,0,0,0,0,0,0,0,0),('admin',177,0,'admin','admin','Administer','a:0:{}','system',0,0,1,0,9,1,0,177,0,0,0,0,0,0,0,0,0),('admin',178,177,'admin/compact','admin/compact','Compact mode','a:0:{}','system',-1,0,0,0,0,2,0,177,178,0,0,0,0,0,0,0,0),('admin',179,177,'admin/content','admin/content','Content management','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:27:\"Manage your site\'s content.\";}}','system',0,0,1,0,-10,2,0,177,179,0,0,0,0,0,0,0,0),('navigation',175,21,'user/%/oauth/authorizations/%/ahah/secret','user/%/oauth/authorizations/%/ahah/secret','','a:0:{}','system',-1,0,0,0,0,2,0,21,175,0,0,0,0,0,0,0,0),('navigation',176,21,'user/%/oauth/consumer/%/ahah/secret','user/%/oauth/consumer/%/ahah/secret','','a:0:{}','system',-1,0,0,0,0,2,0,21,176,0,0,0,0,0,0,0,0),('admin',277,190,'admin/build/block/list/js','admin/build/block/list/js','JavaScript List Form','a:0:{}','system',-1,0,0,0,0,4,0,177,183,190,277,0,0,0,0,0,0),('admin',278,215,'admin/build/services/%/enable','admin/build/services/%/enable','','a:0:{}','system',-1,0,0,0,0,4,0,177,183,215,278,0,0,0,0,0,0),('admin',279,207,'admin/build/modules/list/confirm','admin/build/modules/list/confirm','List','a:0:{}','system',-1,0,0,0,0,4,0,177,183,207,279,0,0,0,0,0,0),('admin',280,207,'admin/build/modules/uninstall/confirm','admin/build/modules/uninstall/confirm','Uninstall','a:0:{}','system',-1,0,0,0,0,4,0,177,183,207,280,0,0,0,0,0,0),('admin',281,196,'admin/settings/date-time/formats/delete/%','admin/settings/date-time/formats/delete/%','Delete date format','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:47:\"Allow users to delete a configured date format.\";}}','system',-1,0,0,0,0,4,0,177,184,196,281,0,0,0,0,0,0),('admin',282,206,'admin/build/menu/item/%/delete','admin/build/menu/item/%/delete','Delete menu item','a:0:{}','system',-1,0,0,0,0,4,0,177,183,206,282,0,0,0,0,0,0),('admin',283,206,'admin/build/menu/item/%/edit','admin/build/menu/item/%/edit','Edit menu item','a:0:{}','system',-1,0,0,0,0,4,0,177,183,206,283,0,0,0,0,0,0),('admin',284,219,'admin/content/taxonomy/edit/vocabulary/%','admin/content/taxonomy/edit/vocabulary/%','Edit vocabulary','a:0:{}','system',-1,0,0,0,0,4,0,177,179,219,284,0,0,0,0,0,0),('admin',285,206,'admin/build/menu/item/%/reset','admin/build/menu/item/%/reset','Reset menu item','a:0:{}','system',-1,0,0,0,0,4,0,177,183,206,285,0,0,0,0,0,0),('navigation',286,0,'api/iphone','api/iphone','Services endpoint','a:0:{}','system',-1,0,0,0,0,1,0,286,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `menu_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_router`
--

DROP TABLE IF EXISTS `menu_router`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_router` (
  `path` varchar(255) NOT NULL DEFAULT '',
  `load_functions` text NOT NULL,
  `to_arg_functions` text NOT NULL,
  `access_callback` varchar(255) NOT NULL DEFAULT '',
  `access_arguments` text,
  `page_callback` varchar(255) NOT NULL DEFAULT '',
  `page_arguments` text,
  `fit` int(11) NOT NULL DEFAULT '0',
  `number_parts` smallint(6) NOT NULL DEFAULT '0',
  `tab_parent` varchar(255) NOT NULL DEFAULT '',
  `tab_root` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_callback` varchar(255) NOT NULL DEFAULT '',
  `title_arguments` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `block_callback` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `position` varchar(255) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `file` mediumtext,
  PRIMARY KEY (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_router`
--

LOCK TABLES `menu_router` WRITE;
/*!40000 ALTER TABLE `menu_router` DISABLE KEYS */;
INSERT INTO `menu_router` VALUES ('node','','','user_access','a:1:{i:0;s:14:\"access content\";}','node_page_default','a:0:{}',1,1,'','node','Content','t','',4,'','','',0,''),('rss.xml','','','user_access','a:1:{i:0;s:14:\"access content\";}','node_feed','a:0:{}',1,1,'','rss.xml','RSS feed','t','',4,'','','',0,''),('crossdomain.xml','','','services_access_menu','a:0:{}','services_crossdomain_xml','a:0:{}',1,1,'','crossdomain.xml','','t','',4,'','','',0,''),('batch','','','1','a:0:{}','system_batch_page','a:0:{}',1,1,'','batch','','t','',4,'','','',0,'modules/system/system.admin.inc'),('logout','','','user_is_logged_in','a:0:{}','user_logout','a:0:{}',1,1,'','logout','Log out','t','',6,'','','',10,'modules/user/user.pages.inc'),('user','','','1','a:0:{}','user_page','a:0:{}',1,1,'','user','User account','t','',4,'','','',0,'modules/user/user.pages.inc'),('admin','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_main_admin_page','a:0:{}',1,1,'','admin','Administer','t','',6,'','','',9,'modules/system/system.admin.inc'),('user/login','','','user_is_anonymous','a:0:{}','user_page','a:0:{}',3,2,'user','user','Log in','t','',136,'','','',0,'modules/user/user.pages.inc'),('system/files','','','1','a:0:{}','file_download','a:0:{}',3,2,'','system/files','File download','t','',4,'','','',0,''),('cobalt/alias','','','user_access','a:1:{i:0;s:10:\"use cobalt\";}','cobalt_forward_to_alias','a:0:{}',3,2,'','cobalt/alias','Forward to the correct alias','t','',4,'','','',0,''),('user/timezone','','','1','a:0:{}','user_timezone','a:0:{}',3,2,'','user/timezone','User timezone','t','',4,'','','',0,''),('content/js_add_more','','','user_access','a:1:{i:0;s:14:\"access content\";}','content_add_more_js','a:0:{}',3,2,'','content/js_add_more','','t','',4,'','','',0,'sites/all/modules/cck/includes/content.node_form.inc'),('oauth/authorized','','','user_access','a:1:{i:0;s:14:\"access content\";}','oauth_common_page_authorized','a:0:{}',3,2,'','oauth/authorized','Authorization finished','t','',4,'','','',0,'sites/all/modules/oauth/oauth_common.pages.inc'),('taxonomy/autocomplete','','','user_access','a:1:{i:0;s:14:\"access content\";}','taxonomy_autocomplete','a:0:{}',3,2,'','taxonomy/autocomplete','Autocomplete taxonomy','t','',4,'','','',0,'modules/taxonomy/taxonomy.pages.inc'),('admin/by-module','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_by_module','a:0:{}',3,2,'admin','admin','By module','t','',128,'','','',2,'modules/system/system.admin.inc'),('admin/by-task','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_main_admin_page','a:0:{}',3,2,'admin','admin','By task','t','',136,'','','',0,'modules/system/system.admin.inc'),('cobalt/clear-cache','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','_cobalt_clear_cache','a:0:{}',3,2,'','cobalt/clear-cache','Clear cache','t','',4,'','','',0,'sites/all/modules/cobalt/cobalt_admin.inc.php'),('filter/tips','','','1','a:0:{}','filter_tips_long','a:0:{}',3,2,'','filter/tips','Compose tips','t','',20,'','','',0,'modules/filter/filter.pages.inc'),('node/add','','','_node_add_access','a:0:{}','node_add_page','a:0:{}',3,2,'','node/add','Create content','t','',6,'','','',1,'modules/node/node.pages.inc'),('comment/delete','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_delete','a:0:{}',3,2,'','comment/delete','Delete comment','t','',4,'','','',0,'modules/comment/comment.admin.inc'),('devel/source','','','user_access','a:1:{i:0;s:19:\"display source code\";}','devel_display_source','a:0:{}',3,2,'','devel/source','Display the PHP code of any file in your Drupal installation','t','',4,'','','',0,''),('oauth/request_token','','','oauth_commmon_is_provider','a:0:{}','oauth_common_callback_request_token','a:0:{}',3,2,'','oauth/request_token','','t','',4,'','','',0,'sites/all/modules/oauth/oauth_common.pages.inc'),('comment/edit','','','user_access','a:1:{i:0;s:13:\"post comments\";}','comment_edit','a:0:{}',3,2,'','comment/edit','Edit comment','t','',4,'','','',0,'modules/comment/comment.pages.inc'),('oauth/access_token','','','oauth_commmon_is_provider','a:0:{}','oauth_common_callback_access_token','a:0:{}',3,2,'','oauth/access_token','','t','',4,'','','',0,'sites/all/modules/oauth/oauth_common.pages.inc'),('cobalt/rebuild-permissions','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','_cobalt_rebuild_permissions','a:0:{}',3,2,'','cobalt/rebuild-permissions','Rebuild permissions','t','',4,'','','',0,'sites/all/modules/cobalt/cobalt_admin.inc.php'),('api/iphone','','','services_access_menu','a:0:{}','services_endpoint_callback','a:1:{i:0;s:6:\"iphone\";}',3,2,'','api/iphone','Services endpoint','t','',4,'','','',0,''),('devel/switch','','','user_access','a:1:{i:0;s:12:\"switch users\";}','devel_switch_user','a:0:{}',3,2,'','devel/switch','Switch user','t','',4,'','','',0,''),('devel/queries','','','devel_menu_access_store_queries','a:0:{}','devel_queries','a:0:{}',3,2,'','devel/queries','Database queries','t','',6,'','','',0,''),('devel/reference','','','user_access','a:1:{i:0;s:24:\"access devel information\";}','devel_function_reference','a:0:{}',3,2,'','devel/reference','Function reference','t','',6,'','View a list of currently defined user functions with documentation links.','',0,''),('devel/elements','','','user_access','a:1:{i:0;s:24:\"access devel information\";}','devel_elements_page','a:0:{}',3,2,'','devel/elements','Hook_elements()','t','',6,'','View the active form/render elements for this site.','',0,''),('devel/phpinfo','','','user_access','a:1:{i:0;s:24:\"access devel information\";}','devel_phpinfo','a:0:{}',3,2,'','devel/phpinfo','PHPinfo()','t','',6,'','View your server\'s PHP configuration','',0,''),('devel/session','','','user_access','a:1:{i:0;s:24:\"access devel information\";}','devel_session','a:0:{}',3,2,'','devel/session','Session viewer','t','',6,'','List the contents of $_SESSION.','',0,''),('devel/variable','','','user_access','a:1:{i:0;s:24:\"access devel information\";}','devel_variable_page','a:0:{}',3,2,'','devel/variable','Variable editor','t','',6,'','Edit and delete site variables.','',0,''),('oauth/authorize','','','oauth_commmon_is_provider','a:0:{}','drupal_get_form','a:1:{i:0;s:27:\"oauth_common_form_authorize\";}',3,2,'','oauth/authorize','','t','',4,'','','',0,'sites/all/modules/oauth/oauth_common.pages.inc'),('cobalt/update','','','user_access','a:1:{i:0;s:10:\"use cobalt\";}','cobalt_js_update','a:1:{i:0;s:15:\"cobalt_settings\";}',3,2,'','cobalt/update','Cobalt update','t','',4,'','','',0,'sites/all/modules/cobalt/cobalt_update.inc.php'),('admin/compact','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_compact_page','a:0:{}',3,2,'','admin/compact','Compact mode','t','',4,'','','',0,'modules/system/system.admin.inc'),('user/register','','','user_register_access','a:0:{}','drupal_get_form','a:1:{i:0;s:13:\"user_register\";}',3,2,'user','user','Create new account','t','',128,'','','',0,'modules/user/user.pages.inc'),('admin/help','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_main','a:0:{}',3,2,'','admin/help','Help','t','',6,'','','',9,'modules/help/help.admin.inc'),('user/password','','','user_is_anonymous','a:0:{}','drupal_get_form','a:1:{i:0;s:9:\"user_pass\";}',3,2,'user','user','Request new password','t','',128,'','','',0,'modules/user/user.pages.inc'),('user/autocomplete','','','user_access','a:1:{i:0;s:20:\"access user profiles\";}','user_autocomplete','a:0:{}',3,2,'','user/autocomplete','User autocomplete','t','',4,'','','',0,'modules/user/user.pages.inc'),('devel/php','','','user_access','a:1:{i:0;s:16:\"execute php code\";}','drupal_get_form','a:1:{i:0;s:18:\"devel_execute_form\";}',3,2,'','devel/php','Execute PHP Code','t','',6,'','Execute some PHP code','',0,''),('devel/reinstall','','','user_access','a:1:{i:0;s:24:\"access devel information\";}','drupal_get_form','a:1:{i:0;s:15:\"devel_reinstall\";}',3,2,'','devel/reinstall','Reinstall modules','t','',6,'','Run hook_uninstall() and then hook_install() for a given module.','',0,''),('admin/reports','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/reports','Reports','t','',6,'','View reports from system logs and other status information.','left',5,'modules/system/system.admin.inc'),('node/%','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:1;}','node_page_view','a:1:{i:0;i:1;}',2,2,'','node/%','','node_page_title','a:1:{i:0;i:1;}',4,'','','',0,''),('admin/content','','','admin_landing_page_access','a:1:{i:0;s:13:\"admin/content\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/content','Content management','t','',6,'','Manage your site\'s content.','left',-10,'modules/system/system.admin.inc'),('admin/generate','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/generate','Generate items','t','',6,'','Populate your database with dummy items.','left',0,'modules/system/system.admin.inc'),('admin/build','','','admin_landing_page_access','a:1:{i:0;s:11:\"admin/build\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/build','Site building','t','',6,'','Control how your site looks and feels.','right',-10,'modules/system/system.admin.inc'),('admin/settings','','','admin_landing_page_access','a:1:{i:0;s:14:\"admin/settings\";}','system_settings_overview','a:0:{}',3,2,'','admin/settings','Site configuration','t','',6,'','Adjust basic site configuration options.','right',-5,'modules/system/system.admin.inc'),('user/%','a:1:{i:1;s:22:\"user_uid_optional_load\";}','a:1:{i:1;s:24:\"user_uid_optional_to_arg\";}','user_view_access','a:1:{i:0;i:1;}','user_view','a:1:{i:0;i:1;}',2,2,'','user/%','My account','user_page_title','a:1:{i:0;i:1;}',6,'','','',0,'modules/user/user.pages.inc'),('admin/user','','','admin_landing_page_access','a:1:{i:0;s:10:\"admin/user\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/user','User management','t','',6,'','Manage your site\'s users, groups and access to site features.','left',0,'modules/system/system.admin.inc'),('node/%/view','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:1;}','node_page_view','a:1:{i:0;i:1;}',5,3,'node/%','node/%','View','t','',136,'','','',-10,''),('user/%/view','a:1:{i:1;s:9:\"user_load\";}','','user_view_access','a:1:{i:0;i:1;}','user_view','a:1:{i:0;i:1;}',5,3,'user/%','user/%','View','t','',136,'','','',-10,'modules/user/user.pages.inc'),('cobalt/data/menu_json','','','user_access','a:1:{i:0;s:10:\"use cobalt\";}','cobalt_menu_json','a:0:{}',7,3,'','cobalt/data/menu_json','Serialized menu','t','',4,'','','',0,''),('ctools/autocomplete/node','','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_content_autocomplete_node','a:0:{}',7,3,'','ctools/autocomplete/node','','t','',4,'','','',0,'sites/all/modules/ctools/includes/content.menu.inc'),('oauth/test/valid-access-token','','','oauth_commmon_is_provider','a:0:{}','_oauth_common_validate_request_callback','a:1:{i:0;s:12:\"access token\";}',7,3,'','oauth/test/valid-access-token','','t','',4,'','','',0,'sites/all/modules/oauth/oauth_common.pages.inc'),('oauth/test/valid-consumer','','','oauth_commmon_is_provider','a:0:{}','_oauth_common_validate_request_callback','a:1:{i:0;s:8:\"consumer\";}',7,3,'','oauth/test/valid-consumer','','t','',4,'','','',0,'sites/all/modules/oauth/oauth_common.pages.inc'),('admin/settings/actions','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_manage','a:0:{}',7,3,'','admin/settings/actions','Actions','t','',6,'','Manage the actions defined for your site.','',0,''),('node/%/devel','a:1:{i:1;s:9:\"node_load\";}','','user_access','a:1:{i:0;s:24:\"access devel information\";}','devel_load_object','a:2:{i:0;i:1;i:1;s:4:\"node\";}',5,3,'node/%','node/%','Devel','t','',128,'','','',100,''),('user/%/devel','a:1:{i:1;s:9:\"user_load\";}','','user_access','a:1:{i:0;s:24:\"access devel information\";}','devel_load_object','a:2:{i:0;i:1;i:1;s:4:\"user\";}',5,3,'user/%','user/%','Devel','t','',128,'','','',100,''),('devel/cache/clear','','','user_access','a:1:{i:0;s:24:\"access devel information\";}','devel_cache_clear','a:0:{}',7,3,'','devel/cache/clear','Empty cache','t','',6,'','Clear the CSS cache and all database cache tables which store page, node, theme and variable caches.','',0,''),('devel/queries/empty','','','devel_menu_access_store_queries','a:0:{}','devel_queries_empty','a:0:{}',7,3,'','devel/queries/empty','Empty database queries','t','',6,'','','',0,''),('taxonomy/term/%','a:1:{i:2;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','taxonomy_term_page','a:1:{i:0;i:2;}',6,3,'','taxonomy/term/%','Taxonomy term','t','',4,'','','',0,'modules/taxonomy/taxonomy.pages.inc'),('devel/theme/registry','','','user_access','a:1:{i:0;s:24:\"access devel information\";}','devel_theme_registry','a:0:{}',7,3,'','devel/theme/registry','Theme registry','t','',6,'','View a list of available theme functions across the whole site.','',0,''),('admin/user/rules','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access','a:0:{}',7,3,'','admin/user/rules','Access rules','t','',6,'','List and create rules to disallow usernames, e-mail addresses, and IP addresses.','',0,'modules/user/user.admin.inc'),('user/%/oauth','a:1:{i:1;s:9:\"user_load\";}','','_oauth_common_user_access','a:1:{i:0;i:1;}','oauth_common_page_user_authorizations','a:2:{i:0;i:1;i:1;b:1;}',5,3,'user/%','user/%','Authorization','t','',128,'','','',0,'sites/all/modules/oauth/oauth_common.authorizations.inc'),('admin/reports/updates','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','update_status','a:0:{}',7,3,'','admin/reports/updates','Available updates','t','',6,'','Get a status report about available updates for your installed modules and themes.','',10,'modules/update/update.report.inc'),('admin/build/block','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','block_admin_display','a:0:{}',7,3,'','admin/build/block','Blocks','t','',6,'','Configure what block content appears in your site\'s sidebars and other regions.','',0,'modules/block/block.admin.inc'),('admin/content/comment','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_admin','a:0:{}',7,3,'','admin/content/comment','Comments','t','',6,'','List and edit site comments and the comment moderation queue.','',0,'modules/comment/comment.admin.inc'),('node/%/delete','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:6:\"delete\";i:1;i:1;}','drupal_get_form','a:2:{i:0;s:19:\"node_delete_confirm\";i:1;i:1;}',5,3,'','node/%/delete','Delete','t','',4,'','','',1,'modules/node/node.pages.inc'),('user/%/delete','a:1:{i:1;s:9:\"user_load\";}','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:2:{i:0;s:19:\"user_confirm_delete\";i:1;i:1;}',5,3,'','user/%/delete','Delete','t','',4,'','','',0,'modules/user/user.pages.inc'),('admin/settings/devel','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:20:\"devel_admin_settings\";}',7,3,'','admin/settings/devel','Devel settings','t','',6,'','Helper functions, pages, and blocks to assist Drupal developers. The devel blocks can be managed via the <a href=\"/admin/build/block\">block administration</a> page.','',0,''),('node/%/edit','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:6:\"update\";i:1;i:1;}','node_page_edit','a:1:{i:0;i:1;}',5,3,'node/%','node/%','Edit','t','',128,'','','',1,'modules/node/node.pages.inc'),('admin/generate/taxonomy','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:28:\"devel_generate_taxonomy_form\";}',7,3,'','admin/generate/taxonomy','Generate categories','t','',6,'','Generate a given number of vocabularies and terms. Optionally delete current categories.','',0,''),('admin/generate/content','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:27:\"devel_generate_content_form\";}',7,3,'','admin/generate/content','Generate content','t','',6,'','Generate a given number of nodes and comments. Optionally delete current items.','',0,''),('admin/generate/user','','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:1:{i:0;s:25:\"devel_generate_users_form\";}',7,3,'','admin/generate/user','Generate users','t','',6,'','Generate a given number of users. Optionally delete current users.','',0,''),('admin/settings/logging','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_logging_overview','a:0:{}',7,3,'','admin/settings/logging','Logging and alerts','t','',6,'','Settings for logging and alerts modules. Various modules can route Drupal\'s system events to different destination, such as syslog, database, email, ...etc.','',0,'modules/system/system.admin.inc'),('devel/menu/reset','','','user_access','a:1:{i:0;s:24:\"access devel information\";}','drupal_get_form','a:1:{i:0;s:18:\"devel_menu_rebuild\";}',7,3,'','devel/menu/reset','Rebuild menus','t','',6,'','Rebuild menu based on hook_menu() and revert any custom changes. All menu items return to their default settings.','',0,''),('admin/reports/dblog','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_overview','a:0:{}',7,3,'','admin/reports/dblog','Recent log entries','t','',6,'','View events that have recently been logged.','',-1,'modules/dblog/dblog.admin.inc'),('comment/reply/%','a:1:{i:2;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:2;}','comment_reply','a:1:{i:0;i:2;}',6,3,'','comment/reply/%','Reply to comment','t','',4,'','','',0,'modules/comment/comment.pages.inc'),('node/%/revisions','a:1:{i:1;s:9:\"node_load\";}','','_node_revision_access','a:1:{i:0;i:1;}','node_revision_overview','a:1:{i:0;i:1;}',5,3,'node/%','node/%','Revisions','t','',128,'','','',2,'modules/node/node.pages.inc'),('admin/build/services','','','user_access','a:1:{i:0;s:19:\"administer services\";}','services_list_endpoint','a:0:{}',7,3,'','admin/build/services','Services','t','',6,'','Manage how external applications communicates with Drupal.','',0,'sites/all/modules/services/services.admin.inc'),('admin/reports/status','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_status','a:0:{}',7,3,'','admin/reports/status','Status report','t','',6,'','Get a status report about your site\'s operation and any detected problems.','',10,'modules/system/system.admin.inc'),('admin/help/block','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/block','block','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/color','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/color','color','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/comment','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/comment','comment','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/content','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/content','content','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/date','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/date','date','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/dblog','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/dblog','dblog','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/devel','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/devel','devel','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/filter','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/filter','filter','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/help','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/help','help','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/menu','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/menu','menu','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/node','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/node','node','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/services','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/services','services','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/system','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/system','system','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/taxonomy','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/taxonomy','taxonomy','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/update','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/update','update','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/user','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/user','user','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/settings/clean-urls','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_clean_url_settings\";}',7,3,'','admin/settings/clean-urls','Clean URLs','t','',6,'','Enable or disable clean URLs for your site.','',0,'modules/system/system.admin.inc'),('admin/settings/cobalt','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:15:\"cobalt_settings\";}',7,3,'','admin/settings/cobalt','Cobalt configuration','t','',6,'','Settings for cobalt appearance and behaviour','',0,'sites/all/modules/cobalt/cobalt_admin.inc.php'),('admin/content/node','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:18:\"node_admin_content\";}',7,3,'','admin/content/node','Content','t','',6,'','View, edit, and delete your site\'s content.','',0,'modules/node/node.admin.inc'),('admin/content/types','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','content_types_overview','a:0:{}',7,3,'','admin/content/types','Content types','t','',6,'','Manage posts by content type, including default status, front page promotion, etc.','',0,'sites/all/modules/cck/includes/content.admin.inc'),('admin/settings/date-time','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_date_time_settings\";}',7,3,'','admin/settings/date-time','Date and time','t','',6,'','Settings for how Drupal displays date and time, as well as the system\'s default timezone.','',0,'modules/system/system.admin.inc'),('user/%/edit','a:1:{i:1;a:1:{s:18:\"user_category_load\";a:2:{i:0;s:4:\"%map\";i:1;s:6:\"%index\";}}}','','user_edit_access','a:1:{i:0;i:1;}','user_edit','a:1:{i:0;i:1;}',5,3,'user/%','user/%','Edit','t','',128,'','','',0,'modules/user/user.pages.inc'),('admin/settings/error-reporting','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:31:\"system_error_reporting_settings\";}',7,3,'','admin/settings/error-reporting','Error reporting','t','',6,'','Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.','',0,'modules/system/system.admin.inc'),('admin/settings/file-system','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_file_system_settings\";}',7,3,'','admin/settings/file-system','File system','t','',6,'','Tell Drupal where to store uploaded files and how they are accessed.','',0,'modules/system/system.admin.inc'),('admin/settings/image-toolkit','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:29:\"system_image_toolkit_settings\";}',7,3,'','admin/settings/image-toolkit','Image toolkit','t','',6,'','Choose which image toolkit to use if you have installed optional toolkits.','',0,'modules/system/system.admin.inc'),('admin/settings/filters','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:21:\"filter_admin_overview\";}',7,3,'','admin/settings/filters','Input formats','t','',6,'','Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.','',0,'modules/filter/filter.admin.inc'),('admin/build/menu','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_overview_page','a:0:{}',7,3,'','admin/build/menu','Menus','t','',6,'','Control your site\'s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.','',0,'modules/menu/menu.admin.inc'),('admin/build/modules','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}',7,3,'','admin/build/modules','Modules','t','',6,'','Enable or disable add-on modules for your site.','',0,'modules/system/system.admin.inc'),('admin/settings/oauth','','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','drupal_get_form','a:1:{i:0;s:19:\"_oauth_common_admin\";}',7,3,'','admin/settings/oauth','OAuth','t','',6,'','Settings for OAuth','',0,'sites/all/modules/oauth/oauth_common.admin.inc'),('admin/settings/performance','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_performance_settings\";}',7,3,'','admin/settings/performance','Performance','t','',6,'','Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.','',0,'modules/system/system.admin.inc'),('admin/user/permissions','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:15:\"user_admin_perm\";}',7,3,'','admin/user/permissions','Permissions','t','',6,'','Determine access to features by selecting permissions for roles.','',0,'modules/user/user.admin.inc'),('admin/content/node-settings','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:14:\"node_configure\";}',7,3,'','admin/content/node-settings','Post settings','t','',6,'','Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.','',0,'modules/node/node.admin.inc'),('admin/content/rss-publishing','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_rss_feeds_settings\";}',7,3,'','admin/content/rss-publishing','RSS publishing','t','',6,'','Configure the number of items per feed and whether feeds should be titles/teasers/full-text.','',0,'modules/system/system.admin.inc'),('admin/user/roles','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:19:\"user_admin_new_role\";}',7,3,'','admin/user/roles','Roles','t','',6,'','List, edit, or add user roles.','',0,'modules/user/user.admin.inc'),('admin/settings/site-information','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:32:\"system_site_information_settings\";}',7,3,'','admin/settings/site-information','Site information','t','',6,'','Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.','',0,'modules/system/system.admin.inc'),('admin/settings/site-maintenance','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:32:\"system_site_maintenance_settings\";}',7,3,'','admin/settings/site-maintenance','Site maintenance','t','',6,'','Take the site off-line for maintenance or bring it back online.','',0,'modules/system/system.admin.inc'),('admin/content/taxonomy','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:30:\"taxonomy_overview_vocabularies\";}',7,3,'','admin/content/taxonomy','Taxonomy','t','',6,'','Manage tagging, categorization, and classification of your content.','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/build/themes','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:18:\"system_themes_form\";i:1;N;}',7,3,'','admin/build/themes','Themes','t','',6,'','Change which theme your site uses or allows users to set.','',0,'modules/system/system.admin.inc'),('admin/reports/access-denied','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_top','a:1:{i:0;s:13:\"access denied\";}',7,3,'','admin/reports/access-denied','Top \'access denied\' errors','t','',6,'','View \'access denied\' errors (403s).','',0,'modules/dblog/dblog.admin.inc'),('admin/reports/page-not-found','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_top','a:1:{i:0;s:14:\"page not found\";}',7,3,'','admin/reports/page-not-found','Top \'page not found\' errors','t','',6,'','View \'page not found\' errors (404s).','',0,'modules/dblog/dblog.admin.inc'),('admin/user/settings','','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:1:{i:0;s:19:\"user_admin_settings\";}',7,3,'','admin/user/settings','User settings','t','',6,'','Configure default behavior of users, including registration requirements, e-mails, and user pictures.','',0,'modules/user/user.admin.inc'),('admin/user/user','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:4:\"list\";}',7,3,'','admin/user/user','Users','t','',6,'','List, add, and edit users.','',0,'modules/user/user.admin.inc'),('admin/settings/admin','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:19:\"admin_settings_form\";}',7,3,'','admin/settings/admin','Administration tools','t','',6,'','Settings for site administration tools.','',0,'sites/all/modules/admin/admin.admin.inc'),('node/add/page','','','node_access','a:2:{i:0;s:6:\"create\";i:1;s:4:\"page\";}','node_add','a:1:{i:0;i:2;}',7,3,'','node/add/page','Page','check_plain','',6,'','A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.','',0,'modules/node/node.pages.inc'),('node/add/story','','','node_access','a:2:{i:0;s:6:\"create\";i:1;s:5:\"story\";}','node_add','a:1:{i:0;i:2;}',7,3,'','node/add/story','Story','check_plain','',6,'','A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.','',0,'modules/node/node.pages.inc'),('admin/build/block/list','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','block_admin_display','a:0:{}',15,4,'admin/build/block','admin/build/block','List','t','',136,'','','',-10,'modules/block/block.admin.inc'),('admin/content/node/overview','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:18:\"node_admin_content\";}',15,4,'admin/content/node','admin/content/node','List','t','',136,'','','',-10,'modules/node/node.admin.inc'),('admin/content/types/list','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','content_types_overview','a:0:{}',15,4,'admin/content/types','admin/content/types','List','t','',136,'','','',-10,'sites/all/modules/cck/includes/content.admin.inc'),('admin/content/taxonomy/list','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:30:\"taxonomy_overview_vocabularies\";}',15,4,'admin/content/taxonomy','admin/content/taxonomy','List','t','',136,'','','',-10,'modules/taxonomy/taxonomy.admin.inc'),('admin/user/rules/list','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access','a:0:{}',15,4,'admin/user/rules','admin/user/rules','List','t','',136,'','','',-10,'modules/user/user.admin.inc'),('admin/settings/filters/list','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:21:\"filter_admin_overview\";}',15,4,'admin/settings/filters','admin/settings/filters','List','t','',136,'','','',0,'modules/filter/filter.admin.inc'),('admin/build/modules/list','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}',15,4,'admin/build/modules','admin/build/modules','List','t','',136,'','','',0,'modules/system/system.admin.inc'),('admin/user/user/list','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:4:\"list\";}',15,4,'admin/user/user','admin/user/user','List','t','',136,'','','',-10,'modules/user/user.admin.inc'),('admin/content/comment/new','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_admin','a:0:{}',15,4,'admin/content/comment','admin/content/comment','Published comments','t','',136,'','','',-10,'modules/comment/comment.admin.inc'),('user/%/edit/account','a:1:{i:1;a:1:{s:18:\"user_category_load\";a:2:{i:0;s:4:\"%map\";i:1;s:6:\"%index\";}}}','','user_edit_access','a:1:{i:0;i:1;}','user_edit','a:1:{i:0;i:1;}',11,4,'user/%/edit','user/%','Account','t','',136,'','','',0,'modules/user/user.pages.inc'),('admin/build/themes/select','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:18:\"system_themes_form\";i:1;N;}',15,4,'admin/build/themes','admin/build/themes','List','t','',136,'','Select the default theme.','',-1,'modules/system/system.admin.inc'),('admin/build/menu/list','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_overview_page','a:0:{}',15,4,'admin/build/menu','admin/build/menu','List menus','t','',136,'','','',-10,'modules/menu/menu.admin.inc'),('admin/build/themes/settings','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:21:\"system_theme_settings\";}',15,4,'admin/build/themes','admin/build/themes','Configure','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/settings/actions/manage','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_manage','a:0:{}',15,4,'admin/settings/actions','admin/settings/actions','Manage actions','t','',136,'','Manage the actions defined for your site.','',-2,''),('admin/build/modules/uninstall','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:24:\"system_modules_uninstall\";}',15,4,'admin/build/modules','admin/build/modules','Uninstall','t','',128,'','','',0,'modules/system/system.admin.inc'),('ctools/context/ajax/add','','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_context_ajax_item_add','a:0:{}',15,4,'','ctools/context/ajax/add','','t','',4,'','','',0,'sites/all/modules/ctools/includes/context-admin.inc'),('ctools/context/ajax/delete','','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_context_ajax_item_delete','a:0:{}',15,4,'','ctools/context/ajax/delete','','t','',4,'','','',0,'sites/all/modules/ctools/includes/context-admin.inc'),('ctools/context/ajax/configure','','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_context_ajax_item_edit','a:0:{}',15,4,'','ctools/context/ajax/configure','','t','',4,'','','',0,'sites/all/modules/ctools/includes/context-admin.inc'),('admin/settings/oauth/add','','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','oauth_common_add_context','a:0:{}',15,4,'admin/settings/oauth','admin/settings/oauth','Add context','t','',128,'','','',10,'sites/all/modules/oauth/oauth_common.admin.inc'),('admin/build/services/add','','','user_access','a:1:{i:0;s:19:\"administer services\";}','services_add_endpoint','a:0:{}',15,4,'admin/build/services','admin/build/services','Add endpoint','t','',128,'','','',0,'sites/all/modules/services/services.admin.inc'),('admin/settings/filters/add','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:0:{}',15,4,'admin/settings/filters','admin/settings/filters','Add input format','t','',128,'','','',1,'modules/filter/filter.admin.inc'),('admin/user/rules/add','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access_add','a:0:{}',15,4,'admin/user/rules','admin/user/rules','Add rule','t','',128,'','','',0,'modules/user/user.admin.inc'),('admin/user/user/create','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:6:\"create\";}',15,4,'admin/user/user','admin/user/user','Add user','t','',128,'','','',0,'modules/user/user.admin.inc'),('admin/content/comment/approval','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_admin','a:1:{i:0;s:8:\"approval\";}',15,4,'admin/content/comment','admin/content/comment','Approval queue','t','',128,'','','',0,'modules/comment/comment.admin.inc'),('admin/user/rules/check','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access_check','a:0:{}',15,4,'admin/user/rules','admin/user/rules','Check rules','t','',128,'','','',0,'modules/user/user.admin.inc'),('admin/content/types/fields','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','content_fields_list','a:0:{}',15,4,'admin/content/types','admin/content/types','Fields','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),('admin/build/services/list','','','user_access','a:1:{i:0;s:19:\"administer services\";}','services_list_endpoint','a:0:{}',15,4,'admin/build/services','admin/build/services','List','t','',136,'','','',-10,'sites/all/modules/services/services.admin.inc'),('admin/reports/updates/list','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','update_status','a:0:{}',15,4,'admin/reports/updates','admin/reports/updates','List','t','',136,'','','',0,'modules/update/update.report.inc'),('admin/settings/actions/orphan','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_remove_orphans','a:0:{}',15,4,'','admin/settings/actions/orphan','Remove orphans','t','',4,'','','',0,''),('admin/build/block/add','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:20:\"block_add_block_form\";}',15,4,'admin/build/block','admin/build/block','Add block','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/content/types/add','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:1:{i:0;s:14:\"node_type_form\";}',15,4,'admin/content/types','admin/content/types','Add content type','t','',128,'','','',0,'modules/node/content_types.inc'),('admin/build/menu/add','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:14:\"menu_edit_menu\";i:1;s:3:\"add\";}',15,4,'admin/build/menu','admin/build/menu','Add menu','t','',128,'','','',0,'modules/menu/menu.admin.inc'),('admin/settings/clean-urls/check','','','1','a:0:{}','drupal_json','a:1:{i:0;a:1:{s:6:\"status\";b:1;}}',15,4,'','admin/settings/clean-urls/check','Clean URL check','t','',4,'','','',0,''),('admin/settings/actions/configure','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','drupal_get_form','a:1:{i:0;s:24:\"system_actions_configure\";}',15,4,'','admin/settings/actions/configure','Configure an advanced action','t','',4,'','','',0,''),('admin/settings/oauth/contexts','','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','oauth_common_list_context','a:0:{}',15,4,'admin/settings/oauth','admin/settings/oauth','Contexts','t','',128,'','The different context for authorization','',1,'sites/all/modules/oauth/oauth_common.admin.inc'),('admin/settings/date-time/lookup','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_date_time_lookup','a:0:{}',15,4,'','admin/settings/date-time/lookup','Date and time lookup','t','',4,'','','',0,'modules/system/system.admin.inc'),('node/%/devel/load','a:1:{i:1;s:9:\"node_load\";}','','user_access','a:1:{i:0;s:24:\"access devel information\";}','devel_load_object','a:2:{i:0;i:1;i:1;s:4:\"node\";}',11,4,'node/%/devel','node/%','Dev load','t','',136,'','','',0,''),('user/%/devel/load','a:1:{i:1;s:9:\"user_load\";}','','user_access','a:1:{i:0;s:24:\"access devel information\";}','devel_load_object','a:2:{i:0;i:1;i:1;s:4:\"user\";}',11,4,'user/%/devel','user/%','Dev load','t','',136,'','','',0,''),('node/%/devel/render','a:1:{i:1;s:9:\"node_load\";}','','user_access','a:1:{i:0;s:24:\"access devel information\";}','devel_render_object','a:2:{i:0;s:4:\"node\";i:1;i:1;}',11,4,'node/%/devel','node/%','Dev render','t','',128,'','','',10,''),('user/%/devel/render','a:1:{i:1;s:9:\"user_load\";}','','user_access','a:1:{i:0;s:24:\"access devel information\";}','devel_render_object','a:2:{i:0;s:4:\"user\";i:1;i:1;}',11,4,'user/%/devel','user/%','Dev render','t','',128,'','','',10,''),('admin/user/roles/edit','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:15:\"user_admin_role\";}',15,4,'','admin/user/roles/edit','Edit role','t','',4,'','','',0,'modules/user/user.admin.inc'),('admin/user/rules/edit','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access_edit','a:0:{}',15,4,'','admin/user/rules/edit','Edit rule','t','',4,'','','',0,'modules/user/user.admin.inc'),('admin/reports/updates/check','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','update_manual_status','a:0:{}',15,4,'','admin/reports/updates/check','Manual update check','t','',4,'','','',0,'modules/update/update.fetch.inc'),('admin/reports/status/php','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_php','a:0:{}',15,4,'','admin/reports/status/php','PHP','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/content/node-settings/rebuild','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','drupal_get_form','a:1:{i:0;s:30:\"node_configure_rebuild_confirm\";}',15,4,'','admin/content/node-settings/rebuild','Rebuild permissions','t','',4,'','','',0,'modules/node/node.admin.inc'),('admin/reports/status/run-cron','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_run_cron','a:0:{}',15,4,'','admin/reports/status/run-cron','Run cron','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/reports/status/sql','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_sql','a:0:{}',15,4,'','admin/reports/status/sql','SQL','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/build/menu/settings','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:1:{i:0;s:14:\"menu_configure\";}',15,4,'admin/build/menu','admin/build/menu','Settings','t','',128,'','','',5,'modules/menu/menu.admin.inc'),('admin/reports/updates/settings','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:15:\"update_settings\";}',15,4,'admin/reports/updates','admin/reports/updates','Settings','t','',128,'','','',0,'modules/update/update.settings.inc'),('devel/variable/edit/%','a:1:{i:3;N;}','','user_access','a:1:{i:0;s:24:\"access devel information\";}','drupal_get_form','a:2:{i:0;s:19:\"devel_variable_edit\";i:1;i:3;}',14,4,'','devel/variable/edit/%','Variable editor','t','',4,'','','',0,''),('user/%/oauth/authorizations','a:1:{i:1;s:9:\"user_load\";}','','_oauth_common_user_access','a:1:{i:0;i:1;}','oauth_common_page_user_authorizations','a:2:{i:0;i:1;i:1;b:1;}',11,4,'user/%/oauth','user/%','Authorizations','t','',136,'','','',0,'sites/all/modules/oauth/oauth_common.authorizations.inc'),('admin/build/block/configure','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:21:\"block_admin_configure\";}',15,4,'','admin/build/block/configure','Configure block','t','',4,'','','',0,'modules/block/block.admin.inc'),('user/%/oauth/consumers','a:1:{i:1;s:9:\"user_load\";}','','_oauth_common_user_access','a:1:{i:0;i:1;}','oauth_common_page_user_consumers','a:1:{i:0;i:1;}',11,4,'user/%/oauth','user/%','Consumers','t','',128,'','','',0,'sites/all/modules/oauth/oauth_common.consumers.inc'),('admin/settings/date-time/configure','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_date_time_settings\";}',15,4,'admin/settings/date-time','admin/settings/date-time','Date and time','t','',136,'','Settings for how Drupal displays date and time, as well as the system\'s default timezone.','',0,'modules/system/system.admin.inc'),('admin/build/block/delete','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:16:\"block_box_delete\";}',15,4,'','admin/build/block/delete','Delete block','t','',4,'','','',0,'modules/block/block.admin.inc'),('admin/settings/filters/delete','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:19:\"filter_admin_delete\";}',15,4,'','admin/settings/filters/delete','Delete input format','t','',4,'','','',0,'modules/filter/filter.admin.inc'),('admin/user/rules/delete','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:32:\"user_admin_access_delete_confirm\";}',15,4,'','admin/user/rules/delete','Delete rule','t','',4,'','','',0,'modules/user/user.admin.inc'),('admin/reports/event/%','a:1:{i:3;N;}','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_event','a:1:{i:0;i:3;}',14,4,'','admin/reports/event/%','Details','t','',4,'','','',0,'modules/dblog/dblog.admin.inc'),('admin/settings/date-time/formats','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:26:\"date_api_date_formats_form\";}',15,4,'admin/settings/date-time','admin/settings/date-time','Formats','t','',128,'','Allow users to configure date formats','',1,'sites/all/modules/date/date_api.admin.inc'),('admin/content/taxonomy/%','a:1:{i:3;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:23:\"taxonomy_overview_terms\";i:1;i:3;}',14,4,'','admin/content/taxonomy/%','List terms','t','',4,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/content/node-type/page','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"page\";s:4:\"name\";s:4:\"Page\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:4:\"page\";}}',15,4,'','admin/content/node-type/page','Page','t','',4,'','','',0,'modules/node/content_types.inc'),('admin/settings/oauth/settings','','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','drupal_get_form','a:1:{i:0;s:19:\"_oauth_common_admin\";}',15,4,'admin/settings/oauth','admin/settings/oauth','Settings','t','',136,'','Settings for OAuth','',0,'sites/all/modules/oauth/oauth_common.admin.inc'),('admin/content/node-type/story','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:5:\"story\";s:4:\"name\";s:5:\"Story\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:392:\"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:5:\"story\";}}',15,4,'','admin/content/node-type/story','Story','t','',4,'','','',0,'modules/node/content_types.inc'),('admin/settings/logging/dblog','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:20:\"dblog_admin_settings\";}',15,4,'','admin/settings/logging/dblog','Database logging','t','',6,'','Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.','',0,'modules/dblog/dblog.admin.inc'),('admin/settings/admin/settings','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:19:\"admin_settings_form\";}',15,4,'admin/settings/admin','admin/settings/admin','Settings','t','',136,'','Settings for site administration tools.','',0,'sites/all/modules/admin/admin.admin.inc'),('admin/settings/filters/%','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:1:{i:0;i:3;}',14,4,'','admin/settings/filters/%','','filter_admin_format_title','a:1:{i:0;i:3;}',4,'','','',0,'modules/filter/filter.admin.inc'),('admin/settings/admin/theme','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_admin_theme_settings\";}',15,4,'admin/settings/admin','admin/settings/admin','Administration theme','t','',128,'system_admin_theme_settings','Settings for how your administrative pages should look.','left',10,'modules/system/system.admin.inc'),('admin/build/menu-customize/%','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:18:\"menu_overview_form\";i:1;i:3;}',14,4,'','admin/build/menu-customize/%','Customize menu','menu_overview_title','a:1:{i:0;i:3;}',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/content/node-type/page/edit','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"page\";s:4:\"name\";s:4:\"Page\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:4:\"page\";}}',31,5,'admin/content/node-type/page','admin/content/node-type/page','Edit','t','',136,'','','',0,'modules/node/content_types.inc'),('admin/content/node-type/story/edit','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:5:\"story\";s:4:\"name\";s:5:\"Story\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:392:\"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:5:\"story\";}}',31,5,'admin/content/node-type/story','admin/content/node-type/story','Edit','t','',136,'','','',0,'modules/node/content_types.inc'),('admin/build/themes/settings/global','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:21:\"system_theme_settings\";}',31,5,'admin/build/themes/settings','admin/build/themes','Global settings','t','',136,'','','',-1,'modules/system/system.admin.inc'),('admin/content/taxonomy/%/list','a:1:{i:3;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:23:\"taxonomy_overview_terms\";i:1;i:3;}',29,5,'admin/content/taxonomy/%','admin/content/taxonomy/%','List','t','',136,'','','',-10,'modules/taxonomy/taxonomy.admin.inc'),('admin/settings/filters/%/edit','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:1:{i:0;i:3;}',29,5,'admin/settings/filters/%','admin/settings/filters/%','Edit','t','',136,'','','',0,'modules/filter/filter.admin.inc'),('admin/build/menu-customize/%/list','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:18:\"menu_overview_form\";i:1;i:3;}',29,5,'admin/build/menu-customize/%','admin/build/menu-customize/%','List items','t','',136,'','','',-10,'modules/menu/menu.admin.inc'),('admin/build/modules/list/confirm','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}',31,5,'','admin/build/modules/list/confirm','List','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/build/modules/uninstall/confirm','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:24:\"system_modules_uninstall\";}',31,5,'','admin/build/modules/uninstall/confirm','Uninstall','t','',4,'','','',0,'modules/system/system.admin.inc'),('ctools/context/ajax/access/delete','','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_access_ajax_delete','a:0:{}',31,5,'','ctools/context/ajax/access/delete','','t','',4,'','','',0,'sites/all/modules/ctools/includes/context-access-admin.inc'),('ctools/context/ajax/access/configure','','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_access_ajax_edit','a:0:{}',31,5,'','ctools/context/ajax/access/configure','','t','',4,'','','',0,'sites/all/modules/ctools/includes/context-access-admin.inc'),('admin/build/themes/settings/acquia_marina','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:49:\"sites/all/themes/acquia_marina/acquia_marina.info\";s:4:\"name\";s:13:\"acquia_marina\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:13:\"Acquia Marina\";s:11:\"description\";s:250:\"<a href=\"http://www.acquia.com\">Acquia\'s</a> Marina theme is ideal for blogs and community sites. Includes advanced theme settings and 15 flexible content regions for a variety of layouts. By <a href=\"http://www.topnotchthemes.com\">TopNotchThemes</a>\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:3:{s:9:\"style.css\";s:40:\"sites/all/themes/acquia_marina/style.css\";s:9:\"icons.css\";s:40:\"sites/all/themes/acquia_marina/icons.css\";s:9:\"local.css\";s:40:\"sites/all/themes/acquia_marina/local.css\";}}s:7:\"regions\";a:15:{s:13:\"sidebar_first\";s:13:\"sidebar first\";s:12:\"sidebar_last\";s:12:\"sidebar last\";s:13:\"header_middle\";s:13:\"header middle\";s:11:\"header_last\";s:11:\"header last\";s:13:\"preface_first\";s:13:\"preface first\";s:14:\"preface_middle\";s:14:\"preface middle\";s:12:\"preface_last\";s:12:\"preface last\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:16:\"postscript_first\";s:16:\"postscript first\";s:17:\"postscript_middle\";s:17:\"postscript middle\";s:15:\"postscript_last\";s:15:\"postscript last\";s:10:\"footer_top\";s:10:\"footer top\";s:6:\"footer\";s:6:\"footer\";s:11:\"node_bottom\";s:11:\"node bottom\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";}s:7:\"version\";s:7:\"6.x-1.9\";s:7:\"project\";s:13:\"acquia_marina\";s:9:\"datestamp\";s:10:\"1242217832\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:40:\"sites/all/themes/acquia_marina/script.js\";}s:10:\"screenshot\";s:45:\"sites/all/themes/acquia_marina/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:3:{s:9:\"style.css\";s:40:\"sites/all/themes/acquia_marina/style.css\";s:9:\"icons.css\";s:40:\"sites/all/themes/acquia_marina/icons.css\";s:9:\"local.css\";s:40:\"sites/all/themes/acquia_marina/local.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:40:\"sites/all/themes/acquia_marina/script.js\";}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:13:\"acquia_marina\";}',31,5,'admin/build/themes/settings','admin/build/themes','Acquia Marina','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes/settings/acquia_slate','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:47:\"sites/all/themes/acquia_slate/acquia_slate.info\";s:4:\"name\";s:12:\"acquia_slate\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:12:\"Acquia Slate\";s:11:\"description\";s:252:\"<a href=\"http://www.acquia.com\">Acquia\'s</a> Slate theme is ideal for corporate and business sites. Includes advanced theme settings and 12 flexible content regions for a variety of layouts. By <a href=\"http://www.topnotchthemes.com\">TopNotchThemes</a>\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:39:\"sites/all/themes/acquia_slate/style.css\";s:9:\"dblog.css\";s:39:\"sites/all/themes/acquia_slate/dblog.css\";}}s:7:\"scripts\";a:2:{s:9:\"script.js\";s:39:\"sites/all/themes/acquia_slate/script.js\";s:19:\"jquery.overlabel.js\";s:49:\"sites/all/themes/acquia_slate/jquery.overlabel.js\";}s:7:\"regions\";a:14:{s:13:\"sidebar_first\";s:13:\"sidebar first\";s:12:\"sidebar_last\";s:12:\"sidebar last\";s:6:\"banner\";s:6:\"banner\";s:10:\"header_top\";s:10:\"header top\";s:12:\"header_first\";s:12:\"header first\";s:13:\"header_middle\";s:13:\"header middle\";s:15:\"preface_sidebar\";s:21:\"front preface sidebar\";s:11:\"content_top\";s:17:\"inner content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:16:\"postscript_first\";s:16:\"postscript first\";s:17:\"postscript_middle\";s:17:\"postscript middle\";s:15:\"postscript_last\";s:15:\"postscript last\";s:6:\"footer\";s:6:\"footer\";s:11:\"node_bottom\";s:11:\"node bottom\";}s:8:\"features\";a:8:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:6:\"search\";i:5;s:7:\"favicon\";i:6;s:13:\"primary_links\";i:7;s:15:\"secondary_links\";}s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:12:\"acquia_slate\";s:9:\"datestamp\";s:10:\"1242218140\";s:10:\"screenshot\";s:44:\"sites/all/themes/acquia_slate/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:39:\"sites/all/themes/acquia_slate/style.css\";s:9:\"dblog.css\";s:39:\"sites/all/themes/acquia_slate/dblog.css\";}}s:7:\"scripts\";a:2:{s:9:\"script.js\";s:39:\"sites/all/themes/acquia_slate/script.js\";s:19:\"jquery.overlabel.js\";s:49:\"sites/all/themes/acquia_slate/jquery.overlabel.js\";}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:12:\"acquia_slate\";}',31,5,'admin/build/themes/settings','admin/build/themes','Acquia Slate','t','',128,'','','',0,'modules/system/system.admin.inc'),('ctools/context/ajax/access/add','','','user_access','a:1:{i:0;s:14:\"access content\";}','ctools_access_ajax_add','a:0:{}',31,5,'','ctools/context/ajax/access/add','','t','',4,'','','',0,'sites/all/modules/ctools/includes/context-access-admin.inc'),('admin/build/themes/settings/cube','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:37:\"sites/all/themes/rubik/cube/cube.info\";s:4:\"name\";s:4:\"cube\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:17:{s:4:\"name\";s:4:\"Cube\";s:11:\"description\";s:44:\"Spaces-aware front-end theme based on Rubik.\";s:10:\"base theme\";s:5:\"rubik\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:1:{s:9:\"style.css\";s:37:\"sites/all/themes/rubik/cube/style.css\";}}s:7:\"regions\";a:4:{s:6:\"header\";s:6:\"Header\";s:7:\"content\";s:7:\"Content\";s:4:\"left\";s:4:\"Left\";s:5:\"right\";s:5:\"Right\";}s:9:\"designkit\";a:2:{s:5:\"color\";a:1:{s:10:\"background\";s:7:\"#0088cc\";}s:4:\"logo\";a:2:{s:4:\"logo\";s:23:\"imagecache_scale:200x50\";s:5:\"print\";s:24:\"imagecache_scale:600x150\";}}s:7:\"layouts\";a:5:{s:7:\"default\";a:3:{s:4:\"name\";s:7:\"Default\";s:11:\"description\";s:23:\"Simple one column page.\";s:8:\"template\";s:4:\"page\";}s:7:\"sidebar\";a:5:{s:4:\"name\";s:7:\"Sidebar\";s:11:\"description\";s:26:\"Main content with sidebar.\";s:10:\"stylesheet\";s:18:\"layout-sidebar.css\";s:8:\"template\";s:14:\"layout-sidebar\";s:7:\"regions\";a:2:{i:0;s:7:\"content\";i:1;s:5:\"right\";}}s:5:\"split\";a:5:{s:4:\"name\";s:5:\"Split\";s:11:\"description\";s:12:\"50/50 split.\";s:10:\"stylesheet\";s:16:\"layout-split.css\";s:8:\"template\";s:14:\"layout-sidebar\";s:7:\"regions\";a:2:{i:0;s:7:\"content\";i:1;s:5:\"right\";}}s:7:\"columns\";a:5:{s:4:\"name\";s:7:\"Columns\";s:11:\"description\";s:20:\"Three column layout.\";s:10:\"stylesheet\";s:18:\"layout-columns.css\";s:8:\"template\";s:14:\"layout-columns\";s:7:\"regions\";a:4:{i:0;s:6:\"header\";i:1;s:7:\"content\";i:2;s:4:\"left\";i:3;s:5:\"right\";}}s:6:\"offset\";a:5:{s:4:\"name\";s:15:\"Offset sidebars\";s:11:\"description\";s:38:\"Main content with two offset sidebars.\";s:10:\"stylesheet\";s:17:\"layout-offset.css\";s:8:\"template\";s:13:\"layout-offset\";s:7:\"regions\";a:4:{i:0;s:6:\"header\";i:1;s:7:\"content\";i:2;s:4:\"left\";i:3;s:5:\"right\";}}}s:9:\"datestamp\";s:10:\"1267655587\";s:7:\"project\";s:5:\"rubik\";s:18:\"project status url\";s:39:\"http://code.developmentseed.org/fserver\";s:7:\"version\";s:13:\"6.x-1.0-beta8\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:37:\"sites/all/themes/rubik/cube/script.js\";}s:10:\"screenshot\";s:42:\"sites/all/themes/rubik/cube/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:1:{s:9:\"style.css\";s:37:\"sites/all/themes/rubik/cube/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:5:\"rubik\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:4:\"cube\";}',31,5,'admin/build/themes/settings','admin/build/themes','Cube','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/settings/date-time/formats/lookup','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','date_api_date_time_lookup','a:0:{}',31,5,'','admin/settings/date-time/formats/lookup','Date and time lookup','t','',4,'','','',0,''),('admin/build/themes/settings/garland','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:27:\"themes/garland/garland.info\";s:4:\"name\";s:7:\"garland\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:66:\"Tableless, recolorable, multi-column, fluid width theme (default).\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:24:\"themes/garland/script.js\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:7:\"garland\";}',31,5,'admin/build/themes/settings','admin/build/themes','Garland','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes/settings/minnelli','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:37:\"themes/garland/minnelli/minnelli.info\";s:4:\"name\";s:8:\"minnelli\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:14:{s:4:\"name\";s:8:\"Minnelli\";s:11:\"description\";s:56:\"Tableless, recolorable, multi-column, fixed width theme.\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:7:\"garland\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/garland/minnelli/script.js\";}s:10:\"screenshot\";s:38:\"themes/garland/minnelli/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:7:\"garland\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:8:\"minnelli\";}',31,5,'admin/build/themes/settings','admin/build/themes','Minnelli','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes/settings/rubik','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":14:{s:8:\"filename\";s:33:\"sites/all/themes/rubik/rubik.info\";s:4:\"name\";s:5:\"rubik\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:15:{s:4:\"name\";s:5:\"Rubik\";s:11:\"description\";s:18:\"Clean admin theme.\";s:10:\"base theme\";s:3:\"tao\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"scripts\";a:1:{s:11:\"js/rubik.js\";s:34:\"sites/all/themes/rubik/js/rubik.js\";}s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:3:{s:8:\"core.css\";s:31:\"sites/all/themes/rubik/core.css\";s:9:\"icons.css\";s:32:\"sites/all/themes/rubik/icons.css\";s:9:\"style.css\";s:32:\"sites/all/themes/rubik/style.css\";}}s:7:\"regions\";a:1:{s:7:\"content\";s:7:\"Content\";}s:9:\"datestamp\";s:10:\"1267655587\";s:7:\"project\";s:5:\"rubik\";s:18:\"project status url\";s:39:\"http://code.developmentseed.org/fserver\";s:7:\"version\";s:13:\"6.x-1.0-beta8\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:10:\"screenshot\";s:37:\"sites/all/themes/rubik/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:3:{s:8:\"core.css\";s:31:\"sites/all/themes/rubik/core.css\";s:9:\"icons.css\";s:32:\"sites/all/themes/rubik/icons.css\";s:9:\"style.css\";s:32:\"sites/all/themes/rubik/style.css\";}}s:7:\"scripts\";a:1:{s:11:\"js/rubik.js\";s:34:\"sites/all/themes/rubik/js/rubik.js\";}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:3:\"tao\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:5:\"rubik\";}',31,5,'admin/build/themes/settings','admin/build/themes','Rubik','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes/settings/tao','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:29:\"sites/all/themes/tao/tao.info\";s:4:\"name\";s:3:\"tao\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:14:{s:4:\"core\";s:3:\"6.x\";s:11:\"description\";s:149:\"Tao is a base theme that is all about going with the flow. It takes care of key reset and utility tasks so that sub-themes can get on with their job.\";s:6:\"engine\";s:11:\"phptemplate\";s:4:\"name\";s:3:\"Tao\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:7:\"scripts\";a:1:{s:9:\"js/tao.js\";s:30:\"sites/all/themes/tao/js/tao.js\";}s:11:\"stylesheets\";a:2:{s:6:\"screen\";a:2:{s:9:\"reset.css\";s:30:\"sites/all/themes/tao/reset.css\";s:8:\"base.css\";s:29:\"sites/all/themes/tao/base.css\";}s:5:\"print\";a:3:{s:9:\"reset.css\";s:30:\"sites/all/themes/tao/reset.css\";s:8:\"base.css\";s:29:\"sites/all/themes/tao/base.css\";s:9:\"print.css\";s:30:\"sites/all/themes/tao/print.css\";}}s:9:\"datestamp\";s:10:\"1267655521\";s:7:\"project\";s:3:\"tao\";s:18:\"project status url\";s:39:\"http://code.developmentseed.org/fserver\";s:7:\"version\";s:8:\"6.x-1.10\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:10:\"screenshot\";s:35:\"sites/all/themes/tao/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:2:{s:6:\"screen\";a:2:{s:9:\"reset.css\";s:30:\"sites/all/themes/tao/reset.css\";s:8:\"base.css\";s:29:\"sites/all/themes/tao/base.css\";}s:5:\"print\";a:3:{s:9:\"reset.css\";s:30:\"sites/all/themes/tao/reset.css\";s:8:\"base.css\";s:29:\"sites/all/themes/tao/base.css\";s:9:\"print.css\";s:30:\"sites/all/themes/tao/print.css\";}}s:7:\"scripts\";a:1:{s:9:\"js/tao.js\";s:30:\"sites/all/themes/tao/js/tao.js\";}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:3:\"tao\";}',31,5,'admin/build/themes/settings','admin/build/themes','Tao','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/block/list/acquia_marina','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:49:\"sites/all/themes/acquia_marina/acquia_marina.info\";s:4:\"name\";s:13:\"acquia_marina\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:13:\"Acquia Marina\";s:11:\"description\";s:250:\"<a href=\"http://www.acquia.com\">Acquia\'s</a> Marina theme is ideal for blogs and community sites. Includes advanced theme settings and 15 flexible content regions for a variety of layouts. By <a href=\"http://www.topnotchthemes.com\">TopNotchThemes</a>\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:3:{s:9:\"style.css\";s:40:\"sites/all/themes/acquia_marina/style.css\";s:9:\"icons.css\";s:40:\"sites/all/themes/acquia_marina/icons.css\";s:9:\"local.css\";s:40:\"sites/all/themes/acquia_marina/local.css\";}}s:7:\"regions\";a:15:{s:13:\"sidebar_first\";s:13:\"sidebar first\";s:12:\"sidebar_last\";s:12:\"sidebar last\";s:13:\"header_middle\";s:13:\"header middle\";s:11:\"header_last\";s:11:\"header last\";s:13:\"preface_first\";s:13:\"preface first\";s:14:\"preface_middle\";s:14:\"preface middle\";s:12:\"preface_last\";s:12:\"preface last\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:16:\"postscript_first\";s:16:\"postscript first\";s:17:\"postscript_middle\";s:17:\"postscript middle\";s:15:\"postscript_last\";s:15:\"postscript last\";s:10:\"footer_top\";s:10:\"footer top\";s:6:\"footer\";s:6:\"footer\";s:11:\"node_bottom\";s:11:\"node bottom\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";}s:7:\"version\";s:7:\"6.x-1.9\";s:7:\"project\";s:13:\"acquia_marina\";s:9:\"datestamp\";s:10:\"1242217832\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:40:\"sites/all/themes/acquia_marina/script.js\";}s:10:\"screenshot\";s:45:\"sites/all/themes/acquia_marina/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:3:{s:9:\"style.css\";s:40:\"sites/all/themes/acquia_marina/style.css\";s:9:\"icons.css\";s:40:\"sites/all/themes/acquia_marina/icons.css\";s:9:\"local.css\";s:40:\"sites/all/themes/acquia_marina/local.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:40:\"sites/all/themes/acquia_marina/script.js\";}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:13:\"acquia_marina\";}',31,5,'admin/build/block/list','admin/build/block','Acquia Marina','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/build/block/list/acquia_slate','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:47:\"sites/all/themes/acquia_slate/acquia_slate.info\";s:4:\"name\";s:12:\"acquia_slate\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:12:\"Acquia Slate\";s:11:\"description\";s:252:\"<a href=\"http://www.acquia.com\">Acquia\'s</a> Slate theme is ideal for corporate and business sites. Includes advanced theme settings and 12 flexible content regions for a variety of layouts. By <a href=\"http://www.topnotchthemes.com\">TopNotchThemes</a>\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:39:\"sites/all/themes/acquia_slate/style.css\";s:9:\"dblog.css\";s:39:\"sites/all/themes/acquia_slate/dblog.css\";}}s:7:\"scripts\";a:2:{s:9:\"script.js\";s:39:\"sites/all/themes/acquia_slate/script.js\";s:19:\"jquery.overlabel.js\";s:49:\"sites/all/themes/acquia_slate/jquery.overlabel.js\";}s:7:\"regions\";a:14:{s:13:\"sidebar_first\";s:13:\"sidebar first\";s:12:\"sidebar_last\";s:12:\"sidebar last\";s:6:\"banner\";s:6:\"banner\";s:10:\"header_top\";s:10:\"header top\";s:12:\"header_first\";s:12:\"header first\";s:13:\"header_middle\";s:13:\"header middle\";s:15:\"preface_sidebar\";s:21:\"front preface sidebar\";s:11:\"content_top\";s:17:\"inner content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:16:\"postscript_first\";s:16:\"postscript first\";s:17:\"postscript_middle\";s:17:\"postscript middle\";s:15:\"postscript_last\";s:15:\"postscript last\";s:6:\"footer\";s:6:\"footer\";s:11:\"node_bottom\";s:11:\"node bottom\";}s:8:\"features\";a:8:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:6:\"search\";i:5;s:7:\"favicon\";i:6;s:13:\"primary_links\";i:7;s:15:\"secondary_links\";}s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:12:\"acquia_slate\";s:9:\"datestamp\";s:10:\"1242218140\";s:10:\"screenshot\";s:44:\"sites/all/themes/acquia_slate/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:39:\"sites/all/themes/acquia_slate/style.css\";s:9:\"dblog.css\";s:39:\"sites/all/themes/acquia_slate/dblog.css\";}}s:7:\"scripts\";a:2:{s:9:\"script.js\";s:39:\"sites/all/themes/acquia_slate/script.js\";s:19:\"jquery.overlabel.js\";s:49:\"sites/all/themes/acquia_slate/jquery.overlabel.js\";}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:12:\"acquia_slate\";}',31,5,'admin/build/block/list','admin/build/block','Acquia Slate','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/build/services/ahah/security-options','','','user_access','a:1:{i:0;s:19:\"administer services\";}','_services_ahah_security_options','a:0:{}',31,5,'','admin/build/services/ahah/security-options','','t','',4,'','','',0,'sites/all/modules/services/services.admin.inc'),('user/%/oauth/consumer/add','a:1:{i:1;s:9:\"user_load\";}','','oauth_common_can_create_consumers','a:0:{}','oauth_common_add_consumer','a:1:{i:0;i:1;}',23,5,'user/%/oauth','user/%','Add consumer','t','',128,'','','',10,'sites/all/modules/oauth/oauth_common.consumers.inc'),('admin/build/menu-customize/%/add','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:4:{i:0;s:14:\"menu_edit_item\";i:1;s:3:\"add\";i:2;N;i:3;i:3;}',29,5,'admin/build/menu-customize/%','admin/build/menu-customize/%','Add item','t','',128,'','','',0,'modules/menu/menu.admin.inc'),('admin/settings/oauth/ahah/add-auth-level','','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','oauth_common_ahah_add_auth_level','a:0:{}',31,5,'','admin/settings/oauth/ahah/add-auth-level','','t','',4,'','','',0,'sites/all/modules/oauth/oauth_common.admin.inc'),('admin/build/services/%/authentication','a:1:{i:3;s:22:\"services_endpoint_load\";}','','user_access','a:1:{i:0;s:19:\"administer services\";}','services_edit_endpoint_authentication','a:1:{i:0;i:3;}',29,5,'admin/build/services','admin/build/services','Authentication','t','',128,'','','',5,'sites/all/modules/services/services.admin.inc'),('admin/settings/filters/%/configure','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_configure_page','a:1:{i:0;i:3;}',29,5,'admin/settings/filters/%','admin/settings/filters/%','Configure','t','',128,'','','',1,'modules/filter/filter.admin.inc'),('admin/build/block/list/cube','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:37:\"sites/all/themes/rubik/cube/cube.info\";s:4:\"name\";s:4:\"cube\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:17:{s:4:\"name\";s:4:\"Cube\";s:11:\"description\";s:44:\"Spaces-aware front-end theme based on Rubik.\";s:10:\"base theme\";s:5:\"rubik\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:1:{s:9:\"style.css\";s:37:\"sites/all/themes/rubik/cube/style.css\";}}s:7:\"regions\";a:4:{s:6:\"header\";s:6:\"Header\";s:7:\"content\";s:7:\"Content\";s:4:\"left\";s:4:\"Left\";s:5:\"right\";s:5:\"Right\";}s:9:\"designkit\";a:2:{s:5:\"color\";a:1:{s:10:\"background\";s:7:\"#0088cc\";}s:4:\"logo\";a:2:{s:4:\"logo\";s:23:\"imagecache_scale:200x50\";s:5:\"print\";s:24:\"imagecache_scale:600x150\";}}s:7:\"layouts\";a:5:{s:7:\"default\";a:3:{s:4:\"name\";s:7:\"Default\";s:11:\"description\";s:23:\"Simple one column page.\";s:8:\"template\";s:4:\"page\";}s:7:\"sidebar\";a:5:{s:4:\"name\";s:7:\"Sidebar\";s:11:\"description\";s:26:\"Main content with sidebar.\";s:10:\"stylesheet\";s:18:\"layout-sidebar.css\";s:8:\"template\";s:14:\"layout-sidebar\";s:7:\"regions\";a:2:{i:0;s:7:\"content\";i:1;s:5:\"right\";}}s:5:\"split\";a:5:{s:4:\"name\";s:5:\"Split\";s:11:\"description\";s:12:\"50/50 split.\";s:10:\"stylesheet\";s:16:\"layout-split.css\";s:8:\"template\";s:14:\"layout-sidebar\";s:7:\"regions\";a:2:{i:0;s:7:\"content\";i:1;s:5:\"right\";}}s:7:\"columns\";a:5:{s:4:\"name\";s:7:\"Columns\";s:11:\"description\";s:20:\"Three column layout.\";s:10:\"stylesheet\";s:18:\"layout-columns.css\";s:8:\"template\";s:14:\"layout-columns\";s:7:\"regions\";a:4:{i:0;s:6:\"header\";i:1;s:7:\"content\";i:2;s:4:\"left\";i:3;s:5:\"right\";}}s:6:\"offset\";a:5:{s:4:\"name\";s:15:\"Offset sidebars\";s:11:\"description\";s:38:\"Main content with two offset sidebars.\";s:10:\"stylesheet\";s:17:\"layout-offset.css\";s:8:\"template\";s:13:\"layout-offset\";s:7:\"regions\";a:4:{i:0;s:6:\"header\";i:1;s:7:\"content\";i:2;s:4:\"left\";i:3;s:5:\"right\";}}}s:9:\"datestamp\";s:10:\"1267655587\";s:7:\"project\";s:5:\"rubik\";s:18:\"project status url\";s:39:\"http://code.developmentseed.org/fserver\";s:7:\"version\";s:13:\"6.x-1.0-beta8\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:37:\"sites/all/themes/rubik/cube/script.js\";}s:10:\"screenshot\";s:42:\"sites/all/themes/rubik/cube/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:1:{s:9:\"style.css\";s:37:\"sites/all/themes/rubik/cube/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:5:\"rubik\";}}','block_admin_display','a:1:{i:0;s:4:\"cube\";}',31,5,'admin/build/block/list','admin/build/block','Cube','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/settings/date-time/formats/custom','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','date_api_configure_custom_date_formats','a:0:{}',31,5,'admin/settings/date-time/formats','admin/settings/date-time','Custom formats','t','',128,'','Allow users to configure custom date formats.','',2,'sites/all/modules/date/date_api.admin.inc'),('admin/content/node-type/page/delete','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"node_type_delete_confirm\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"page\";s:4:\"name\";s:4:\"Page\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:4:\"page\";}}',31,5,'','admin/content/node-type/page/delete','Delete','t','',4,'','','',0,'modules/node/content_types.inc'),('admin/content/node-type/story/delete','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"node_type_delete_confirm\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:5:\"story\";s:4:\"name\";s:5:\"Story\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:392:\"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:5:\"story\";}}',31,5,'','admin/content/node-type/story/delete','Delete','t','',4,'','','',0,'modules/node/content_types.inc'),('admin/content/node-type/page/display','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:29:\"content_display_overview_form\";i:1;s:4:\"page\";}',31,5,'admin/content/node-type/page','admin/content/node-type/page','Display fields','t','',128,'','','',2,'sites/all/modules/cck/includes/content.admin.inc'),('admin/content/node-type/story/display','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:29:\"content_display_overview_form\";i:1;s:5:\"story\";}',31,5,'admin/content/node-type/story','admin/content/node-type/story','Display fields','t','',128,'','','',2,'sites/all/modules/cck/includes/content.admin.inc'),('admin/settings/oauth/%/edit','a:1:{i:3;s:25:\"oauth_common_context_load\";}','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','oauth_common_edit_context','a:1:{i:0;i:3;}',29,5,'admin/settings/oauth','admin/settings/oauth','Edit context','t','',128,'','','',10,'sites/all/modules/oauth/oauth_common.admin.inc'),('admin/build/services/%/edit','a:1:{i:3;s:22:\"services_endpoint_load\";}','','user_access','a:1:{i:0;s:19:\"administer services\";}','services_edit_endpoint','a:1:{i:0;i:3;}',29,5,'admin/build/services','admin/build/services','Edit endpoint','t','',128,'','','',0,'sites/all/modules/services/services.admin.inc'),('admin/build/menu-customize/%/edit','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:3:{i:0;s:14:\"menu_edit_menu\";i:1;s:4:\"edit\";i:2;i:3;}',29,5,'admin/build/menu-customize/%','admin/build/menu-customize/%','Edit menu','t','',128,'','','',0,'modules/menu/menu.admin.inc'),('admin/content/taxonomy/edit/term','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','taxonomy_admin_term_edit','a:0:{}',31,5,'','admin/content/taxonomy/edit/term','Edit term','t','',4,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/settings/oauth/%/export','a:1:{i:3;s:25:\"oauth_common_context_load\";}','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','drupal_get_form','a:2:{i:0;s:27:\"oauth_common_export_context\";i:1;i:3;}',29,5,'admin/settings/oauth','admin/settings/oauth','Export context','t','',128,'','','',20,'sites/all/modules/oauth/oauth_common.admin.inc'),('admin/build/services/%/export','a:1:{i:3;s:22:\"services_endpoint_load\";}','','user_access','a:1:{i:0;s:19:\"administer services\";}','drupal_get_form','a:2:{i:0;s:24:\"services_export_endpoint\";i:1;i:3;}',29,5,'admin/build/services','admin/build/services','Export endpoint','t','',128,'','','',20,'sites/all/modules/services/services.admin.inc'),('admin/build/block/list/garland','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:27:\"themes/garland/garland.info\";s:4:\"name\";s:7:\"garland\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:66:\"Tableless, recolorable, multi-column, fluid width theme (default).\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:24:\"themes/garland/script.js\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:7:\"garland\";}',31,5,'admin/build/block/list','admin/build/block','Garland','t','',136,'','','',-10,'modules/block/block.admin.inc'),('admin/build/block/list/js','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','block_admin_display_js','a:0:{}',31,5,'','admin/build/block/list/js','JavaScript List Form','t','',4,'','','',0,'modules/block/block.admin.inc'),('admin/content/node-type/page/fields','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:27:\"content_field_overview_form\";i:1;s:4:\"page\";}',31,5,'admin/content/node-type/page','admin/content/node-type/page','Manage fields','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),('admin/content/node-type/story/fields','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:27:\"content_field_overview_form\";i:1;s:5:\"story\";}',31,5,'admin/content/node-type/story','admin/content/node-type/story','Manage fields','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),('admin/build/block/list/minnelli','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:37:\"themes/garland/minnelli/minnelli.info\";s:4:\"name\";s:8:\"minnelli\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:14:{s:4:\"name\";s:8:\"Minnelli\";s:11:\"description\";s:56:\"Tableless, recolorable, multi-column, fixed width theme.\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:7:\"garland\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/garland/minnelli/script.js\";}s:10:\"screenshot\";s:38:\"themes/garland/minnelli/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:7:\"garland\";}}','block_admin_display','a:1:{i:0;s:8:\"minnelli\";}',31,5,'admin/build/block/list','admin/build/block','Minnelli','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/settings/filters/%/order','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_order_page','a:1:{i:0;i:3;}',29,5,'admin/settings/filters/%','admin/settings/filters/%','Rearrange','t','',128,'','','',2,'modules/filter/filter.admin.inc'),('user/reset/%/%/%','a:3:{i:2;N;i:3;N;i:4;N;}','','1','a:0:{}','drupal_get_form','a:4:{i:0;s:15:\"user_pass_reset\";i:1;i:2;i:2;i:3;i:3;i:4;}',24,5,'','user/reset/%/%/%','Reset password','t','',4,'','','',0,'modules/user/user.pages.inc'),('admin/build/services/%/resources','a:1:{i:3;s:22:\"services_endpoint_load\";}','','user_access','a:1:{i:0;s:19:\"administer services\";}','services_edit_endpoint_resources','a:1:{i:0;i:3;}',29,5,'admin/build/services','admin/build/services','Resources','t','',128,'','','',10,'sites/all/modules/services/services.admin.inc'),('admin/build/block/list/rubik','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":14:{s:8:\"filename\";s:33:\"sites/all/themes/rubik/rubik.info\";s:4:\"name\";s:5:\"rubik\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:15:{s:4:\"name\";s:5:\"Rubik\";s:11:\"description\";s:18:\"Clean admin theme.\";s:10:\"base theme\";s:3:\"tao\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"scripts\";a:1:{s:11:\"js/rubik.js\";s:34:\"sites/all/themes/rubik/js/rubik.js\";}s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:3:{s:8:\"core.css\";s:31:\"sites/all/themes/rubik/core.css\";s:9:\"icons.css\";s:32:\"sites/all/themes/rubik/icons.css\";s:9:\"style.css\";s:32:\"sites/all/themes/rubik/style.css\";}}s:7:\"regions\";a:1:{s:7:\"content\";s:7:\"Content\";}s:9:\"datestamp\";s:10:\"1267655587\";s:7:\"project\";s:5:\"rubik\";s:18:\"project status url\";s:39:\"http://code.developmentseed.org/fserver\";s:7:\"version\";s:13:\"6.x-1.0-beta8\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:10:\"screenshot\";s:37:\"sites/all/themes/rubik/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:3:{s:8:\"core.css\";s:31:\"sites/all/themes/rubik/core.css\";s:9:\"icons.css\";s:32:\"sites/all/themes/rubik/icons.css\";s:9:\"style.css\";s:32:\"sites/all/themes/rubik/style.css\";}}s:7:\"scripts\";a:1:{s:11:\"js/rubik.js\";s:34:\"sites/all/themes/rubik/js/rubik.js\";}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:3:\"tao\";}}','block_admin_display','a:1:{i:0;s:5:\"rubik\";}',31,5,'admin/build/block/list','admin/build/block','Rubik','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/build/block/list/tao','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:29:\"sites/all/themes/tao/tao.info\";s:4:\"name\";s:3:\"tao\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:14:{s:4:\"core\";s:3:\"6.x\";s:11:\"description\";s:149:\"Tao is a base theme that is all about going with the flow. It takes care of key reset and utility tasks so that sub-themes can get on with their job.\";s:6:\"engine\";s:11:\"phptemplate\";s:4:\"name\";s:3:\"Tao\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:7:\"scripts\";a:1:{s:9:\"js/tao.js\";s:30:\"sites/all/themes/tao/js/tao.js\";}s:11:\"stylesheets\";a:2:{s:6:\"screen\";a:2:{s:9:\"reset.css\";s:30:\"sites/all/themes/tao/reset.css\";s:8:\"base.css\";s:29:\"sites/all/themes/tao/base.css\";}s:5:\"print\";a:3:{s:9:\"reset.css\";s:30:\"sites/all/themes/tao/reset.css\";s:8:\"base.css\";s:29:\"sites/all/themes/tao/base.css\";s:9:\"print.css\";s:30:\"sites/all/themes/tao/print.css\";}}s:9:\"datestamp\";s:10:\"1267655521\";s:7:\"project\";s:3:\"tao\";s:18:\"project status url\";s:39:\"http://code.developmentseed.org/fserver\";s:7:\"version\";s:8:\"6.x-1.10\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:10:\"screenshot\";s:35:\"sites/all/themes/tao/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:2:{s:6:\"screen\";a:2:{s:9:\"reset.css\";s:30:\"sites/all/themes/tao/reset.css\";s:8:\"base.css\";s:29:\"sites/all/themes/tao/base.css\";}s:5:\"print\";a:3:{s:9:\"reset.css\";s:30:\"sites/all/themes/tao/reset.css\";s:8:\"base.css\";s:29:\"sites/all/themes/tao/base.css\";s:9:\"print.css\";s:30:\"sites/all/themes/tao/print.css\";}}s:7:\"scripts\";a:1:{s:9:\"js/tao.js\";s:30:\"sites/all/themes/tao/js/tao.js\";}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:3:\"tao\";}',31,5,'admin/build/block/list','admin/build/block','Tao','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/settings/oauth/%/disable','a:1:{i:3;s:25:\"oauth_common_context_load\";}','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','oauth_common_context','a:1:{i:0;i:3;}',29,5,'','admin/settings/oauth/%/disable','','t','',4,'','','',0,'sites/all/modules/oauth/oauth_common.admin.inc'),('admin/settings/oauth/%/enable','a:1:{i:3;s:25:\"oauth_common_context_load\";}','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','oauth_common_enable_context','a:1:{i:0;i:3;}',29,5,'','admin/settings/oauth/%/enable','','t','',4,'','','',0,'sites/all/modules/oauth/oauth_common.admin.inc'),('admin/build/services/%/disable','a:1:{i:3;s:22:\"services_endpoint_load\";}','','user_access','a:1:{i:0;s:19:\"administer services\";}','services_disable_endpoint','a:1:{i:0;i:3;}',29,5,'','admin/build/services/%/disable','','t','',4,'','','',0,'sites/all/modules/services/services.admin.inc'),('admin/build/services/%/enable','a:1:{i:3;s:22:\"services_endpoint_load\";}','','user_access','a:1:{i:0;s:19:\"administer services\";}','services_enable_endpoint','a:1:{i:0;i:3;}',29,5,'','admin/build/services/%/enable','','t','',4,'','','',0,'sites/all/modules/services/services.admin.inc'),('admin/settings/date-time/formats/add','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:30:\"date_api_add_date_formats_form\";}',31,5,'admin/settings/date-time/formats','admin/settings/date-time','Add format','t','',128,'','Allow users to add additional date formats.','',3,'sites/all/modules/date/date_api.admin.inc'),('admin/content/taxonomy/add/vocabulary','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:24:\"taxonomy_form_vocabulary\";}',31,5,'admin/content/taxonomy','admin/content/taxonomy','Add vocabulary','t','',128,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/settings/date-time/formats/configure','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:26:\"date_api_date_formats_form\";}',31,5,'admin/settings/date-time/formats','admin/settings/date-time','Configure','t','',136,'','Allow users to configure date formats','',1,'sites/all/modules/date/date_api.admin.inc'),('admin/settings/actions/delete/%','a:1:{i:4;s:12:\"actions_load\";}','','user_access','a:1:{i:0;s:18:\"administer actions\";}','drupal_get_form','a:2:{i:0;s:26:\"system_actions_delete_form\";i:1;i:4;}',30,5,'','admin/settings/actions/delete/%','Delete action','t','',4,'','Delete an action.','',0,''),('admin/settings/oauth/%/delete','a:1:{i:3;s:25:\"oauth_common_context_load\";}','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','drupal_get_form','a:2:{i:0;s:35:\"oauth_common_delete_confirm_context\";i:1;i:3;}',29,5,'','admin/settings/oauth/%/delete','Delete context','t','',4,'','','',0,'sites/all/modules/oauth/oauth_common.admin.inc'),('admin/build/services/%/delete','a:1:{i:3;s:22:\"services_endpoint_load\";}','','user_access','a:1:{i:0;s:19:\"administer services\";}','drupal_get_form','a:2:{i:0;s:32:\"services_delete_confirm_endpoint\";i:1;i:3;}',29,5,'','admin/build/services/%/delete','Delete endpoint','t','',4,'','','',0,'sites/all/modules/services/services.admin.inc'),('admin/build/menu-customize/%/delete','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_delete_menu_page','a:1:{i:0;i:3;}',29,5,'','admin/build/menu-customize/%/delete','Delete menu','t','',4,'','','',0,'modules/menu/menu.admin.inc'),('user/%/oauth/authorizations/%','a:2:{i:1;s:9:\"user_load\";i:4;s:32:\"oauth_common_provider_token_load\";}','','_oauth_common_user_access','a:2:{i:0;i:1;i:1;s:25:\"oauth authorize consumers\";}','drupal_get_form','a:2:{i:0;s:31:\"oauth_common_form_authorization\";i:1;i:4;}',22,5,'user/%/oauth/authorizations','user/%','Edit authorization','t','',128,'','','',0,'sites/all/modules/oauth/oauth_common.authorizations.inc'),('user/%/oauth/consumer/%','a:2:{i:1;s:9:\"user_load\";i:4;s:26:\"oauth_common_consumer_load\";}','','oauth_common_can_edit_consumer','a:1:{i:0;i:4;}','oauth_common_edit_consumer','a:1:{i:0;i:4;}',22,5,'user/%/oauth','user/%','Edit consumer','t','',128,'','','',0,'sites/all/modules/oauth/oauth_common.consumers.inc'),('node/%/revisions/%/view','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:1:{i:0;i:1;}','node_show','a:3:{i:0;i:1;i:1;N;i:2;b:1;}',21,5,'','node/%/revisions/%/view','Revisions','t','',4,'','','',0,''),('admin/settings/date-time/delete/%','a:1:{i:4;N;}','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:32:\"date_api_delete_format_type_form\";i:1;i:4;}',30,5,'','admin/settings/date-time/delete/%','Delete date format type','t','',4,'','Allow users to delete a configured date format type.','',0,'sites/all/modules/date/date_api.admin.inc'),('node/%/revisions/%/delete','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:2:{i:0;i:1;i:1;s:6:\"delete\";}','drupal_get_form','a:2:{i:0;s:28:\"node_revision_delete_confirm\";i:1;i:1;}',21,5,'','node/%/revisions/%/delete','Delete earlier revision','t','',4,'','','',0,'modules/node/node.pages.inc'),('node/%/revisions/%/revert','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:2:{i:0;i:1;i:1;s:6:\"update\";}','drupal_get_form','a:2:{i:0;s:28:\"node_revision_revert_confirm\";i:1;i:1;}',21,5,'','node/%/revisions/%/revert','Revert to earlier revision','t','',4,'','','',0,'modules/node/node.pages.inc'),('admin/content/node-type/page/display/basic','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:4:\"page\";i:2;s:5:\"basic\";}',63,6,'admin/content/node-type/page/display','admin/content/node-type/page','Basic','t','',136,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),('admin/content/node-type/story/display/basic','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:5:\"story\";i:2;s:5:\"basic\";}',63,6,'admin/content/node-type/story/display','admin/content/node-type/story','Basic','t','',136,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),('admin/content/node-type/page/display/rss','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:4:\"page\";i:2;s:3:\"rss\";}',63,6,'admin/content/node-type/page/display','admin/content/node-type/page','RSS','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),('admin/content/node-type/story/display/rss','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:5:\"story\";i:2;s:3:\"rss\";}',63,6,'admin/content/node-type/story/display','admin/content/node-type/story','RSS','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),('user/%/oauth/consumer/%/add-authorization','a:2:{i:1;s:9:\"user_load\";i:4;s:26:\"oauth_common_consumer_load\";}','','oauth_common_can_authorize_consumer','a:1:{i:0;i:4;}','oauth_common_authorization_add','a:1:{i:0;i:4;}',45,6,'user/%/oauth/consumer/%','user/%','Add authorization','t','',128,'','','',0,'sites/all/modules/oauth/oauth_common.authorizations.inc'),('admin/content/taxonomy/%/add/term','a:1:{i:3;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','taxonomy_add_term_page','a:1:{i:0;i:3;}',59,6,'admin/content/taxonomy/%','admin/content/taxonomy/%','Add term','t','',128,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('user/%/oauth/authorizations/%/delete','a:2:{i:1;s:9:\"user_load\";i:4;s:32:\"oauth_common_provider_token_load\";}','','user_edit_access','a:1:{i:0;i:1;}','drupal_get_form','a:3:{i:0;s:38:\"oauth_common_form_authorization_delete\";i:1;i:1;i:2;i:4;}',45,6,'user/%/oauth/authorizations/%','user/%','Delete authorization','t','',128,'','','',0,'sites/all/modules/oauth/oauth_common.authorizations.inc'),('user/%/oauth/consumer/%/delete','a:2:{i:1;s:9:\"user_load\";i:4;s:26:\"oauth_common_consumer_load\";}','','oauth_common_can_edit_consumer','a:1:{i:0;i:4;}','drupal_get_form','a:2:{i:0;s:33:\"oauth_common_form_consumer_delete\";i:1;i:4;}',45,6,'user/%/oauth/consumer/%','user/%','Delete consumer','t','',128,'','','',0,'sites/all/modules/oauth/oauth_common.consumers.inc'),('admin/build/menu/item/%/delete','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_item_delete_page','a:1:{i:0;i:4;}',61,6,'','admin/build/menu/item/%/delete','Delete menu item','t','',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/build/menu/item/%/edit','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:4:{i:0;s:14:\"menu_edit_item\";i:1;s:4:\"edit\";i:2;i:4;i:3;N;}',61,6,'','admin/build/menu/item/%/edit','Edit menu item','t','',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/content/taxonomy/edit/vocabulary/%','a:1:{i:5;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','taxonomy_admin_vocabulary_edit','a:1:{i:0;i:5;}',62,6,'','admin/content/taxonomy/edit/vocabulary/%','Edit vocabulary','t','',4,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/build/menu/item/%/reset','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:23:\"menu_reset_item_confirm\";i:1;i:4;}',61,6,'','admin/build/menu/item/%/reset','Reset menu item','t','',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/settings/date-time/formats/delete/%','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:27:\"date_api_delete_format_form\";i:1;i:5;}',62,6,'','admin/settings/date-time/formats/delete/%','Delete date format','t','',4,'','Allow users to delete a configured date format.','',0,'sites/all/modules/date/date_api.admin.inc'),('user/%/oauth/authorizations/%/ahah/secret','a:2:{i:1;s:9:\"user_load\";i:4;s:32:\"oauth_common_provider_token_load\";}','','_oauth_common_user_access','a:2:{i:0;i:1;i:1;s:25:\"oauth authorize consumers\";}','oauth_common_ahah_secret','a:1:{i:0;i:4;}',91,7,'','user/%/oauth/authorizations/%/ahah/secret','','t','',4,'','','',0,'sites/all/modules/oauth/oauth_common.inc'),('user/%/oauth/consumer/%/ahah/secret','a:2:{i:1;s:9:\"user_load\";i:4;s:26:\"oauth_common_consumer_load\";}','','oauth_common_can_edit_consumer','a:1:{i:0;i:4;}','oauth_common_ahah_secret','a:1:{i:0;i:4;}',91,7,'','user/%/oauth/consumer/%/ahah/secret','','t','',4,'','','',0,'sites/all/modules/oauth/oauth_common.inc');
/*!40000 ALTER TABLE `menu_router` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `comment` int(11) NOT NULL DEFAULT '0',
  `promote` int(11) NOT NULL DEFAULT '0',
  `moderate` int(11) NOT NULL DEFAULT '0',
  `sticky` int(11) NOT NULL DEFAULT '0',
  `tnid` int(10) unsigned NOT NULL DEFAULT '0',
  `translate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_moderate` (`moderate`),
  KEY `node_promote_status` (`promote`,`status`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,1,'story','','Tincidunt Ad Typicus',1,1,1281079673,1281467786,2,0,0,0,0,0),(2,2,'story','','Letalis Qui',0,1,1281442936,1281467786,2,0,0,0,0,0),(3,3,'story','','Nunc Premo Valetudo Uxor Jugis Quis',0,1,1280940622,1281467786,2,1,0,0,0,0),(4,4,'story','','Brevitas Metuo Gilvus Aptent Ex Euismod',0,1,1281462442,1281467786,2,0,0,0,0,0),(5,5,'story','','Praemitto Zelus Qui',0,1,1281353229,1281467786,2,1,0,0,0,0),(6,6,'story','','Hos Autem Quae Capto Loquor Quibus',0,1,1281311352,1281467786,2,0,0,0,0,0),(7,7,'story','','Nulla Neque Usitas Acsi',0,1,1281199243,1281467786,2,1,0,0,0,0),(8,8,'story','','Scisco Odio Exerci Et Abluo Gravis Uxor',0,1,1281224068,1281467786,2,0,0,0,0,0),(9,9,'story','','Sit Ibidem Humo Meus Esse Venio Vindico Nunc',0,1,1281417056,1281467786,2,1,0,0,0,0),(10,10,'story','','Uxor Sagaciter Feugiat',0,1,1281333433,1281467786,2,0,0,0,0,0);
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_access`
--

DROP TABLE IF EXISTS `node_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` varchar(255) NOT NULL DEFAULT '',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_access`
--

LOCK TABLES `node_access` WRITE;
/*!40000 ALTER TABLE `node_access` DISABLE KEYS */;
INSERT INTO `node_access` VALUES (0,0,'all',1,0,0);
/*!40000 ALTER TABLE `node_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_comment_statistics`
--

DROP TABLE IF EXISTS `node_comment_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0',
  `last_comment_name` varchar(60) DEFAULT NULL,
  `last_comment_uid` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_comment_statistics`
--

LOCK TABLES `node_comment_statistics` WRITE;
/*!40000 ALTER TABLE `node_comment_statistics` DISABLE KEYS */;
INSERT INTO `node_comment_statistics` VALUES (1,1281467786,NULL,1,0),(2,1281467786,NULL,0,0),(3,1281467786,NULL,0,0),(4,1281467786,NULL,0,0),(5,1281467786,NULL,0,0),(6,1281467786,NULL,0,0),(7,1281467786,NULL,0,0),(8,1281467786,NULL,0,0),(9,1281467786,NULL,0,0),(10,1281467786,NULL,0,0);
/*!40000 ALTER TABLE `node_comment_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_counter`
--

DROP TABLE IF EXISTS `node_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_counter` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `totalcount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `daycount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_counter`
--

LOCK TABLES `node_counter` WRITE;
/*!40000 ALTER TABLE `node_counter` DISABLE KEYS */;
INSERT INTO `node_counter` VALUES (1,154,113,814021479),(2,474,209,1168471225),(3,57,7,1108978517),(4,410,5,891782887),(5,158,15,623254089),(6,397,138,810806509),(7,10,7,421763176),(8,352,266,590718530),(9,259,92,1007688141),(10,287,31,1112441995);
/*!40000 ALTER TABLE `node_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_revisions`
--

DROP TABLE IF EXISTS `node_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_revisions` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `teaser` longtext NOT NULL,
  `log` longtext NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `format` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_revisions`
--

LOCK TABLES `node_revisions` WRITE;
/*!40000 ALTER TABLE `node_revisions` DISABLE KEYS */;
INSERT INTO `node_revisions` VALUES (1,1,1,'Tincidunt Ad Typicus','node (story) - <p>Te elit laoreet. Genitus eros populus melior euismod camur. Macto gilvus camur euismod proprius patria populus imputo.</p><p>Sed macto dolus damnum patria abdo tego. Autem magna scisco hos enim ulciscor accumsan. Nutus in lobortis cui interdico. Sagaciter pala probo aliquam iusto cogo proprius venio commoveo damnum. Eu letalis vindico gemino sit singularis. Antehabeo decet quidne antehabeo camur utrum.</p><p>Pertineo minim jus interdico appellatio. Autem quidem secundum iriure huic volutpat vel sino. Huic et volutpat secundum quibus dolore iusto valetudo. Wisi inhibeo gemino magna iustum illum natu sudo vel.</p><p>Suscipit persto cogo feugiat comis. Inhibeo modo feugiat quidem tation eros vereor modo. Iaceo ludus modo saepius utrum esca letalis commodo. Defui abigo damnum nostrud occuro torqueo humo feugiat iriure sudo. At minim amet aptent plaga esse. Letalis sed qui usitas at cogo interdico conventio. Caecus huic rusticus quibus premo interdico pertineo hendrerit torqueo roto. Consectetuer magna capto letalis paratus.</p><p>Ullamcorper quia gilvus autem exerci. Secundum oppeto probo utrum brevitas eros volutpat. Letalis iriure dolus elit magna pecus jumentum. Oppeto quibus laoreet melior commoveo utrum. Ibidem valde refoveo. Abbas bene nulla. Roto suscipit luctus luptatum defui. Natu cogo nostrud gemino meus.</p><p>Enim gravis in similis si sagaciter. Conventio commodo olim premo. Validus modo damnum suscipit loquor distineo vulputate occuro.</p><p>Augue vulpes eum. Genitus quidem ad saepius abbas sudo ut premo distineo ibidem. Validus persto suscipit natu pertineo exputo augue. Jus populus neo singularis abbas. Dolor pala vulpes patria et. Jugis sudo interdico quia. Nostrud vulputate aliquam. Abigo persto iaceo humo utrum.</p><p>Acsi sudo amet gemino. Exputo conventio verto facilisi jugis sed humo. Appellatio jugis at genitus gilvus diam torqueo loquor veniam sit.</p>','node (story) - <p>Te elit laoreet. Genitus eros populus melior euismod camur. Macto gilvus camur euismod proprius patria populus imputo.</p><p>Sed macto dolus damnum patria abdo tego. Autem magna scisco hos enim ulciscor accumsan. Nutus in lobortis cui interdico. Sagaciter pala probo aliquam iusto cogo proprius venio commoveo damnum. Eu letalis vindico gemino sit singularis. Antehabeo decet quidne antehabeo camur utrum.</p>','',1281467786,0),(2,2,1,'Letalis Qui','node (story) - Ludus incassum diam. Proprius te saepius. Aliquip qui camur dolor. Lucidus pecus scisco persto consectetuer dolus pagus letalis conventio. Pertineo euismod nulla valde huic. Brevitas vulpes pneum molior appellatio. Velit saepius refoveo proprius rusticus valde. Eros ex erat gilvus. Vulpes erat tincidunt luptatum ibidem sed sagaciter. Tamen dolore ideo exputo interdico mauris nisl commodo ratis vulputate.\n\nInhibeo mauris neque tego immitto capto quis te lenis esse. Amet illum appellatio magna. Suscipit ut nobis hos. Venio ratis secundum refoveo suscipit hendrerit erat neo premo. Voco macto eros dignissim iaceo persto at nisl neque immitto. Pertineo esca enim jugis ulciscor valde eum nisl. Eu melior tego suscipit. Tamen capto gravis consectetuer oppeto meus importunus interdico abdo appellatio.\n\nRusticus neo virtus esse. Sudo os aptent vulputate tincidunt neo patria iriure facilisis. Minim enim esse mos aliquam. Tation commodo probo singularis virtus at wisi suscipit laoreet olim. Letalis vulputate nimis velit. Abbas antehabeo cui nimis. Refero pecus nibh damnum. Quae praesent turpis modo utrum minim hendrerit. Brevitas persto virtus quadrum sino.\n\nEsca nunc iustum. Enim eros verto. Persto nunc defui quia refero lenis. Illum nibh brevitas. Utrum genitus iaceo. Luctus acsi ad haero odio dignissim tego blandit ut hendrerit. Pala acsi utinam odio. Sino suscipere paratus premo nostrud hos. Nostrud acsi gilvus ad usitas abbas ibidem exputo ad. Quidem pneum premo pertineo natu. Eum camur odio ad nimis abbas jugis immitto turpis.\n\n','node (story) - Ludus incassum diam. Proprius te saepius. Aliquip qui camur dolor. Lucidus pecus scisco persto consectetuer dolus pagus letalis conventio. Pertineo euismod nulla valde huic. Brevitas vulpes pneum molior appellatio. Velit saepius refoveo proprius rusticus valde. Eros ex erat gilvus. Vulpes erat tincidunt luptatum ibidem sed sagaciter. Tamen dolore ideo exputo interdico mauris nisl commodo ratis vulputate.\n\nInhibeo mauris neque tego immitto capto quis te lenis esse. Amet illum appellatio magna. Suscipit ut nobis hos. Venio ratis secundum refoveo suscipit hendrerit erat neo premo.','',1281467786,0),(3,3,1,'Nunc Premo Valetudo Uxor Jugis Quis','node (story) - <p>Eros praemitto valetudo laoreet jumentum dolore feugiat tincidunt diam. Immitto vicis wisi lobortis lobortis quia probo euismod camur et. Venio secundum iusto pagus tego. Sudo vereor ille probo imputo. Eu mos quadrum mauris. Mos comis roto. Brevitas luptatum torqueo accumsan.</p><p>Patria ut pecus erat incassum. Elit iusto proprius caecus venio premo abbas. Velit suscipere exputo roto suscipit oppeto similis illum ex. Cui cui in haero populus. Quibus eum nunc et quis pagus commodo dolor mos. Loquor minim wisi modo suscipit importunus enim suscipere ibidem. Dolore aliquip olim brevitas.</p><p>Vulputate ulciscor natu letalis. Enim loquor camur gilvus ludus nulla commoveo. Zelus voco melior paratus paulatim valetudo. Velit feugiat vulpes dolor abdo camur fere. Magna paratus iustum nostrud elit genitus quadrum.</p><p>Quibus lucidus luctus quidne haero camur typicus. Turpis usitas cogo virtus. Luptatum plaga tum vindico abigo comis haero jugis autem. Duis quidem quidem humo. Tincidunt conventio ullamcorper ymo metuo quae esse antehabeo.</p>','node (story) - <p>Eros praemitto valetudo laoreet jumentum dolore feugiat tincidunt diam. Immitto vicis wisi lobortis lobortis quia probo euismod camur et. Venio secundum iusto pagus tego. Sudo vereor ille probo imputo. Eu mos quadrum mauris. Mos comis roto. Brevitas luptatum torqueo accumsan.</p>','',1281467786,0),(4,4,1,'Brevitas Metuo Gilvus Aptent Ex Euismod','node (story) - Patria lenis capto duis dolore. Amet consectetuer sed olim vulpes melior inhibeo autem refoveo te. Causa probo veniam facilisis laoreet sino damnum velit metuo. Eum abbas ratis pertineo. Accumsan commoveo neo nunc ratis tation. Amet comis quis. Pneum aliquip vereor brevitas tamen sit neque valetudo ideo sit. Nobis eros refero eros singularis abdo. In verto blandit abbas illum natu validus.\n\nIustum occuro ea tego usitas facilisi. Refero abigo obruo comis dignissim gemino uxor diam. Accumsan iustum jus nutus duis qui torqueo ea iusto dolore. Lucidus qui fere. Metuo verto jumentum refero typicus. Blandit utrum persto exerci si ratis vindico modo elit zelus. Vindico euismod hos. Quidem ratis laoreet autem facilisis sagaciter eum. Saluto paratus importunus. Consequat pneum iustum distineo adipiscing acsi plaga sudo jumentum odio.\n\nHos nulla importunus melior patria feugiat acsi lucidus tamen quia. Nostrud metuo enim iriure bene te. Hos similis qui commodo distineo mauris dolus autem. Eligo sudo proprius. Macto capto ut nutus volutpat laoreet turpis valde. Gemino aptent veniam dolus vulputate.\n\nBlandit immitto amet natu veniam nunc accumsan interdico os elit. Secundum appellatio persto ideo abigo laoreet commoveo. Dignissim singularis iustum tincidunt odio modo ea iustum valetudo. Iusto validus proprius ad. Scisco aliquam abbas pertineo diam. Refoveo decet typicus roto hos distineo pneum. Abluo validus acsi amet. Sit abbas typicus jumentum scisco meus voco olim acsi facilisi.\n\nVel tincidunt praemitto typicus iusto quae gravis. Utinam velit ullamcorper praesent paulatim sagaciter olim ratis in mos. Et mauris haero bene gemino. Genitus causa si gilvus mauris saepius similis.\n\nPecus odio pecus plaga nibh. Proprius ex vero causa qui wisi meus vereor. Vindico eum luctus vel torqueo venio enim olim utinam accumsan.\n\nBene tego distineo tum tum lobortis illum aptent suscipere accumsan. Cogo euismod conventio pertineo ad pecus molior esca jumentum. Quia natu verto os enim. Nunc scisco si diam refero abico.\n\nPraesent tincidunt esse torqueo. Singularis pneum eros abigo hendrerit roto letalis loquor hendrerit bene.\n\nIlle odio ibidem metuo tum vindico meus aptent causa. Gemino diam brevitas enim. Utrum iriure nobis pecus. Bene luctus lenis loquor comis gilvus. Oppeto abico ullamcorper inhibeo huic amet suscipere nulla. Qui blandit sagaciter iusto quia. Os nostrud aliquam vereor nimis sudo abigo. Inhibeo blandit pecus plaga dignissim sudo utinam dolus ymo. Nutus augue huic. Nostrud facilisi lenis probo voco quibus ullamcorper humo pala.\n\nLucidus sudo premo qui letalis. Sed commodo feugiat roto tego antehabeo abigo melior abbas. Fere pecus sit commodo valde vindico haero. Nibh lenis abico facilisi.\n\n','node (story) - Patria lenis capto duis dolore. Amet consectetuer sed olim vulpes melior inhibeo autem refoveo te. Causa probo veniam facilisis laoreet sino damnum velit metuo. Eum abbas ratis pertineo. Accumsan commoveo neo nunc ratis tation. Amet comis quis. Pneum aliquip vereor brevitas tamen sit neque valetudo ideo sit. Nobis eros refero eros singularis abdo. In verto blandit abbas illum natu validus.\n\nIustum occuro ea tego usitas facilisi. Refero abigo obruo comis dignissim gemino uxor diam. Accumsan iustum jus nutus duis qui torqueo ea iusto dolore. Lucidus qui fere.','',1281467786,0),(5,5,1,'Praemitto Zelus Qui','node (story) - Olim modo minim sudo. Conventio nisl luptatum. Vulpes molior ludus pneum vicis torqueo minim mauris nobis.<br />Scisco abbas si inhibeo aptent appellatio scisco loquor abdo duis. Turpis pneum facilisi bene abdo feugiat metuo genitus. Quia luctus esse aptent quis jus secundum ibidem. Odio scisco aptent refoveo eligo consequat damnum. Valetudo valde imputo refoveo nibh tum si persto. Nunc sudo oppeto. Laoreet utrum loquor exerci diam sed diam erat sit.<br />','node (story) - Olim modo minim sudo. Conventio nisl luptatum. Vulpes molior ludus pneum vicis torqueo minim mauris nobis.<br />Scisco abbas si inhibeo aptent appellatio scisco loquor abdo duis. Turpis pneum facilisi bene abdo feugiat metuo genitus. Quia luctus esse aptent quis jus secundum ibidem. Odio scisco aptent refoveo eligo consequat damnum. Valetudo valde imputo refoveo nibh tum si persto. Nunc sudo oppeto. Laoreet utrum loquor exerci diam sed diam erat sit.<br />','',1281467786,0),(6,6,1,'Hos Autem Quae Capto Loquor Quibus','node (story) - <p>Brevitas occuro interdico iriure elit premo exerci. Iaceo sino damnum saluto similis camur quibus commodo. Abico nulla nobis similis jumentum zelus gemino. Erat iriure letalis causa lenis.</p><p>Genitus plaga vindico. Jus quidne dolor valde. Venio letalis nibh letalis abbas causa refoveo. Nunc validus ex sagaciter. Patria iusto bene. Wisi os cogo esse brevitas meus saluto vero humo. Hendrerit iriure nimis quadrum similis fere vero vulpes obruo decet.</p><p>Decet iaceo obruo. Rusticus aliquip diam augue gilvus premo tincidunt distineo bene at. Nostrud velit os camur abluo. Appellatio os minim. Plaga at nunc rusticus loquor. Dolor pneum acsi esca brevitas. Saepius metuo cui ratis amet magna caecus vero at. Vel lobortis caecus facilisi valetudo eu tamen. Loquor melior abigo saepius immitto. Quidem feugiat wisi decet usitas cui praesent antehabeo.</p><p>Mos autem valetudo aliquam quadrum nisl. In autem sino saepius odio obruo magna patria tincidunt mauris.</p><p>In conventio olim abico iaceo. Quidem esse nutus importunus damnum metuo paulatim verto si pecus. Esse validus proprius. Esca elit metuo quibus.</p>','node (story) - <p>Brevitas occuro interdico iriure elit premo exerci. Iaceo sino damnum saluto similis camur quibus commodo. Abico nulla nobis similis jumentum zelus gemino. Erat iriure letalis causa lenis.</p><p>Genitus plaga vindico. Jus quidne dolor valde. Venio letalis nibh letalis abbas causa refoveo. Nunc validus ex sagaciter. Patria iusto bene. Wisi os cogo esse brevitas meus saluto vero humo. Hendrerit iriure nimis quadrum similis fere vero vulpes obruo decet.</p>','',1281467786,0),(7,7,1,'Nulla Neque Usitas Acsi','node (story) - <p>Tincidunt sudo veniam patria typicus voco vulputate. Iaceo uxor quidne decet veniam tincidunt velit abdo wisi. Nisl sagaciter jugis ullamcorper pneum. Abbas nunc usitas. Dignissim sagaciter nunc valetudo. Aliquam commoveo immitto dolus quadrum praesent exputo mauris. Ludus exerci tincidunt nimis voco. Magna vereor probo vindico utinam acsi qui capto.</p><p>Hendrerit qui tum. Dolor comis commodo abico ideo lobortis ibidem occuro. Sudo esca luptatum vulpes comis capto esse augue typicus.</p><p>Adipiscing bene facilisi dolor quis eum praemitto eu neo eum. Sino in vel paulatim lobortis roto causa acsi aliquam secundum. Vicis jus damnum vero exputo abbas os. Decet appellatio huic metuo saluto quia nostrud. Appellatio capto sit jumentum. Exputo ex metuo nibh at obruo abbas pertineo.</p><p>Verto esse molior sudo. Ex ex ludus meus commodo cogo obruo. Lucidus fere eligo ut causa ille haero dolus. Gravis tincidunt natu. Si melior zelus. Damnum patria obruo aliquip gravis genitus damnum nutus. Obruo antehabeo praesent.</p><p>Huic duis wisi pecus quis veniam. Ymo facilisis odio pneum. Pertineo dolore genitus proprius. Ulciscor natu adipiscing minim letalis abdo ulciscor. Comis nimis neque pala decet tamen exputo quia pneum. Turpis sino ibidem tincidunt causa odio vulpes nobis sed. Quadrum esse aliquam premo populus nimis proprius refero ludus. Iaceo valde modo capto tego.</p><p>Occuro quibus antehabeo interdico praemitto venio. Jugis premo commoveo pertineo vicis euismod fere ulciscor. Diam loquor capto causa pala amet refero gemino. Aliquip appellatio tum dolor gilvus. Ideo duis quidne. Ymo ea humo occuro distineo illum qui obruo metuo uxor. Vel refoveo ex loquor capto. Ea nunc camur. Inhibeo mos in.</p>','node (story) - <p>Tincidunt sudo veniam patria typicus voco vulputate. Iaceo uxor quidne decet veniam tincidunt velit abdo wisi. Nisl sagaciter jugis ullamcorper pneum. Abbas nunc usitas. Dignissim sagaciter nunc valetudo. Aliquam commoveo immitto dolus quadrum praesent exputo mauris. Ludus exerci tincidunt nimis voco. Magna vereor probo vindico utinam acsi qui capto.</p><p>Hendrerit qui tum. Dolor comis commodo abico ideo lobortis ibidem occuro. Sudo esca luptatum vulpes comis capto esse augue typicus.</p>','',1281467786,0),(8,8,1,'Scisco Odio Exerci Et Abluo Gravis Uxor','node (story) - <p>Brevitas caecus verto volutpat loquor letalis pala oppeto melior os. Nutus antehabeo pagus iusto proprius velit acsi adipiscing qui. Nostrud occuro tamen saepius caecus. Olim modo abigo jugis interdico pagus. Eligo eros os in jugis caecus conventio vicis. Pagus jus quidem inhibeo praemitto turpis. Letalis consectetuer meus vereor nostrud abdo appellatio jus sudo blandit.</p><p>Hos similis lenis. Iustum nimis nibh jus facilisi molior. Antehabeo aliquam dolor lucidus eros. Gemino appellatio nisl. Jus praesent loquor ratis lucidus causa. Gravis nulla paulatim velit tamen enim populus enim ibidem quidne. Bene letalis euismod haero elit obruo praemitto. Utrum humo amet gilvus jumentum minim plaga uxor ratis eros. Autem suscipere aliquam ymo olim rusticus dolor.</p><p>Lucidus melior abdo at accumsan nibh meus verto nobis neque. Ludus autem facilisis esse inhibeo haero facilisis ullamcorper nutus. Quidem verto sino meus gravis nibh premo ex quadrum.</p>','node (story) - <p>Brevitas caecus verto volutpat loquor letalis pala oppeto melior os. Nutus antehabeo pagus iusto proprius velit acsi adipiscing qui. Nostrud occuro tamen saepius caecus. Olim modo abigo jugis interdico pagus. Eligo eros os in jugis caecus conventio vicis. Pagus jus quidem inhibeo praemitto turpis. Letalis consectetuer meus vereor nostrud abdo appellatio jus sudo blandit.</p>','',1281467786,0),(9,9,1,'Sit Ibidem Humo Meus Esse Venio Vindico Nunc','node (story) - Et scisco lobortis ad plaga luptatum occuro abigo immitto. Quidem verto eligo ideo commodo melior jumentum loquor. Vulputate diam eros abbas qui at feugiat.\n\nDefui vel tum nimis. Paratus hendrerit exputo amet genitus. Ibidem capto plaga iusto os hendrerit. Refoveo ulciscor metuo utrum os verto singularis hos praemitto. Blandit exputo jumentum secundum quidem similis. Refero comis esse torqueo eu melior. Saluto eum cogo imputo imputo. Sit virtus autem damnum tum illum secundum luctus turpis.\n\nQuidem volutpat ibidem mauris bene camur plaga. Natu imputo probo te facilisis exputo iusto gravis loquor. Euismod laoreet quidne oppeto persto verto utinam turpis aliquam.\n\nNibh praemitto vicis patria tamen nostrud elit turpis genitus abdo. Roto pagus singularis ut hos. Sudo aptent suscipit nisl duis inhibeo commoveo quae scisco. Refero ratis velit jumentum vulpes ea. Quidne quidem dignissim tincidunt voco camur. Vel dolus sudo vulpes pagus. Sino natu similis velit quae elit ex pertineo molior.\n\nIn quia probo incassum gemino. Tum ad obruo. Mauris valde wisi.\n\nInhibeo abbas ideo pagus. Secundum modo uxor nobis luptatum. Abigo enim et aliquip autem iriure suscipere dignissim macto acsi. Pertineo tation ad humo ibidem sudo elit facilisis pala praemitto. Patria fere quidne tego conventio quadrum eligo vindico distineo.\n\nSudo quibus damnum praemitto ea ratis veniam paulatim abluo caecus. Quae adipiscing importunus humo. Ibidem natu te causa causa pagus. Elit loquor abigo ymo similis.\n\nNeo genitus ad valetudo eum aliquip. Blandit suscipere refoveo. Saluto torqueo abluo hos wisi commoveo duis. Ille consectetuer accumsan immitto mauris saluto tamen. Mos eu iaceo consequat patria probo. Refoveo decet rusticus. Premo distineo iaceo. Premo euismod roto patria. Nostrud velit defui metuo uxor sed si abluo. Refoveo melior euismod venio cui antehabeo.\n\nNostrud importunus facilisi erat saluto magna esca. Letalis refoveo aptent camur iaceo amet at. Nulla quidem dignissim abigo te velit genitus melior adipiscing. Nostrud augue volutpat. Pagus nimis sagaciter lucidus. Autem ymo eros fere esca. Ratis nunc diam abdo tation sed wisi. Magna sit saluto ibidem nibh uxor ut ratis dignissim. Proprius iriure sino neque nisl distineo validus tum quibus dolore.\n\n','node (story) - Et scisco lobortis ad plaga luptatum occuro abigo immitto. Quidem verto eligo ideo commodo melior jumentum loquor. Vulputate diam eros abbas qui at feugiat.\n\nDefui vel tum nimis. Paratus hendrerit exputo amet genitus. Ibidem capto plaga iusto os hendrerit. Refoveo ulciscor metuo utrum os verto singularis hos praemitto. Blandit exputo jumentum secundum quidem similis. Refero comis esse torqueo eu melior. Saluto eum cogo imputo imputo. Sit virtus autem damnum tum illum secundum luctus turpis.\n\nQuidem volutpat ibidem mauris bene camur plaga.','',1281467786,0),(10,10,1,'Uxor Sagaciter Feugiat','node (story) - <p>Nobis saluto huic camur vereor nimis scisco meus. Voco genitus iriure blandit. Ad augue valde refero dolus. Iustum patria si. Neo sit olim sagaciter refero refoveo iaceo consequat lenis. Metuo enim volutpat consequat refoveo natu. Consectetuer humo ideo bene decet roto paulatim gemino qui distineo.</p><p>Eum roto tum sed in brevitas damnum si. Aliquam torqueo causa acsi pecus augue ad iaceo quae cui.</p><p>Elit velit suscipit ille quidem commodo. Mauris at inhibeo. Exputo pala imputo eu pertineo refero voco esca.</p><p>Tum qui camur cogo ullamcorper tation jumentum pertineo obruo autem. Incassum imputo patria quia lenis jus et gilvus odio obruo. Inhibeo facilisi fere gemino incassum facilisi valetudo gilvus nostrud imputo. Eros praemitto pneum commoveo praesent et. Exerci laoreet camur. Zelus pagus erat plaga iustum.</p><p>Nostrud scisco at sudo dolor loquor cogo meus letalis proprius. Jus populus pertineo ideo commodo comis augue tincidunt nunc. Abico velit neque luptatum ex facilisis antehabeo importunus. Acsi jumentum si abbas olim cui nisl. Paratus vereor euismod ille iriure feugiat defui. Probo utinam ulciscor caecus plaga cui jus quis.</p><p>Blandit saluto nimis luptatum brevitas tation. Zelus facilisi voco virtus venio eum. Tincidunt sit quis persto hendrerit sino quidne vulputate. Ideo caecus turpis quadrum persto aptent illum tamen vulputate. Velit humo ratis quibus jumentum metuo. Nostrud humo pertineo pala populus occuro gemino. Blandit exerci at pagus fere ad luptatum mos gemino.</p>','node (story) - <p>Nobis saluto huic camur vereor nimis scisco meus. Voco genitus iriure blandit. Ad augue valde refero dolus. Iustum patria si. Neo sit olim sagaciter refero refoveo iaceo consequat lenis. Metuo enim volutpat consequat refoveo natu. Consectetuer humo ideo bene decet roto paulatim gemino qui distineo.</p><p>Eum roto tum sed in brevitas damnum si. Aliquam torqueo causa acsi pecus augue ad iaceo quae cui.</p><p>Elit velit suscipit ille quidem commodo. Mauris at inhibeo. Exputo pala imputo eu pertineo refero voco esca.</p>','',1281467786,0);
/*!40000 ALTER TABLE `node_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_type`
--

DROP TABLE IF EXISTS `node_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_type` (
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `help` mediumtext NOT NULL,
  `has_title` tinyint(3) unsigned NOT NULL,
  `title_label` varchar(255) NOT NULL DEFAULT '',
  `has_body` tinyint(3) unsigned NOT NULL,
  `body_label` varchar(255) NOT NULL DEFAULT '',
  `min_word_count` smallint(5) unsigned NOT NULL,
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `modified` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `orig_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_type`
--

LOCK TABLES `node_type` WRITE;
/*!40000 ALTER TABLE `node_type` DISABLE KEYS */;
INSERT INTO `node_type` VALUES ('page','Page','node','A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.','',1,'Title',1,'Body',0,1,1,0,'page'),('story','Story','node','A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.','',1,'Title',1,'Body',0,1,1,0,'story');
/*!40000 ALTER TABLE `node_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_common_consumer`
--

DROP TABLE IF EXISTS `oauth_common_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_common_consumer` (
  `consumer_key` varchar(32) NOT NULL,
  `provider_consumer` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `secret` varchar(32) NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `context` varchar(32) NOT NULL DEFAULT '',
  `callback_url` varchar(255) NOT NULL,
  `configuration` longtext NOT NULL,
  PRIMARY KEY (`consumer_key`,`provider_consumer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_common_consumer`
--

LOCK TABLES `oauth_common_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_common_consumer` DISABLE KEYS */;
INSERT INTO `oauth_common_consumer` VALUES ('rmTU6Sxs7TGwvJGqNHBy9E9NqDXegQXr',1,'qH5uWLPkEtZ5DsVQoaAT8VBUZT7KXYBP',1281445809,1281446864,1,'iPhone','default','oob','a:0:{}');
/*!40000 ALTER TABLE `oauth_common_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_common_context`
--

DROP TABLE IF EXISTS `oauth_common_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_common_context` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `title` varchar(100) NOT NULL,
  `authorization_options` longtext NOT NULL,
  `authorization_levels` longtext NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `context` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_common_context`
--

LOCK TABLES `oauth_common_context` WRITE;
/*!40000 ALTER TABLE `oauth_common_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_common_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_common_nonce`
--

DROP TABLE IF EXISTS `oauth_common_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_common_nonce` (
  `nonce` varchar(32) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `token` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`nonce`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_common_nonce`
--

LOCK TABLES `oauth_common_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_common_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_common_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_common_token`
--

DROP TABLE IF EXISTS `oauth_common_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_common_token` (
  `token_key` varchar(32) NOT NULL,
  `provider_token` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `secret` varchar(32) NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `expires` int(11) NOT NULL DEFAULT '0',
  `type` varchar(7) NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `consumer_key` varchar(32) NOT NULL,
  `services` text,
  `authorized` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`token_key`,`provider_token`),
  KEY `token_key_type` (`token_key`,`provider_token`,`type`),
  KEY `consumer_key` (`consumer_key`,`provider_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_common_token`
--

LOCK TABLES `oauth_common_token` WRITE;
/*!40000 ALTER TABLE `oauth_common_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_common_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `perm` longtext,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,1,'access content',0),(2,2,'access comments, access content, post comments, post comments without approval',0);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'anonymous user'),(2,'authenticated user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semaphore`
--

DROP TABLE IF EXISTS `semaphore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `expire` double NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semaphore`
--

LOCK TABLES `semaphore` WRITE;
/*!40000 ALTER TABLE `semaphore` DISABLE KEYS */;
/*!40000 ALTER TABLE `semaphore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_endpoint`
--

DROP TABLE IF EXISTS `services_endpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_endpoint` (
  `eid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `server` varchar(32) NOT NULL,
  `path` varchar(255) NOT NULL,
  `authentication` longtext NOT NULL,
  `resources` longtext NOT NULL,
  PRIMARY KEY (`eid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_endpoint`
--

LOCK TABLES `services_endpoint` WRITE;
/*!40000 ALTER TABLE `services_endpoint` DISABLE KEYS */;
INSERT INTO `services_endpoint` VALUES (1,'iphone','iPhone Test','rest_server','api/iphone','a:1:{s:14:\"services_oauth\";a:1:{s:13:\"oauth_context\";s:7:\"default\";}}','a:1:{s:4:\"node\";a:2:{s:5:\"alias\";s:0:\"\";s:10:\"operations\";a:1:{s:5:\"index\";a:2:{s:7:\"enabled\";i:1;s:14:\"services_oauth\";a:2:{s:11:\"credentials\";s:5:\"token\";s:13:\"authorization\";s:1:\"*\";}}}}}');
/*!40000 ALTER TABLE `services_endpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `uid` int(10) unsigned NOT NULL,
  `sid` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `cache` int(11) NOT NULL DEFAULT '0',
  `session` longtext,
  PRIMARY KEY (`sid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (0,'u01to8a3prrmf1h8gr72a64kj2','127.0.0.1',1281462970,0,''),(0,'gb3cbn98t8fj0ne10hd2dldr72','127.0.0.1',1281446658,0,''),(0,'3uq4evtf4sphlf1uo9p7caa3p2','127.0.0.1',1281460841,0,''),(0,'ih6amrhmdfa9qbhudev9uhlhq3','127.0.0.1',1281462200,0,''),(0,'8bmo8phkofn3m450qpa2bm4r42','127.0.0.1',1281467616,0,''),(0,'vd890bn8kd116kb9naqq245660','127.0.0.1',1281467657,0,''),(0,'eg3fh0t0le9tpia2mf1uu0mcf4','127.0.0.1',1281467830,0,''),(1,'q6vme1180ucl2ac0dqst238i04','127.0.0.1',1281469549,0,'');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `filename` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `owner` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `bootstrap` int(11) NOT NULL DEFAULT '0',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1',
  `weight` int(11) NOT NULL DEFAULT '0',
  `info` text,
  PRIMARY KEY (`filename`),
  KEY `modules` (`type`(12),`status`,`weight`,`filename`),
  KEY `bootstrap` (`type`(12),`status`,`bootstrap`,`weight`,`filename`),
  KEY `type_name` (`type`(12),`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES ('sites/all/themes/acquia_marina/acquia_marina.info','acquia_marina','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:13:{s:4:\"name\";s:13:\"Acquia Marina\";s:11:\"description\";s:250:\"<a href=\"http://www.acquia.com\">Acquia\'s</a> Marina theme is ideal for blogs and community sites. Includes advanced theme settings and 15 flexible content regions for a variety of layouts. By <a href=\"http://www.topnotchthemes.com\">TopNotchThemes</a>\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:3:{s:9:\"style.css\";s:40:\"sites/all/themes/acquia_marina/style.css\";s:9:\"icons.css\";s:40:\"sites/all/themes/acquia_marina/icons.css\";s:9:\"local.css\";s:40:\"sites/all/themes/acquia_marina/local.css\";}}s:7:\"regions\";a:15:{s:13:\"sidebar_first\";s:13:\"sidebar first\";s:12:\"sidebar_last\";s:12:\"sidebar last\";s:13:\"header_middle\";s:13:\"header middle\";s:11:\"header_last\";s:11:\"header last\";s:13:\"preface_first\";s:13:\"preface first\";s:14:\"preface_middle\";s:14:\"preface middle\";s:12:\"preface_last\";s:12:\"preface last\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:16:\"postscript_first\";s:16:\"postscript first\";s:17:\"postscript_middle\";s:17:\"postscript middle\";s:15:\"postscript_last\";s:15:\"postscript last\";s:10:\"footer_top\";s:10:\"footer top\";s:6:\"footer\";s:6:\"footer\";s:11:\"node_bottom\";s:11:\"node bottom\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";}s:7:\"version\";s:7:\"6.x-1.9\";s:7:\"project\";s:13:\"acquia_marina\";s:9:\"datestamp\";s:10:\"1242217832\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:40:\"sites/all/themes/acquia_marina/script.js\";}s:10:\"screenshot\";s:45:\"sites/all/themes/acquia_marina/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),('themes/garland/minnelli/minnelli.info','minnelli','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:14:{s:4:\"name\";s:8:\"Minnelli\";s:11:\"description\";s:56:\"Tableless, recolorable, multi-column, fixed width theme.\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:7:\"garland\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/garland/minnelli/script.js\";}s:10:\"screenshot\";s:38:\"themes/garland/minnelli/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}'),('sites/all/themes/tao/tao.info','tao','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:14:{s:4:\"core\";s:3:\"6.x\";s:11:\"description\";s:149:\"Tao is a base theme that is all about going with the flow. It takes care of key reset and utility tasks so that sub-themes can get on with their job.\";s:6:\"engine\";s:11:\"phptemplate\";s:4:\"name\";s:3:\"Tao\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:7:\"scripts\";a:1:{s:9:\"js/tao.js\";s:30:\"sites/all/themes/tao/js/tao.js\";}s:11:\"stylesheets\";a:2:{s:6:\"screen\";a:2:{s:9:\"reset.css\";s:30:\"sites/all/themes/tao/reset.css\";s:8:\"base.css\";s:29:\"sites/all/themes/tao/base.css\";}s:5:\"print\";a:3:{s:9:\"reset.css\";s:30:\"sites/all/themes/tao/reset.css\";s:8:\"base.css\";s:29:\"sites/all/themes/tao/base.css\";s:9:\"print.css\";s:30:\"sites/all/themes/tao/print.css\";}}s:9:\"datestamp\";s:10:\"1267655521\";s:7:\"project\";s:3:\"tao\";s:18:\"project status url\";s:39:\"http://code.developmentseed.org/fserver\";s:7:\"version\";s:8:\"6.x-1.10\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:10:\"screenshot\";s:35:\"sites/all/themes/tao/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),('themes/garland/garland.info','garland','theme','themes/engines/phptemplate/phptemplate.engine',1,0,0,-1,0,'a:13:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:66:\"Tableless, recolorable, multi-column, fluid width theme (default).\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:24:\"themes/garland/script.js\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),('modules/system/system.module','system','module','',1,0,0,6055,0,'a:10:{s:4:\"name\";s:6:\"System\";s:11:\"description\";s:54:\"Handles general site configuration for administrators.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/advanced_help/advanced_help.module','advanced_help','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:13:\"Advanced help\";s:11:\"description\";s:38:\"Allow advanced help and documentation.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:13:\"advanced_help\";s:9:\"datestamp\";s:10:\"1238954409\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/aggregator/aggregator.module','aggregator','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Aggregator\";s:11:\"description\";s:57:\"Aggregates syndicated content (RSS, RDF, and Atom feeds).\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/autoload/autoload.module','autoload','module','',1,0,0,0,0,'a:9:{s:4:\"name\";s:8:\"Autoload\";s:11:\"description\";s:46:\"Helper module to autoload classes under PHP 5.\";s:3:\"php\";s:5:\"5.1.2\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.3\";s:7:\"project\";s:8:\"autoload\";s:9:\"datestamp\";s:10:\"1237327502\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}}'),('modules/block/block.module','block','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:5:\"Block\";s:11:\"description\";s:62:\"Controls the boxes that are displayed around the main content.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/blog/blog.module','blog','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Blog\";s:11:\"description\";s:69:\"Enables keeping easily and regularly updated user web pages or blogs.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/blogapi/blogapi.module','blogapi','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Blog API\";s:11:\"description\";s:79:\"Allows users to post content using applications that support XML-RPC blog APIs.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/book/book.module','book','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Book\";s:11:\"description\";s:63:\"Allows users to structure site pages in a hierarchy or outline.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cobalt/cobalt.module','cobalt','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:6:\"Cobalt\";s:4:\"core\";s:3:\"6.x\";s:11:\"description\";s:63:\"Cobalt is a javascript implementation of Quicksilver for Drupal\";s:7:\"package\";s:6:\"Cobalt\";s:7:\"version\";s:11:\"6.x-1.x-dev\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cobalt/cobaltnodes.module','cobaltnodes','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:12:\"Cobalt Nodes\";s:4:\"core\";s:3:\"6.x\";s:11:\"description\";s:39:\"Provides access to nodes through cobalt\";s:7:\"package\";s:6:\"Cobalt\";s:12:\"dependencies\";a:1:{i:0;s:6:\"cobalt\";}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cobalt/cobalttaxonomy.module','cobalttaxonomy','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:15:\"Cobalt Taxonomy\";s:4:\"core\";s:3:\"6.x\";s:11:\"description\";s:44:\"Provides access to taxonomies through cobalt\";s:7:\"package\";s:6:\"Cobalt\";s:12:\"dependencies\";a:1:{i:0;s:6:\"cobalt\";}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cobalt/cobaltusers.module','cobaltusers','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:12:\"Cobalt Users\";s:4:\"core\";s:3:\"6.x\";s:11:\"description\";s:39:\"Provides access to users through cobalt\";s:7:\"package\";s:6:\"Cobalt\";s:12:\"dependencies\";a:1:{i:0;s:6:\"cobalt\";}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/coder/coder.module','coder','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:5:\"Coder\";s:11:\"description\";s:66:\"Developer Module that assists with code review and version upgrade\";s:7:\"package\";s:11:\"Development\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:13:\"6.x-2.0-beta1\";s:7:\"project\";s:5:\"coder\";s:9:\"datestamp\";s:10:\"1256306115\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/color/color.module','color','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:5:\"Color\";s:11:\"description\";s:61:\"Allows the user to change the color scheme of certain themes.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/comment/comment.module','comment','module','',1,0,0,6003,0,'a:10:{s:4:\"name\";s:7:\"Comment\";s:11:\"description\";s:57:\"Allows users to comment on and discuss published content.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/contact/contact.module','contact','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Contact\";s:11:\"description\";s:61:\"Enables the use of both personal and site-wide contact forms.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/content.module','content','module','',1,0,0,6010,0,'a:10:{s:4:\"name\";s:7:\"Content\";s:11:\"description\";s:50:\"Allows administrators to define new content types.\";s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1276685405\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/content_copy/content_copy.module','content_copy','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"Content Copy\";s:11:\"description\";s:51:\"Enables ability to import/export field definitions.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1276685405\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/content_permissions/content_permissions.module','content_permissions','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Content Permissions\";s:11:\"description\";s:43:\"Set field-level permissions for CCK fields.\";s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1276685405\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cssdry/cssdry.module','cssdry','module','',0,0,0,-1,0,'a:7:{s:4:\"name\";s:6:\"CssDry\";s:11:\"description\";s:54:\"Utility module that makes it possible to write DRY CSS\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date/date.module','date','module','',1,0,0,6005,0,'a:10:{s:4:\"name\";s:4:\"Date\";s:11:\"description\";s:41:\"Defines CCK date/time fields and widgets.\";s:12:\"dependencies\";a:3:{i:0;s:7:\"content\";i:1;s:8:\"date_api\";i:2;s:13:\"date_timezone\";}s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.4\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1253103320\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_api.module','date_api','module','',1,0,0,6005,0,'a:10:{s:4:\"name\";s:8:\"Date API\";s:11:\"description\";s:45:\"A Date API that can be used by other modules.\";s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.4\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1253103320\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_locale/date_locale.module','date_locale','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:11:\"Date Locale\";s:11:\"description\";s:124:\"Allows the site admin to configure multiple formats for date/time display to tailor dates for a specific locale or audience.\";s:7:\"package\";s:9:\"Date/Time\";s:12:\"dependencies\";a:2:{i:0;s:8:\"date_api\";i:1;s:6:\"locale\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.4\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1253103320\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_php4/date_php4.module','date_php4','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:9:\"Date PHP4\";s:11:\"description\";s:134:\"Emulate PHP 5.2 date functions in PHP 4.x, PHP 5.0, and PHP 5.1. Required when using the Date API with PHP versions less than PHP 5.2.\";s:7:\"package\";s:9:\"Date/Time\";s:12:\"dependencies\";a:1:{i:0;s:8:\"date_api\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.4\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1253103320\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_popup/date_popup.module','date_popup','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Date Popup\";s:11:\"description\";s:84:\"Enables jquery popup calendars and time entry widgets for selecting dates and times.\";s:12:\"dependencies\";a:2:{i:0;s:8:\"date_api\";i:1;s:13:\"date_timezone\";}s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.4\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1253103320\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_repeat/date_repeat.module','date_repeat','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:15:\"Date Repeat API\";s:11:\"description\";s:73:\"A Date Repeat API to calculate repeating dates and times from iCal rules.\";s:12:\"dependencies\";a:1:{i:0;s:8:\"date_api\";}s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.4\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1253103320\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_timezone/date_timezone.module','date_timezone','module','',1,0,0,5200,0,'a:10:{s:4:\"name\";s:13:\"Date Timezone\";s:11:\"description\";s:111:\"Needed when using Date API. Overrides site and user timezone handling to set timezone names instead of offsets.\";s:7:\"package\";s:9:\"Date/Time\";s:12:\"dependencies\";a:1:{i:0;s:8:\"date_api\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.4\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1253103320\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_tools/date_tools.module','date_tools','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Date Tools\";s:11:\"description\";s:52:\"Tools to import and auto-create dates and calendars.\";s:12:\"dependencies\";a:2:{i:0;s:7:\"content\";i:1;s:4:\"date\";}s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.4\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1253103320\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/dblog/dblog.module','dblog','module','',1,0,0,6000,0,'a:10:{s:4:\"name\";s:16:\"Database logging\";s:11:\"description\";s:47:\"Logs and records system events to the database.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/devel/devel.module','devel','module','',1,0,1,6002,88,'a:10:{s:4:\"name\";s:5:\"Devel\";s:11:\"description\";s:52:\"Various blocks, pages, and functions for developers.\";s:7:\"package\";s:11:\"Development\";s:12:\"dependencies\";a:1:{i:0;s:4:\"menu\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.20\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1271886306\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/devel/devel_generate.module','devel_generate','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:14:\"Devel generate\";s:11:\"description\";s:48:\"Generate dummy users, nodes, and taxonomy terms.\";s:7:\"package\";s:11:\"Development\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.20\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1271886306\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/devel/devel_node_access.module','devel_node_access','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:17:\"Devel node access\";s:11:\"description\";s:67:\"Developer block and page illustrating relevant node_access records.\";s:7:\"package\";s:11:\"Development\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.20\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1271886306\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/devel/devel_themer.module','devel_themer','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:15:\"Theme developer\";s:11:\"description\";s:52:\"Essential theme API information for theme developers\";s:7:\"package\";s:11:\"Development\";s:12:\"dependencies\";a:1:{i:0;s:5:\"devel\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.17\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1250713853\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/fieldgroup/fieldgroup.module','fieldgroup','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Fieldgroup\";s:11:\"description\";s:37:\"Create display groups for CCK fields.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1276685405\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/services/services/file_service/file_service.module','file_service','module','',0,0,0,-1,0,'a:10:{s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:8:\"services\";}s:11:\"description\";s:24:\"Provides a file service.\";s:4:\"name\";s:12:\"File Service\";s:7:\"package\";s:19:\"Services - services\";s:7:\"version\";s:8:\"6.x-0.15\";s:7:\"project\";s:8:\"services\";s:9:\"datestamp\";s:10:\"1247541359\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/filefield/filefield.module','filefield','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:9:\"FileField\";s:11:\"description\";s:26:\"Defines a file field type.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.0\";s:7:\"version\";s:7:\"6.x-3.7\";s:7:\"project\";s:9:\"filefield\";s:9:\"datestamp\";s:10:\"1277943012\";s:10:\"dependents\";a:0:{}}'),('sites/all/modules/filefield/filefield_meta/filefield_meta.module','filefield_meta','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"FileField Meta\";s:11:\"description\";s:48:\"Add metadata gathering and storage to FileField.\";s:12:\"dependencies\";a:2:{i:0;s:9:\"filefield\";i:1;s:6:\"getid3\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.0\";s:7:\"version\";s:7:\"6.x-3.7\";s:7:\"project\";s:9:\"filefield\";s:9:\"datestamp\";s:10:\"1277943012\";s:10:\"dependents\";a:0:{}}'),('modules/filter/filter.module','filter','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:6:\"Filter\";s:11:\"description\";s:60:\"Handles the filtering of content in preparation for display.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/flag/flag.module','flag','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Flag\";s:11:\"description\";s:54:\"Create customized flags that users can set on content.\";s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:5:\"Flags\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"flag\";s:9:\"datestamp\";s:10:\"1237042847\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/flag/flag_actions.module','flag_actions','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"Flag actions\";s:11:\"description\";s:31:\"Execute actions on Flag events.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:4:\"flag\";}s:7:\"package\";s:5:\"Flags\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"flag\";s:9:\"datestamp\";s:10:\"1237042847\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/forum/forum.module','forum','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:5:\"Forum\";s:11:\"description\";s:50:\"Enables threaded discussions about general topics.\";s:12:\"dependencies\";a:2:{i:0;s:8:\"taxonomy\";i:1;s:7:\"comment\";}s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/google_analytics/googleanalytics.module','googleanalytics','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:16:\"Google Analytics\";s:11:\"description\";s:72:\"Adds Google Analytics javascript tracking code to all your site\'s pages.\";s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:10:\"Statistics\";s:7:\"version\";s:7:\"6.x-2.2\";s:7:\"project\";s:16:\"google_analytics\";s:9:\"datestamp\";s:10:\"1238610067\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/help/help.module','help','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"Help\";s:11:\"description\";s:35:\"Manages the display of online help.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/advanced_help/help_example/help_example.module','help_example','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:21:\"Advanced help example\";s:11:\"description\";s:62:\"A example help module to demonstrate the advanced help module.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:13:\"advanced_help\";}s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:13:\"advanced_help\";s:9:\"datestamp\";s:10:\"1238954409\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18n.module','i18n','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:20:\"Internationalization\";s:11:\"description\";s:49:\"Extends Drupal support for multilingual features.\";s:12:\"dependencies\";a:2:{i:0;s:6:\"locale\";i:1;s:11:\"translation\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1270669810\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18nblocks/i18nblocks.module','i18nblocks','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:17:\"Block translation\";s:11:\"description\";s:50:\"Enables multilingual blocks and block translation.\";s:12:\"dependencies\";a:2:{i:0;s:4:\"i18n\";i:1;s:11:\"i18nstrings\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1270669810\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18ncontent/i18ncontent.module','i18ncontent','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:24:\"Content type translation\";s:11:\"description\";s:99:\"Add multilingual options for content and translate related strings: name, description, help text...\";s:12:\"dependencies\";a:1:{i:0;s:11:\"i18nstrings\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1270669810\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18nmenu/i18nmenu.module','i18nmenu','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:16:\"Menu translation\";s:11:\"description\";s:40:\"Supports translatable custom menu items.\";s:12:\"dependencies\";a:4:{i:0;s:4:\"i18n\";i:1;s:4:\"menu\";i:2;s:10:\"i18nblocks\";i:3;s:11:\"i18nstrings\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1270669810\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18npoll/i18npoll.module','i18npoll','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Poll aggregate\";s:11:\"description\";s:45:\"Aggregates poll results for all translations.\";s:12:\"dependencies\";a:2:{i:0;s:11:\"translation\";i:1;s:4:\"poll\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1270669810\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18nprofile/i18nprofile.module','i18nprofile','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Profile translation\";s:11:\"description\";s:36:\"Enables multilingual profile fields.\";s:12:\"dependencies\";a:2:{i:0;s:7:\"profile\";i:1;s:11:\"i18nstrings\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1270669810\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18nstrings/i18nstrings.module','i18nstrings','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:18:\"String translation\";s:11:\"description\";s:57:\"Provides support for translation of user defined strings.\";s:12:\"dependencies\";a:1:{i:0;s:6:\"locale\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1270669810\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18nsync/i18nsync.module','i18nsync','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:24:\"Synchronize translations\";s:11:\"description\";s:74:\"Synchronizes taxonomy and fields accross translations of the same content.\";s:12:\"dependencies\";a:1:{i:0;s:4:\"i18n\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1270669810\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18ntaxonomy/i18ntaxonomy.module','i18ntaxonomy','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:20:\"Taxonomy translation\";s:11:\"description\";s:30:\"Enables multilingual taxonomy.\";s:12:\"dependencies\";a:3:{i:0;s:4:\"i18n\";i:1;s:8:\"taxonomy\";i:2;s:11:\"i18nstrings\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1270669810\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18nviews/i18nviews.module','i18nviews','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:17:\"Views translation\";s:11:\"description\";s:80:\"Translation of views strings and content selection for views. Requires Views 3.x\";s:12:\"dependencies\";a:3:{i:0;s:5:\"views\";i:1;s:11:\"i18nstrings\";i:2;s:12:\"i18ntaxonomy\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1270669810\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/imageapi/imageapi.module','imageapi','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"ImageAPI\";s:11:\"description\";s:38:\"ImageAPI supporting multiple toolkits.\";s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.1\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:8:\"imageapi\";s:9:\"datestamp\";s:10:\"1239992203\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}}'),('sites/all/modules/imageapi/imageapi_gd.module','imageapi_gd','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"ImageAPI GD2\";s:11:\"description\";s:49:\"Uses PHP\'s built-in GD2 image processing support.\";s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:8:\"imageapi\";s:9:\"datestamp\";s:10:\"1239992203\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/imageapi/imageapi_imagemagick.module','imageapi_imagemagick','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:20:\"ImageAPI ImageMagick\";s:11:\"description\";s:33:\"Command Line ImageMagick support.\";s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:8:\"imageapi\";s:9:\"datestamp\";s:10:\"1239992203\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/imagecache/imagecache.module','imagecache','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"ImageCache\";s:11:\"description\";s:36:\"Dynamic image manipulator and cache.\";s:7:\"package\";s:10:\"ImageCache\";s:12:\"dependencies\";a:1:{i:0;s:8:\"imageapi\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:14:\"6.x-2.0-beta10\";s:7:\"project\";s:10:\"imagecache\";s:9:\"datestamp\";s:10:\"1250716281\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/imagecache_action_cover/imagecache_action_cover.module','imagecache_action_cover','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:21:\"Cover and crop action\";s:11:\"description\";s:79:\"Scales a image so that it covers a specified width and height and then crops it\";s:7:\"package\";s:10:\"ImageCache\";s:12:\"dependencies\";a:1:{i:0;s:10:\"imagecache\";}s:7:\"version\";s:3:\"0.1\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/imagecache/imagecache_ui.module','imagecache_ui','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:13:\"ImageCache UI\";s:11:\"description\";s:26:\"ImageCache User Interface.\";s:12:\"dependencies\";a:2:{i:0;s:10:\"imagecache\";i:1;s:8:\"imageapi\";}s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:14:\"6.x-2.0-beta10\";s:7:\"project\";s:10:\"imagecache\";s:9:\"datestamp\";s:10:\"1250716281\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/imagefield/imagefield.module','imagefield','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"ImageField\";s:11:\"description\";s:28:\"Defines an image field type.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:2:{i:0;s:7:\"content\";i:1;s:9:\"filefield\";}s:7:\"package\";s:3:\"CCK\";s:7:\"version\";s:7:\"6.x-3.7\";s:7:\"project\";s:10:\"imagefield\";s:9:\"datestamp\";s:10:\"1277942710\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/inputstream/inputstream.module','inputstream','module','',1,0,0,0,0,'a:7:{s:4:\"name\";s:19:\"Input stream helper\";s:11:\"description\";s:87:\"Provides a stream-wrapper for drupal://input that should be used instead of php://input\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.2\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;}'),('modules/locale/locale.module','locale','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Locale\";s:11:\"description\";s:119:\"Adds language handling functionality and enables the translation of the user interface to languages other than English.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/logintoboggan/logintoboggan.module','logintoboggan','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:13:\"LoginToboggan\";s:11:\"description\";s:31:\"Improves Drupal\'s login system.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:13:\"logintoboggan\";s:9:\"datestamp\";s:10:\"1255705891\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/menu/menu.module','menu','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"Menu\";s:11:\"description\";s:60:\"Allows administrators to customize the site navigation menu.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/services/services/menu_service/menu_service.module','menu_service','module','',0,0,0,-1,0,'a:10:{s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:8:\"services\";}s:11:\"description\";s:24:\"Provides a menu service.\";s:4:\"name\";s:12:\"Menu Service\";s:7:\"package\";s:19:\"Services - services\";s:7:\"version\";s:8:\"6.x-0.15\";s:7:\"project\";s:8:\"services\";s:9:\"datestamp\";s:10:\"1247541359\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/mimedetect/mimedetect.module','mimedetect','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:10:\"MimeDetect\";s:11:\"description\";s:53:\"Provides common mime type detection for Drupal sites.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:10:\"mimedetect\";s:9:\"datestamp\";s:10:\"1241891444\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/nodeformcols/nfcbiblio.module','nfcbiblio','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:20:\"Biblio compatability\";s:11:\"description\";s:30:\"Adds support for biblio fields\";s:12:\"dependencies\";a:2:{i:0;s:12:\"nodeformcols\";i:1;s:6:\"biblio\";}s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:17:\"Node form columns\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/nodeformcols/nfccaptcha.module','nfccaptcha','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:21:\"CAPTCHA compatability\";s:11:\"description\";s:38:\"Adds support for CAPTCHA in node forms\";s:12:\"dependencies\";a:2:{i:0;s:12:\"nodeformcols\";i:1;s:7:\"captcha\";}s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:17:\"Node form columns\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('modules/node/node.module','node','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"Node\";s:11:\"description\";s:66:\"Allows content to be submitted to the site and displayed on pages.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/services/services/node_service/node_service.module','node_service','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"Node Service\";s:11:\"description\";s:24:\"Provides a node service.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:2:{i:0;s:8:\"services\";i:1;s:4:\"node\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-0.15\";s:7:\"project\";s:8:\"services\";s:9:\"datestamp\";s:10:\"1247541359\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/nodeformcols/nodeformcols.module','nodeformcols','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:17:\"Node form columns\";s:11:\"description\";s:55:\"Separates the node forms into two columns and a footer.\";s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:17:\"Node form columns\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/nodereference/nodereference.module','nodereference','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Node Reference\";s:11:\"description\";s:59:\"Defines a field type for referencing one node from another.\";s:12:\"dependencies\";a:3:{i:0;s:7:\"content\";i:1;s:4:\"text\";i:2;s:13:\"optionwidgets\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1276685405\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/nodewords/nodewords.module','nodewords','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:9:\"Nodewords\";s:11:\"description\";s:160:\"Allows users to add meta tags, e.g. keywords or description. This module doesn\'t actually implement any meta tags, but requires other modules to implement them.\";s:7:\"package\";s:9:\"Nodewords\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:9:\"nodewords\";s:9:\"datestamp\";s:10:\"1253722248\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/number/number.module','number','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Number\";s:11:\"description\";s:28:\"Defines numeric field types.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1276685405\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/oauth/oauth_common.module','oauth_common','module','',1,0,0,6201,0,'a:8:{s:4:\"name\";s:5:\"OAuth\";s:11:\"description\";s:28:\"Provides OAuth functionality\";s:7:\"package\";s:5:\"OAuth\";s:12:\"dependencies\";a:3:{i:0;s:8:\"autoload\";i:1;s:11:\"inputstream\";i:2;s:6:\"ctools\";}s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.2\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;}'),('sites/all/modules/oauth/oauth_common_consumerui.module','oauth_common_consumerui','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:17:\"OAuth Consumer UI\";s:11:\"description\";s:53:\"Provides a UI for when OAuth is acting as a consumer.\";s:7:\"package\";s:5:\"OAuth\";s:12:\"dependencies\";a:1:{i:0;s:12:\"oauth_common\";}s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.2\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;}'),('sites/all/modules/oauth/oauth_common_providerui.module','oauth_common_providerui','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:17:\"OAuth Provider UI\";s:11:\"description\";s:53:\"Provides a UI for when OAuth is acting as a provider.\";s:7:\"package\";s:5:\"OAuth\";s:12:\"dependencies\";a:1:{i:0;s:12:\"oauth_common\";}s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.2\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;}'),('sites/all/modules/oembed/oembed.module','oembed','module','',0,0,0,-1,0,'a:8:{s:7:\"package\";s:6:\"oEmbed\";s:4:\"name\";s:13:\"oEmbed Filter\";s:11:\"description\";s:51:\"Replaces oEmbed-enabled URL:s with embedded content\";s:12:\"dependencies\";a:2:{i:0;s:10:\"oembedcore\";i:1;s:6:\"filter\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/oembed/oembedcore.module','oembedcore','module','',0,0,0,-1,0,'a:8:{s:7:\"package\";s:6:\"oEmbed\";s:4:\"name\";s:11:\"oEmbed Core\";s:11:\"description\";s:51:\"Common functionality for oEmbed client and provider\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:6:\"ctools\";}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/oembed/oembedprovider.module','oembedprovider','module','',0,0,0,-1,0,'a:8:{s:7:\"package\";s:6:\"oEmbed\";s:4:\"name\";s:15:\"oEmbed Provider\";s:11:\"description\";s:38:\"Turns your site into a oEmbed provider\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:10:\"oembedcore\";}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('modules/openid/openid.module','openid','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"OpenID\";s:11:\"description\";s:48:\"Allows users to log into your site using OpenID.\";s:7:\"version\";s:4:\"6.17\";s:7:\"package\";s:15:\"Core - optional\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/opensearchplugin/opensearchplugin.module','opensearchplugin','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:17:\"OpenSearch Plugin\";s:11:\"description\";s:71:\"Provides browser search integration via the OpenSearch plugin protocal.\";s:12:\"dependencies\";a:1:{i:0;s:6:\"search\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:16:\"opensearchplugin\";s:9:\"datestamp\";s:10:\"1203192009\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/optionwidgets/optionwidgets.module','optionwidgets','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Option Widgets\";s:11:\"description\";s:82:\"Defines selection, check box and radio button widgets for text and numeric fields.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1276685405\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/path/path.module','path','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Path\";s:11:\"description\";s:28:\"Allows users to rename URLs.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/pathauto/pathauto.module','pathauto','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Pathauto\";s:11:\"description\";s:95:\"Provides a mechanism for modules to automatically generate aliases for the content they manage.\";s:12:\"dependencies\";a:2:{i:0;s:4:\"path\";i:1;s:5:\"token\";}s:8:\"suggests\";a:1:{i:0;s:13:\"path_redirect\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.3\";s:7:\"project\";s:8:\"pathauto\";s:9:\"datestamp\";s:10:\"1267299906\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/devel/performance/performance.module','performance','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Performance Logging\";s:11:\"description\";s:91:\"Logs detailed and/or summary page generation time and memory consumption for page requests.\";s:7:\"package\";s:11:\"Development\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.20\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1271886306\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/php/php.module','php','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"PHP filter\";s:11:\"description\";s:50:\"Allows embedded PHP code/snippets to be evaluated.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/ping/ping.module','ping','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Ping\";s:11:\"description\";s:51:\"Alerts other sites when your site has been updated.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/poll/poll.module','poll','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Poll\";s:11:\"description\";s:95:\"Allows your site to capture votes on different topics in the form of multiple choice questions.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/potx/potx.module','potx','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:30:\"Translation template extractor\";s:11:\"description\";s:106:\"Provides a web interface and an API to extract translatable text from the sources of installed components.\";s:12:\"dependencies\";a:1:{i:0;s:6:\"locale\";}s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:13:\"Multilanguage\";s:7:\"version\";s:7:\"6.x-3.2\";s:7:\"project\";s:4:\"potx\";s:9:\"datestamp\";s:10:\"1273245607\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/profile/profile.module','profile','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Profile\";s:11:\"description\";s:36:\"Supports configurable user profiles.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/query_builder/query_builder.module','query_builder','module','',1,0,0,0,0,'a:7:{s:4:\"name\";s:13:\"Query Builder\";s:11:\"description\";s:43:\"Provides a a class for building SQL-queries\";s:12:\"dependencies\";a:1:{i:0;s:8:\"autoload\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/rest_server/rest_server.module','rest_server','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:11:\"REST Server\";s:11:\"description\";s:24:\"Provides an REST server.\";s:7:\"package\";s:18:\"Services - servers\";s:12:\"dependencies\";a:3:{i:0;s:8:\"services\";i:1;s:11:\"inputstream\";i:2;s:8:\"autoload\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('modules/search/search.module','search','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Search\";s:11:\"description\";s:36:\"Enables site-wide keyword searching.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/services/services/search_service/search_service.module','search_service','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Search Service\";s:11:\"description\";s:26:\"Provides a search service.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:2:{i:0;s:8:\"services\";i:1;s:6:\"search\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-0.15\";s:7:\"project\";s:8:\"services\";s:9:\"datestamp\";s:10:\"1247541359\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/securesite/securesite.module','securesite','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:11:\"Secure Site\";s:11:\"description\";s:67:\"Enables HTTP Auth security or an HTML form to restrict site access.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.4\";s:7:\"project\";s:10:\"securesite\";s:9:\"datestamp\";s:10:\"1254487917\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/services/services.module','services','module','',1,0,0,6300,0,'a:8:{s:4:\"name\";s:8:\"Services\";s:11:\"description\";s:41:\"Provide an API for creating web services.\";s:7:\"package\";s:8:\"Services\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.x\";s:12:\"dependencies\";a:1:{i:0;s:6:\"ctools\";}s:10:\"dependents\";a:0:{}s:7:\"version\";N;}'),('sites/all/modules/services/auth/services_oauth/services_oauth.module','services_oauth','module','',1,0,0,6200,0,'a:8:{s:4:\"name\";s:20:\"OAuth Authentication\";s:11:\"description\";s:53:\"Provides OAuth authentication for the services module\";s:7:\"package\";s:25:\"Services - authentication\";s:12:\"dependencies\";a:2:{i:0;s:8:\"services\";i:1;s:12:\"oauth_common\";}s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.2\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;}'),('sites/default/modules/services_oop/services_oop.module','services_oop','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:12:\"Services OOP\";s:11:\"description\";s:73:\"Utility functions for working with services in a more OOP-friendly manner\";s:7:\"package\";s:8:\"Services\";s:12:\"dependencies\";a:1:{i:0;s:8:\"autoload\";}s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.2\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;}'),('sites/all/modules/services/auth/services_sessauth/services_sessauth.module','services_sessauth','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:22:\"Session Authentication\";s:11:\"description\";s:55:\"Provides session authentication for the services module\";s:7:\"package\";s:25:\"Services - authentication\";s:12:\"dependencies\";a:1:{i:0;s:8:\"services\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/simple_geo/simple_geo.module','simple_geo','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:10:\"Simple Geo\";s:7:\"version\";s:11:\"6.x-0.x-dev\";s:4:\"core\";s:3:\"6.x\";s:11:\"description\";s:44:\"Allows nodes to add point and polygon fields\";s:7:\"package\";s:3:\"Geo\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/statistics/statistics.module','statistics','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Statistics\";s:11:\"description\";s:37:\"Logs access statistics for your site.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/syslog/syslog.module','syslog','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Syslog\";s:11:\"description\";s:41:\"Logs and records system events to syslog.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/services/services/system_service/system_service.module','system_service','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"System Service\";s:11:\"description\";s:25:\"Provides system services.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:1:{i:0;s:8:\"services\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-0.15\";s:7:\"project\";s:8:\"services\";s:9:\"datestamp\";s:10:\"1247541359\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/taxonomy/taxonomy.module','taxonomy','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:8:\"Taxonomy\";s:11:\"description\";s:38:\"Enables the categorization of content.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/services/services/taxonomy_service/taxonomy_service.module','taxonomy_service','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:16:\"Taxonomy Service\";s:11:\"description\";s:28:\"Provides a taxonomy service.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:2:{i:0;s:8:\"services\";i:1;s:8:\"taxonomy\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-0.15\";s:7:\"project\";s:8:\"services\";s:9:\"datestamp\";s:10:\"1247541359\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/text/text.module','text','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Text\";s:11:\"description\";s:32:\"Defines simple text field types.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1276685405\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/textile/textile.module','textile','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:7:\"Textile\";s:11:\"description\";s:108:\"Allows content to be submitted using Textile, a simple, plain text syntax that is filtered into valid XHTML.\";s:7:\"version\";s:7:\"6.x-2.0\";s:7:\"project\";s:7:\"textile\";s:9:\"datestamp\";s:10:\"1223933157\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/throttle/throttle.module','throttle','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Throttle\";s:11:\"description\";s:66:\"Handles the auto-throttling mechanism, to control site congestion.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/token/token.module','token','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:5:\"Token\";s:11:\"description\";s:79:\"Provides a shared API for replacement of textual placeholders with actual data.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.12\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1243895498\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/token/tokenSTARTER.module','tokenSTARTER','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:12:\"TokenSTARTER\";s:11:\"description\";s:72:\"Provides additional tokens and a base on which to build your own tokens.\";s:12:\"dependencies\";a:1:{i:0;s:5:\"token\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.12\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1243895498\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/token/token_actions.module','token_actions','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:13:\"Token actions\";s:11:\"description\";s:73:\"Provides enhanced versions of core Drupal actions using the Token module.\";s:12:\"dependencies\";a:1:{i:0;s:5:\"token\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.12\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1243895498\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/tracker/tracker.module','tracker','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Tracker\";s:11:\"description\";s:43:\"Enables tracking of recent posts for users.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"comment\";}s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/translation/translation.module','translation','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Content translation\";s:11:\"description\";s:57:\"Allows content to be translated into different languages.\";s:12:\"dependencies\";a:1:{i:0;s:6:\"locale\";}s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/transliteration/transliteration.module','transliteration','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:15:\"Transliteration\";s:11:\"description\";s:71:\"Provides transliteration for UTF-8 text input and sanitizes file names.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.1\";s:7:\"project\";s:15:\"transliteration\";s:9:\"datestamp\";s:10:\"1244575458\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/trigger/trigger.module','trigger','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Trigger\";s:11:\"description\";s:90:\"Enables actions to be fired on certain system events, such as when new content is created.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/update/update.module','update','module','',1,0,0,6000,0,'a:10:{s:4:\"name\";s:13:\"Update status\";s:11:\"description\";s:88:\"Checks the status of available updates for Drupal and your installed modules and themes.\";s:7:\"version\";s:4:\"6.17\";s:7:\"package\";s:15:\"Core - optional\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/upload/upload.module','upload','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Upload\";s:11:\"description\";s:51:\"Allows users to upload and attach files to content.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/user/user.module','user','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"User\";s:11:\"description\";s:47:\"Manages the user registration and login system.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.17\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1275505216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/services/services/user_service/user_service.module','user_service','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"User Service\";s:11:\"description\";s:24:\"Provides a user service.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:2:{i:0;s:8:\"services\";i:1;s:4:\"user\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-0.15\";s:7:\"project\";s:8:\"services\";s:9:\"datestamp\";s:10:\"1247541359\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/userreference/userreference.module','userreference','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"User Reference\";s:11:\"description\";s:56:\"Defines a field type for referencing a user from a node.\";s:12:\"dependencies\";a:3:{i:0;s:7:\"content\";i:1;s:4:\"text\";i:2;s:13:\"optionwidgets\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1276685405\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/views/views.module','views','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:5:\"Views\";s:11:\"description\";s:55:\"Create customized lists and queries from your database.\";s:7:\"package\";s:5:\"Views\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-2.11\";s:7:\"project\";s:5:\"views\";s:9:\"datestamp\";s:10:\"1276743614\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/views/views_export/views_export.module','views_export','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Views exporter\";s:11:\"description\";s:40:\"Allows exporting multiple views at once.\";s:7:\"package\";s:5:\"Views\";s:12:\"dependencies\";a:1:{i:0;s:5:\"views\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-2.11\";s:7:\"project\";s:5:\"views\";s:9:\"datestamp\";s:10:\"1276743614\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/services/services/views_service/views_service.module','views_service','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:13:\"Views Service\";s:11:\"description\";s:25:\"Provides a views service.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:2:{i:0;s:8:\"services\";i:1;s:5:\"views\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-0.15\";s:7:\"project\";s:8:\"services\";s:9:\"datestamp\";s:10:\"1247541359\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/views/views_ui.module','views_ui','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Views UI\";s:11:\"description\";s:93:\"Administrative interface to views. Without this module, you cannot create or edit your views.\";s:7:\"package\";s:5:\"Views\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:5:\"views\";}s:7:\"version\";s:8:\"6.x-2.11\";s:7:\"project\";s:5:\"views\";s:9:\"datestamp\";s:10:\"1276743614\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/rest_server/formats/xcal_format.module','xcal_format','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:21:\"xCal and iCal formats\";s:11:\"description\";s:54:\"Provides xCal and iCal formatters for the REST server.\";s:7:\"package\";s:8:\"Services\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;}'),('sites/all/modules/services/servers/xmlrpc_server/xmlrpc_server.module','xmlrpc_server','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:13:\"XMLRPC Server\";s:11:\"description\";s:26:\"Provides an XMLRPC server.\";s:7:\"package\";s:18:\"Services - servers\";s:12:\"dependencies\";a:1:{i:0;s:8:\"services\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/admin/admin.module','admin','module','',1,0,0,6202,1,'a:10:{s:4:\"name\";s:5:\"Admin\";s:11:\"description\";s:42:\"UI helpers for Drupal admins and managers.\";s:7:\"package\";s:14:\"Administration\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:13:\"6.x-2.0-beta4\";s:7:\"project\";s:5:\"admin\";s:9:\"datestamp\";s:10:\"1277312104\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/nodewords/basic_metatags/basic_metatags.module','basic_metatags','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:15:\"Basic meta tags\";s:11:\"description\";s:83:\"Allows users to add basic meta tags to node, user profile, and taxonomy term pages.\";s:12:\"dependencies\";a:1:{i:0;s:9:\"nodewords\";}s:7:\"package\";s:9:\"Nodewords\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:9:\"nodewords\";s:9:\"datestamp\";s:10:\"1253722248\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/ctools/bulk_export/bulk_export.module','bulk_export','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:11:\"Bulk Export\";s:11:\"description\";s:67:\"Performs bulk exporting of data objects known about by Chaos tools.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:6:\"ctools\";}s:7:\"package\";s:16:\"Chaos tool suite\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1275441007\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/ctools/ctools.module','ctools','module','',1,0,0,6004,0,'a:10:{s:4:\"name\";s:11:\"Chaos tools\";s:11:\"description\";s:46:\"A library of helpful tools by Merlin of Chaos.\";s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:16:\"Chaos tool suite\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1275441007\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/ctools/ctools_plugin_example/ctools_plugin_example.module','ctools_plugin_example','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:35:\"Chaos Tools (CTools) Plugin Example\";s:11:\"description\";s:75:\"Shows how an external module can provide ctools plugins (for Panels, etc.).\";s:7:\"package\";s:16:\"Chaos tool suite\";s:12:\"dependencies\";a:4:{i:0;s:6:\"ctools\";i:1;s:6:\"panels\";i:2;s:12:\"page_manager\";i:3;s:13:\"advanced_help\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1275441007\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/nodewords/extra_metatags/extra_metatags.module','extra_metatags','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:15:\"Extra meta tags\";s:11:\"description\";s:166:\"Allows users to add extra meta tags to node, user profile, and taxonomy term pages; it also allows the user to add custom meta tags by adding custom definition files.\";s:12:\"dependencies\";a:1:{i:0;s:9:\"nodewords\";}s:7:\"package\";s:9:\"Nodewords\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:9:\"nodewords\";s:9:\"datestamp\";s:10:\"1253722248\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/tests/i18n_test.module','i18n_test','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:26:\"Internationalization tests\";s:11:\"description\";s:55:\"Helper module for testing i18n (do not enable manually)\";s:12:\"dependencies\";a:3:{i:0;s:6:\"locale\";i:1;s:11:\"translation\";i:2;s:4:\"i18n\";}s:7:\"package\";s:5:\"Devel\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1270669810\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18ncck/i18ncck.module','i18ncck','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:15:\"CCK translation\";s:11:\"description\";s:56:\"Supports translatable custom CCK fields and fieldgroups.\";s:12:\"dependencies\";a:3:{i:0;s:4:\"i18n\";i:1;s:7:\"content\";i:2;s:11:\"i18nstrings\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1270669810\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/oembed/oembedembedly.module','oembedembedly','module','',0,0,0,-1,0,'a:8:{s:7:\"package\";s:6:\"oEmbed\";s:4:\"name\";s:15:\"oEmbed Embed.ly\";s:11:\"description\";s:52:\"Provides definitions for all of Embed.ly:s providers\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:10:\"oembedcore\";}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/oembed/oembedfield.module','oembedfield','module','',0,0,0,-1,0,'a:8:{s:7:\"package\";s:3:\"CCK\";s:4:\"name\";s:12:\"oEmbed Field\";s:11:\"description\";s:63:\"A formatter for the link field which embeds oembeddable content\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:2:{i:0;s:10:\"oembedcore\";i:1;s:4:\"link\";}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/ctools/page_manager/page_manager.module','page_manager','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"Page manager\";s:11:\"description\";s:54:\"Provides a UI and API to manage pages within the site.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:6:\"ctools\";}s:7:\"package\";s:16:\"Chaos tool suite\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1275441007\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/potx/tests/potx_test_6.module','potx_test_6','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:37:\"Translation template extractor tester\";s:11:\"description\";s:16:\"Test description\";s:7:\"package\";s:12:\"Test package\";s:7:\"version\";s:7:\"6.x-3.2\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:4:\"potx\";s:9:\"datestamp\";s:10:\"1273245607\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/nodewords/site_verification/site_verification.module','site_verification','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:17:\"Site verification\";s:11:\"description\";s:74:\"Allows users to add site verification meta tags some web services require.\";s:12:\"dependencies\";a:1:{i:0;s:9:\"nodewords\";}s:7:\"package\";s:9:\"Nodewords\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:9:\"nodewords\";s:9:\"datestamp\";s:10:\"1253722248\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/smtp/smtp.module','smtp','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:27:\"SMTP Authentication Support\";s:11:\"description\";s:72:\"Allows the sending of site e-mail through an SMTP server of your choice.\";s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:4:\"Mail\";s:3:\"php\";s:5:\"4.0.0\";s:7:\"version\";s:13:\"6.x-1.0-beta3\";s:7:\"project\";s:4:\"smtp\";s:9:\"datestamp\";s:10:\"1222209321\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}}'),('sites/all/modules/ctools/views_content/views_content.module','views_content','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Views content panes\";s:11:\"description\";s:104:\"Allows Views content to be used in Panels, Dashboard and other modules which use the CTools Content API.\";s:7:\"package\";s:16:\"Chaos tool suite\";s:12:\"dependencies\";a:2:{i:0;s:6:\"ctools\";i:1;s:5:\"views\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:6:\"ctools\";s:9:\"datestamp\";s:10:\"1275441007\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/themes/acquia_slate/acquia_slate.info','acquia_slate','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:13:{s:4:\"name\";s:12:\"Acquia Slate\";s:11:\"description\";s:252:\"<a href=\"http://www.acquia.com\">Acquia\'s</a> Slate theme is ideal for corporate and business sites. Includes advanced theme settings and 12 flexible content regions for a variety of layouts. By <a href=\"http://www.topnotchthemes.com\">TopNotchThemes</a>\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:39:\"sites/all/themes/acquia_slate/style.css\";s:9:\"dblog.css\";s:39:\"sites/all/themes/acquia_slate/dblog.css\";}}s:7:\"scripts\";a:2:{s:9:\"script.js\";s:39:\"sites/all/themes/acquia_slate/script.js\";s:19:\"jquery.overlabel.js\";s:49:\"sites/all/themes/acquia_slate/jquery.overlabel.js\";}s:7:\"regions\";a:14:{s:13:\"sidebar_first\";s:13:\"sidebar first\";s:12:\"sidebar_last\";s:12:\"sidebar last\";s:6:\"banner\";s:6:\"banner\";s:10:\"header_top\";s:10:\"header top\";s:12:\"header_first\";s:12:\"header first\";s:13:\"header_middle\";s:13:\"header middle\";s:15:\"preface_sidebar\";s:21:\"front preface sidebar\";s:11:\"content_top\";s:17:\"inner content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:16:\"postscript_first\";s:16:\"postscript first\";s:17:\"postscript_middle\";s:17:\"postscript middle\";s:15:\"postscript_last\";s:15:\"postscript last\";s:6:\"footer\";s:6:\"footer\";s:11:\"node_bottom\";s:11:\"node bottom\";}s:8:\"features\";a:8:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:6:\"search\";i:5;s:7:\"favicon\";i:6;s:13:\"primary_links\";i:7;s:15:\"secondary_links\";}s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:12:\"acquia_slate\";s:9:\"datestamp\";s:10:\"1242218140\";s:10:\"screenshot\";s:44:\"sites/all/themes/acquia_slate/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/themes/rubik/rubik.info','rubik','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:15:{s:4:\"name\";s:5:\"Rubik\";s:11:\"description\";s:18:\"Clean admin theme.\";s:10:\"base theme\";s:3:\"tao\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"scripts\";a:1:{s:11:\"js/rubik.js\";s:34:\"sites/all/themes/rubik/js/rubik.js\";}s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:3:{s:8:\"core.css\";s:31:\"sites/all/themes/rubik/core.css\";s:9:\"icons.css\";s:32:\"sites/all/themes/rubik/icons.css\";s:9:\"style.css\";s:32:\"sites/all/themes/rubik/style.css\";}}s:7:\"regions\";a:1:{s:7:\"content\";s:7:\"Content\";}s:9:\"datestamp\";s:10:\"1267655587\";s:7:\"project\";s:5:\"rubik\";s:18:\"project status url\";s:39:\"http://code.developmentseed.org/fserver\";s:7:\"version\";s:13:\"6.x-1.0-beta8\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:10:\"screenshot\";s:37:\"sites/all/themes/rubik/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/themes/rubik/cube/cube.info','cube','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:17:{s:4:\"name\";s:4:\"Cube\";s:11:\"description\";s:44:\"Spaces-aware front-end theme based on Rubik.\";s:10:\"base theme\";s:5:\"rubik\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:6:\"screen\";a:1:{s:9:\"style.css\";s:37:\"sites/all/themes/rubik/cube/style.css\";}}s:7:\"regions\";a:4:{s:6:\"header\";s:6:\"Header\";s:7:\"content\";s:7:\"Content\";s:4:\"left\";s:4:\"Left\";s:5:\"right\";s:5:\"Right\";}s:9:\"designkit\";a:2:{s:5:\"color\";a:1:{s:10:\"background\";s:7:\"#0088cc\";}s:4:\"logo\";a:2:{s:4:\"logo\";s:23:\"imagecache_scale:200x50\";s:5:\"print\";s:24:\"imagecache_scale:600x150\";}}s:7:\"layouts\";a:5:{s:7:\"default\";a:3:{s:4:\"name\";s:7:\"Default\";s:11:\"description\";s:23:\"Simple one column page.\";s:8:\"template\";s:4:\"page\";}s:7:\"sidebar\";a:5:{s:4:\"name\";s:7:\"Sidebar\";s:11:\"description\";s:26:\"Main content with sidebar.\";s:10:\"stylesheet\";s:18:\"layout-sidebar.css\";s:8:\"template\";s:14:\"layout-sidebar\";s:7:\"regions\";a:2:{i:0;s:7:\"content\";i:1;s:5:\"right\";}}s:5:\"split\";a:5:{s:4:\"name\";s:5:\"Split\";s:11:\"description\";s:12:\"50/50 split.\";s:10:\"stylesheet\";s:16:\"layout-split.css\";s:8:\"template\";s:14:\"layout-sidebar\";s:7:\"regions\";a:2:{i:0;s:7:\"content\";i:1;s:5:\"right\";}}s:7:\"columns\";a:5:{s:4:\"name\";s:7:\"Columns\";s:11:\"description\";s:20:\"Three column layout.\";s:10:\"stylesheet\";s:18:\"layout-columns.css\";s:8:\"template\";s:14:\"layout-columns\";s:7:\"regions\";a:4:{i:0;s:6:\"header\";i:1;s:7:\"content\";i:2;s:4:\"left\";i:3;s:5:\"right\";}}s:6:\"offset\";a:5:{s:4:\"name\";s:15:\"Offset sidebars\";s:11:\"description\";s:38:\"Main content with two offset sidebars.\";s:10:\"stylesheet\";s:17:\"layout-offset.css\";s:8:\"template\";s:13:\"layout-offset\";s:7:\"regions\";a:4:{i:0;s:6:\"header\";i:1;s:7:\"content\";i:2;s:4:\"left\";i:3;s:5:\"right\";}}}s:9:\"datestamp\";s:10:\"1267655587\";s:7:\"project\";s:5:\"rubik\";s:18:\"project status url\";s:39:\"http://code.developmentseed.org/fserver\";s:7:\"version\";s:13:\"6.x-1.0-beta8\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:37:\"sites/all/themes/rubik/cube/script.js\";}s:10:\"screenshot\";s:42:\"sites/all/themes/rubik/cube/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}');
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_data`
--

DROP TABLE IF EXISTS `term_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_data`
--

LOCK TABLES `term_data` WRITE;
/*!40000 ALTER TABLE `term_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_hierarchy`
--

DROP TABLE IF EXISTS `term_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_hierarchy`
--

LOCK TABLES `term_hierarchy` WRITE;
/*!40000 ALTER TABLE `term_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_node`
--

DROP TABLE IF EXISTS `term_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_node` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`vid`),
  KEY `vid` (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_node`
--

LOCK TABLES `term_node` WRITE;
/*!40000 ALTER TABLE `term_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_relation`
--

DROP TABLE IF EXISTS `term_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_relation` (
  `trid` int(11) NOT NULL AUTO_INCREMENT,
  `tid1` int(10) unsigned NOT NULL DEFAULT '0',
  `tid2` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trid`),
  UNIQUE KEY `tid1_tid2` (`tid1`,`tid2`),
  KEY `tid2` (`tid2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_relation`
--

LOCK TABLES `term_relation` WRITE;
/*!40000 ALTER TABLE `term_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_synonym`
--

DROP TABLE IF EXISTS `term_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_synonym` (
  `tsid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tsid`),
  KEY `tid` (`tid`),
  KEY `name_tid` (`name`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_synonym`
--

LOCK TABLES `term_synonym` WRITE;
/*!40000 ALTER TABLE `term_synonym` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_synonym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_alias`
--

DROP TABLE IF EXISTS `url_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src` varchar(128) NOT NULL DEFAULT '',
  `dst` varchar(128) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `dst_language_pid` (`dst`,`language`,`pid`),
  KEY `src_language_pid` (`src`,`language`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_alias`
--

LOCK TABLES `url_alias` WRITE;
/*!40000 ALTER TABLE `url_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `pass` varchar(32) NOT NULL DEFAULT '',
  `mail` varchar(64) DEFAULT '',
  `mode` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) DEFAULT '0',
  `threshold` tinyint(4) DEFAULT '0',
  `theme` varchar(255) NOT NULL DEFAULT '',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `signature_format` smallint(6) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `login` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(8) DEFAULT NULL,
  `language` varchar(12) NOT NULL DEFAULT '',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `init` varchar(64) DEFAULT '',
  `data` longtext,
  `timezone_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'','','',0,0,0,'','',0,0,0,0,0,NULL,'','','',NULL,''),(1,'Admin','1a1dc91c907325c69271ddf0c944bc72','admin@example.com',0,0,0,'','',0,1281444042,1281469428,1281462981,1,'7200','','','hugo@wetterberg.nu','a:1:{s:13:\"form_build_id\";s:37:\"form-bac28c7652adfc128e1f1dceec0da391\";}','Europe/Berlin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable` (
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable`
--

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
INSERT INTO `variable` VALUES ('theme_default','s:7:\"garland\";'),('filter_html_1','i:1;'),('node_options_forum','a:1:{i:0;s:6:\"status\";}'),('drupal_private_key','s:64:\"ad4be2b1317257469d2dd71c1b7c148b1a0df233b6e163022c1209e106944818\";'),('menu_masks','a:22:{i:0;i:91;i:1;i:63;i:2;i:62;i:3;i:61;i:4;i:59;i:5;i:45;i:6;i:31;i:7;i:30;i:8;i:29;i:9;i:24;i:10;i:23;i:11;i:22;i:12;i:21;i:13;i:15;i:14;i:14;i:15;i:11;i:16;i:7;i:17;i:6;i:18;i:5;i:19;i:3;i:20;i:2;i:21;i:1;}'),('install_task','s:4:\"done\";'),('menu_expanded','a:0:{}'),('drupal_http_request_fails','b:0;'),('site_name','s:12:\"iphone.local\";'),('site_mail','s:18:\"hugo@wetterberg.nu\";'),('date_default_timezone','s:4:\"7200\";'),('user_email_verification','b:1;'),('clean_url','s:1:\"1\";'),('install_time','i:1281444082;'),('node_options_page','a:1:{i:0;s:6:\"status\";}'),('comment_page','i:0;'),('theme_settings','a:1:{s:21:\"toggle_node_info_page\";b:0;}'),('css_js_query_string','s:20:\"4mM00000000000000000\";'),('install_profile','s:7:\"default\";'),('update_last_check','i:1281445354;'),('file_directory_temp','s:4:\"/tmp\";'),('javascript_parsed','a:0:{}'),('date_api_version','s:3:\"5.2\";'),('content_schema_version','i:6009;');
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vocabulary` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `help` varchar(255) NOT NULL DEFAULT '',
  `relations` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `multiple` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) NOT NULL DEFAULT '',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `list` (`weight`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary`
--

LOCK TABLES `vocabulary` WRITE;
/*!40000 ALTER TABLE `vocabulary` DISABLE KEYS */;
/*!40000 ALTER TABLE `vocabulary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vocabulary_node_types`
--

DROP TABLE IF EXISTS `vocabulary_node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vocabulary_node_types` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`,`vid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary_node_types`
--

LOCK TABLES `vocabulary_node_types` WRITE;
/*!40000 ALTER TABLE `vocabulary_node_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `vocabulary_node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchdog`
--

DROP TABLE IF EXISTS `watchdog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchdog` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `variables` longtext NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `location` text NOT NULL,
  `referer` text,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wid`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchdog`
--

LOCK TABLES `watchdog` WRITE;
/*!40000 ALTER TABLE `watchdog` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchdog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-08-10 22:31:13
