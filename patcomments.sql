-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- Generation Time: Dec 21, 2010 at 03:16 PM
-- Server version: 5.0.84
-- PHP Version: 5.2.6-1+lenny9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `patron_comments`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `com_id` int(10) NOT NULL auto_increment,
  `type` int(10) default NULL,
  `source` int(10) default NULL,
  `location` int(10) default NULL,
  `staff` varchar(15) collate utf8_unicode_ci default NULL,
  `regarding` int(10) default NULL,
  `comments` text collate utf8_unicode_ci,
  `name` varchar(50) collate utf8_unicode_ci default NULL,
  `address` varchar(50) collate utf8_unicode_ci default NULL,
  `city` varchar(20) collate utf8_unicode_ci default NULL,
  `state` char(2) collate utf8_unicode_ci default NULL,
  `zip` varchar(10) collate utf8_unicode_ci default NULL,
  `phone` varchar(15) collate utf8_unicode_ci default NULL,
  `email` varchar(50) collate utf8_unicode_ci default NULL,
  `date_received` date default '0000-00-00',
  `status` int(10) default NULL,
  `date_resolved` date default '0000-00-00',
  `notes` text collate utf8_unicode_ci,
  `web_info` text collate utf8_unicode_ci,
  `refer_to` int(10) default NULL,
  `publish` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`com_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `loc_id` int(11) NOT NULL auto_increment,
  `loc_name` varchar(20) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`loc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refer_comment`
--

CREATE TABLE IF NOT EXISTS `refer_comment` (
  `ref_id` int(11) NOT NULL auto_increment,
  `refer_to` varchar(25) collate utf8_unicode_ci default NULL,
  `refer_value` varchar(64) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`ref_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regarding`
--

CREATE TABLE IF NOT EXISTS `regarding` (
  `reg_id` int(11) NOT NULL auto_increment,
  `regarding` varchar(30) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`reg_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE IF NOT EXISTS `source` (
  `sou_id` int(10) NOT NULL auto_increment,
  `source` char(15) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`sou_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `stat_id` int(10) NOT NULL auto_increment,
  `status` char(20) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`stat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `status` (`stat_id`, `status`) VALUES
(1, 'New'),
(2, 'Open'),
(3, 'Referred'),
(4, 'Closed-called'),
(5, 'Closed-sentletter'),
(6, 'Closed-emailed'),
(7, 'Closed-anonymous'),
(8, 'AutoClose');

-- --------------------------------------------------------

--
-- Table structure for table `suggest_categories`
--

CREATE TABLE IF NOT EXISTS `suggest_categories` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `description` varchar(128) collate utf8_unicode_ci NOT NULL default '',
  `email` varchar(64) collate utf8_unicode_ci NOT NULL default '',
  `name` varchar(64) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `ty_id` int(10) NOT NULL auto_increment,
  `type` varchar(64) collate utf8_unicode_ci default NULL,
  `init_refer` int(11) NOT NULL default '1',
  `autoclose` tinyint(1) unsigned NOT NULL default '0',
  `pub_display` tinyint(4) NOT NULL default '1',
  `pathcode` varchar(64) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`ty_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
