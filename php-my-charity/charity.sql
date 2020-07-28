-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2015 at 07:31 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `charity`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `user_id` int(11) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `item_name` (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`user_id`, `item_name`, `created_at`) VALUES
(1, 'admin', NULL),
(2, 'users', NULL),
(3, 'ngo', NULL),
(4, 'volunteer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, NULL, 2147483647),
('ngo', 1, NULL, NULL, NULL, NULL, NULL),
('users', 1, NULL, NULL, NULL, NULL, 2147483647),
('volunteer', 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'ngo'),
('admin', 'users'),
('admin', 'volunteer');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cause`
--

CREATE TABLE IF NOT EXISTS `tbl_cause` (
  `CauseId` int(11) NOT NULL AUTO_INCREMENT,
  `CauseTitle` varchar(255) NOT NULL,
  `CauseDescription` text NOT NULL,
  `Image` varchar(255) NOT NULL,
  `NgoName` int(11) NOT NULL,
  `RegisterBy` int(11) NOT NULL,
  `RegisterType` varchar(255) NOT NULL,
  `Promoters` varchar(255) NOT NULL,
  `DonationRequired` decimal(20,2) DEFAULT NULL,
  `MinDonation` decimal(10,2) NOT NULL,
  `DonationCollected` decimal(20,2) NOT NULL,
  `DonerList` enum('Yes','No') NOT NULL,
  `PageMessage` text NOT NULL,
  `ThanksMessage` text NOT NULL,
  `RaiseExtra` enum('Yes','No') NOT NULL,
  `RegisterOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reason` int(11) NOT NULL,
  `PrimaryArea` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `ApprovedOn` datetime NOT NULL,
  `Status` enum('Active','Inactive','Pending','Modified','Deleted') NOT NULL DEFAULT 'Pending',
  `Featured` enum('Yes','No') DEFAULT 'No',
  PRIMARY KEY (`CauseId`),
  KEY `NgoName` (`NgoName`,`RegisterBy`),
  KEY `RegisterBy` (`RegisterBy`),
  KEY `NgoName_2` (`NgoName`),
  KEY `Reason` (`Reason`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tbl_cause`
--

INSERT INTO `tbl_cause` (`CauseId`, `CauseTitle`, `CauseDescription`, `Image`, `NgoName`, `RegisterBy`, `RegisterType`, `Promoters`, `DonationRequired`, `MinDonation`, `DonationCollected`, `DonerList`, `PageMessage`, `ThanksMessage`, `RaiseExtra`, `RegisterOn`, `Reason`, `PrimaryArea`, `StartDate`, `EndDate`, `ApprovedOn`, `Status`, `Featured`) VALUES
(17, 'Education Kit', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n', '', 1, 3, '', '', '420.00', '15.00', '0.00', 'Yes', '<p>Test 123</p>\r\n', '<p>Thank You!</p>\r\n', 'Yes', '2015-06-30 08:23:42', 1, 3, '2015-06-30', '2015-08-08', '0000-00-00 00:00:00', 'Active', 'Yes'),
(18, 'Some title for dation Some title for dation Some title for dation', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n', '', 1, 3, '', '', '1243.00', '24.00', '0.00', 'Yes', '<p>42</p>\r\n', '<p>sgdgd</p>\r\n', 'Yes', '2015-06-30 11:33:28', 1, 5, '2015-06-02', '2015-06-04', '0000-00-00 00:00:00', 'Active', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE IF NOT EXISTS `tbl_country` (
  `CountryId` int(11) NOT NULL AUTO_INCREMENT,
  `CountryCode` varchar(20) NOT NULL,
  `CountryName` varchar(50) NOT NULL,
  PRIMARY KEY (`CountryId`),
  UNIQUE KEY `CountryCode` (`CountryCode`,`CountryName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_country`
--

INSERT INTO `tbl_country` (`CountryId`, `CountryCode`, `CountryName`) VALUES
(1, 'IN', 'India'),
(3, 'UK', 'United Kingdom'),
(2, 'USA', 'United States');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_donation`
--

CREATE TABLE IF NOT EXISTS `tbl_donation` (
  `DonationId` int(11) NOT NULL AUTO_INCREMENT,
  `DonationAmount` decimal(10,2) NOT NULL,
  `CauseId` int(11) NOT NULL,
  `DonationBy` int(11) NOT NULL,
  `DonationOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DonationIp` varchar(255) NOT NULL,
  `DonationMode` varchar(255) NOT NULL,
  PRIMARY KEY (`DonationId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_donation`
--

INSERT INTO `tbl_donation` (`DonationId`, `DonationAmount`, `CauseId`, `DonationBy`, `DonationOn`, `DonationIp`, `DonationMode`) VALUES
(1, '30.00', 18, 2, '2015-07-08 10:07:36', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_newsletter_subscription`
--

CREATE TABLE IF NOT EXISTS `tbl_newsletter_subscription` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ngo`
--

CREATE TABLE IF NOT EXISTS `tbl_ngo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NgoName` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `State` int(11) NOT NULL,
  `Website` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Mobile` varchar(20) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `RegistrationType` enum('Trust','Society','Section 25') NOT NULL,
  `Valid12A` enum('Yes','No') NOT NULL,
  `PanNumber` varchar(20) NOT NULL,
  `Beneficiaries` int(11) NOT NULL,
  `Expenditure` int(11) NOT NULL,
  `PrimaryArea` int(11) NOT NULL,
  `OperatingState` int(11) NOT NULL,
  `ProfilePic` varchar(255) DEFAULT NULL,
  `EnteredOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_ngo`
--

INSERT INTO `tbl_ngo` (`Id`, `NgoName`, `City`, `State`, `Website`, `FirstName`, `LastName`, `Mobile`, `Email`, `RegistrationType`, `Valid12A`, `PanNumber`, `Beneficiaries`, `Expenditure`, `PrimaryArea`, `OperatingState`, `ProfilePic`, `EnteredOn`, `UserId`) VALUES
(1, 'Test Ngo1', 'Lucknow', 1, 'www.ptindia.org', 'Sachin', 'Jaiswal', '9125766788', 'sachin@ptindia.org', 'Trust', '', '', 0, 0, 0, 0, NULL, '2015-06-23 12:50:31', 3),
(4, 'Ngo2 ', '', 1, '', 'fghf', 'fh', '', 'fahad@ptindia.org', 'Trust', 'Yes', '', 0, 0, 0, 0, NULL, '2015-06-25 07:49:40', 7),
(5, 'Ngo3', '', 1, '', 'fghf', 'fh', '', 'fahad@ptindia.org', 'Trust', 'Yes', '', 0, 0, 0, 0, NULL, '2015-06-25 07:51:29', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_primary_area`
--

CREATE TABLE IF NOT EXISTS `tbl_primary_area` (
  `AreaId` int(11) NOT NULL AUTO_INCREMENT,
  `AreaName` varchar(255) NOT NULL,
  `Status` varchar(20) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`AreaId`),
  UNIQUE KEY `AreaName` (`AreaName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tbl_primary_area`
--

INSERT INTO `tbl_primary_area` (`AreaId`, `AreaName`, `Status`) VALUES
(1, 'Children', 'Active'),
(2, 'Disabled', 'Active'),
(3, 'Education', 'Active'),
(4, 'Elderly', 'Active'),
(5, 'Employment', 'Active'),
(6, 'Environment', 'Active'),
(7, 'Health', 'Active'),
(8, 'Human Rights', 'Active'),
(9, 'Women', 'Active'),
(10, 'Youth', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promotion`
--

CREATE TABLE IF NOT EXISTS `tbl_promotion` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CauseId` int(11) DEFAULT NULL,
  `Promoter` int(11) DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Pending',
  `ApprovedOn` date DEFAULT NULL,
  `EnteredOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FlagNgo` int(11) NOT NULL DEFAULT '1',
  `FlagAdmin` int(11) NOT NULL DEFAULT '1',
  `Unique` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Unique` (`Unique`),
  KEY `CuaseId` (`CauseId`,`Promoter`),
  KEY `Promoter` (`Promoter`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_promotion`
--

INSERT INTO `tbl_promotion` (`Id`, `CauseId`, `Promoter`, `Status`, `ApprovedOn`, `EnteredOn`, `FlagNgo`, `FlagAdmin`, `Unique`) VALUES
(1, 17, 8, 'Active', '2015-07-01', '2015-07-01 06:49:58', 1, 1, '178'),
(2, 17, 9, 'Active', '2015-07-01', '2015-07-09 07:06:51', 1, 1, '179'),
(3, 17, 10, 'Active', '2015-07-22', '2015-07-09 07:06:51', 1, 1, '1710');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reason`
--

CREATE TABLE IF NOT EXISTS `tbl_reason` (
  `ReasonId` int(11) NOT NULL AUTO_INCREMENT,
  `Reason` varchar(255) NOT NULL,
  PRIMARY KEY (`ReasonId`),
  UNIQUE KEY `Reason` (`Reason`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_reason`
--

INSERT INTO `tbl_reason` (`ReasonId`, `Reason`) VALUES
(1, 'Test Reason 101'),
(2, 'Test Reason 102');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reminder`
--

CREATE TABLE IF NOT EXISTS `tbl_reminder` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) NOT NULL,
  `Occasion` varchar(255) NOT NULL,
  `OccasionDate` date NOT NULL,
  `Decription` varchar(100) NOT NULL,
  `RemiderDate` date NOT NULL,
  `ReminderAbout` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE IF NOT EXISTS `tbl_state` (
  `StateId` int(11) NOT NULL AUTO_INCREMENT,
  `StateName` varchar(255) NOT NULL,
  PRIMARY KEY (`StateId`),
  UNIQUE KEY `StateName` (`StateName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`StateId`, `StateName`) VALUES
(2, 'Andaman and Nicobar Islands'),
(1, 'Andhra Pradesh'),
(3, 'Arunachal Pradesh'),
(4, 'Assam'),
(5, 'Bihar'),
(6, 'Chandigarh'),
(7, 'Chhattisgarh'),
(8, 'Dadra & Nagar Haveli'),
(9, 'Daman & Diu'),
(10, 'Goa'),
(11, 'Gujarat'),
(12, 'Haryana'),
(13, 'Himachal Pradesh'),
(14, 'Jammu & Kashmir'),
(15, 'Jharkhand'),
(16, 'Karnataka'),
(17, 'Kerala'),
(18, 'Lakshadweep'),
(19, 'Madhya Pradesh'),
(20, 'Maharashtra'),
(21, 'Manipur'),
(22, 'Meghalaya'),
(23, 'Mizoram'),
(24, 'Nagaland'),
(25, 'NCR (Gurgaon, New Delhi, Ghaziabad, Noida)'),
(26, 'Odisha'),
(36, 'Other'),
(27, 'Pondicherry'),
(28, 'Punjab'),
(29, 'Rajasthan'),
(30, 'Sikkim'),
(31, 'Tamil Nadu'),
(32, 'Telegana'),
(33, 'Tripura'),
(34, 'Uttar Pradesh'),
(35, 'Uttarakhand');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE IF NOT EXISTS `tbl_users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Country` int(11) NOT NULL,
  `State` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Pincode` varchar(50) NOT NULL,
  `ProfilePic` varchar(255) DEFAULT NULL,
  `EnteredOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`Id`, `FirstName`, `LastName`, `Country`, `State`, `City`, `Email`, `Address`, `Pincode`, `ProfilePic`, `EnteredOn`, `UserId`) VALUES
(1, 'rtet11', 'tret11', 1, '1', '11', 'et@FS.DTGDE', '1sdfgd', '', NULL, '2015-06-14 09:16:24', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_volunteer`
--

CREATE TABLE IF NOT EXISTS `tbl_volunteer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Country` int(11) DEFAULT NULL,
  `State` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Mobile` varchar(50) DEFAULT NULL,
  `Pan` varchar(50) DEFAULT NULL,
  `Address` varchar(255) NOT NULL,
  `Pincode` varchar(50) NOT NULL,
  `ProfilePic` varchar(255) NOT NULL,
  `EnteredOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`),
  KEY `Country` (`Country`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tbl_volunteer`
--

INSERT INTO `tbl_volunteer` (`Id`, `FirstName`, `LastName`, `Country`, `State`, `City`, `Email`, `Mobile`, `Pan`, `Address`, `Pincode`, `ProfilePic`, `EnteredOn`, `UserId`) VALUES
(8, 'some', ' Name', 1, '18', '2', 'volunteer@test.com', '', '', 'dfgd', 'dg', '6129311_G.jpg', '2015-06-14 10:14:35', 4),
(9, 'dgd', 'dgd', 1, 'dg', 'dg', 'dg', '34', '34', 'dfd', '34', '', '2015-07-09 07:05:57', 6),
(10, 'hfh', 'fhf', 1, 'fhf', 'fhf', 'fhf', NULL, NULL, 'fhf', 'fghf', 'hf', '2015-07-09 07:05:57', 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `CollapseMenu` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullname`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `CollapseMenu`) VALUES
(1, 'Mr. Admin', 'admin', 'ld6XrLadQBakdmPsRCqKUxXX2oDbqXBM', '$2y$13$KhGGtYp09WlnQ2sIEY.m9eqZwmCNS/BARvrnVybsVwxOpgF0u.x7W', 'TElDXFC5wuhcYFS4HBawtoKLq6BtdAKq_1423459939', 'admin@test.com', 10, 1423459712, 1432363124, '0'),
(2, 'Mr. Test', 'test', 'tQxUh8cSU8w6WoSyaknR4JiN6yPCSyuq', '$2y$13$jIWl/h4eIpba8iZYYApJKeLleeGjJo55hPjJqfb9gJL8u8Mf8wCTm', NULL, 'test@test.com', 10, 1424256473, 1432549056, '1'),
(3, 'fahad', 'ngo', 'fQbpyWPtY-RWeLjbuvccTjH7aMHJsHqj', '$2y$13$pCKYoU/1MD1POUNqH50KROrk/KbHMf4S0MT9yPEttMoZd4lUQS5Au', NULL, 'ngo@test.com', 10, 1434036603, 1434036603, '1'),
(4, 'volunteer', 'volunteer', '', '$2y$13$jIWl/h4eIpba8iZYYApJKeLleeGjJo55hPjJqfb9gJL8u8Mf8wCTm', NULL, 'volunteer@test.com', 10, 0, 1434363635, '1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_promotion`
--
ALTER TABLE `tbl_promotion`
  ADD CONSTRAINT `tbl_promotion_ibfk_2` FOREIGN KEY (`Promoter`) REFERENCES `tbl_volunteer` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_volunteer`
--
ALTER TABLE `tbl_volunteer`
  ADD CONSTRAINT `tbl_volunteer_ibfk_1` FOREIGN KEY (`Country`) REFERENCES `tbl_country` (`CountryId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
