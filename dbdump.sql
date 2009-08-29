-- MySQL dump 10.11
--
-- Host: localhost    Database: drupaliphone
-- ------------------------------------------------------
-- Server version	5.0.84

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
-- Table structure for table `di_access`
--

DROP TABLE IF EXISTS `di_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_access` (
  `aid` int(11) NOT NULL auto_increment,
  `mask` varchar(255) NOT NULL default '',
  `type` varchar(255) NOT NULL default '',
  `status` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_access`
--

LOCK TABLES `di_access` WRITE;
/*!40000 ALTER TABLE `di_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_actions`
--

DROP TABLE IF EXISTS `di_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_actions` (
  `aid` varchar(255) NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  `callback` varchar(255) NOT NULL default '',
  `parameters` longtext NOT NULL,
  `description` varchar(255) NOT NULL default '0',
  PRIMARY KEY  (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_actions`
--

LOCK TABLES `di_actions` WRITE;
/*!40000 ALTER TABLE `di_actions` DISABLE KEYS */;
INSERT INTO `di_actions` VALUES ('comment_unpublish_action','comment','comment_unpublish_action','','Unpublish comment'),('node_publish_action','node','node_publish_action','','Publish post'),('node_unpublish_action','node','node_unpublish_action','','Unpublish post'),('node_make_sticky_action','node','node_make_sticky_action','','Make post sticky'),('node_make_unsticky_action','node','node_make_unsticky_action','','Make post unsticky'),('node_promote_action','node','node_promote_action','','Promote post to front page'),('node_unpromote_action','node','node_unpromote_action','','Remove post from front page'),('node_save_action','node','node_save_action','','Save post'),('user_block_user_action','user','user_block_user_action','','Block current user'),('user_block_ip_action','user','user_block_ip_action','','Ban IP address of current user');
/*!40000 ALTER TABLE `di_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_actions_aid`
--

DROP TABLE IF EXISTS `di_actions_aid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_actions_aid` (
  `aid` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_actions_aid`
--

LOCK TABLES `di_actions_aid` WRITE;
/*!40000 ALTER TABLE `di_actions_aid` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_actions_aid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_authmap`
--

DROP TABLE IF EXISTS `di_authmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_authmap` (
  `aid` int(10) unsigned NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `authname` varchar(128) NOT NULL default '',
  `module` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_authmap`
--

LOCK TABLES `di_authmap` WRITE;
/*!40000 ALTER TABLE `di_authmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_authmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_batch`
--

DROP TABLE IF EXISTS `di_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_batch` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `token` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `batch` longtext,
  PRIMARY KEY  (`bid`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_batch`
--

LOCK TABLES `di_batch` WRITE;
/*!40000 ALTER TABLE `di_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_blocks`
--

DROP TABLE IF EXISTS `di_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_blocks` (
  `bid` int(11) NOT NULL auto_increment,
  `module` varchar(64) NOT NULL default '',
  `delta` varchar(32) NOT NULL default '0',
  `theme` varchar(64) NOT NULL default '',
  `status` tinyint(4) NOT NULL default '0',
  `weight` tinyint(4) NOT NULL default '0',
  `region` varchar(64) NOT NULL default '',
  `custom` tinyint(4) NOT NULL default '0',
  `throttle` tinyint(4) NOT NULL default '0',
  `visibility` tinyint(4) NOT NULL default '0',
  `pages` text NOT NULL,
  `title` varchar(64) NOT NULL default '',
  `cache` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_blocks`
--

LOCK TABLES `di_blocks` WRITE;
/*!40000 ALTER TABLE `di_blocks` DISABLE KEYS */;
INSERT INTO `di_blocks` VALUES (1,'user','0','garland',1,0,'left',0,0,0,'','',-1),(2,'user','1','garland',1,0,'left',0,0,0,'','',-1),(3,'system','0','garland',1,10,'footer',0,0,0,'','',-1);
/*!40000 ALTER TABLE `di_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_blocks_roles`
--

DROP TABLE IF EXISTS `di_blocks_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_blocks_roles` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_blocks_roles`
--

LOCK TABLES `di_blocks_roles` WRITE;
/*!40000 ALTER TABLE `di_blocks_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_blocks_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_boxes`
--

DROP TABLE IF EXISTS `di_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_boxes` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `body` longtext,
  `info` varchar(128) NOT NULL default '',
  `format` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_boxes`
--

LOCK TABLES `di_boxes` WRITE;
/*!40000 ALTER TABLE `di_boxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_cache`
--

DROP TABLE IF EXISTS `di_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_cache` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_cache`
--

LOCK TABLES `di_cache` WRITE;
/*!40000 ALTER TABLE `di_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_cache_block`
--

DROP TABLE IF EXISTS `di_cache_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_cache_block` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_cache_block`
--

LOCK TABLES `di_cache_block` WRITE;
/*!40000 ALTER TABLE `di_cache_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_cache_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_cache_filter`
--

DROP TABLE IF EXISTS `di_cache_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_cache_filter` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_cache_filter`
--

LOCK TABLES `di_cache_filter` WRITE;
/*!40000 ALTER TABLE `di_cache_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_cache_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_cache_form`
--

DROP TABLE IF EXISTS `di_cache_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_cache_form` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_cache_form`
--

LOCK TABLES `di_cache_form` WRITE;
/*!40000 ALTER TABLE `di_cache_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_cache_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_cache_menu`
--

DROP TABLE IF EXISTS `di_cache_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_cache_menu` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_cache_menu`
--

LOCK TABLES `di_cache_menu` WRITE;
/*!40000 ALTER TABLE `di_cache_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_cache_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_cache_page`
--

DROP TABLE IF EXISTS `di_cache_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_cache_page` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_cache_page`
--

LOCK TABLES `di_cache_page` WRITE;
/*!40000 ALTER TABLE `di_cache_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_cache_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_comments`
--

DROP TABLE IF EXISTS `di_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_comments` (
  `cid` int(11) NOT NULL auto_increment,
  `pid` int(11) NOT NULL default '0',
  `nid` int(11) NOT NULL default '0',
  `uid` int(11) NOT NULL default '0',
  `subject` varchar(64) NOT NULL default '',
  `comment` longtext NOT NULL,
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  `status` tinyint(3) unsigned NOT NULL default '0',
  `format` smallint(6) NOT NULL default '0',
  `thread` varchar(255) NOT NULL,
  `name` varchar(60) default NULL,
  `mail` varchar(64) default NULL,
  `homepage` varchar(255) default NULL,
  PRIMARY KEY  (`cid`),
  KEY `pid` (`pid`),
  KEY `nid` (`nid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_comments`
--

LOCK TABLES `di_comments` WRITE;
/*!40000 ALTER TABLE `di_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_files`
--

DROP TABLE IF EXISTS `di_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_files` (
  `fid` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `filemime` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `status` int(11) NOT NULL default '0',
  `timestamp` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_files`
--

LOCK TABLES `di_files` WRITE;
/*!40000 ALTER TABLE `di_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_filter_formats`
--

DROP TABLE IF EXISTS `di_filter_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_filter_formats` (
  `format` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `roles` varchar(255) NOT NULL default '',
  `cache` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`format`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_filter_formats`
--

LOCK TABLES `di_filter_formats` WRITE;
/*!40000 ALTER TABLE `di_filter_formats` DISABLE KEYS */;
INSERT INTO `di_filter_formats` VALUES (1,'Filtered HTML',',1,2,',1),(2,'Full HTML','',1);
/*!40000 ALTER TABLE `di_filter_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_filters`
--

DROP TABLE IF EXISTS `di_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_filters` (
  `fid` int(11) NOT NULL auto_increment,
  `format` int(11) NOT NULL default '0',
  `module` varchar(64) NOT NULL default '',
  `delta` tinyint(4) NOT NULL default '0',
  `weight` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  UNIQUE KEY `fmd` (`format`,`module`,`delta`),
  KEY `list` (`format`,`weight`,`module`,`delta`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_filters`
--

LOCK TABLES `di_filters` WRITE;
/*!40000 ALTER TABLE `di_filters` DISABLE KEYS */;
INSERT INTO `di_filters` VALUES (1,1,'filter',2,0),(2,1,'filter',0,1),(3,1,'filter',1,2),(4,1,'filter',3,10),(5,2,'filter',2,0),(6,2,'filter',1,1),(7,2,'filter',3,10);
/*!40000 ALTER TABLE `di_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_flood`
--

DROP TABLE IF EXISTS `di_flood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_flood` (
  `fid` int(11) NOT NULL auto_increment,
  `event` varchar(64) NOT NULL default '',
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  KEY `allow` (`event`,`hostname`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_flood`
--

LOCK TABLES `di_flood` WRITE;
/*!40000 ALTER TABLE `di_flood` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_flood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_history`
--

DROP TABLE IF EXISTS `di_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_history` (
  `uid` int(11) NOT NULL default '0',
  `nid` int(11) NOT NULL default '0',
  `timestamp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_history`
--

LOCK TABLES `di_history` WRITE;
/*!40000 ALTER TABLE `di_history` DISABLE KEYS */;
INSERT INTO `di_history` VALUES (1,1,1251269143),(1,2,1251270024);
/*!40000 ALTER TABLE `di_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_menu_custom`
--

DROP TABLE IF EXISTS `di_menu_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_menu_custom` (
  `menu_name` varchar(32) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `description` text,
  PRIMARY KEY  (`menu_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_menu_custom`
--

LOCK TABLES `di_menu_custom` WRITE;
/*!40000 ALTER TABLE `di_menu_custom` DISABLE KEYS */;
INSERT INTO `di_menu_custom` VALUES ('navigation','Navigation','The navigation menu is provided by Drupal and is the main interactive menu for any site. It is usually the only menu that contains personalized links for authenticated users, and is often not even visible to anonymous users.'),('primary-links','Primary links','Primary links are often used at the theme layer to show the major sections of a site. A typical representation for primary links would be tabs along the top.'),('secondary-links','Secondary links','Secondary links are often used for pages like legal notices, contact details, and other secondary navigation items that play a lesser role than primary links');
/*!40000 ALTER TABLE `di_menu_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_menu_links`
--

DROP TABLE IF EXISTS `di_menu_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_menu_links` (
  `menu_name` varchar(32) NOT NULL default '',
  `mlid` int(10) unsigned NOT NULL auto_increment,
  `plid` int(10) unsigned NOT NULL default '0',
  `link_path` varchar(255) NOT NULL default '',
  `router_path` varchar(255) NOT NULL default '',
  `link_title` varchar(255) NOT NULL default '',
  `options` text,
  `module` varchar(255) NOT NULL default 'system',
  `hidden` smallint(6) NOT NULL default '0',
  `external` smallint(6) NOT NULL default '0',
  `has_children` smallint(6) NOT NULL default '0',
  `expanded` smallint(6) NOT NULL default '0',
  `weight` int(11) NOT NULL default '0',
  `depth` smallint(6) NOT NULL default '0',
  `customized` smallint(6) NOT NULL default '0',
  `p1` int(10) unsigned NOT NULL default '0',
  `p2` int(10) unsigned NOT NULL default '0',
  `p3` int(10) unsigned NOT NULL default '0',
  `p4` int(10) unsigned NOT NULL default '0',
  `p5` int(10) unsigned NOT NULL default '0',
  `p6` int(10) unsigned NOT NULL default '0',
  `p7` int(10) unsigned NOT NULL default '0',
  `p8` int(10) unsigned NOT NULL default '0',
  `p9` int(10) unsigned NOT NULL default '0',
  `updated` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_menu_links`
--

LOCK TABLES `di_menu_links` WRITE;
/*!40000 ALTER TABLE `di_menu_links` DISABLE KEYS */;
INSERT INTO `di_menu_links` VALUES ('navigation',1,0,'batch','batch','','a:0:{}','system',-1,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0),('navigation',2,0,'admin','admin','Administer','a:0:{}','system',0,0,1,0,9,1,0,2,0,0,0,0,0,0,0,0,0),('navigation',3,0,'node','node','Content','a:0:{}','system',-1,0,0,0,0,1,0,3,0,0,0,0,0,0,0,0,0),('navigation',4,0,'logout','logout','Log out','a:0:{}','system',0,0,0,0,10,1,0,4,0,0,0,0,0,0,0,0,0),('navigation',5,0,'rss.xml','rss.xml','RSS feed','a:0:{}','system',-1,0,0,0,0,1,0,5,0,0,0,0,0,0,0,0,0),('navigation',6,0,'user','user','User account','a:0:{}','system',-1,0,0,0,0,1,0,6,0,0,0,0,0,0,0,0,0),('navigation',7,0,'node/%','node/%','','a:0:{}','system',-1,0,0,0,0,1,0,7,0,0,0,0,0,0,0,0,0),('navigation',8,2,'admin/compact','admin/compact','Compact mode','a:0:{}','system',-1,0,0,0,0,2,0,2,8,0,0,0,0,0,0,0,0),('navigation',9,0,'filter/tips','filter/tips','Compose tips','a:0:{}','system',1,0,0,0,0,1,0,9,0,0,0,0,0,0,0,0,0),('navigation',10,2,'admin/content','admin/content','Content management','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:27:\"Manage your site\'s content.\";}}','system',0,0,1,0,-10,2,0,2,10,0,0,0,0,0,0,0,0),('navigation',11,0,'node/add','node/add','Create content','a:0:{}','system',0,0,1,0,1,1,0,11,0,0,0,0,0,0,0,0,0),('navigation',12,0,'comment/delete','comment/delete','Delete comment','a:0:{}','system',-1,0,0,0,0,1,0,12,0,0,0,0,0,0,0,0,0),('navigation',13,0,'comment/edit','comment/edit','Edit comment','a:0:{}','system',-1,0,0,0,0,1,0,13,0,0,0,0,0,0,0,0,0),('navigation',14,0,'system/files','system/files','File download','a:0:{}','system',-1,0,0,0,0,1,0,14,0,0,0,0,0,0,0,0,0),('navigation',15,2,'admin/help','admin/help','Help','a:0:{}','system',0,0,0,0,9,2,0,2,15,0,0,0,0,0,0,0,0),('navigation',16,2,'admin/reports','admin/reports','Reports','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:59:\"View reports from system logs and other status information.\";}}','system',0,0,1,0,5,2,0,2,16,0,0,0,0,0,0,0,0),('navigation',17,2,'admin/build','admin/build','Site building','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:38:\"Control how your site looks and feels.\";}}','system',0,0,1,0,-10,2,0,2,17,0,0,0,0,0,0,0,0),('navigation',18,2,'admin/settings','admin/settings','Site configuration','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:40:\"Adjust basic site configuration options.\";}}','system',0,0,1,0,-5,2,0,2,18,0,0,0,0,0,0,0,0),('navigation',19,0,'user/autocomplete','user/autocomplete','User autocomplete','a:0:{}','system',-1,0,0,0,0,1,0,19,0,0,0,0,0,0,0,0,0),('navigation',20,2,'admin/user','admin/user','User management','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:61:\"Manage your site\'s users, groups and access to site features.\";}}','system',0,0,1,0,0,2,0,2,20,0,0,0,0,0,0,0,0),('navigation',21,0,'user/%','user/%','My account','a:0:{}','system',0,0,0,0,0,1,0,21,0,0,0,0,0,0,0,0,0),('navigation',22,20,'admin/user/rules','admin/user/rules','Access rules','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:80:\"List and create rules to disallow usernames, e-mail addresses, and IP addresses.\";}}','system',0,0,0,0,0,3,0,2,20,22,0,0,0,0,0,0,0),('navigation',23,18,'admin/settings/actions','admin/settings/actions','Actions','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:41:\"Manage the actions defined for your site.\";}}','system',0,0,0,0,0,3,0,2,18,23,0,0,0,0,0,0,0),('navigation',24,18,'admin/settings/admin','admin/settings/admin','Administration theme','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:55:\"Settings for how your administrative pages should look.\";}}','system',0,0,0,0,0,3,0,2,18,24,0,0,0,0,0,0,0),('navigation',25,17,'admin/build/block','admin/build/block','Blocks','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:79:\"Configure what block content appears in your site\'s sidebars and other regions.\";}}','system',0,0,0,0,0,3,0,2,17,25,0,0,0,0,0,0,0),('navigation',26,18,'admin/settings/clean-urls','admin/settings/clean-urls','Clean URLs','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"Enable or disable clean URLs for your site.\";}}','system',0,0,0,0,0,3,0,2,18,26,0,0,0,0,0,0,0),('navigation',27,10,'admin/content/comment','admin/content/comment','Comments','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:61:\"List and edit site comments and the comment moderation queue.\";}}','system',0,0,0,0,0,3,0,2,10,27,0,0,0,0,0,0,0),('navigation',28,10,'admin/content/node','admin/content/node','Content','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"View, edit, and delete your site\'s content.\";}}','system',0,0,0,0,0,3,0,2,10,28,0,0,0,0,0,0,0),('navigation',29,10,'admin/content/types','admin/content/types','Content types','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:82:\"Manage posts by content type, including default status, front page promotion, etc.\";}}','system',0,0,0,0,0,3,0,2,10,29,0,0,0,0,0,0,0),('navigation',30,18,'admin/settings/date-time','admin/settings/date-time','Date and time','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:89:\"Settings for how Drupal displays date and time, as well as the system\'s default timezone.\";}}','system',0,0,0,0,0,3,0,2,18,30,0,0,0,0,0,0,0),('navigation',31,0,'node/%/delete','node/%/delete','Delete','a:0:{}','system',-1,0,0,0,1,1,0,31,0,0,0,0,0,0,0,0,0),('navigation',32,21,'user/%/delete','user/%/delete','Delete','a:0:{}','system',-1,0,0,0,0,2,0,21,32,0,0,0,0,0,0,0,0),('navigation',33,18,'admin/settings/error-reporting','admin/settings/error-reporting','Error reporting','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:93:\"Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.\";}}','system',0,0,0,0,0,3,0,2,18,33,0,0,0,0,0,0,0),('navigation',34,18,'admin/settings/file-system','admin/settings/file-system','File system','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:68:\"Tell Drupal where to store uploaded files and how they are accessed.\";}}','system',0,0,0,0,0,3,0,2,18,34,0,0,0,0,0,0,0),('navigation',35,18,'admin/settings/image-toolkit','admin/settings/image-toolkit','Image toolkit','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:74:\"Choose which image toolkit to use if you have installed optional toolkits.\";}}','system',0,0,0,0,0,3,0,2,18,35,0,0,0,0,0,0,0),('navigation',36,18,'admin/settings/filters','admin/settings/filters','Input formats','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:127:\"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.\";}}','system',0,0,0,0,0,3,0,2,18,36,0,0,0,0,0,0,0),('navigation',37,18,'admin/settings/logging','admin/settings/logging','Logging and alerts','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:156:\"Settings for logging and alerts modules. Various modules can route Drupal\'s system events to different destination, such as syslog, database, email, ...etc.\";}}','system',0,0,1,0,0,3,0,2,18,37,0,0,0,0,0,0,0),('navigation',38,17,'admin/build/menu','admin/build/menu','Menus','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:116:\"Control your site\'s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.\";}}','system',0,0,1,0,0,3,0,2,17,38,0,0,0,0,0,0,0),('navigation',39,17,'admin/build/modules','admin/build/modules','Modules','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:47:\"Enable or disable add-on modules for your site.\";}}','system',0,0,0,0,0,3,0,2,17,39,0,0,0,0,0,0,0),('navigation',40,18,'admin/settings/performance','admin/settings/performance','Performance','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:101:\"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.\";}}','system',0,0,0,0,0,3,0,2,18,40,0,0,0,0,0,0,0),('navigation',41,20,'admin/user/permissions','admin/user/permissions','Permissions','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:64:\"Determine access to features by selecting permissions for roles.\";}}','system',0,0,0,0,0,3,0,2,20,41,0,0,0,0,0,0,0),('navigation',42,10,'admin/content/node-settings','admin/content/node-settings','Post settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:126:\"Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.\";}}','system',0,0,0,0,0,3,0,2,10,42,0,0,0,0,0,0,0),('navigation',43,10,'admin/content/rss-publishing','admin/content/rss-publishing','RSS publishing','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:92:\"Configure the number of items per feed and whether feeds should be titles/teasers/full-text.\";}}','system',0,0,0,0,0,3,0,2,10,43,0,0,0,0,0,0,0),('navigation',44,0,'comment/reply/%','comment/reply/%','Reply to comment','a:0:{}','system',-1,0,0,0,0,1,0,44,0,0,0,0,0,0,0,0,0),('navigation',45,20,'admin/user/roles','admin/user/roles','Roles','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:30:\"List, edit, or add user roles.\";}}','system',0,0,0,0,0,3,0,2,20,45,0,0,0,0,0,0,0),('navigation',46,18,'admin/settings/site-information','admin/settings/site-information','Site information','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:107:\"Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.\";}}','system',0,0,0,0,0,3,0,2,18,46,0,0,0,0,0,0,0),('navigation',47,18,'admin/settings/site-maintenance','admin/settings/site-maintenance','Site maintenance','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:63:\"Take the site off-line for maintenance or bring it back online.\";}}','system',0,0,0,0,0,3,0,2,18,47,0,0,0,0,0,0,0),('navigation',48,16,'admin/reports/status','admin/reports/status','Status report','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:74:\"Get a status report about your site\'s operation and any detected problems.\";}}','system',0,0,0,0,10,3,0,2,16,48,0,0,0,0,0,0,0),('navigation',49,17,'admin/build/themes','admin/build/themes','Themes','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:57:\"Change which theme your site uses or allows users to set.\";}}','system',0,0,0,0,0,3,0,2,17,49,0,0,0,0,0,0,0),('navigation',50,20,'admin/user/settings','admin/user/settings','User settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:101:\"Configure default behavior of users, including registration requirements, e-mails, and user pictures.\";}}','system',0,0,0,0,0,3,0,2,20,50,0,0,0,0,0,0,0),('navigation',51,20,'admin/user/user','admin/user/user','Users','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:26:\"List, add, and edit users.\";}}','system',0,0,0,0,0,3,0,2,20,51,0,0,0,0,0,0,0),('navigation',52,15,'admin/help/block','admin/help/block','block','a:0:{}','system',-1,0,0,0,0,3,0,2,15,52,0,0,0,0,0,0,0),('navigation',53,15,'admin/help/color','admin/help/color','color','a:0:{}','system',-1,0,0,0,0,3,0,2,15,53,0,0,0,0,0,0,0),('navigation',54,15,'admin/help/comment','admin/help/comment','comment','a:0:{}','system',-1,0,0,0,0,3,0,2,15,54,0,0,0,0,0,0,0),('navigation',55,15,'admin/help/filter','admin/help/filter','filter','a:0:{}','system',-1,0,0,0,0,3,0,2,15,55,0,0,0,0,0,0,0),('navigation',56,15,'admin/help/help','admin/help/help','help','a:0:{}','system',-1,0,0,0,0,3,0,2,15,56,0,0,0,0,0,0,0),('navigation',57,15,'admin/help/menu','admin/help/menu','menu','a:0:{}','system',-1,0,0,0,0,3,0,2,15,57,0,0,0,0,0,0,0),('navigation',58,15,'admin/help/node','admin/help/node','node','a:0:{}','system',-1,0,0,0,0,3,0,2,15,58,0,0,0,0,0,0,0),('navigation',59,15,'admin/help/system','admin/help/system','system','a:0:{}','system',-1,0,0,0,0,3,0,2,15,59,0,0,0,0,0,0,0),('navigation',60,15,'admin/help/user','admin/help/user','user','a:0:{}','system',-1,0,0,0,0,3,0,2,15,60,0,0,0,0,0,0,0),('navigation',61,36,'admin/settings/filters/%','admin/settings/filters/%','','a:0:{}','system',-1,0,0,0,0,4,0,2,18,36,61,0,0,0,0,0,0),('navigation',62,26,'admin/settings/clean-urls/check','admin/settings/clean-urls/check','Clean URL check','a:0:{}','system',-1,0,0,0,0,4,0,2,18,26,62,0,0,0,0,0,0),('navigation',63,23,'admin/settings/actions/configure','admin/settings/actions/configure','Configure an advanced action','a:0:{}','system',-1,0,0,0,0,4,0,2,18,23,63,0,0,0,0,0,0),('navigation',64,25,'admin/build/block/configure','admin/build/block/configure','Configure block','a:0:{}','system',-1,0,0,0,0,4,0,2,17,25,64,0,0,0,0,0,0),('navigation',65,17,'admin/build/menu-customize/%','admin/build/menu-customize/%','Customize menu','a:0:{}','system',-1,0,0,0,0,3,0,2,17,65,0,0,0,0,0,0,0),('navigation',66,30,'admin/settings/date-time/lookup','admin/settings/date-time/lookup','Date and time lookup','a:0:{}','system',-1,0,0,0,0,4,0,2,18,30,66,0,0,0,0,0,0),('navigation',67,25,'admin/build/block/delete','admin/build/block/delete','Delete block','a:0:{}','system',-1,0,0,0,0,4,0,2,17,25,67,0,0,0,0,0,0),('navigation',68,36,'admin/settings/filters/delete','admin/settings/filters/delete','Delete input format','a:0:{}','system',-1,0,0,0,0,4,0,2,18,36,68,0,0,0,0,0,0),('navigation',69,22,'admin/user/rules/delete','admin/user/rules/delete','Delete rule','a:0:{}','system',-1,0,0,0,0,4,0,2,20,22,69,0,0,0,0,0,0),('navigation',70,45,'admin/user/roles/edit','admin/user/roles/edit','Edit role','a:0:{}','system',-1,0,0,0,0,4,0,2,20,45,70,0,0,0,0,0,0),('navigation',71,22,'admin/user/rules/edit','admin/user/rules/edit','Edit rule','a:0:{}','system',-1,0,0,0,0,4,0,2,20,22,71,0,0,0,0,0,0),('navigation',72,48,'admin/reports/status/php','admin/reports/status/php','PHP','a:0:{}','system',-1,0,0,0,0,4,0,2,16,48,72,0,0,0,0,0,0),('navigation',73,42,'admin/content/node-settings/rebuild','admin/content/node-settings/rebuild','Rebuild permissions','a:0:{}','system',-1,0,0,0,0,4,0,2,10,42,73,0,0,0,0,0,0),('navigation',74,23,'admin/settings/actions/orphan','admin/settings/actions/orphan','Remove orphans','a:0:{}','system',-1,0,0,0,0,4,0,2,18,23,74,0,0,0,0,0,0),('navigation',75,48,'admin/reports/status/run-cron','admin/reports/status/run-cron','Run cron','a:0:{}','system',-1,0,0,0,0,4,0,2,16,48,75,0,0,0,0,0,0),('navigation',76,48,'admin/reports/status/sql','admin/reports/status/sql','SQL','a:0:{}','system',-1,0,0,0,0,4,0,2,16,48,76,0,0,0,0,0,0),('navigation',77,23,'admin/settings/actions/delete/%','admin/settings/actions/delete/%','Delete action','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:17:\"Delete an action.\";}}','system',-1,0,0,0,0,4,0,2,18,23,77,0,0,0,0,0,0),('navigation',78,0,'admin/build/menu-customize/%/delete','admin/build/menu-customize/%/delete','Delete menu','a:0:{}','system',-1,0,0,0,0,1,0,78,0,0,0,0,0,0,0,0,0),('navigation',79,25,'admin/build/block/list/js','admin/build/block/list/js','JavaScript List Form','a:0:{}','system',-1,0,0,0,0,4,0,2,17,25,79,0,0,0,0,0,0),('navigation',80,39,'admin/build/modules/list/confirm','admin/build/modules/list/confirm','List','a:0:{}','system',-1,0,0,0,0,4,0,2,17,39,80,0,0,0,0,0,0),('navigation',81,0,'user/reset/%/%/%','user/reset/%/%/%','Reset password','a:0:{}','system',-1,0,0,0,0,1,0,81,0,0,0,0,0,0,0,0,0),('navigation',82,39,'admin/build/modules/uninstall/confirm','admin/build/modules/uninstall/confirm','Uninstall','a:0:{}','system',-1,0,0,0,0,4,0,2,17,39,82,0,0,0,0,0,0),('navigation',83,0,'node/%/revisions/%/delete','node/%/revisions/%/delete','Delete earlier revision','a:0:{}','system',-1,0,0,0,0,1,0,83,0,0,0,0,0,0,0,0,0),('navigation',84,0,'node/%/revisions/%/revert','node/%/revisions/%/revert','Revert to earlier revision','a:0:{}','system',-1,0,0,0,0,1,0,84,0,0,0,0,0,0,0,0,0),('navigation',85,0,'node/%/revisions/%/view','node/%/revisions/%/view','Revisions','a:0:{}','system',-1,0,0,0,0,1,0,85,0,0,0,0,0,0,0,0,0),('navigation',86,38,'admin/build/menu/item/%/delete','admin/build/menu/item/%/delete','Delete menu item','a:0:{}','system',-1,0,0,0,0,4,0,2,17,38,86,0,0,0,0,0,0),('navigation',87,38,'admin/build/menu/item/%/edit','admin/build/menu/item/%/edit','Edit menu item','a:0:{}','system',-1,0,0,0,0,4,0,2,17,38,87,0,0,0,0,0,0),('navigation',88,38,'admin/build/menu/item/%/reset','admin/build/menu/item/%/reset','Reset menu item','a:0:{}','system',-1,0,0,0,0,4,0,2,17,38,88,0,0,0,0,0,0),('navigation',89,38,'admin/build/menu-customize/navigation','admin/build/menu-customize/%','Navigation','a:0:{}','menu',0,0,0,0,0,4,0,2,17,38,89,0,0,0,0,0,0),('navigation',90,38,'admin/build/menu-customize/primary-links','admin/build/menu-customize/%','Primary links','a:0:{}','menu',0,0,0,0,0,4,0,2,17,38,90,0,0,0,0,0,0),('navigation',91,38,'admin/build/menu-customize/secondary-links','admin/build/menu-customize/%','Secondary links','a:0:{}','menu',0,0,0,0,0,4,0,2,17,38,91,0,0,0,0,0,0),('navigation',92,0,'taxonomy/autocomplete','taxonomy/autocomplete','Autocomplete taxonomy','a:0:{}','system',-1,0,0,0,0,1,0,92,0,0,0,0,0,0,0,0,0),('navigation',93,16,'admin/reports/dblog','admin/reports/dblog','Recent log entries','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"View events that have recently been logged.\";}}','system',0,0,0,0,-1,3,0,2,16,93,0,0,0,0,0,0,0),('navigation',94,10,'admin/content/taxonomy','admin/content/taxonomy','Taxonomy','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:67:\"Manage tagging, categorization, and classification of your content.\";}}','system',0,0,0,0,0,3,0,2,10,94,0,0,0,0,0,0,0),('navigation',95,0,'taxonomy/term/%','taxonomy/term/%','Taxonomy term','a:0:{}','system',-1,0,0,0,0,1,0,95,0,0,0,0,0,0,0,0,0),('navigation',96,16,'admin/reports/access-denied','admin/reports/access-denied','Top \'access denied\' errors','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:35:\"View \'access denied\' errors (403s).\";}}','system',0,0,0,0,0,3,0,2,16,96,0,0,0,0,0,0,0),('navigation',97,16,'admin/reports/page-not-found','admin/reports/page-not-found','Top \'page not found\' errors','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:36:\"View \'page not found\' errors (404s).\";}}','system',0,0,0,0,0,3,0,2,16,97,0,0,0,0,0,0,0),('navigation',98,15,'admin/help/dblog','admin/help/dblog','dblog','a:0:{}','system',-1,0,0,0,0,3,0,2,15,98,0,0,0,0,0,0,0),('navigation',99,15,'admin/help/taxonomy','admin/help/taxonomy','taxonomy','a:0:{}','system',-1,0,0,0,0,3,0,2,15,99,0,0,0,0,0,0,0),('navigation',100,37,'admin/settings/logging/dblog','admin/settings/logging/dblog','Database logging','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:169:\"Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.\";}}','system',0,0,0,0,0,4,0,2,18,37,100,0,0,0,0,0,0),('navigation',101,16,'admin/reports/event/%','admin/reports/event/%','Details','a:0:{}','system',-1,0,0,0,0,3,0,2,16,101,0,0,0,0,0,0,0),('navigation',102,94,'admin/content/taxonomy/%','admin/content/taxonomy/%','List terms','a:0:{}','system',-1,0,0,0,0,4,0,2,10,94,102,0,0,0,0,0,0),('navigation',103,94,'admin/content/taxonomy/edit/term','admin/content/taxonomy/edit/term','Edit term','a:0:{}','system',-1,0,0,0,0,4,0,2,10,94,103,0,0,0,0,0,0),('navigation',104,94,'admin/content/taxonomy/edit/vocabulary/%','admin/content/taxonomy/edit/vocabulary/%','Edit vocabulary','a:0:{}','system',-1,0,0,0,0,4,0,2,10,94,104,0,0,0,0,0,0),('navigation',105,11,'node/add/page','node/add/page','Page','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";}}','system',0,0,0,0,0,2,0,11,105,0,0,0,0,0,0,0,0),('navigation',106,11,'node/add/story','node/add/story','Story','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:392:\"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.\";}}','system',0,0,0,0,0,2,0,11,106,0,0,0,0,0,0,0,0),('navigation',107,10,'admin/content/node-type/page','admin/content/node-type/page','Page','a:0:{}','system',-1,0,0,0,0,3,0,2,10,107,0,0,0,0,0,0,0),('navigation',108,10,'admin/content/node-type/story','admin/content/node-type/story','Story','a:0:{}','system',-1,0,0,0,0,3,0,2,10,108,0,0,0,0,0,0,0),('navigation',109,0,'admin/content/node-type/page/delete','admin/content/node-type/page/delete','Delete','a:0:{}','system',-1,0,0,0,0,1,0,109,0,0,0,0,0,0,0,0,0),('navigation',110,0,'admin/content/node-type/story/delete','admin/content/node-type/story/delete','Delete','a:0:{}','system',-1,0,0,0,0,1,0,110,0,0,0,0,0,0,0,0,0),('navigation',111,0,'crossdomain.xml','crossdomain.xml','','a:0:{}','system',-1,0,0,0,0,1,0,111,0,0,0,0,0,0,0,0,0),('navigation',112,0,'oauth/access_token','oauth/access_token','','a:0:{}','system',-1,0,0,0,0,1,0,112,0,0,0,0,0,0,0,0,0),('navigation',113,0,'oauth/request_token','oauth/request_token','','a:0:{}','system',-1,0,0,0,0,1,0,113,0,0,0,0,0,0,0,0,0),('navigation',114,0,'oauth/authorized','oauth/authorized','Authorization finished','a:0:{}','system',-1,0,0,0,0,1,0,114,0,0,0,0,0,0,0,0,0),('navigation',115,0,'oauth/authorize','oauth/authorize','','a:0:{}','system',-1,0,0,0,0,1,0,115,0,0,0,0,0,0,0,0,0),('navigation',116,0,'services/%','services/%','Services','a:0:{}','system',-1,0,0,0,0,1,0,116,0,0,0,0,0,0,0,0,0),('navigation',117,0,'oauth/test/valid-consumer','oauth/test/valid-consumer','','a:0:{}','system',-1,0,0,0,0,1,0,117,0,0,0,0,0,0,0,0,0),('navigation',118,0,'oauth/test/valid-access-token','oauth/test/valid-access-token','','a:0:{}','system',-1,0,0,0,0,1,0,118,0,0,0,0,0,0,0,0,0),('navigation',119,18,'admin/settings/oauth','admin/settings/oauth','OAuth','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:18:\"Settings for OAuth\";}}','system',0,0,0,0,0,3,0,2,18,119,0,0,0,0,0,0,0),('navigation',120,17,'admin/build/services','admin/build/services','Services','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:56:\"Allows external applications to communicate with Drupal.\";}}','system',0,0,0,0,0,3,0,2,17,120,0,0,0,0,0,0,0),('navigation',121,15,'admin/help/services','admin/help/services','services','a:0:{}','system',-1,0,0,0,0,3,0,2,15,121,0,0,0,0,0,0,0),('navigation',122,21,'user/%/applications/add','user/%/applications/add','Add application','a:0:{}','system',-1,0,0,0,0,2,0,21,122,0,0,0,0,0,0,0,0),('navigation',123,2,'admin/services/ahah/security-options','admin/services/ahah/security-options','','a:0:{}','system',-1,0,0,0,0,2,0,2,123,0,0,0,0,0,0,0,0),('navigation',124,21,'user/%/applications/authorization/%','user/%/applications/authorization/%','Edit authorization','a:0:{}','system',-1,0,0,0,0,2,0,21,124,0,0,0,0,0,0,0,0),('navigation',125,0,'user/%/applications/authorization/%/delete','user/%/applications/authorization/%/delete','Delete authorization','a:0:{}','system',-1,0,0,0,0,1,0,125,0,0,0,0,0,0,0,0,0),('navigation',126,119,'admin/settings/oauth/authorization/%/delete','admin/settings/oauth/authorization/%/delete','Delete authorization level','a:0:{}','system',-1,0,0,0,0,4,0,2,18,119,126,0,0,0,0,0,0),('navigation',127,0,'cobalt/clear-cache','cobalt/clear-cache','Clear cache','a:0:{}','system',-1,0,0,0,0,1,0,127,0,0,0,0,0,0,0,0,0),('navigation',128,0,'cobalt/alias','cobalt/alias','Forward to the correct alias','a:0:{}','system',-1,0,0,0,0,1,0,128,0,0,0,0,0,0,0,0,0),('navigation',129,0,'cobalt/update','cobalt/update','Cobalt update','a:0:{}','system',-1,0,0,0,0,1,0,129,0,0,0,0,0,0,0,0,0),('navigation',130,0,'cobalt/rebuild-permissions','cobalt/rebuild-permissions','Rebuild permissions','a:0:{}','system',-1,0,0,0,0,1,0,130,0,0,0,0,0,0,0,0,0),('navigation',131,18,'admin/settings/cobalt','admin/settings/cobalt','Cobalt configuration','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:44:\"Settings for cobalt appearance and behaviour\";}}','system',0,0,0,0,0,3,0,2,18,131,0,0,0,0,0,0,0),('navigation',132,0,'cobalt/data/menu_json','cobalt/data/menu_json','Serialized menu','a:0:{}','system',-1,0,0,0,0,1,0,132,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `di_menu_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_menu_router`
--

DROP TABLE IF EXISTS `di_menu_router`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_menu_router` (
  `path` varchar(255) NOT NULL default '',
  `load_functions` text NOT NULL,
  `to_arg_functions` text NOT NULL,
  `access_callback` varchar(255) NOT NULL default '',
  `access_arguments` text,
  `page_callback` varchar(255) NOT NULL default '',
  `page_arguments` text,
  `fit` int(11) NOT NULL default '0',
  `number_parts` smallint(6) NOT NULL default '0',
  `tab_parent` varchar(255) NOT NULL default '',
  `tab_root` varchar(255) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `title_callback` varchar(255) NOT NULL default '',
  `title_arguments` varchar(255) NOT NULL default '',
  `type` int(11) NOT NULL default '0',
  `block_callback` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `position` varchar(255) NOT NULL default '',
  `weight` int(11) NOT NULL default '0',
  `file` mediumtext,
  PRIMARY KEY  (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_menu_router`
--

LOCK TABLES `di_menu_router` WRITE;
/*!40000 ALTER TABLE `di_menu_router` DISABLE KEYS */;
INSERT INTO `di_menu_router` VALUES ('node','','','user_access','a:1:{i:0;s:14:\"access content\";}','node_page_default','a:0:{}',1,1,'','node','Content','t','',4,'','','',0,''),('rss.xml','','','user_access','a:1:{i:0;s:14:\"access content\";}','node_feed','a:0:{}',1,1,'','rss.xml','RSS feed','t','',4,'','','',0,''),('crossdomain.xml','','','services_access_menu','a:0:{}','services_crossdomain_xml','a:0:{}',1,1,'','crossdomain.xml','','t','',4,'','','',0,''),('batch','','','1','a:0:{}','system_batch_page','a:0:{}',1,1,'','batch','','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_main_admin_page','a:0:{}',1,1,'','admin','Administer','t','',6,'','','',9,'modules/system/system.admin.inc'),('logout','','','user_is_logged_in','a:0:{}','user_logout','a:0:{}',1,1,'','logout','Log out','t','',6,'','','',10,'modules/user/user.pages.inc'),('user','','','1','a:0:{}','user_page','a:0:{}',1,1,'','user','User account','t','',4,'','','',0,'modules/user/user.pages.inc'),('user/login','','','user_is_anonymous','a:0:{}','user_page','a:0:{}',3,2,'user','user','Log in','t','',136,'','','',0,'modules/user/user.pages.inc'),('system/files','','','1','a:0:{}','file_download','a:0:{}',3,2,'','system/files','File download','t','',4,'','','',0,''),('cobalt/alias','','','user_access','a:1:{i:0;s:10:\"use cobalt\";}','cobalt_forward_to_alias','a:0:{}',3,2,'','cobalt/alias','Forward to the correct alias','t','',4,'','','',0,''),('oauth/authorized','','','_oauth_common_always_true','a:0:{}','_oauth_common_authorized','a:0:{}',3,2,'','oauth/authorized','Authorization finished','t','',4,'','','',0,'sites/default/modules/oauth_common/oauth_common.pages.inc'),('taxonomy/autocomplete','','','user_access','a:1:{i:0;s:14:\"access content\";}','taxonomy_autocomplete','a:0:{}',3,2,'','taxonomy/autocomplete','Autocomplete taxonomy','t','',4,'','','',0,'modules/taxonomy/taxonomy.pages.inc'),('admin/by-module','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_by_module','a:0:{}',3,2,'admin','admin','By module','t','',128,'','','',2,'modules/system/system.admin.inc'),('admin/by-task','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_main_admin_page','a:0:{}',3,2,'admin','admin','By task','t','',136,'','','',0,'modules/system/system.admin.inc'),('cobalt/clear-cache','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','_cobalt_clear_cache','a:0:{}',3,2,'','cobalt/clear-cache','Clear cache','t','',4,'','','',0,'sites/all/modules/cobalt/cobalt_admin.inc.php'),('admin/compact','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_compact_page','a:0:{}',3,2,'','admin/compact','Compact mode','t','',4,'','','',0,'modules/system/system.admin.inc'),('filter/tips','','','1','a:0:{}','filter_tips_long','a:0:{}',3,2,'','filter/tips','Compose tips','t','',20,'','','',0,'modules/filter/filter.pages.inc'),('node/add','','','_node_add_access','a:0:{}','node_add_page','a:0:{}',3,2,'','node/add','Create content','t','',6,'','','',1,'modules/node/node.pages.inc'),('comment/delete','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_delete','a:0:{}',3,2,'','comment/delete','Delete comment','t','',4,'','','',0,'modules/comment/comment.admin.inc'),('comment/edit','','','user_access','a:1:{i:0;s:13:\"post comments\";}','comment_edit','a:0:{}',3,2,'','comment/edit','Edit comment','t','',4,'','','',0,'modules/comment/comment.pages.inc'),('admin/help','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_main','a:0:{}',3,2,'','admin/help','Help','t','',6,'','','',9,'modules/help/help.admin.inc'),('cobalt/rebuild-permissions','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','_cobalt_rebuild_permissions','a:0:{}',3,2,'','cobalt/rebuild-permissions','Rebuild permissions','t','',4,'','','',0,'sites/all/modules/cobalt/cobalt_admin.inc.php'),('oauth/access_token','','','_oauth_common_always_true','a:0:{}','_oauth_common_access_token','a:0:{}',3,2,'','oauth/access_token','','t','',4,'','','',0,'sites/default/modules/oauth_common/oauth_common.pages.inc'),('oauth/request_token','','','_oauth_common_always_true','a:0:{}','_oauth_common_request_token','a:0:{}',3,2,'','oauth/request_token','','t','',4,'','','',0,'sites/default/modules/oauth_common/oauth_common.pages.inc'),('services/%','a:1:{i:1;N;}','','services_access_menu','a:0:{}','services_server','a:1:{i:0;i:1;}',2,2,'','services/%','Services','t','',4,'','','',0,''),('cobalt/update','','','user_access','a:1:{i:0;s:10:\"use cobalt\";}','cobalt_js_update','a:1:{i:0;s:15:\"cobalt_settings\";}',3,2,'','cobalt/update','Cobalt update','t','',4,'','','',0,'sites/all/modules/cobalt/cobalt_update.inc.php'),('oauth/authorize','','','_oauth_common_always_true','a:0:{}','drupal_get_form','a:1:{i:0;s:23:\"_oauth_common_authorize\";}',3,2,'','oauth/authorize','','t','',4,'','','',0,'sites/default/modules/oauth_common/oauth_common.pages.inc'),('user/register','','','user_register_access','a:0:{}','drupal_get_form','a:1:{i:0;s:13:\"user_register\";}',3,2,'user','user','Create new account','t','',128,'','','',0,'modules/user/user.pages.inc'),('user/password','','','user_is_anonymous','a:0:{}','drupal_get_form','a:1:{i:0;s:9:\"user_pass\";}',3,2,'user','user','Request new password','t','',128,'','','',0,'modules/user/user.pages.inc'),('user/autocomplete','','','user_access','a:1:{i:0;s:20:\"access user profiles\";}','user_autocomplete','a:0:{}',3,2,'','user/autocomplete','User autocomplete','t','',4,'','','',0,'modules/user/user.pages.inc'),('admin/content','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/content','Content management','t','',6,'','Manage your site\'s content.','left',-10,'modules/system/system.admin.inc'),('admin/reports','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/reports','Reports','t','',6,'','View reports from system logs and other status information.','left',5,'modules/system/system.admin.inc'),('admin/build','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/build','Site building','t','',6,'','Control how your site looks and feels.','right',-10,'modules/system/system.admin.inc'),('admin/settings','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_settings_overview','a:0:{}',3,2,'','admin/settings','Site configuration','t','',6,'','Adjust basic site configuration options.','right',-5,'modules/system/system.admin.inc'),('node/%','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:1;}','node_page_view','a:1:{i:0;i:1;}',2,2,'','node/%','','node_page_title','a:1:{i:0;i:1;}',4,'','','',0,''),('admin/user','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/user','User management','t','',6,'','Manage your site\'s users, groups and access to site features.','left',0,'modules/system/system.admin.inc'),('user/%','a:1:{i:1;s:22:\"user_uid_optional_load\";}','a:1:{i:1;s:24:\"user_uid_optional_to_arg\";}','user_view_access','a:1:{i:0;i:1;}','user_view','a:1:{i:0;i:1;}',2,2,'','user/%','My account','user_page_title','a:1:{i:0;i:1;}',6,'','','',0,'modules/user/user.pages.inc'),('node/%/view','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:1;}','node_page_view','a:1:{i:0;i:1;}',5,3,'node/%','node/%','View','t','',136,'','','',-10,''),('user/%/view','a:1:{i:1;s:9:\"user_load\";}','','user_view_access','a:1:{i:0;i:1;}','user_view','a:1:{i:0;i:1;}',5,3,'user/%','user/%','View','t','',136,'','','',-10,'modules/user/user.pages.inc'),('cobalt/data/menu_json','','','user_access','a:1:{i:0;s:10:\"use cobalt\";}','cobalt_menu_json','a:0:{}',7,3,'','cobalt/data/menu_json','Serialized menu','t','',4,'','','',0,''),('admin/settings/actions','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_manage','a:0:{}',7,3,'','admin/settings/actions','Actions','t','',6,'','Manage the actions defined for your site.','',0,''),('admin/build/block','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','block_admin_display','a:0:{}',7,3,'','admin/build/block','Blocks','t','',6,'','Configure what block content appears in your site\'s sidebars and other regions.','',0,'modules/block/block.admin.inc'),('admin/reports/dblog','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_overview','a:0:{}',7,3,'','admin/reports/dblog','Recent log entries','t','',6,'','View events that have recently been logged.','',-1,'modules/dblog/dblog.admin.inc'),('admin/help/dblog','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/dblog','dblog','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/help','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/help','help','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/menu','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/menu','menu','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/node','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/node','node','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/services','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/services','services','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/system','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/system','system','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/taxonomy','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/taxonomy','taxonomy','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/user','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/user','user','t','',4,'','','',0,'modules/help/help.admin.inc'),('oauth/test/valid-access-token','','','user_access','a:1:{i:0;s:14:\"access content\";}','_oauth_common_validate_request_callback','a:1:{i:0;s:12:\"access token\";}',7,3,'','oauth/test/valid-access-token','','t','',4,'','','',0,'sites/default/modules/oauth_common/oauth_common.pages.inc'),('admin/user/rules','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access','a:0:{}',7,3,'','admin/user/rules','Access rules','t','',6,'','List and create rules to disallow usernames, e-mail addresses, and IP addresses.','',0,'modules/user/user.admin.inc'),('admin/content/comment','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_admin','a:0:{}',7,3,'','admin/content/comment','Comments','t','',6,'','List and edit site comments and the comment moderation queue.','',0,'modules/comment/comment.admin.inc'),('admin/content/types','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','node_overview_types','a:0:{}',7,3,'','admin/content/types','Content types','t','',6,'','Manage posts by content type, including default status, front page promotion, etc.','',0,'modules/node/content_types.inc'),('oauth/test/valid-consumer','','','user_access','a:1:{i:0;s:14:\"access content\";}','_oauth_common_validate_request_callback','a:1:{i:0;s:8:\"consumer\";}',7,3,'','oauth/test/valid-consumer','','t','',4,'','','',0,'sites/default/modules/oauth_common/oauth_common.pages.inc'),('admin/settings/logging','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_logging_overview','a:0:{}',7,3,'','admin/settings/logging','Logging and alerts','t','',6,'','Settings for logging and alerts modules. Various modules can route Drupal\'s system events to different destination, such as syslog, database, email, ...etc.','',0,'modules/system/system.admin.inc'),('admin/build/services','','','user_access','a:1:{i:0;s:19:\"administer services\";}','services_admin_browse_index','a:0:{}',7,3,'','admin/build/services','Services','t','',6,'','Allows external applications to communicate with Drupal.','',0,'sites/default/modules/services/services_admin_browse.inc'),('admin/reports/status','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_status','a:0:{}',7,3,'','admin/reports/status','Status report','t','',6,'','Get a status report about your site\'s operation and any detected problems.','',10,'modules/system/system.admin.inc'),('taxonomy/term/%','a:1:{i:2;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','taxonomy_term_page','a:1:{i:0;i:2;}',6,3,'','taxonomy/term/%','Taxonomy term','t','',4,'','','',0,'modules/taxonomy/taxonomy.pages.inc'),('admin/help/block','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/block','block','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/color','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/color','color','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/comment','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/comment','comment','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/filter','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/filter','filter','t','',4,'','','',0,'modules/help/help.admin.inc'),('user/%/applications','a:1:{i:1;s:9:\"user_load\";}','','_oauth_common_user_access','a:2:{i:0;i:1;i:1;s:25:\"oauth authorize consumers\";}','drupal_get_form','a:2:{i:0;s:31:\"_oauth_common_user_applications\";i:1;i:1;}',5,3,'user/%','user/%','Applications','t','',128,'','','',0,'sites/default/modules/oauth_common/oauth_common.pages.inc'),('admin/settings/clean-urls','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_clean_url_settings\";}',7,3,'','admin/settings/clean-urls','Clean URLs','t','',6,'','Enable or disable clean URLs for your site.','',0,'modules/system/system.admin.inc'),('admin/settings/cobalt','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:15:\"cobalt_settings\";}',7,3,'','admin/settings/cobalt','Cobalt configuration','t','',6,'','Settings for cobalt appearance and behaviour','',0,'sites/all/modules/cobalt/cobalt_admin.inc.php'),('admin/content/node','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:18:\"node_admin_content\";}',7,3,'','admin/content/node','Content','t','',6,'','View, edit, and delete your site\'s content.','',0,'modules/node/node.admin.inc'),('admin/settings/date-time','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_date_time_settings\";}',7,3,'','admin/settings/date-time','Date and time','t','',6,'','Settings for how Drupal displays date and time, as well as the system\'s default timezone.','',0,'modules/system/system.admin.inc'),('node/%/delete','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:6:\"delete\";i:1;i:1;}','drupal_get_form','a:2:{i:0;s:19:\"node_delete_confirm\";i:1;i:1;}',5,3,'','node/%/delete','Delete','t','',4,'','','',1,'modules/node/node.pages.inc'),('user/%/delete','a:1:{i:1;s:9:\"user_load\";}','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:2:{i:0;s:19:\"user_confirm_delete\";i:1;i:1;}',5,3,'','user/%/delete','Delete','t','',4,'','','',0,'modules/user/user.pages.inc'),('node/%/edit','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:6:\"update\";i:1;i:1;}','node_page_edit','a:1:{i:0;i:1;}',5,3,'node/%','node/%','Edit','t','',128,'','','',1,'modules/node/node.pages.inc'),('admin/settings/error-reporting','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:31:\"system_error_reporting_settings\";}',7,3,'','admin/settings/error-reporting','Error reporting','t','',6,'','Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.','',0,'modules/system/system.admin.inc'),('admin/settings/file-system','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_file_system_settings\";}',7,3,'','admin/settings/file-system','File system','t','',6,'','Tell Drupal where to store uploaded files and how they are accessed.','',0,'modules/system/system.admin.inc'),('admin/settings/image-toolkit','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:29:\"system_image_toolkit_settings\";}',7,3,'','admin/settings/image-toolkit','Image toolkit','t','',6,'','Choose which image toolkit to use if you have installed optional toolkits.','',0,'modules/system/system.admin.inc'),('admin/settings/filters','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:21:\"filter_admin_overview\";}',7,3,'','admin/settings/filters','Input formats','t','',6,'','Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.','',0,'modules/filter/filter.admin.inc'),('admin/build/menu','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_overview_page','a:0:{}',7,3,'','admin/build/menu','Menus','t','',6,'','Control your site\'s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.','',0,'modules/menu/menu.admin.inc'),('admin/build/modules','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}',7,3,'','admin/build/modules','Modules','t','',6,'','Enable or disable add-on modules for your site.','',0,'modules/system/system.admin.inc'),('admin/settings/oauth','','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','drupal_get_form','a:1:{i:0;s:19:\"_oauth_common_admin\";}',7,3,'','admin/settings/oauth','OAuth','t','',6,'','Settings for OAuth','',0,'sites/default/modules/oauth_common/oauth_common.admin.inc'),('admin/settings/performance','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_performance_settings\";}',7,3,'','admin/settings/performance','Performance','t','',6,'','Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.','',0,'modules/system/system.admin.inc'),('admin/user/permissions','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:15:\"user_admin_perm\";}',7,3,'','admin/user/permissions','Permissions','t','',6,'','Determine access to features by selecting permissions for roles.','',0,'modules/user/user.admin.inc'),('admin/content/node-settings','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:14:\"node_configure\";}',7,3,'','admin/content/node-settings','Post settings','t','',6,'','Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.','',0,'modules/node/node.admin.inc'),('admin/content/rss-publishing','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_rss_feeds_settings\";}',7,3,'','admin/content/rss-publishing','RSS publishing','t','',6,'','Configure the number of items per feed and whether feeds should be titles/teasers/full-text.','',0,'modules/system/system.admin.inc'),('comment/reply/%','a:1:{i:2;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:2;}','comment_reply','a:1:{i:0;i:2;}',6,3,'','comment/reply/%','Reply to comment','t','',4,'','','',0,'modules/comment/comment.pages.inc'),('node/%/revisions','a:1:{i:1;s:9:\"node_load\";}','','_node_revision_access','a:1:{i:0;i:1;}','node_revision_overview','a:1:{i:0;i:1;}',5,3,'node/%','node/%','Revisions','t','',128,'','','',2,'modules/node/node.pages.inc'),('admin/user/roles','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:19:\"user_admin_new_role\";}',7,3,'','admin/user/roles','Roles','t','',6,'','List, edit, or add user roles.','',0,'modules/user/user.admin.inc'),('admin/settings/site-information','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:32:\"system_site_information_settings\";}',7,3,'','admin/settings/site-information','Site information','t','',6,'','Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.','',0,'modules/system/system.admin.inc'),('admin/settings/site-maintenance','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:32:\"system_site_maintenance_settings\";}',7,3,'','admin/settings/site-maintenance','Site maintenance','t','',6,'','Take the site off-line for maintenance or bring it back online.','',0,'modules/system/system.admin.inc'),('admin/content/taxonomy','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:30:\"taxonomy_overview_vocabularies\";}',7,3,'','admin/content/taxonomy','Taxonomy','t','',6,'','Manage tagging, categorization, and classification of your content.','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/build/themes','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:18:\"system_themes_form\";i:1;N;}',7,3,'','admin/build/themes','Themes','t','',6,'','Change which theme your site uses or allows users to set.','',0,'modules/system/system.admin.inc'),('admin/reports/access-denied','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_top','a:1:{i:0;s:13:\"access denied\";}',7,3,'','admin/reports/access-denied','Top \'access denied\' errors','t','',6,'','View \'access denied\' errors (403s).','',0,'modules/dblog/dblog.admin.inc'),('admin/reports/page-not-found','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_top','a:1:{i:0;s:14:\"page not found\";}',7,3,'','admin/reports/page-not-found','Top \'page not found\' errors','t','',6,'','View \'page not found\' errors (404s).','',0,'modules/dblog/dblog.admin.inc'),('admin/user/settings','','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:1:{i:0;s:19:\"user_admin_settings\";}',7,3,'','admin/user/settings','User settings','t','',6,'','Configure default behavior of users, including registration requirements, e-mails, and user pictures.','',0,'modules/user/user.admin.inc'),('admin/user/user','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:4:\"list\";}',7,3,'','admin/user/user','Users','t','',6,'','List, add, and edit users.','',0,'modules/user/user.admin.inc'),('user/%/edit','a:1:{i:1;a:1:{s:18:\"user_category_load\";a:2:{i:0;s:4:\"%map\";i:1;s:6:\"%index\";}}}','','user_edit_access','a:1:{i:0;i:1;}','user_edit','a:1:{i:0;i:1;}',5,3,'user/%','user/%','Edit','t','',128,'','','',0,'modules/user/user.pages.inc'),('admin/settings/admin','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_admin_theme_settings\";}',7,3,'','admin/settings/admin','Administration theme','t','',6,'system_admin_theme_settings','Settings for how your administrative pages should look.','left',0,'modules/system/system.admin.inc'),('node/add/page','','','node_access','a:2:{i:0;s:6:\"create\";i:1;s:4:\"page\";}','node_add','a:1:{i:0;i:2;}',7,3,'','node/add/page','Page','check_plain','',6,'','A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.','',0,'modules/node/node.pages.inc'),('node/add/story','','','node_access','a:2:{i:0;s:6:\"create\";i:1;s:5:\"story\";}','node_add','a:1:{i:0;i:2;}',7,3,'','node/add/story','Story','check_plain','',6,'','A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.','',0,'modules/node/node.pages.inc'),('admin/build/block/list','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','block_admin_display','a:0:{}',15,4,'admin/build/block','admin/build/block','List','t','',136,'','','',-10,'modules/block/block.admin.inc'),('admin/content/node/overview','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:18:\"node_admin_content\";}',15,4,'admin/content/node','admin/content/node','List','t','',136,'','','',-10,'modules/node/node.admin.inc'),('admin/content/taxonomy/list','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:30:\"taxonomy_overview_vocabularies\";}',15,4,'admin/content/taxonomy','admin/content/taxonomy','List','t','',136,'','','',-10,'modules/taxonomy/taxonomy.admin.inc'),('admin/user/user/list','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:4:\"list\";}',15,4,'admin/user/user','admin/user/user','List','t','',136,'','','',-10,'modules/user/user.admin.inc'),('admin/settings/filters/list','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:21:\"filter_admin_overview\";}',15,4,'admin/settings/filters','admin/settings/filters','List','t','',136,'','','',0,'modules/filter/filter.admin.inc'),('admin/content/types/list','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','node_overview_types','a:0:{}',15,4,'admin/content/types','admin/content/types','List','t','',136,'','','',-10,'modules/node/content_types.inc'),('admin/build/modules/list','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}',15,4,'admin/build/modules','admin/build/modules','List','t','',136,'','','',0,'modules/system/system.admin.inc'),('admin/user/rules/list','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access','a:0:{}',15,4,'admin/user/rules','admin/user/rules','List','t','',136,'','','',-10,'modules/user/user.admin.inc'),('admin/content/comment/new','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_admin','a:0:{}',15,4,'admin/content/comment','admin/content/comment','Published comments','t','',136,'','','',-10,'modules/comment/comment.admin.inc'),('user/%/edit/account','a:1:{i:1;a:1:{s:18:\"user_category_load\";a:2:{i:0;s:4:\"%map\";i:1;s:6:\"%index\";}}}','','user_edit_access','a:1:{i:0;i:1;}','user_edit','a:1:{i:0;i:1;}',11,4,'user/%/edit','user/%','Account','t','',136,'','','',0,'modules/user/user.pages.inc'),('admin/build/services/browse','','','user_access','a:1:{i:0;s:19:\"administer services\";}','services_admin_browse_index','a:0:{}',15,4,'admin/build/services','admin/build/services','Browse','t','',136,'','Browse and test available remote services.','',-10,'sites/default/modules/services/services_admin_browse.inc'),('admin/build/themes/select','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:18:\"system_themes_form\";i:1;N;}',15,4,'admin/build/themes','admin/build/themes','List','t','',136,'','Select the default theme.','',-1,'modules/system/system.admin.inc'),('admin/build/menu/list','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_overview_page','a:0:{}',15,4,'admin/build/menu','admin/build/menu','List menus','t','',136,'','','',-10,'modules/menu/menu.admin.inc'),('admin/build/themes/settings','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:21:\"system_theme_settings\";}',15,4,'admin/build/themes','admin/build/themes','Configure','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/settings/actions/manage','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_manage','a:0:{}',15,4,'admin/settings/actions','admin/settings/actions','Manage actions','t','',136,'','Manage the actions defined for your site.','',-2,''),('admin/settings/actions/orphan','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_remove_orphans','a:0:{}',15,4,'','admin/settings/actions/orphan','Remove orphans','t','',4,'','','',0,''),('admin/build/modules/uninstall','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:24:\"system_modules_uninstall\";}',15,4,'admin/build/modules','admin/build/modules','Uninstall','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/settings/filters/add','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:0:{}',15,4,'admin/settings/filters','admin/settings/filters','Add input format','t','',128,'','','',1,'modules/filter/filter.admin.inc'),('admin/services/ahah/security-options','','','user_access','a:1:{i:0;s:19:\"administer services\";}','_services_ahah_security_options','a:0:{}',15,4,'','admin/services/ahah/security-options','','t','',4,'','','',0,'sites/default/modules/services/services_admin_browse.inc'),('admin/user/rules/add','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access_add','a:0:{}',15,4,'admin/user/rules','admin/user/rules','Add rule','t','',128,'','','',0,'modules/user/user.admin.inc'),('admin/user/user/create','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:6:\"create\";}',15,4,'admin/user/user','admin/user/user','Add user','t','',128,'','','',0,'modules/user/user.admin.inc'),('admin/content/comment/approval','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_admin','a:1:{i:0;s:8:\"approval\";}',15,4,'admin/content/comment','admin/content/comment','Approval queue','t','',128,'','','',0,'modules/comment/comment.admin.inc'),('admin/user/rules/check','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access_check','a:0:{}',15,4,'admin/user/rules','admin/user/rules','Check rules','t','',128,'','','',0,'modules/user/user.admin.inc'),('admin/settings/clean-urls/check','','','1','a:0:{}','drupal_json','a:1:{i:0;a:1:{s:6:\"status\";b:1;}}',15,4,'','admin/settings/clean-urls/check','Clean URL check','t','',4,'','','',0,''),('admin/settings/actions/configure','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','drupal_get_form','a:1:{i:0;s:24:\"system_actions_configure\";}',15,4,'','admin/settings/actions/configure','Configure an advanced action','t','',4,'','','',0,''),('admin/settings/date-time/lookup','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_date_time_lookup','a:0:{}',15,4,'','admin/settings/date-time/lookup','Date and time lookup','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/user/roles/edit','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:15:\"user_admin_role\";}',15,4,'','admin/user/roles/edit','Edit role','t','',4,'','','',0,'modules/user/user.admin.inc'),('admin/user/rules/edit','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access_edit','a:0:{}',15,4,'','admin/user/rules/edit','Edit rule','t','',4,'','','',0,'modules/user/user.admin.inc'),('admin/reports/status/php','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_php','a:0:{}',15,4,'','admin/reports/status/php','PHP','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/content/node-settings/rebuild','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','drupal_get_form','a:1:{i:0;s:30:\"node_configure_rebuild_confirm\";}',15,4,'','admin/content/node-settings/rebuild','Rebuild permissions','t','',4,'','','',0,'modules/node/node.admin.inc'),('admin/reports/status/run-cron','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_run_cron','a:0:{}',15,4,'','admin/reports/status/run-cron','Run cron','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/reports/status/sql','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_sql','a:0:{}',15,4,'','admin/reports/status/sql','SQL','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/build/block/add','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:20:\"block_add_block_form\";}',15,4,'admin/build/block','admin/build/block','Add block','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/content/types/add','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:1:{i:0;s:14:\"node_type_form\";}',15,4,'admin/content/types','admin/content/types','Add content type','t','',128,'','','',0,'modules/node/content_types.inc'),('admin/build/menu/add','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:14:\"menu_edit_menu\";i:1;s:3:\"add\";}',15,4,'admin/build/menu','admin/build/menu','Add menu','t','',128,'','','',0,'modules/menu/menu.admin.inc'),('admin/build/services/authentication','','','user_access','a:1:{i:0;s:19:\"administer services\";}','drupal_get_form','a:1:{i:0;s:36:\"_services_oauth_admin_authentication\";}',15,4,'admin/build/services','admin/build/services','Authentication','t','',128,'','','',0,'sites/default/modules/services_oauth/services_oauth.admin.inc'),('admin/settings/oauth/authorizations','','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','drupal_get_form','a:1:{i:0;s:33:\"_oauth_common_admin_authorization\";}',15,4,'admin/settings/oauth','admin/settings/oauth','Authorization levels','t','',128,'','','',0,'sites/default/modules/oauth_common/oauth_common.admin.inc'),('admin/build/block/configure','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:21:\"block_admin_configure\";}',15,4,'','admin/build/block/configure','Configure block','t','',4,'','','',0,'modules/block/block.admin.inc'),('admin/build/block/delete','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:16:\"block_box_delete\";}',15,4,'','admin/build/block/delete','Delete block','t','',4,'','','',0,'modules/block/block.admin.inc'),('admin/settings/filters/delete','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:19:\"filter_admin_delete\";}',15,4,'','admin/settings/filters/delete','Delete input format','t','',4,'','','',0,'modules/filter/filter.admin.inc'),('admin/user/rules/delete','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:32:\"user_admin_access_delete_confirm\";}',15,4,'','admin/user/rules/delete','Delete rule','t','',4,'','','',0,'modules/user/user.admin.inc'),('admin/reports/event/%','a:1:{i:3;N;}','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_event','a:1:{i:0;i:3;}',14,4,'','admin/reports/event/%','Details','t','',4,'','','',0,'modules/dblog/dblog.admin.inc'),('admin/content/taxonomy/%','a:1:{i:3;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:23:\"taxonomy_overview_terms\";i:1;i:3;}',14,4,'','admin/content/taxonomy/%','List terms','t','',4,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/content/node-type/page','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"page\";s:4:\"name\";s:4:\"Page\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:4:\"page\";}}',15,4,'','admin/content/node-type/page','Page','t','',4,'','','',0,'modules/node/content_types.inc'),('admin/build/menu/settings','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:1:{i:0;s:14:\"menu_configure\";}',15,4,'admin/build/menu','admin/build/menu','Settings','t','',128,'','','',5,'modules/menu/menu.admin.inc'),('admin/content/node-type/story','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:5:\"story\";s:4:\"name\";s:5:\"Story\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:392:\"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:5:\"story\";}}',15,4,'','admin/content/node-type/story','Story','t','',4,'','','',0,'modules/node/content_types.inc'),('user/%/applications/add','a:1:{i:1;s:9:\"user_load\";}','','_oauth_common_user_access','a:2:{i:0;i:1;i:1;s:24:\"oauth register consumers\";}','drupal_get_form','a:2:{i:0;s:35:\"_oauth_common_user_applications_add\";i:1;i:1;}',11,4,'','user/%/applications/add','Add application','t','',4,'','','',0,'sites/default/modules/oauth_common/oauth_common.pages.inc'),('admin/settings/logging/dblog','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:20:\"dblog_admin_settings\";}',15,4,'','admin/settings/logging/dblog','Database logging','t','',6,'','Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.','',0,'modules/dblog/dblog.admin.inc'),('admin/build/services/settings','','','user_access','a:1:{i:0;s:19:\"administer services\";}','drupal_get_form','a:1:{i:0;s:23:\"services_admin_settings\";}',15,4,'admin/build/services','admin/build/services','Settings','t','',128,'','Configure service settings.','',0,'sites/default/modules/services/services_admin_browse.inc'),('admin/settings/oauth/general','','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','drupal_get_form','a:1:{i:0;s:19:\"_oauth_common_admin\";}',15,4,'admin/settings/oauth','admin/settings/oauth','Settings','t','',136,'','Settings for OAuth','',-10,'sites/default/modules/oauth_common/oauth_common.admin.inc'),('admin/settings/filters/%','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:1:{i:0;i:3;}',14,4,'','admin/settings/filters/%','','filter_admin_format_title','a:1:{i:0;i:3;}',4,'','','',0,'modules/filter/filter.admin.inc'),('admin/build/menu-customize/%','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:18:\"menu_overview_form\";i:1;i:3;}',14,4,'','admin/build/menu-customize/%','Customize menu','menu_overview_title','a:1:{i:0;i:3;}',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/content/node-type/page/edit','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"page\";s:4:\"name\";s:4:\"Page\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:4:\"page\";}}',31,5,'admin/content/node-type/page','admin/content/node-type/page','Edit','t','',136,'','','',0,'modules/node/content_types.inc'),('admin/content/node-type/story/edit','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:5:\"story\";s:4:\"name\";s:5:\"Story\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:392:\"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:5:\"story\";}}',31,5,'admin/content/node-type/story','admin/content/node-type/story','Edit','t','',136,'','','',0,'modules/node/content_types.inc'),('admin/build/themes/settings/global','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:21:\"system_theme_settings\";}',31,5,'admin/build/themes/settings','admin/build/themes','Global settings','t','',136,'','','',-1,'modules/system/system.admin.inc'),('admin/content/taxonomy/%/list','a:1:{i:3;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:23:\"taxonomy_overview_terms\";i:1;i:3;}',29,5,'admin/content/taxonomy/%','admin/content/taxonomy/%','List','t','',136,'','','',-10,'modules/taxonomy/taxonomy.admin.inc'),('admin/settings/filters/%/edit','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:1:{i:0;i:3;}',29,5,'admin/settings/filters/%','admin/settings/filters/%','Edit','t','',136,'','','',0,'modules/filter/filter.admin.inc'),('admin/build/modules/list/confirm','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}',31,5,'','admin/build/modules/list/confirm','List','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/build/menu-customize/%/list','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:18:\"menu_overview_form\";i:1;i:3;}',29,5,'admin/build/menu-customize/%','admin/build/menu-customize/%','List items','t','',136,'','','',-10,'modules/menu/menu.admin.inc'),('admin/build/modules/uninstall/confirm','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:24:\"system_modules_uninstall\";}',31,5,'','admin/build/modules/uninstall/confirm','Uninstall','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes/settings/acquia_marina','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:49:\"sites/all/themes/acquia_marina/acquia_marina.info\";s:4:\"name\";s:13:\"acquia_marina\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:13:\"Acquia Marina\";s:11:\"description\";s:250:\"<a href=\"http://www.acquia.com\">Acquia\'s</a> Marina theme is ideal for blogs and community sites. Includes advanced theme settings and 15 flexible content regions for a variety of layouts. By <a href=\"http://www.topnotchthemes.com\">TopNotchThemes</a>\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:3:{s:9:\"style.css\";s:40:\"sites/all/themes/acquia_marina/style.css\";s:9:\"icons.css\";s:40:\"sites/all/themes/acquia_marina/icons.css\";s:9:\"local.css\";s:40:\"sites/all/themes/acquia_marina/local.css\";}}s:7:\"regions\";a:15:{s:13:\"sidebar_first\";s:13:\"sidebar first\";s:12:\"sidebar_last\";s:12:\"sidebar last\";s:13:\"header_middle\";s:13:\"header middle\";s:11:\"header_last\";s:11:\"header last\";s:13:\"preface_first\";s:13:\"preface first\";s:14:\"preface_middle\";s:14:\"preface middle\";s:12:\"preface_last\";s:12:\"preface last\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:16:\"postscript_first\";s:16:\"postscript first\";s:17:\"postscript_middle\";s:17:\"postscript middle\";s:15:\"postscript_last\";s:15:\"postscript last\";s:10:\"footer_top\";s:10:\"footer top\";s:6:\"footer\";s:6:\"footer\";s:11:\"node_bottom\";s:11:\"node bottom\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";}s:7:\"version\";s:7:\"6.x-1.9\";s:7:\"project\";s:13:\"acquia_marina\";s:9:\"datestamp\";s:10:\"1242217832\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:40:\"sites/all/themes/acquia_marina/script.js\";}s:10:\"screenshot\";s:45:\"sites/all/themes/acquia_marina/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:3:{s:9:\"style.css\";s:40:\"sites/all/themes/acquia_marina/style.css\";s:9:\"icons.css\";s:40:\"sites/all/themes/acquia_marina/icons.css\";s:9:\"local.css\";s:40:\"sites/all/themes/acquia_marina/local.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:40:\"sites/all/themes/acquia_marina/script.js\";}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:13:\"acquia_marina\";}',31,5,'admin/build/themes/settings','admin/build/themes','Acquia Marina','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes/settings/acquia_slate','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:47:\"sites/all/themes/acquia_slate/acquia_slate.info\";s:4:\"name\";s:12:\"acquia_slate\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:12:\"Acquia Slate\";s:11:\"description\";s:252:\"<a href=\"http://www.acquia.com\">Acquia\'s</a> Slate theme is ideal for corporate and business sites. Includes advanced theme settings and 12 flexible content regions for a variety of layouts. By <a href=\"http://www.topnotchthemes.com\">TopNotchThemes</a>\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:39:\"sites/all/themes/acquia_slate/style.css\";s:9:\"dblog.css\";s:39:\"sites/all/themes/acquia_slate/dblog.css\";}}s:7:\"scripts\";a:2:{s:9:\"script.js\";s:39:\"sites/all/themes/acquia_slate/script.js\";s:19:\"jquery.overlabel.js\";s:49:\"sites/all/themes/acquia_slate/jquery.overlabel.js\";}s:7:\"regions\";a:14:{s:13:\"sidebar_first\";s:13:\"sidebar first\";s:12:\"sidebar_last\";s:12:\"sidebar last\";s:6:\"banner\";s:6:\"banner\";s:10:\"header_top\";s:10:\"header top\";s:12:\"header_first\";s:12:\"header first\";s:13:\"header_middle\";s:13:\"header middle\";s:15:\"preface_sidebar\";s:21:\"front preface sidebar\";s:11:\"content_top\";s:17:\"inner content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:16:\"postscript_first\";s:16:\"postscript first\";s:17:\"postscript_middle\";s:17:\"postscript middle\";s:15:\"postscript_last\";s:15:\"postscript last\";s:6:\"footer\";s:6:\"footer\";s:11:\"node_bottom\";s:11:\"node bottom\";}s:8:\"features\";a:8:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:6:\"search\";i:5;s:7:\"favicon\";i:6;s:13:\"primary_links\";i:7;s:15:\"secondary_links\";}s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:12:\"acquia_slate\";s:9:\"datestamp\";s:10:\"1242218140\";s:10:\"screenshot\";s:44:\"sites/all/themes/acquia_slate/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:39:\"sites/all/themes/acquia_slate/style.css\";s:9:\"dblog.css\";s:39:\"sites/all/themes/acquia_slate/dblog.css\";}}s:7:\"scripts\";a:2:{s:9:\"script.js\";s:39:\"sites/all/themes/acquia_slate/script.js\";s:19:\"jquery.overlabel.js\";s:49:\"sites/all/themes/acquia_slate/jquery.overlabel.js\";}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:12:\"acquia_slate\";}',31,5,'admin/build/themes/settings','admin/build/themes','Acquia Slate','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/content/node-type/page/delete','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"node_type_delete_confirm\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"page\";s:4:\"name\";s:4:\"Page\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:4:\"page\";}}',31,5,'','admin/content/node-type/page/delete','Delete','t','',4,'','','',0,'modules/node/content_types.inc'),('admin/content/node-type/story/delete','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"node_type_delete_confirm\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:5:\"story\";s:4:\"name\";s:5:\"Story\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:392:\"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:5:\"story\";}}',31,5,'','admin/content/node-type/story/delete','Delete','t','',4,'','','',0,'modules/node/content_types.inc'),('admin/content/taxonomy/edit/term','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','taxonomy_admin_term_edit','a:0:{}',31,5,'','admin/content/taxonomy/edit/term','Edit term','t','',4,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/build/themes/settings/garland','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:27:\"themes/garland/garland.info\";s:4:\"name\";s:7:\"garland\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:66:\"Tableless, recolorable, multi-column, fluid width theme (default).\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:24:\"themes/garland/script.js\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:7:\"garland\";}',31,5,'admin/build/themes/settings','admin/build/themes','Garland','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/block/list/js','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','block_admin_display_js','a:0:{}',31,5,'','admin/build/block/list/js','JavaScript List Form','t','',4,'','','',0,'modules/block/block.admin.inc'),('admin/build/themes/settings/minnelli','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:37:\"themes/garland/minnelli/minnelli.info\";s:4:\"name\";s:8:\"minnelli\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:14:{s:4:\"name\";s:8:\"Minnelli\";s:11:\"description\";s:56:\"Tableless, recolorable, multi-column, fixed width theme.\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:7:\"garland\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/garland/minnelli/script.js\";}s:10:\"screenshot\";s:38:\"themes/garland/minnelli/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:7:\"garland\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:8:\"minnelli\";}',31,5,'admin/build/themes/settings','admin/build/themes','Minnelli','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/block/list/acquia_marina','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:49:\"sites/all/themes/acquia_marina/acquia_marina.info\";s:4:\"name\";s:13:\"acquia_marina\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:13:\"Acquia Marina\";s:11:\"description\";s:250:\"<a href=\"http://www.acquia.com\">Acquia\'s</a> Marina theme is ideal for blogs and community sites. Includes advanced theme settings and 15 flexible content regions for a variety of layouts. By <a href=\"http://www.topnotchthemes.com\">TopNotchThemes</a>\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:3:{s:9:\"style.css\";s:40:\"sites/all/themes/acquia_marina/style.css\";s:9:\"icons.css\";s:40:\"sites/all/themes/acquia_marina/icons.css\";s:9:\"local.css\";s:40:\"sites/all/themes/acquia_marina/local.css\";}}s:7:\"regions\";a:15:{s:13:\"sidebar_first\";s:13:\"sidebar first\";s:12:\"sidebar_last\";s:12:\"sidebar last\";s:13:\"header_middle\";s:13:\"header middle\";s:11:\"header_last\";s:11:\"header last\";s:13:\"preface_first\";s:13:\"preface first\";s:14:\"preface_middle\";s:14:\"preface middle\";s:12:\"preface_last\";s:12:\"preface last\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:16:\"postscript_first\";s:16:\"postscript first\";s:17:\"postscript_middle\";s:17:\"postscript middle\";s:15:\"postscript_last\";s:15:\"postscript last\";s:10:\"footer_top\";s:10:\"footer top\";s:6:\"footer\";s:6:\"footer\";s:11:\"node_bottom\";s:11:\"node bottom\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";}s:7:\"version\";s:7:\"6.x-1.9\";s:7:\"project\";s:13:\"acquia_marina\";s:9:\"datestamp\";s:10:\"1242217832\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:40:\"sites/all/themes/acquia_marina/script.js\";}s:10:\"screenshot\";s:45:\"sites/all/themes/acquia_marina/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:3:{s:9:\"style.css\";s:40:\"sites/all/themes/acquia_marina/style.css\";s:9:\"icons.css\";s:40:\"sites/all/themes/acquia_marina/icons.css\";s:9:\"local.css\";s:40:\"sites/all/themes/acquia_marina/local.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:40:\"sites/all/themes/acquia_marina/script.js\";}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:13:\"acquia_marina\";}',31,5,'admin/build/block/list','admin/build/block','Acquia Marina','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/build/block/list/acquia_slate','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:47:\"sites/all/themes/acquia_slate/acquia_slate.info\";s:4:\"name\";s:12:\"acquia_slate\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:12:\"Acquia Slate\";s:11:\"description\";s:252:\"<a href=\"http://www.acquia.com\">Acquia\'s</a> Slate theme is ideal for corporate and business sites. Includes advanced theme settings and 12 flexible content regions for a variety of layouts. By <a href=\"http://www.topnotchthemes.com\">TopNotchThemes</a>\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:39:\"sites/all/themes/acquia_slate/style.css\";s:9:\"dblog.css\";s:39:\"sites/all/themes/acquia_slate/dblog.css\";}}s:7:\"scripts\";a:2:{s:9:\"script.js\";s:39:\"sites/all/themes/acquia_slate/script.js\";s:19:\"jquery.overlabel.js\";s:49:\"sites/all/themes/acquia_slate/jquery.overlabel.js\";}s:7:\"regions\";a:14:{s:13:\"sidebar_first\";s:13:\"sidebar first\";s:12:\"sidebar_last\";s:12:\"sidebar last\";s:6:\"banner\";s:6:\"banner\";s:10:\"header_top\";s:10:\"header top\";s:12:\"header_first\";s:12:\"header first\";s:13:\"header_middle\";s:13:\"header middle\";s:15:\"preface_sidebar\";s:21:\"front preface sidebar\";s:11:\"content_top\";s:17:\"inner content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:16:\"postscript_first\";s:16:\"postscript first\";s:17:\"postscript_middle\";s:17:\"postscript middle\";s:15:\"postscript_last\";s:15:\"postscript last\";s:6:\"footer\";s:6:\"footer\";s:11:\"node_bottom\";s:11:\"node bottom\";}s:8:\"features\";a:8:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:6:\"search\";i:5;s:7:\"favicon\";i:6;s:13:\"primary_links\";i:7;s:15:\"secondary_links\";}s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:12:\"acquia_slate\";s:9:\"datestamp\";s:10:\"1242218140\";s:10:\"screenshot\";s:44:\"sites/all/themes/acquia_slate/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:39:\"sites/all/themes/acquia_slate/style.css\";s:9:\"dblog.css\";s:39:\"sites/all/themes/acquia_slate/dblog.css\";}}s:7:\"scripts\";a:2:{s:9:\"script.js\";s:39:\"sites/all/themes/acquia_slate/script.js\";s:19:\"jquery.overlabel.js\";s:49:\"sites/all/themes/acquia_slate/jquery.overlabel.js\";}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:12:\"acquia_slate\";}',31,5,'admin/build/block/list','admin/build/block','Acquia Slate','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/build/menu-customize/%/add','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:4:{i:0;s:14:\"menu_edit_item\";i:1;s:3:\"add\";i:2;N;i:3;i:3;}',29,5,'admin/build/menu-customize/%','admin/build/menu-customize/%','Add item','t','',128,'','','',0,'modules/menu/menu.admin.inc'),('admin/settings/filters/%/configure','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_configure_page','a:1:{i:0;i:3;}',29,5,'admin/settings/filters/%','admin/settings/filters/%','Configure','t','',128,'','','',1,'modules/filter/filter.admin.inc'),('admin/settings/actions/delete/%','a:1:{i:4;s:12:\"actions_load\";}','','user_access','a:1:{i:0;s:18:\"administer actions\";}','drupal_get_form','a:2:{i:0;s:26:\"system_actions_delete_form\";i:1;i:4;}',30,5,'','admin/settings/actions/delete/%','Delete action','t','',4,'','Delete an action.','',0,''),('admin/build/menu-customize/%/delete','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_delete_menu_page','a:1:{i:0;i:3;}',29,5,'','admin/build/menu-customize/%/delete','Delete menu','t','',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/build/menu-customize/%/edit','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:3:{i:0;s:14:\"menu_edit_menu\";i:1;s:4:\"edit\";i:2;i:3;}',29,5,'admin/build/menu-customize/%','admin/build/menu-customize/%','Edit menu','t','',128,'','','',0,'modules/menu/menu.admin.inc'),('admin/build/block/list/garland','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:27:\"themes/garland/garland.info\";s:4:\"name\";s:7:\"garland\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:66:\"Tableless, recolorable, multi-column, fluid width theme (default).\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:24:\"themes/garland/script.js\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:7:\"garland\";}',31,5,'admin/build/block/list','admin/build/block','Garland','t','',136,'','','',-10,'modules/block/block.admin.inc'),('admin/build/services/settings/general','','','user_access','a:1:{i:0;s:19:\"administer services\";}','drupal_get_form','a:1:{i:0;s:23:\"services_admin_settings\";}',31,5,'admin/build/services/settings','admin/build/services','General','t','',136,'','Configure service settings.','',-10,''),('admin/build/block/list/minnelli','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:37:\"themes/garland/minnelli/minnelli.info\";s:4:\"name\";s:8:\"minnelli\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:14:{s:4:\"name\";s:8:\"Minnelli\";s:11:\"description\";s:56:\"Tableless, recolorable, multi-column, fixed width theme.\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:7:\"garland\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/garland/minnelli/script.js\";}s:10:\"screenshot\";s:38:\"themes/garland/minnelli/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:7:\"garland\";}}','block_admin_display','a:1:{i:0;s:8:\"minnelli\";}',31,5,'admin/build/block/list','admin/build/block','Minnelli','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/settings/filters/%/order','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_order_page','a:1:{i:0;i:3;}',29,5,'admin/settings/filters/%','admin/settings/filters/%','Rearrange','t','',128,'','','',2,'modules/filter/filter.admin.inc'),('user/reset/%/%/%','a:3:{i:2;N;i:3;N;i:4;N;}','','1','a:0:{}','drupal_get_form','a:4:{i:0;s:15:\"user_pass_reset\";i:1;i:2;i:2;i:3;i:3;i:4;}',24,5,'','user/reset/%/%/%','Reset password','t','',4,'','','',0,'modules/user/user.pages.inc'),('admin/content/taxonomy/add/vocabulary','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:24:\"taxonomy_form_vocabulary\";}',31,5,'admin/content/taxonomy','admin/content/taxonomy','Add vocabulary','t','',128,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('user/%/applications/authorization/%','a:2:{i:1;s:9:\"user_load\";i:4;N;}','','_oauth_common_user_access','a:2:{i:0;i:1;i:1;s:25:\"oauth authorize consumers\";}','drupal_get_form','a:3:{i:0;s:37:\"_oauth_common_user_authorization_edit\";i:1;i:1;i:2;i:4;}',22,5,'','user/%/applications/authorization/%','Edit authorization','t','',4,'','','',0,'sites/default/modules/oauth_common/oauth_common.pages.inc'),('node/%/revisions/%/view','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:1:{i:0;i:1;}','node_show','a:3:{i:0;i:1;i:1;N;i:2;b:1;}',21,5,'','node/%/revisions/%/view','Revisions','t','',4,'','','',0,''),('admin/build/services/browse/%','a:1:{i:4;s:20:\"services_method_load\";}','','user_access','a:1:{i:0;s:19:\"administer services\";}','services_admin_browse_method','a:1:{i:0;i:4;}',30,5,'admin/build/services/browse','admin/build/services','Services','t','',128,'','Calls a Services method.','',0,'sites/default/modules/services/services_admin_browse.inc'),('node/%/revisions/%/delete','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:2:{i:0;i:1;i:1;s:6:\"delete\";}','drupal_get_form','a:2:{i:0;s:28:\"node_revision_delete_confirm\";i:1;i:1;}',21,5,'','node/%/revisions/%/delete','Delete earlier revision','t','',4,'','','',0,'modules/node/node.pages.inc'),('node/%/revisions/%/revert','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:2:{i:0;i:1;i:1;s:6:\"update\";}','drupal_get_form','a:2:{i:0;s:28:\"node_revision_revert_confirm\";i:1;i:1;}',21,5,'','node/%/revisions/%/revert','Revert to earlier revision','t','',4,'','','',0,'modules/node/node.pages.inc'),('admin/settings/oauth/authorization/%/delete','a:1:{i:4;N;}','','user_access','a:1:{i:0;s:16:\"administer oauth\";}','drupal_get_form','a:2:{i:0;s:40:\"_oauth_common_admin_authorization_delete\";i:1;i:4;}',61,6,'','admin/settings/oauth/authorization/%/delete','Delete authorization level','t','',4,'','','',0,'sites/default/modules/oauth_common/oauth_common.admin.inc'),('admin/build/menu/item/%/delete','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_item_delete_page','a:1:{i:0;i:4;}',61,6,'','admin/build/menu/item/%/delete','Delete menu item','t','',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/build/menu/item/%/edit','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:4:{i:0;s:14:\"menu_edit_item\";i:1;s:4:\"edit\";i:2;i:4;i:3;N;}',61,6,'','admin/build/menu/item/%/edit','Edit menu item','t','',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/content/taxonomy/edit/vocabulary/%','a:1:{i:5;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','taxonomy_admin_vocabulary_edit','a:1:{i:0;i:5;}',62,6,'','admin/content/taxonomy/edit/vocabulary/%','Edit vocabulary','t','',4,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/build/menu/item/%/reset','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:23:\"menu_reset_item_confirm\";i:1;i:4;}',61,6,'','admin/build/menu/item/%/reset','Reset menu item','t','',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/content/taxonomy/%/add/term','a:1:{i:3;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','taxonomy_add_term_page','a:1:{i:0;i:3;}',59,6,'admin/content/taxonomy/%','admin/content/taxonomy/%','Add term','t','',128,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('user/%/applications/authorization/%/delete','a:2:{i:1;s:9:\"user_load\";i:4;N;}','','user_edit_access','a:1:{i:0;i:1;}','drupal_get_form','a:3:{i:0;s:39:\"_oauth_common_user_authorization_delete\";i:1;i:1;i:2;i:4;}',45,6,'','user/%/applications/authorization/%/delete','Delete authorization','t','',4,'','','',0,'sites/default/modules/oauth_common/oauth_common.pages.inc');
/*!40000 ALTER TABLE `di_menu_router` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_node`
--

DROP TABLE IF EXISTS `di_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_node` (
  `nid` int(10) unsigned NOT NULL auto_increment,
  `vid` int(10) unsigned NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  `language` varchar(12) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `uid` int(11) NOT NULL default '0',
  `status` int(11) NOT NULL default '1',
  `created` int(11) NOT NULL default '0',
  `changed` int(11) NOT NULL default '0',
  `comment` int(11) NOT NULL default '0',
  `promote` int(11) NOT NULL default '0',
  `moderate` int(11) NOT NULL default '0',
  `sticky` int(11) NOT NULL default '0',
  `tnid` int(10) unsigned NOT NULL default '0',
  `translate` int(11) NOT NULL default '0',
  PRIMARY KEY  (`nid`),
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_node`
--

LOCK TABLES `di_node` WRITE;
/*!40000 ALTER TABLE `di_node` DISABLE KEYS */;
INSERT INTO `di_node` VALUES (1,1,'story','','Some story!',1,1,1251269143,1251269143,2,1,0,0,0,0),(2,2,'story','','Another scoop',1,1,1251269435,1251269435,2,1,0,0,0,0);
/*!40000 ALTER TABLE `di_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_node_access`
--

DROP TABLE IF EXISTS `di_node_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_node_access` (
  `nid` int(10) unsigned NOT NULL default '0',
  `gid` int(10) unsigned NOT NULL default '0',
  `realm` varchar(255) NOT NULL default '',
  `grant_view` tinyint(3) unsigned NOT NULL default '0',
  `grant_update` tinyint(3) unsigned NOT NULL default '0',
  `grant_delete` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`,`gid`,`realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_node_access`
--

LOCK TABLES `di_node_access` WRITE;
/*!40000 ALTER TABLE `di_node_access` DISABLE KEYS */;
INSERT INTO `di_node_access` VALUES (0,0,'all',1,0,0);
/*!40000 ALTER TABLE `di_node_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_node_comment_statistics`
--

DROP TABLE IF EXISTS `di_node_comment_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL default '0',
  `last_comment_timestamp` int(11) NOT NULL default '0',
  `last_comment_name` varchar(60) default NULL,
  `last_comment_uid` int(11) NOT NULL default '0',
  `comment_count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_node_comment_statistics`
--

LOCK TABLES `di_node_comment_statistics` WRITE;
/*!40000 ALTER TABLE `di_node_comment_statistics` DISABLE KEYS */;
INSERT INTO `di_node_comment_statistics` VALUES (1,1251269143,NULL,1,0),(2,1251269435,NULL,1,0);
/*!40000 ALTER TABLE `di_node_comment_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_node_counter`
--

DROP TABLE IF EXISTS `di_node_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_node_counter` (
  `nid` int(11) NOT NULL default '0',
  `totalcount` bigint(20) unsigned NOT NULL default '0',
  `daycount` mediumint(8) unsigned NOT NULL default '0',
  `timestamp` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_node_counter`
--

LOCK TABLES `di_node_counter` WRITE;
/*!40000 ALTER TABLE `di_node_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_node_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_node_revisions`
--

DROP TABLE IF EXISTS `di_node_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_node_revisions` (
  `nid` int(10) unsigned NOT NULL default '0',
  `vid` int(10) unsigned NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `body` longtext NOT NULL,
  `teaser` longtext NOT NULL,
  `log` longtext NOT NULL,
  `timestamp` int(11) NOT NULL default '0',
  `format` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_node_revisions`
--

LOCK TABLES `di_node_revisions` WRITE;
/*!40000 ALTER TABLE `di_node_revisions` DISABLE KEYS */;
INSERT INTO `di_node_revisions` VALUES (1,1,1,'Some story!','Praesent dui sem, molestie posuere ornare ut, vestibulum a nibh. Mauris suscipit, magna non iaculis euismod, turpis ante cursus nisi, a tempus eros lacus et lacus. Curabitur metus metus, porttitor ut consequat sit amet, lobortis ac odio. Curabitur eget mauris nec nibh molestie consectetur. Phasellus tristique vehicula mollis. Phasellus ac magna nibh. Nam volutpat massa in nulla hendrerit at iaculis magna vulputate. Cras faucibus mi non tortor interdum iaculis. Aliquam tellus libero, consectetur sed venenatis ac, lacinia sit amet purus. Sed sagittis, magna at luctus malesuada, dolor tortor cursus risus, et feugiat dui turpis ac massa. Pellentesque at augue purus, vitae dignissim velit. Aliquam ante orci, sagittis in aliquam at, consectetur porttitor eros. Praesent sit amet volutpat libero. Donec eget pellentesque neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n\r\nMaecenas metus leo, pellentesque et accumsan ac, consequat volutpat odio. In bibendum interdum elementum. Aliquam lacinia magna sit amet enim lacinia congue. Ut tempor vestibulum sodales. Phasellus velit tortor, tristique at vestibulum id, gravida aliquet diam. Donec sed lacus ligula. Curabitur in ante sed nunc accumsan pretium. Proin hendrerit aliquet urna. Nam sit amet est eu odio placerat hendrerit at in mi. Proin dolor mi, tincidunt vitae dignissim vitae, pretium non lacus. Donec volutpat, nibh sit amet scelerisque iaculis, nisi metus vestibulum urna, eu vulputate augue lorem in est. Integer ac orci lacus, in condimentum arcu. Proin bibendum purus faucibus diam facilisis et pulvinar tortor porta. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam hendrerit dignissim augue, vitae laoreet est dictum in.\r\n\r\nMauris at odio sit amet nulla tincidunt posuere sit amet ut lectus. Mauris velit felis, pretium eget luctus nec, placerat ut nunc. Morbi consectetur dignissim justo at ullamcorper. Duis nec nulla velit, id hendrerit velit. Sed est nisl, fermentum vitae interdum vel, porta eu velit. Nulla a molestie nisl. Quisque in arcu mi, vel tincidunt ipsum. Mauris eleifend, ipsum quis dictum aliquam, ante nisi dictum tortor, ac egestas massa magna eu leo. Fusce eget metus dolor. Sed nec elit tortor. Phasellus a purus justo. Nullam congue luctus elementum. In placerat magna nisl, et consequat dui. Suspendisse bibendum dignissim varius. Ut libero ligula, congue a tincidunt scelerisque, eleifend sed justo. Aliquam erat volutpat.','Praesent dui sem, molestie posuere ornare ut, vestibulum a nibh. Mauris suscipit, magna non iaculis euismod, turpis ante cursus nisi, a tempus eros lacus et lacus. Curabitur metus metus, porttitor ut consequat sit amet, lobortis ac odio. Curabitur eget mauris nec nibh molestie consectetur. Phasellus tristique vehicula mollis. Phasellus ac magna nibh. Nam volutpat massa in nulla hendrerit at iaculis magna vulputate. Cras faucibus mi non tortor interdum iaculis. Aliquam tellus libero, consectetur sed venenatis ac, lacinia sit amet purus.','',1251269143,1),(2,2,1,'Another scoop','Mauris at odio sit amet nulla tincidunt posuere sit amet ut lectus. Mauris velit felis, pretium eget luctus nec, placerat ut nunc. Morbi consectetur dignissim justo at ullamcorper. Duis nec nulla velit, id hendrerit velit. Sed est nisl, fermentum vitae interdum vel, porta eu velit. Nulla a molestie nisl. Quisque in arcu mi, vel tincidunt ipsum. Mauris eleifend, ipsum quis dictum aliquam, ante nisi dictum tortor, ac egestas massa magna eu leo. Fusce eget metus dolor. Sed nec elit tortor. Phasellus a purus justo. Nullam congue luctus elementum. In placerat magna nisl, et consequat dui. Suspendisse bibendum dignissim varius. Ut libero ligula, congue a tincidunt scelerisque, eleifend sed justo. Aliquam erat volutpat.\r\n\r\nIn hac habitasse platea dictumst. Donec vitae quam felis. In dui dolor, interdum eu sodales at, consequat sed sem. In convallis dictum feugiat. Donec ligula nulla, laoreet in semper at, scelerisque ac mi. Etiam felis enim, volutpat sed laoreet quis, semper vel quam. Fusce semper blandit massa eget luctus. Donec lobortis consequat nisi, ut consequat metus viverra eu. Donec quam mauris, tincidunt in venenatis rutrum, aliquet vel enim. Aliquam erat volutpat. In feugiat, leo eget feugiat malesuada, tortor nisi aliquet elit, nec facilisis tellus magna et neque. Nulla facilisi. Donec sed ultricies ligula. Proin sagittis odio ut dui convallis scelerisque et molestie nisi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin sodales consectetur ante at volutpat. Morbi vel urna ut ligula auctor fringilla at vel diam. Phasellus massa purus, ultricies vel vehicula id, tempor sed mauris. Etiam ultrices vehicula lorem eu accumsan.','Mauris at odio sit amet nulla tincidunt posuere sit amet ut lectus. Mauris velit felis, pretium eget luctus nec, placerat ut nunc. Morbi consectetur dignissim justo at ullamcorper. Duis nec nulla velit, id hendrerit velit. Sed est nisl, fermentum vitae interdum vel, porta eu velit. Nulla a molestie nisl. Quisque in arcu mi, vel tincidunt ipsum. Mauris eleifend, ipsum quis dictum aliquam, ante nisi dictum tortor, ac egestas massa magna eu leo. Fusce eget metus dolor. Sed nec elit tortor. Phasellus a purus justo. Nullam congue luctus elementum. In placerat magna nisl, et consequat dui.','',1251269435,1);
/*!40000 ALTER TABLE `di_node_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_node_type`
--

DROP TABLE IF EXISTS `di_node_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_node_type` (
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `module` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `help` mediumtext NOT NULL,
  `has_title` tinyint(3) unsigned NOT NULL,
  `title_label` varchar(255) NOT NULL default '',
  `has_body` tinyint(3) unsigned NOT NULL,
  `body_label` varchar(255) NOT NULL default '',
  `min_word_count` smallint(5) unsigned NOT NULL,
  `custom` tinyint(4) NOT NULL default '0',
  `modified` tinyint(4) NOT NULL default '0',
  `locked` tinyint(4) NOT NULL default '0',
  `orig_type` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_node_type`
--

LOCK TABLES `di_node_type` WRITE;
/*!40000 ALTER TABLE `di_node_type` DISABLE KEYS */;
INSERT INTO `di_node_type` VALUES ('page','Page','node','A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.','',1,'Title',1,'Body',0,1,1,0,'page'),('story','Story','node','A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.','',1,'Title',1,'Body',0,1,1,0,'story');
/*!40000 ALTER TABLE `di_node_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_oauth_authorization_levels`
--

DROP TABLE IF EXISTS `di_oauth_authorization_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_oauth_authorization_levels` (
  `name` varchar(32) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_oauth_authorization_levels`
--

LOCK TABLES `di_oauth_authorization_levels` WRITE;
/*!40000 ALTER TABLE `di_oauth_authorization_levels` DISABLE KEYS */;
INSERT INTO `di_oauth_authorization_levels` VALUES ('read','Read access','This will allow !appname to fetch content that you have access to on !sitename.');
/*!40000 ALTER TABLE `di_oauth_authorization_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_oauth_common_consumer`
--

DROP TABLE IF EXISTS `di_oauth_common_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_oauth_common_consumer` (
  `consumer_key` varchar(32) NOT NULL,
  `provider_consumer` tinyint(3) unsigned NOT NULL default '1',
  `secret` varchar(32) NOT NULL,
  `created` int(11) NOT NULL default '0',
  `changed` int(11) NOT NULL default '0',
  `uid` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` varchar(32) NOT NULL,
  `callback_url` varchar(255) NOT NULL,
  PRIMARY KEY  (`consumer_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_oauth_common_consumer`
--

LOCK TABLES `di_oauth_common_consumer` WRITE;
/*!40000 ALTER TABLE `di_oauth_common_consumer` DISABLE KEYS */;
INSERT INTO `di_oauth_common_consumer` VALUES ('92dyZAANYnepnjG69suXV775rKDgnhzi',1,'ffRTh8pP9gfWSFpu3NJt6j5v6j4ENZSf',1251300822,1251300822,1,'iPhone','community','');
/*!40000 ALTER TABLE `di_oauth_common_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_oauth_common_consumer_token`
--

DROP TABLE IF EXISTS `di_oauth_common_consumer_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_oauth_common_consumer_token` (
  `token_key` varchar(32) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `type` varchar(8) NOT NULL,
  `uid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`token_key`),
  KEY `token_key_type` (`token_key`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_oauth_common_consumer_token`
--

LOCK TABLES `di_oauth_common_consumer_token` WRITE;
/*!40000 ALTER TABLE `di_oauth_common_consumer_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_oauth_common_consumer_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_oauth_common_nonce`
--

DROP TABLE IF EXISTS `di_oauth_common_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_oauth_common_nonce` (
  `nonce` varchar(32) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `token` varchar(32) default NULL,
  PRIMARY KEY  (`nonce`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_oauth_common_nonce`
--

LOCK TABLES `di_oauth_common_nonce` WRITE;
/*!40000 ALTER TABLE `di_oauth_common_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_oauth_common_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_oauth_common_token`
--

DROP TABLE IF EXISTS `di_oauth_common_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_oauth_common_token` (
  `token_key` varchar(32) NOT NULL,
  `provider_token` tinyint(3) unsigned NOT NULL default '1',
  `secret` varchar(32) NOT NULL,
  `created` int(11) NOT NULL default '0',
  `changed` int(11) NOT NULL default '0',
  `expires` int(11) NOT NULL default '0',
  `type` varchar(7) NOT NULL,
  `uid` int(10) unsigned NOT NULL default '0',
  `consumer_key` varchar(32) NOT NULL,
  `services` text,
  `authorized` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`token_key`),
  KEY `token_key_type` (`token_key`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_oauth_common_token`
--

LOCK TABLES `di_oauth_common_token` WRITE;
/*!40000 ALTER TABLE `di_oauth_common_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_oauth_common_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_permission`
--

DROP TABLE IF EXISTS `di_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_permission` (
  `pid` int(11) NOT NULL auto_increment,
  `rid` int(10) unsigned NOT NULL default '0',
  `perm` longtext,
  `tid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`pid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_permission`
--

LOCK TABLES `di_permission` WRITE;
/*!40000 ALTER TABLE `di_permission` DISABLE KEYS */;
INSERT INTO `di_permission` VALUES (1,1,'access content',0),(2,2,'access comments, access content, post comments, post comments without approval',0);
/*!40000 ALTER TABLE `di_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_role`
--

DROP TABLE IF EXISTS `di_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_role` (
  `rid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_role`
--

LOCK TABLES `di_role` WRITE;
/*!40000 ALTER TABLE `di_role` DISABLE KEYS */;
INSERT INTO `di_role` VALUES (1,'anonymous user'),(2,'authenticated user');
/*!40000 ALTER TABLE `di_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_sessions`
--

DROP TABLE IF EXISTS `di_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_sessions` (
  `uid` int(10) unsigned NOT NULL,
  `sid` varchar(64) NOT NULL default '',
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  `cache` int(11) NOT NULL default '0',
  `session` longtext,
  PRIMARY KEY  (`sid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_sessions`
--

LOCK TABLES `di_sessions` WRITE;
/*!40000 ALTER TABLE `di_sessions` DISABLE KEYS */;
INSERT INTO `di_sessions` VALUES (0,'10009aaadc0e0dbffde4744e83505075','127.0.0.1',1251576388,0,''),(1,'45959da83837f57c456558b3afdaeb5e','127.0.0.1',1251578870,0,'user_overview_filter|a:0:{}');
/*!40000 ALTER TABLE `di_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_system`
--

DROP TABLE IF EXISTS `di_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_system` (
  `filename` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `type` varchar(255) NOT NULL default '',
  `owner` varchar(255) NOT NULL default '',
  `status` int(11) NOT NULL default '0',
  `throttle` tinyint(4) NOT NULL default '0',
  `bootstrap` int(11) NOT NULL default '0',
  `schema_version` smallint(6) NOT NULL default '-1',
  `weight` int(11) NOT NULL default '0',
  `info` text,
  PRIMARY KEY  (`filename`),
  KEY `modules` (`type`(12),`status`,`weight`,`filename`),
  KEY `bootstrap` (`type`(12),`status`,`bootstrap`,`weight`,`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_system`
--

LOCK TABLES `di_system` WRITE;
/*!40000 ALTER TABLE `di_system` DISABLE KEYS */;
INSERT INTO `di_system` VALUES ('sites/all/themes/acquia_marina/acquia_marina.info','acquia_marina','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:13:{s:4:\"name\";s:13:\"Acquia Marina\";s:11:\"description\";s:250:\"<a href=\"http://www.acquia.com\">Acquia\'s</a> Marina theme is ideal for blogs and community sites. Includes advanced theme settings and 15 flexible content regions for a variety of layouts. By <a href=\"http://www.topnotchthemes.com\">TopNotchThemes</a>\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:3:{s:9:\"style.css\";s:40:\"sites/all/themes/acquia_marina/style.css\";s:9:\"icons.css\";s:40:\"sites/all/themes/acquia_marina/icons.css\";s:9:\"local.css\";s:40:\"sites/all/themes/acquia_marina/local.css\";}}s:7:\"regions\";a:15:{s:13:\"sidebar_first\";s:13:\"sidebar first\";s:12:\"sidebar_last\";s:12:\"sidebar last\";s:13:\"header_middle\";s:13:\"header middle\";s:11:\"header_last\";s:11:\"header last\";s:13:\"preface_first\";s:13:\"preface first\";s:14:\"preface_middle\";s:14:\"preface middle\";s:12:\"preface_last\";s:12:\"preface last\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:16:\"postscript_first\";s:16:\"postscript first\";s:17:\"postscript_middle\";s:17:\"postscript middle\";s:15:\"postscript_last\";s:15:\"postscript last\";s:10:\"footer_top\";s:10:\"footer top\";s:6:\"footer\";s:6:\"footer\";s:11:\"node_bottom\";s:11:\"node bottom\";}s:8:\"features\";a:9:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";}s:7:\"version\";s:7:\"6.x-1.9\";s:7:\"project\";s:13:\"acquia_marina\";s:9:\"datestamp\";s:10:\"1242217832\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:40:\"sites/all/themes/acquia_marina/script.js\";}s:10:\"screenshot\";s:45:\"sites/all/themes/acquia_marina/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/themes/acquia_slate/acquia_slate.info','acquia_slate','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:13:{s:4:\"name\";s:12:\"Acquia Slate\";s:11:\"description\";s:252:\"<a href=\"http://www.acquia.com\">Acquia\'s</a> Slate theme is ideal for corporate and business sites. Includes advanced theme settings and 12 flexible content regions for a variety of layouts. By <a href=\"http://www.topnotchthemes.com\">TopNotchThemes</a>\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:39:\"sites/all/themes/acquia_slate/style.css\";s:9:\"dblog.css\";s:39:\"sites/all/themes/acquia_slate/dblog.css\";}}s:7:\"scripts\";a:2:{s:9:\"script.js\";s:39:\"sites/all/themes/acquia_slate/script.js\";s:19:\"jquery.overlabel.js\";s:49:\"sites/all/themes/acquia_slate/jquery.overlabel.js\";}s:7:\"regions\";a:14:{s:13:\"sidebar_first\";s:13:\"sidebar first\";s:12:\"sidebar_last\";s:12:\"sidebar last\";s:6:\"banner\";s:6:\"banner\";s:10:\"header_top\";s:10:\"header top\";s:12:\"header_first\";s:12:\"header first\";s:13:\"header_middle\";s:13:\"header middle\";s:15:\"preface_sidebar\";s:21:\"front preface sidebar\";s:11:\"content_top\";s:17:\"inner content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:16:\"postscript_first\";s:16:\"postscript first\";s:17:\"postscript_middle\";s:17:\"postscript middle\";s:15:\"postscript_last\";s:15:\"postscript last\";s:6:\"footer\";s:6:\"footer\";s:11:\"node_bottom\";s:11:\"node bottom\";}s:8:\"features\";a:8:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:6:\"search\";i:5;s:7:\"favicon\";i:6;s:13:\"primary_links\";i:7;s:15:\"secondary_links\";}s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:12:\"acquia_slate\";s:9:\"datestamp\";s:10:\"1242218140\";s:10:\"screenshot\";s:44:\"sites/all/themes/acquia_slate/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),('themes/garland/minnelli/minnelli.info','minnelli','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:14:{s:4:\"name\";s:8:\"Minnelli\";s:11:\"description\";s:56:\"Tableless, recolorable, multi-column, fixed width theme.\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:7:\"garland\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/garland/minnelli/script.js\";}s:10:\"screenshot\";s:38:\"themes/garland/minnelli/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}'),('themes/garland/garland.info','garland','theme','themes/engines/phptemplate/phptemplate.engine',1,0,0,-1,0,'a:13:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:66:\"Tableless, recolorable, multi-column, fluid width theme (default).\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:24:\"themes/garland/script.js\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),('modules/system/system.module','system','module','',1,0,0,6051,0,'a:10:{s:4:\"name\";s:6:\"System\";s:11:\"description\";s:54:\"Handles general site configuration for administrators.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/advanced_help/advanced_help.module','advanced_help','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:13:\"Advanced help\";s:11:\"description\";s:38:\"Allow advanced help and documentation.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:13:\"advanced_help\";s:9:\"datestamp\";s:10:\"1238954409\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/aggregator/aggregator.module','aggregator','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Aggregator\";s:11:\"description\";s:57:\"Aggregates syndicated content (RSS, RDF, and Atom feeds).\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/autoload/autoload.module','autoload','module','',1,0,0,0,0,'a:9:{s:4:\"name\";s:8:\"Autoload\";s:11:\"description\";s:46:\"Helper module to autoload classes under PHP 5.\";s:3:\"php\";s:5:\"5.1.2\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.3\";s:7:\"project\";s:8:\"autoload\";s:9:\"datestamp\";s:10:\"1237327502\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}}'),('modules/block/block.module','block','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:5:\"Block\";s:11:\"description\";s:62:\"Controls the boxes that are displayed around the main content.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/blog/blog.module','blog','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Blog\";s:11:\"description\";s:69:\"Enables keeping easily and regularly updated user web pages or blogs.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/blogapi/blogapi.module','blogapi','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Blog API\";s:11:\"description\";s:79:\"Allows users to post content using applications that support XML-RPC blog APIs.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/book/book.module','book','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Book\";s:11:\"description\";s:63:\"Allows users to structure site pages in a hierarchy or outline.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cobalt/cobalt.module','cobalt','module','',1,0,0,0,0,'a:9:{s:4:\"name\";s:6:\"Cobalt\";s:4:\"core\";s:3:\"6.x\";s:11:\"description\";s:63:\"Cobalt is a javascript implementation of Quicksilver for Drupal\";s:7:\"package\";s:6:\"Cobalt\";s:7:\"project\";s:6:\"cobalt\";s:7:\"version\";s:11:\"6.x-1.x-dev\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cobalt/cobaltnodes.module','cobaltnodes','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:12:\"Cobalt Nodes\";s:4:\"core\";s:3:\"6.x\";s:11:\"description\";s:39:\"Provides access to nodes through cobalt\";s:12:\"dependencies\";a:1:{i:0;s:6:\"cobalt\";}s:7:\"package\";s:6:\"Cobalt\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cobalt/cobalttaxonomy.module','cobalttaxonomy','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:15:\"Cobalt Taxonomy\";s:4:\"core\";s:3:\"6.x\";s:11:\"description\";s:44:\"Provides access to taxonomies through cobalt\";s:12:\"dependencies\";a:1:{i:0;s:6:\"cobalt\";}s:7:\"package\";s:6:\"Cobalt\";s:7:\"project\";s:6:\"cobalt\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cobalt/cobaltusers.module','cobaltusers','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:12:\"Cobalt Users\";s:4:\"core\";s:3:\"6.x\";s:11:\"description\";s:39:\"Provides access to users through cobalt\";s:12:\"dependencies\";a:1:{i:0;s:6:\"cobalt\";}s:7:\"package\";s:6:\"Cobalt\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/coder/coder.module','coder','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:5:\"Coder\";s:11:\"description\";s:66:\"Developer Module that assists with code review and version upgrade\";s:7:\"package\";s:11:\"Development\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:11:\"6.x-2.x-dev\";s:7:\"project\";s:5:\"coder\";s:9:\"datestamp\";s:10:\"1250251627\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/color/color.module','color','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:5:\"Color\";s:11:\"description\";s:61:\"Allows the user to change the color scheme of certain themes.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/comment/comment.module','comment','module','',1,0,0,6003,0,'a:10:{s:4:\"name\";s:7:\"Comment\";s:11:\"description\";s:57:\"Allows users to comment on and discuss published content.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/contact/contact.module','contact','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Contact\";s:11:\"description\";s:61:\"Enables the use of both personal and site-wide contact forms.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/content.module','content','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Content\";s:11:\"description\";s:50:\"Allows administrators to define new content types.\";s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.5\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1249334428\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/content_copy/content_copy.module','content_copy','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"Content Copy\";s:11:\"description\";s:51:\"Enables ability to import/export field definitions.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.5\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1249334428\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/content_permissions/content_permissions.module','content_permissions','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Content Permissions\";s:11:\"description\";s:43:\"Set field-level permissions for CCK fields.\";s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"version\";s:7:\"6.x-2.5\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1249334428\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cssdry/cssdry.module','cssdry','module','',0,0,0,-1,0,'a:7:{s:4:\"name\";s:6:\"CssDry\";s:11:\"description\";s:54:\"Utility module that makes it possible to write DRY CSS\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date/date.module','date','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Date\";s:11:\"description\";s:41:\"Defines CCK date/time fields and widgets.\";s:12:\"dependencies\";a:3:{i:0;s:7:\"content\";i:1;s:8:\"date_api\";i:2;s:13:\"date_timezone\";}s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1248867055\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_api.module','date_api','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Date API\";s:11:\"description\";s:45:\"A Date API that can be used by other modules.\";s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1248867055\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_locale/date_locale.module','date_locale','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:11:\"Date Locale\";s:11:\"description\";s:124:\"Allows the site admin to configure multiple formats for date/time display to tailor dates for a specific locale or audience.\";s:7:\"package\";s:9:\"Date/Time\";s:12:\"dependencies\";a:2:{i:0;s:8:\"date_api\";i:1;s:6:\"locale\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1248867055\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_php4/date_php4.module','date_php4','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:9:\"Date PHP4\";s:11:\"description\";s:134:\"Emulate PHP 5.2 date functions in PHP 4.x, PHP 5.0, and PHP 5.1. Required when using the Date API with PHP versions less than PHP 5.2.\";s:7:\"package\";s:9:\"Date/Time\";s:12:\"dependencies\";a:1:{i:0;s:8:\"date_api\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1248867055\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_popup/date_popup.module','date_popup','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Date Popup\";s:11:\"description\";s:84:\"Enables jquery popup calendars and time entry widgets for selecting dates and times.\";s:12:\"dependencies\";a:2:{i:0;s:8:\"date_api\";i:1;s:13:\"date_timezone\";}s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1248867055\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_repeat/date_repeat.module','date_repeat','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:15:\"Date Repeat API\";s:11:\"description\";s:73:\"A Date Repeat API to calculate repeating dates and times from iCal rules.\";s:12:\"dependencies\";a:1:{i:0;s:8:\"date_api\";}s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1248867055\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_timezone/date_timezone.module','date_timezone','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:13:\"Date Timezone\";s:11:\"description\";s:111:\"Needed when using Date API. Overrides site and user timezone handling to set timezone names instead of offsets.\";s:7:\"package\";s:9:\"Date/Time\";s:12:\"dependencies\";a:1:{i:0;s:8:\"date_api\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1248867055\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/date/date_tools/date_tools.module','date_tools','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Date Tools\";s:11:\"description\";s:52:\"Tools to import and auto-create dates and calendars.\";s:12:\"dependencies\";a:2:{i:0;s:7:\"content\";i:1;s:4:\"date\";}s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1248867055\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/dblog/dblog.module','dblog','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:16:\"Database logging\";s:11:\"description\";s:47:\"Logs and records system events to the database.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/devel/devel.module','devel','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:5:\"Devel\";s:11:\"description\";s:52:\"Various blocks, pages, and functions for developers.\";s:7:\"package\";s:11:\"Development\";s:12:\"dependencies\";a:1:{i:0;s:4:\"menu\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.17\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1250713853\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/devel/devel_generate.module','devel_generate','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Devel generate\";s:11:\"description\";s:48:\"Generate dummy users, nodes, and taxonomy terms.\";s:7:\"package\";s:11:\"Development\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.17\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1250713853\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/devel/devel_node_access.module','devel_node_access','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:17:\"Devel node access\";s:11:\"description\";s:67:\"Developer block and page illustrating relevant node_access records.\";s:7:\"package\";s:11:\"Development\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.17\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1250713853\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/devel/devel_themer.module','devel_themer','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:15:\"Theme developer\";s:11:\"description\";s:52:\"Essential theme API information for theme developers\";s:7:\"package\";s:11:\"Development\";s:12:\"dependencies\";a:1:{i:0;s:5:\"devel\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.17\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1250713853\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/fieldgroup/fieldgroup.module','fieldgroup','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Fieldgroup\";s:11:\"description\";s:37:\"Create display groups for CCK fields.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.5\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1249334428\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services/services/file_service/file_service.module','file_service','module','',0,0,0,-1,0,'a:8:{s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:8:\"services\";}s:11:\"description\";s:24:\"Provides a file service.\";s:4:\"name\";s:12:\"File Service\";s:7:\"package\";s:19:\"Services - services\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/inputstream/inputstream.module','inputstream','module','',1,0,0,0,0,'a:7:{s:4:\"name\";s:19:\"Input stream helper\";s:11:\"description\";s:87:\"Provides a stream-wrapper for drupal://input that should be used instead of php://input\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.2\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;}'),('sites/all/modules/filefield/filefield.module','filefield','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:9:\"FileField\";s:11:\"description\";s:26:\"Defines a file field type.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.0\";s:7:\"version\";s:7:\"6.x-3.1\";s:7:\"project\";s:9:\"filefield\";s:9:\"datestamp\";s:10:\"1246665925\";s:10:\"dependents\";a:0:{}}'),('sites/all/modules/filefield/filefield_meta/filefield_meta.module','filefield_meta','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"FileField Meta\";s:11:\"description\";s:48:\"Add metadata gathering and storage to FileField.\";s:12:\"dependencies\";a:2:{i:0;s:9:\"filefield\";i:1;s:6:\"getid3\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.0\";s:7:\"version\";s:7:\"6.x-3.1\";s:7:\"project\";s:9:\"filefield\";s:9:\"datestamp\";s:10:\"1246665925\";s:10:\"dependents\";a:0:{}}'),('modules/filter/filter.module','filter','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:6:\"Filter\";s:11:\"description\";s:60:\"Handles the filtering of content in preparation for display.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/flag/flag.module','flag','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Flag\";s:11:\"description\";s:54:\"Create customized flags that users can set on content.\";s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:5:\"Flags\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"flag\";s:9:\"datestamp\";s:10:\"1237042847\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/flag/flag_actions.module','flag_actions','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"Flag actions\";s:11:\"description\";s:31:\"Execute actions on Flag events.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:4:\"flag\";}s:7:\"package\";s:5:\"Flags\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"flag\";s:9:\"datestamp\";s:10:\"1237042847\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/forum/forum.module','forum','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:5:\"Forum\";s:11:\"description\";s:50:\"Enables threaded discussions about general topics.\";s:12:\"dependencies\";a:2:{i:0;s:8:\"taxonomy\";i:1;s:7:\"comment\";}s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/google_analytics/googleanalytics.module','googleanalytics','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:16:\"Google Analytics\";s:11:\"description\";s:72:\"Adds Google Analytics javascript tracking code to all your site\'s pages.\";s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:10:\"Statistics\";s:7:\"version\";s:7:\"6.x-2.2\";s:7:\"project\";s:16:\"google_analytics\";s:9:\"datestamp\";s:10:\"1238610067\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/help/help.module','help','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"Help\";s:11:\"description\";s:35:\"Manages the display of online help.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/advanced_help/help_example/help_example.module','help_example','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:21:\"Advanced help example\";s:11:\"description\";s:62:\"A example help module to demonstrate the advanced help module.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:13:\"advanced_help\";}s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:13:\"advanced_help\";s:9:\"datestamp\";s:10:\"1238954409\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18n.module','i18n','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:20:\"Internationalization\";s:11:\"description\";s:49:\"Extends Drupal support for multilingual features.\";s:12:\"dependencies\";a:2:{i:0;s:6:\"locale\";i:1;s:11:\"translation\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1245663335\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18nblocks/i18nblocks.module','i18nblocks','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:17:\"Block translation\";s:11:\"description\";s:50:\"Enables multilingual blocks and block translation.\";s:12:\"dependencies\";a:2:{i:0;s:4:\"i18n\";i:1;s:11:\"i18nstrings\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1245663335\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18ncontent/i18ncontent.module','i18ncontent','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:24:\"Content type translation\";s:11:\"description\";s:72:\"Translates content type related strings: name, description, help text...\";s:12:\"dependencies\";a:2:{i:0;s:4:\"i18n\";i:1;s:11:\"i18nstrings\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1245663335\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18nmenu/i18nmenu.module','i18nmenu','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:16:\"Menu translation\";s:11:\"description\";s:40:\"Supports translatable custom menu items.\";s:12:\"dependencies\";a:4:{i:0;s:4:\"i18n\";i:1;s:4:\"menu\";i:2;s:10:\"i18nblocks\";i:3;s:11:\"i18nstrings\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1245663335\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18npoll/i18npoll.module','i18npoll','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Poll aggregate\";s:11:\"description\";s:45:\"Aggregates poll results for all translations.\";s:12:\"dependencies\";a:2:{i:0;s:11:\"translation\";i:1;s:4:\"poll\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1245663335\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18nprofile/i18nprofile.module','i18nprofile','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Profile translation\";s:11:\"description\";s:36:\"Enables multilingual profile fields.\";s:12:\"dependencies\";a:2:{i:0;s:7:\"profile\";i:1;s:11:\"i18nstrings\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1245663335\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18nstrings/i18nstrings.module','i18nstrings','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:18:\"String translation\";s:11:\"description\";s:57:\"Provides support for translation of user defined strings.\";s:12:\"dependencies\";a:1:{i:0;s:6:\"locale\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1245663335\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18nsync/i18nsync.module','i18nsync','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:24:\"Synchronize translations\";s:11:\"description\";s:74:\"Synchronizes taxonomy and fields accross translations of the same content.\";s:12:\"dependencies\";a:1:{i:0;s:4:\"i18n\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1245663335\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18ntaxonomy/i18ntaxonomy.module','i18ntaxonomy','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:20:\"Taxonomy translation\";s:11:\"description\";s:30:\"Enables multilingual taxonomy.\";s:12:\"dependencies\";a:3:{i:0;s:4:\"i18n\";i:1;s:8:\"taxonomy\";i:2;s:11:\"i18nstrings\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1245663335\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/i18n/i18nviews/i18nviews.module','i18nviews','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:17:\"Views translation\";s:11:\"description\";s:60:\"Translation of views strings and content selection for views\";s:12:\"dependencies\";a:4:{i:0;s:5:\"views\";i:1;s:4:\"i18n\";i:2;s:11:\"i18nstrings\";i:3;s:12:\"i18ntaxonomy\";}s:7:\"package\";s:13:\"Multilanguage\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:4:\"i18n\";s:9:\"datestamp\";s:10:\"1245663335\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/imageapi/imageapi.module','imageapi','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"ImageAPI\";s:11:\"description\";s:38:\"ImageAPI supporting multiple toolkits.\";s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.1\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:8:\"imageapi\";s:9:\"datestamp\";s:10:\"1239992203\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}}'),('sites/all/modules/imageapi/imageapi_gd.module','imageapi_gd','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"ImageAPI GD2\";s:11:\"description\";s:49:\"Uses PHP\'s built-in GD2 image processing support.\";s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:8:\"imageapi\";s:9:\"datestamp\";s:10:\"1239992203\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/imageapi/imageapi_imagemagick.module','imageapi_imagemagick','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:20:\"ImageAPI ImageMagick\";s:11:\"description\";s:33:\"Command Line ImageMagick support.\";s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:8:\"imageapi\";s:9:\"datestamp\";s:10:\"1239992203\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/imagecache/imagecache.module','imagecache','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"ImageCache\";s:11:\"description\";s:36:\"Dynamic image manipulator and cache.\";s:7:\"package\";s:10:\"ImageCache\";s:12:\"dependencies\";a:1:{i:0;s:8:\"imageapi\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:14:\"6.x-2.0-beta10\";s:7:\"project\";s:10:\"imagecache\";s:9:\"datestamp\";s:10:\"1250716281\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/imagecache_action_cover/imagecache_action_cover.module','imagecache_action_cover','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:21:\"Cover and crop action\";s:11:\"description\";s:79:\"Scales a image so that it covers a specified width and height and then crops it\";s:7:\"package\";s:10:\"ImageCache\";s:12:\"dependencies\";a:1:{i:0;s:10:\"imagecache\";}s:7:\"version\";s:3:\"0.1\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/imagecache/imagecache_ui.module','imagecache_ui','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:13:\"ImageCache UI\";s:11:\"description\";s:26:\"ImageCache User Interface.\";s:12:\"dependencies\";a:2:{i:0;s:10:\"imagecache\";i:1;s:8:\"imageapi\";}s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:14:\"6.x-2.0-beta10\";s:7:\"project\";s:10:\"imagecache\";s:9:\"datestamp\";s:10:\"1250716281\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/imagefield/imagefield.module','imagefield','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"ImageField\";s:11:\"description\";s:28:\"Defines an image field type.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:2:{i:0;s:7:\"content\";i:1;s:9:\"filefield\";}s:7:\"package\";s:3:\"CCK\";s:7:\"version\";s:7:\"6.x-3.1\";s:7:\"project\";s:10:\"imagefield\";s:9:\"datestamp\";s:10:\"1246665655\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/locale/locale.module','locale','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Locale\";s:11:\"description\";s:119:\"Adds language handling functionality and enables the translation of the user interface to languages other than English.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/logintoboggan/logintoboggan.module','logintoboggan','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:13:\"LoginToboggan\";s:11:\"description\";s:31:\"Improves Drupal\'s login system.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.5\";s:7:\"project\";s:13:\"logintoboggan\";s:9:\"datestamp\";s:10:\"1242233182\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/menu/menu.module','menu','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"Menu\";s:11:\"description\";s:60:\"Allows administrators to customize the site navigation menu.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services/services/menu_service/menu_service.module','menu_service','module','',0,0,0,-1,0,'a:8:{s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:8:\"services\";}s:11:\"description\";s:24:\"Provides a menu service.\";s:4:\"name\";s:12:\"Menu Service\";s:7:\"package\";s:19:\"Services - services\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services/services/node_service/node_resource.module','node_resource','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:13:\"Node Resource\";s:11:\"description\";s:56:\"Provides a resource oriented service interface to nodes.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:1:{i:0;s:13:\"query_builder\";}s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;}'),('sites/all/modules/mimedetect/mimedetect.module','mimedetect','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:10:\"MimeDetect\";s:11:\"description\";s:53:\"Provides common mime type detection for Drupal sites.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:10:\"mimedetect\";s:9:\"datestamp\";s:10:\"1241891444\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/nodeformcols/nfcbiblio.module','nfcbiblio','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:20:\"Biblio compatability\";s:11:\"description\";s:30:\"Adds support for biblio fields\";s:12:\"dependencies\";a:2:{i:0;s:12:\"nodeformcols\";i:1;s:6:\"biblio\";}s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:17:\"Node form columns\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/nodeformcols/nfccaptcha.module','nfccaptcha','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:21:\"CAPTCHA compatability\";s:11:\"description\";s:38:\"Adds support for CAPTCHA in node forms\";s:12:\"dependencies\";a:2:{i:0;s:12:\"nodeformcols\";i:1;s:7:\"captcha\";}s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:17:\"Node form columns\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('modules/node/node.module','node','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"Node\";s:11:\"description\";s:66:\"Allows content to be submitted to the site and displayed on pages.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services/services/node_service/node_service.module','node_service','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:12:\"Node Service\";s:11:\"description\";s:24:\"Provides a node service.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:2:{i:0;s:8:\"services\";i:1;s:4:\"node\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/nodeformcols/nodeformcols.module','nodeformcols','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:17:\"Node form columns\";s:11:\"description\";s:55:\"Separates the node forms into two columns and a footer.\";s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:17:\"Node form columns\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/nodereference/nodereference.module','nodereference','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Node Reference\";s:11:\"description\";s:59:\"Defines a field type for referencing one node from another.\";s:12:\"dependencies\";a:3:{i:0;s:7:\"content\";i:1;s:4:\"text\";i:2;s:13:\"optionwidgets\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.5\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1249334428\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/nodewords/nodewords.module','nodewords','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:9:\"Meta tags\";s:11:\"description\";s:58:\"Allows users to add meta tags, eg keywords or description.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:9:\"nodewords\";s:9:\"datestamp\";s:10:\"1233995126\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/number/number.module','number','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Number\";s:11:\"description\";s:28:\"Defines numeric field types.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.5\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1249334428\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/oembed/oembed.module','oembed','module','',0,0,0,-1,0,'a:8:{s:7:\"package\";s:6:\"oEmbed\";s:4:\"name\";s:13:\"oEmbed Filter\";s:11:\"description\";s:51:\"Replaces oEmbed-enabled URL:s with embedded content\";s:12:\"dependencies\";a:2:{i:0;s:10:\"oembedcore\";i:1;s:6:\"filter\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/oembed/oembedcore.module','oembedcore','module','',0,0,0,-1,0,'a:8:{s:7:\"package\";s:6:\"oEmbed\";s:4:\"name\";s:11:\"oEmbed Core\";s:11:\"description\";s:51:\"Common functionality for oEmbed client and provider\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/oembed/oembedprovider.module','oembedprovider','module','',0,0,0,-1,0,'a:8:{s:7:\"package\";s:6:\"oEmbed\";s:4:\"name\";s:15:\"oEmbed Provider\";s:11:\"description\";s:37:\"Turns you site into a oEmbed provider\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:10:\"oembedcore\";}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('modules/openid/openid.module','openid','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"OpenID\";s:11:\"description\";s:48:\"Allows users to log into your site using OpenID.\";s:7:\"version\";s:4:\"6.13\";s:7:\"package\";s:15:\"Core - optional\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/opensearchplugin/opensearchplugin.module','opensearchplugin','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:17:\"OpenSearch Plugin\";s:11:\"description\";s:71:\"Provides browser search integration via the OpenSearch plugin protocal.\";s:12:\"dependencies\";a:1:{i:0;s:6:\"search\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:16:\"opensearchplugin\";s:9:\"datestamp\";s:10:\"1203192009\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/optionwidgets/optionwidgets.module','optionwidgets','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Option Widgets\";s:11:\"description\";s:82:\"Defines selection, check box and radio button widgets for text and numeric fields.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.5\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1249334428\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/path/path.module','path','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Path\";s:11:\"description\";s:28:\"Allows users to rename URLs.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/pathauto/pathauto.module','pathauto','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:8:\"Pathauto\";s:11:\"description\";s:95:\"Provides a mechanism for modules to automatically generate aliases for the content they manage.\";s:12:\"dependencies\";a:2:{i:0;s:4:\"path\";i:1;s:5:\"token\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:8:\"pathauto\";s:9:\"datestamp\";s:10:\"1214487317\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/devel/performance/performance.module','performance','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Performance Logging\";s:11:\"description\";s:91:\"Logs detailed and/or summary page generation time and memory consumption for page requests.\";s:7:\"package\";s:11:\"Development\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.17\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1250713853\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/php/php.module','php','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"PHP filter\";s:11:\"description\";s:50:\"Allows embedded PHP code/snippets to be evaluated.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/ping/ping.module','ping','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Ping\";s:11:\"description\";s:51:\"Alerts other sites when your site has been updated.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/poll/poll.module','poll','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Poll\";s:11:\"description\";s:95:\"Allows your site to capture votes on different topics in the form of multiple choice questions.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/potx/potx.module','potx','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:30:\"Translation template extractor\";s:11:\"description\";s:106:\"Provides a web interface and an API to extract translatable text from the sources of installed components.\";s:12:\"dependencies\";a:1:{i:0;s:6:\"locale\";}s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:13:\"Multilanguage\";s:7:\"version\";s:7:\"6.x-3.0\";s:7:\"project\";s:4:\"potx\";s:9:\"datestamp\";s:10:\"1248008844\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/profile/profile.module','profile','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Profile\";s:11:\"description\";s:36:\"Supports configurable user profiles.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/search/search.module','search','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Search\";s:11:\"description\";s:36:\"Enables site-wide keyword searching.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services/services/search_service/search_service.module','search_service','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:14:\"Search Service\";s:11:\"description\";s:26:\"Provides a search service.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:2:{i:0;s:8:\"services\";i:1;s:6:\"search\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/securesite/securesite.module','securesite','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:11:\"Secure Site\";s:11:\"description\";s:67:\"Enables HTTP Auth security or an HTML form to restrict site access.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:10:\"securesite\";s:9:\"datestamp\";s:10:\"1240238567\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services/services.module','services','module','',1,0,0,6002,0,'a:8:{s:4:\"name\";s:8:\"Services\";s:11:\"description\";s:41:\"Provide an API for creating web services.\";s:7:\"package\";s:8:\"Services\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;}'),('sites/default/modules/services/auth/services_keyauth/services_keyauth.module','services_keyauth','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:18:\"Key Authentication\";s:11:\"description\";s:51:\"Provides key authentication for the services module\";s:7:\"package\";s:25:\"Services - authentication\";s:12:\"dependencies\";a:1:{i:0;s:8:\"services\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/simple_geo/simple_geo.module','simple_geo','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:10:\"Simple Geo\";s:7:\"version\";s:11:\"6.x-0.x-dev\";s:4:\"core\";s:3:\"6.x\";s:11:\"description\";s:44:\"Allows nodes to add point and polygon fields\";s:7:\"package\";s:3:\"Geo\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/statistics/statistics.module','statistics','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Statistics\";s:11:\"description\";s:37:\"Logs access statistics for your site.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/syslog/syslog.module','syslog','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Syslog\";s:11:\"description\";s:41:\"Logs and records system events to syslog.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services/services/system_service/system_service.module','system_service','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:14:\"System Service\";s:11:\"description\";s:25:\"Provides system services.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:1:{i:0;s:8:\"services\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('modules/taxonomy/taxonomy.module','taxonomy','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:8:\"Taxonomy\";s:11:\"description\";s:38:\"Enables the categorization of content.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services/services/taxonomy_service/taxonomy_service.module','taxonomy_service','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:16:\"Taxonomy Service\";s:11:\"description\";s:28:\"Provides a taxonomy service.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:2:{i:0;s:8:\"services\";i:1;s:8:\"taxonomy\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/text/text.module','text','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Text\";s:11:\"description\";s:32:\"Defines simple text field types.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.5\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1249334428\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/textile/textile.module','textile','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:7:\"Textile\";s:11:\"description\";s:108:\"Allows content to be submitted using Textile, a simple, plain text syntax that is filtered into valid XHTML.\";s:7:\"version\";s:7:\"6.x-2.0\";s:7:\"project\";s:7:\"textile\";s:9:\"datestamp\";s:10:\"1223933157\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/throttle/throttle.module','throttle','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Throttle\";s:11:\"description\";s:66:\"Handles the auto-throttling mechanism, to control site congestion.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/token/token.module','token','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:5:\"Token\";s:11:\"description\";s:79:\"Provides a shared API for replacement of textual placeholders with actual data.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.12\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1243895498\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/token/tokenSTARTER.module','tokenSTARTER','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:12:\"TokenSTARTER\";s:11:\"description\";s:72:\"Provides additional tokens and a base on which to build your own tokens.\";s:12:\"dependencies\";a:1:{i:0;s:5:\"token\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.12\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1243895498\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/token/token_actions.module','token_actions','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:13:\"Token actions\";s:11:\"description\";s:73:\"Provides enhanced versions of core Drupal actions using the Token module.\";s:12:\"dependencies\";a:1:{i:0;s:5:\"token\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.12\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1243895498\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/tracker/tracker.module','tracker','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Tracker\";s:11:\"description\";s:43:\"Enables tracking of recent posts for users.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"comment\";}s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/translation/translation.module','translation','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Content translation\";s:11:\"description\";s:57:\"Allows content to be translated into different languages.\";s:12:\"dependencies\";a:1:{i:0;s:6:\"locale\";}s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/transliteration/transliteration.module','transliteration','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:15:\"Transliteration\";s:11:\"description\";s:71:\"Provides transliteration for UTF-8 text input and sanitizes file names.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.1\";s:7:\"project\";s:15:\"transliteration\";s:9:\"datestamp\";s:10:\"1244575458\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/trigger/trigger.module','trigger','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Trigger\";s:11:\"description\";s:90:\"Enables actions to be fired on certain system events, such as when new content is created.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/update/update.module','update','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:13:\"Update status\";s:11:\"description\";s:88:\"Checks the status of available updates for Drupal and your installed modules and themes.\";s:7:\"version\";s:4:\"6.13\";s:7:\"package\";s:15:\"Core - optional\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/upload/upload.module','upload','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Upload\";s:11:\"description\";s:51:\"Allows users to upload and attach files to content.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/user/user.module','user','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"User\";s:11:\"description\";s:47:\"Manages the user registration and login system.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.13\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1246481719\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services/services/user_service/user_service.module','user_service','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:12:\"User Service\";s:11:\"description\";s:24:\"Provides a user service.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:2:{i:0;s:8:\"services\";i:1;s:4:\"user\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/cck/modules/userreference/userreference.module','userreference','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"User Reference\";s:11:\"description\";s:56:\"Defines a field type for referencing a user from a node.\";s:12:\"dependencies\";a:3:{i:0;s:7:\"content\";i:1;s:4:\"text\";i:2;s:13:\"optionwidgets\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.5\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1249334428\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/views/views.module','views','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:5:\"Views\";s:11:\"description\";s:55:\"Create customized lists and queries from your database.\";s:7:\"package\";s:5:\"Views\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.6\";s:7:\"project\";s:5:\"views\";s:9:\"datestamp\";s:10:\"1244671915\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/views/views_export/views_export.module','views_export','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Views exporter\";s:11:\"description\";s:40:\"Allows exporting multiple views at once.\";s:7:\"package\";s:5:\"Views\";s:12:\"dependencies\";a:1:{i:0;s:5:\"views\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.6\";s:7:\"project\";s:5:\"views\";s:9:\"datestamp\";s:10:\"1244671915\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services/services/views_service/views_service.module','views_service','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:13:\"Views Service\";s:11:\"description\";s:25:\"Provides a views service.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:2:{i:0;s:8:\"services\";i:1;s:5:\"views\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/query_builder/query_builder.module','query_builder','module','',1,0,0,0,0,'a:7:{s:4:\"name\";s:13:\"Query Builder\";s:11:\"description\";s:43:\"Provides a a class for building SQL-queries\";s:12:\"dependencies\";a:1:{i:0;s:8:\"autoload\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/views/views_ui.module','views_ui','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Views UI\";s:11:\"description\";s:93:\"Administrative interface to views. Without this module, you cannot create or edit your views.\";s:7:\"package\";s:5:\"Views\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:5:\"views\";}s:7:\"version\";s:7:\"6.x-2.6\";s:7:\"project\";s:5:\"views\";s:9:\"datestamp\";s:10:\"1244671915\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services/servers/xmlrpc_server/xmlrpc_server.module','xmlrpc_server','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:13:\"XMLRPC Server\";s:11:\"description\";s:26:\"Provides an XMLRPC server.\";s:7:\"package\";s:18:\"Services - servers\";s:12:\"dependencies\";a:1:{i:0;s:8:\"services\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/oauth_common/oauth_common.module','oauth_common','module','',1,0,0,6003,0,'a:7:{s:4:\"name\";s:12:\"OAuth Common\";s:11:\"description\";s:35:\"Provides common OAuth functionality\";s:12:\"dependencies\";a:2:{i:0;s:8:\"autoload\";i:1;s:11:\"inputstream\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services_oauth/services_oauth.module','services_oauth','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:20:\"OAuth Authentication\";s:11:\"description\";s:53:\"Provides OAuth authentication for the services module\";s:7:\"package\";s:25:\"Services - authentication\";s:12:\"dependencies\";a:2:{i:0;s:8:\"services\";i:1;s:12:\"oauth_common\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services/services/comment_service/comment_service.module','comment_service','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:15:\"Comment Service\";s:11:\"description\";s:27:\"Provides a comment service.\";s:7:\"package\";s:19:\"Services - services\";s:12:\"dependencies\";a:2:{i:0;s:8:\"services\";i:1;s:7:\"comment\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/services_oop/services_oop.module','services_oop','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:12:\"Services OOP\";s:11:\"description\";s:73:\"Utility functions for working with services in a more OOP-friendly manner\";s:7:\"package\";s:8:\"Services\";s:12:\"dependencies\";a:1:{i:0;s:8:\"autoload\";}s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.2\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;}'),('sites/default/modules/rest_server/rest_server.module','rest_server','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:11:\"REST Server\";s:11:\"description\";s:24:\"Provides an REST server.\";s:7:\"package\";s:18:\"Services - servers\";s:12:\"dependencies\";a:3:{i:0;s:8:\"services\";i:1;s:11:\"inputstream\";i:2;s:8:\"autoload\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/rest_server/formats/xcal_format.module','xcal_format','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:21:\"xCal and iCal formats\";s:11:\"description\";s:54:\"Provides xCal and iCal formatters for the REST server.\";s:7:\"package\";s:8:\"Services\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;}');
/*!40000 ALTER TABLE `di_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_term_data`
--

DROP TABLE IF EXISTS `di_term_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_term_data` (
  `tid` int(10) unsigned NOT NULL auto_increment,
  `vid` int(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `description` longtext,
  `weight` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_term_data`
--

LOCK TABLES `di_term_data` WRITE;
/*!40000 ALTER TABLE `di_term_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_term_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_term_hierarchy`
--

DROP TABLE IF EXISTS `di_term_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_term_hierarchy` (
  `tid` int(10) unsigned NOT NULL default '0',
  `parent` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_term_hierarchy`
--

LOCK TABLES `di_term_hierarchy` WRITE;
/*!40000 ALTER TABLE `di_term_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_term_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_term_node`
--

DROP TABLE IF EXISTS `di_term_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_term_node` (
  `nid` int(10) unsigned NOT NULL default '0',
  `vid` int(10) unsigned NOT NULL default '0',
  `tid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tid`,`vid`),
  KEY `vid` (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_term_node`
--

LOCK TABLES `di_term_node` WRITE;
/*!40000 ALTER TABLE `di_term_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_term_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_term_relation`
--

DROP TABLE IF EXISTS `di_term_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_term_relation` (
  `trid` int(11) NOT NULL auto_increment,
  `tid1` int(10) unsigned NOT NULL default '0',
  `tid2` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`trid`),
  UNIQUE KEY `tid1_tid2` (`tid1`,`tid2`),
  KEY `tid2` (`tid2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_term_relation`
--

LOCK TABLES `di_term_relation` WRITE;
/*!40000 ALTER TABLE `di_term_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_term_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_term_synonym`
--

DROP TABLE IF EXISTS `di_term_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_term_synonym` (
  `tsid` int(11) NOT NULL auto_increment,
  `tid` int(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`tsid`),
  KEY `tid` (`tid`),
  KEY `name_tid` (`name`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_term_synonym`
--

LOCK TABLES `di_term_synonym` WRITE;
/*!40000 ALTER TABLE `di_term_synonym` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_term_synonym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_url_alias`
--

DROP TABLE IF EXISTS `di_url_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_url_alias` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `src` varchar(128) NOT NULL default '',
  `dst` varchar(128) NOT NULL default '',
  `language` varchar(12) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  UNIQUE KEY `dst_language` (`dst`,`language`),
  KEY `src_language` (`src`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_url_alias`
--

LOCK TABLES `di_url_alias` WRITE;
/*!40000 ALTER TABLE `di_url_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_url_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_users`
--

DROP TABLE IF EXISTS `di_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_users` (
  `uid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `pass` varchar(32) NOT NULL default '',
  `mail` varchar(64) default '',
  `mode` tinyint(4) NOT NULL default '0',
  `sort` tinyint(4) default '0',
  `threshold` tinyint(4) default '0',
  `theme` varchar(255) NOT NULL default '',
  `signature` varchar(255) NOT NULL default '',
  `signature_format` smallint(6) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `login` int(11) NOT NULL default '0',
  `status` tinyint(4) NOT NULL default '0',
  `timezone` varchar(8) default NULL,
  `language` varchar(12) NOT NULL default '',
  `picture` varchar(255) NOT NULL default '',
  `init` varchar(64) default '',
  `data` longtext,
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_users`
--

LOCK TABLES `di_users` WRITE;
/*!40000 ALTER TABLE `di_users` DISABLE KEYS */;
INSERT INTO `di_users` VALUES (0,'','','',0,0,0,'','',0,0,0,0,0,NULL,'','','',NULL),(1,'Drupal Developer','5f4dcc3b5aa765d61d8327deb882cf99','drupal.developer@john.doe',0,0,0,'','',0,1251215026,1251578742,1251475505,1,'7200','','','hugo.wetterberg@gmail.com','a:1:{s:13:\"form_build_id\";s:37:\"form-fb53e5f121f2e67b7c1ccf02b977b9b9\";}');
/*!40000 ALTER TABLE `di_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_users_roles`
--

DROP TABLE IF EXISTS `di_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_users_roles` (
  `uid` int(10) unsigned NOT NULL default '0',
  `rid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_users_roles`
--

LOCK TABLES `di_users_roles` WRITE;
/*!40000 ALTER TABLE `di_users_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_variable`
--

DROP TABLE IF EXISTS `di_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_variable` (
  `name` varchar(128) NOT NULL default '',
  `value` longtext NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_variable`
--

LOCK TABLES `di_variable` WRITE;
/*!40000 ALTER TABLE `di_variable` DISABLE KEYS */;
INSERT INTO `di_variable` VALUES ('theme_default','s:7:\"garland\";'),('filter_html_1','i:1;'),('node_options_forum','a:1:{i:0;s:6:\"status\";}'),('drupal_private_key','s:64:\"664ae5891821e8e20a24ea341dc372c9ff8d465ad5c7971344970f20fbd5670d\";'),('menu_masks','a:19:{i:0;i:62;i:1;i:61;i:2;i:59;i:3;i:45;i:4;i:31;i:5;i:30;i:6;i:29;i:7;i:24;i:8;i:22;i:9;i:21;i:10;i:15;i:11;i:14;i:12;i:11;i:13;i:7;i:14;i:6;i:15;i:5;i:16;i:3;i:17;i:2;i:18;i:1;}'),('install_task','s:4:\"done\";'),('menu_expanded','a:0:{}'),('site_name','s:13:\"Drupal iPhone\";'),('site_mail','s:25:\"hugo.wetterberg@gmail.com\";'),('date_default_timezone','s:4:\"7200\";'),('user_email_verification','b:1;'),('clean_url','s:1:\"1\";'),('install_time','i:1251215105;'),('node_options_page','a:1:{i:0;s:6:\"status\";}'),('comment_page','i:0;'),('theme_settings','a:1:{s:21:\"toggle_node_info_page\";b:0;}'),('drupal_http_request_fails','b:0;'),('css_js_query_string','s:20:\"E8QwnK7r500000000000\";'),('install_profile','s:7:\"default\";'),('file_directory_temp','s:4:\"/tmp\";'),('cron_last','i:1251215127;'),('javascript_parsed','a:0:{}'),('services_auth_module','s:14:\"services_oauth\";'),('services_oauth_authentication_levels','a:5:{s:14:\"node/#retrieve\";s:5:\"token\";s:12:\"node/#create\";s:5:\"token\";s:12:\"node/#update\";s:5:\"token\";s:12:\"node/#delete\";s:5:\"token\";s:11:\"node/#index\";s:5:\"token\";}'),('services_oauth_authorization_settings','a:5:{s:14:\"node/#retrieve\";s:4:\"read\";s:12:\"node/#create\";s:1:\"*\";s:12:\"node/#update\";s:1:\"*\";s:12:\"node/#delete\";s:1:\"*\";s:11:\"node/#index\";s:4:\"read\";}');
/*!40000 ALTER TABLE `di_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_vocabulary`
--

DROP TABLE IF EXISTS `di_vocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_vocabulary` (
  `vid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` longtext,
  `help` varchar(255) NOT NULL default '',
  `relations` tinyint(3) unsigned NOT NULL default '0',
  `hierarchy` tinyint(3) unsigned NOT NULL default '0',
  `multiple` tinyint(3) unsigned NOT NULL default '0',
  `required` tinyint(3) unsigned NOT NULL default '0',
  `tags` tinyint(3) unsigned NOT NULL default '0',
  `module` varchar(255) NOT NULL default '',
  `weight` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `list` (`weight`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_vocabulary`
--

LOCK TABLES `di_vocabulary` WRITE;
/*!40000 ALTER TABLE `di_vocabulary` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_vocabulary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_vocabulary_node_types`
--

DROP TABLE IF EXISTS `di_vocabulary_node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_vocabulary_node_types` (
  `vid` int(10) unsigned NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`type`,`vid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_vocabulary_node_types`
--

LOCK TABLES `di_vocabulary_node_types` WRITE;
/*!40000 ALTER TABLE `di_vocabulary_node_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_vocabulary_node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `di_watchdog`
--

DROP TABLE IF EXISTS `di_watchdog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `di_watchdog` (
  `wid` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `type` varchar(16) NOT NULL default '',
  `message` longtext NOT NULL,
  `variables` longtext NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL default '0',
  `link` varchar(255) NOT NULL default '',
  `location` text NOT NULL,
  `referer` varchar(128) NOT NULL default '',
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wid`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `di_watchdog`
--

LOCK TABLES `di_watchdog` WRITE;
/*!40000 ALTER TABLE `di_watchdog` DISABLE KEYS */;
/*!40000 ALTER TABLE `di_watchdog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-08-29 22:53:48
