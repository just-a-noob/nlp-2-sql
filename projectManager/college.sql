-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 19, 2018 at 06:19 PM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `college`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `ID` varchar(10) NOT NULL,
  `title` varchar(20) NOT NULL,
  `teacher` varchar(20) NOT NULL,
  `credits` int(3) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`ID`, `title`, `teacher`, `credits`) VALUES
('CSC201', 'Java', 'Mahesh Patil', 4),
('CSC205', 'Data Structures', 'Gopal joshi', 6),
('CSC216', 'Compilers', 'K G Karibasappa', 3),
('CSC302', 'Data communication', 'Parikshit Hegde', 5),
('CSC311', 'DBMS', 'Vijay', 4),
('CSC321', 'ADBMS', 'Vijay', 3),
('CSC322', 'Software engineering', 'Padmashree Desai', 4),
('CSC331', 'Data Mining', 'Parikshit Hegde', 4);

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE IF NOT EXISTS `results` (
  `usn` varchar(20) NOT NULL,
  `cid` varchar(20) NOT NULL,
  `grade` int(3) NOT NULL,
  KEY `FK_cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `results`
--


-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `USN` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `courseid` varchar(10) NOT NULL,
  PRIMARY KEY (`USN`),
  KEY `courseid_2` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`USN`, `name`, `courseid`) VALUES
('81', 'Shravan', 'CSC201'),
('82', 'Sandesh', 'CSC216'),
('83', 'Ramesh', 'CSC302'),
('84', 'Kiran', 'CSC201'),
('85', 'Shivu', 'CSC216'),
('86', 'Sachin', 'CSC216'),
('87', 'Sanjay', 'CSC311'),
('88', 'Ram', 'CSC205');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `FK_cid` FOREIGN KEY (`cid`) REFERENCES `course` (`ID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FK_coid` FOREIGN KEY (`courseid`) REFERENCES `course` (`ID`),
  ADD CONSTRAINT `FK_ceid` FOREIGN KEY (`courseid`) REFERENCES `course` (`ID`),
  ADD CONSTRAINT `FK_courseid` FOREIGN KEY (`courseid`) REFERENCES `course` (`ID`);
