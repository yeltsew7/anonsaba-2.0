-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 24, 2015 at 07:58 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `anonsaba`
--

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `ip` varchar(25) NOT NULL,
  `reason` text NOT NULL,
  `until` int(11) NOT NULL,
  `boards` text NOT NULL,
  `appeal` int(11) DEFAULT NULL,
  `appealed` int(11) DEFAULT NULL,
  `appealmsg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;


-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE IF NOT EXISTS `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(9999) NOT NULL,
  `desc` varchar(9999) NOT NULL,
  `class` varchar(9999) NOT NULL,
  `section` varchar(9999) NOT NULL,
  `header` varchar(9999) NOT NULL,
  `fileurl` int(11) NOT NULL DEFAULT '0',
  `fileperpost` int(11) NOT NULL DEFAULT '1',
  `imagesize` int(11) NOT NULL DEFAULT '1024000',
  `postperpage` int(255) NOT NULL DEFAULT '8',
  `boardpages` int(11) NOT NULL DEFAULT '11',
  `threadhours` int(11) NOT NULL,
  `markpage` int(11) NOT NULL DEFAULT '9',
  `threadreply` int(11) NOT NULL DEFAULT '0',
  `postername` varchar(9999) NOT NULL DEFAULT 'Anonymous',
  `locked` int(11) NOT NULL DEFAULT '0',
  `email` int(11) NOT NULL DEFAULT '1',
  `ads` int(11) NOT NULL DEFAULT '1',
  `showid` int(11) NOT NULL DEFAULT '0',
  `report` int(11) NOT NULL DEFAULT '1',
  `captcha` int(11) NOT NULL DEFAULT '0',
  `nofile` int(11) NOT NULL DEFAULT '0',
  `forcedanon` int(11) NOT NULL DEFAULT '0',
  `trail` int(11) NOT NULL DEFAULT '0',
  `popular` int(11) NOT NULL DEFAULT '0',
  `recentpost` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=118 ;


-- --------------------------------------------------------

--
-- Table structure for table `board_filetypes`
--

CREATE TABLE IF NOT EXISTS `board_filetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boardid` int(11) NOT NULL,
  `fileid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=502 ;


-- --------------------------------------------------------

--
-- Table structure for table `expiredbans`
--

CREATE TABLE IF NOT EXISTS `expiredbans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` mediumtext NOT NULL,
  `reason` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL,
  `board` varchar(999) NOT NULL,
  `file` varchar(999) NOT NULL,
  `md5` varchar(999) NOT NULL,
  `type` varchar(999) NOT NULL,
  `original` varchar(999) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `filetypes`
--

CREATE TABLE IF NOT EXISTS `filetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(999) NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `filetypes`
--

INSERT INTO `filetypes` (`id`, `name`, `image`) VALUES
(1, 'JPG', ''),
(2, 'PNG', ''),
(3, 'GIF', '');

-- --------------------------------------------------------

--
-- Table structure for table `front`
--

CREATE TABLE IF NOT EXISTS `front` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(999) NOT NULL,
  `by` varchar(999) NOT NULL,
  `subject` varchar(999) NOT NULL,
  `email` varchar(999) NOT NULL,
  `message` varchar(9999) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(999) NOT NULL,
  `message` varchar(999) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1518 ;


-- --------------------------------------------------------

--
-- Table structure for table `pms`
--

CREATE TABLE IF NOT EXISTS `pms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to` varchar(999) NOT NULL,
  `from` varchar(999) NOT NULL,
  `message` varchar(9999) NOT NULL,
  `subject` varchar(9999) NOT NULL,
  `time` int(11) NOT NULL,
  `read` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;


-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL,
  `name` varchar(9999) NOT NULL,
  `email` varchar(9999) NOT NULL,
  `subject` varchar(9999) NOT NULL,
  `message` varchar(9999) NOT NULL,
  `password` varchar(999) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL,
  `ip` varchar(9999) NOT NULL,
  `boardname` varchar(9999) NOT NULL,
  `time` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  `ipid` varchar(999) NOT NULL,
  `sticky` int(11) NOT NULL DEFAULT '0',
  `lock` int(11) NOT NULL DEFAULT '0',
  `rw` int(11) NOT NULL DEFAULT '0',
  `deleted_time` int(12) NOT NULL,
  `bumped` int(12) NOT NULL,
  `cleared` int(11) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `abbr` varchar(999) NOT NULL,
  `name` varchar(999) NOT NULL,
  `hidden` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;


-- --------------------------------------------------------

--
-- Table structure for table `siteconfig`
--

CREATE TABLE IF NOT EXISTS `siteconfig` (
  `config_name` varchar(999) NOT NULL,
  `config_value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(999) NOT NULL,
  `password` varchar(999) NOT NULL,
  `sessionid` varchar(999) NOT NULL,
  `active` int(11) NOT NULL,
  `level` varchar(999) NOT NULL,
  `suspended` int(11) NOT NULL,
  `boards` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;


-- --------------------------------------------------------

--
-- Table structure for table `wordfilters`
--

CREATE TABLE IF NOT EXISTS `wordfilters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(9999) NOT NULL,
  `replace` varchar(9999) NOT NULL,
  `boards` varchar(9999) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
