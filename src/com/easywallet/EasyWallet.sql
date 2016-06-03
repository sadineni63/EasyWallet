-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2016 at 11:17 AM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easywallet`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `uid` varchar(20) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `balance` int(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `activation_code` varchar(50) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`uid`, `type`, `balance`, `status`, `activation_code`, `email`) VALUES
('U5E14BB', 'consumer', 510, 'active', '123456789', 'nikhilreddy@outlook.com');

-- --------------------------------------------------------

--
-- Table structure for table `add_transactions`
--

CREATE TABLE `add_transactions` (
  `tid` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` datetime DEFAULT NULL,
  `amount` int(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  `strt_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `add_transactions`
--

INSERT INTO `add_transactions` (`tid`, `email`, `date`, `amount`, `status`, `source`, `strt_id`) VALUES
('TRA1674AF', 'nikhilreddy93@outlook.com', '2016-05-28 17:21:49', 500, 'active', 'my card', 'U5E14BB');

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `uid` varchar(20) NOT NULL,
  `cardname` varchar(30) NOT NULL,
  `cardnumber` varchar(30) NOT NULL,
  `bankname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`uid`, `cardname`, `cardnumber`, `bankname`) VALUES
('U5E14BB', 'my card', '459874563215', 'sbi');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `code` varchar(50) NOT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `min_tran_amount` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `uid` varchar(50) NOT NULL,
  `merchant` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `request_transactions`
--

CREATE TABLE `request_transactions` (
  `tid` varchar(25) NOT NULL,
  `date` datetime DEFAULT NULL,
  `b_email` varchar(50) DEFAULT NULL,
  `c_email` varchar(50) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reward_transactions`
--

CREATE TABLE `reward_transactions` (
  `tid` varchar(25) NOT NULL,
  `date` datetime DEFAULT NULL,
  `merchant` varchar(50) DEFAULT NULL,
  `reward_amount` int(10) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `send_tid` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `send_transactions`
--

CREATE TABLE `send_transactions` (
  `tid` varchar(25) NOT NULL,
  `date` datetime DEFAULT NULL,
  `merchant` varchar(50) DEFAULT NULL,
  `c_email` varchar(50) DEFAULT NULL,
  `amount` int(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` varchar(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `email`, `phone`, `address`, `password`) VALUES
('U5E14BB', 'nikhilreddy', 'nikhilreddy93@outlook.com', '9966516546', 'hyd', '$2a$12$LyBwSq59GDmuCE7/aqvF5OR3TfiIttsx6n.RgFJ/GArSPzJk8jAR.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `add_transactions`
--
ALTER TABLE `add_transactions`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `request_transactions`
--
ALTER TABLE `request_transactions`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `reward_transactions`
--
ALTER TABLE `reward_transactions`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `send_fk_idx` (`send_tid`);

--
-- Indexes for table `send_transactions`
--
ALTER TABLE `send_transactions`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reward_transactions`
--
ALTER TABLE `reward_transactions`
  ADD CONSTRAINT `send_fk` FOREIGN KEY (`send_tid`) REFERENCES `send_transactions` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
