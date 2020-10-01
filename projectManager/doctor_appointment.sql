-- phpMyAdmin SQL Dump
-- version 2.10.1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jun 23, 2017 at 06:42 AM
-- Server version: 5.0.41
-- PHP Version: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `doctor_appointment`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `advice`
-- 

CREATE TABLE `advice` (
  `advice_id` int(10) NOT NULL auto_increment,
  `advice_problem` varchar(100) default NULL,
  `advice_solution` text,
  PRIMARY KEY  (`advice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `advice`
-- 

INSERT INTO `advice` (`advice_id`, `advice_problem`, `advice_solution`) VALUES 
(1, 'cold', 'Synarist,Cheston,Nomox'),
(2, 'fever', 'Dolo 650mg , Ymox 250mg , Synarist'),
(3, 'wounds', 'Detol , soframycin , Neosprin powder'),
(4, 'body pain', 'Imol , Combiflame , Bowfin'),
(5, 'loose motion', 'Eldoper'),
(6, 'acidity', 'Rantac'),
(7, 'Cough', 'Benedril , TSUQ Syrup , Crux Syrup');

-- --------------------------------------------------------

-- 
-- Table structure for table `doctor`
-- 

CREATE TABLE `doctor` (
  `doctor_id` int(10) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `doctor_ph` varchar(10) NOT NULL,
  `doctor_address` varchar(100) NOT NULL,
  `doctor_email` varchar(100) NOT NULL,
  `doctor_specialization` varchar(100) NOT NULL,
  `doctor_password` varchar(100) NOT NULL,
  PRIMARY KEY  (`doctor_id`),
  UNIQUE KEY `doctor_ph` (`doctor_ph`),
  UNIQUE KEY `doctor_email` (`doctor_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- 
-- Dumping data for table `doctor`
-- 

INSERT INTO `doctor` (`doctor_id`, `doctor_name`, `doctor_ph`, `doctor_address`, `doctor_email`, `doctor_specialization`, `doctor_password`) VALUES 
(1, 'Nikita', '8884580551', 'Gandhinagar Hubballi', 'doc@nikita.com', 'ENT', '123456'),
(2, 'Shabnam', '9538253097', 'Vidya Nagar Hubballi', 'doc@sabnam.com', 'ENT', '123456'),
(3, 'Raaju', '3333333333', 'Gokul Hubballi', 'doc@raaju.com', 'Cardiologist', '123456'),
(4, 'Raamu', '4444444444', 'Nehru Nagar Hubballi', 'doc@raamu.com', 'Cardiologist', '123456'),
(5, 'Rahul', '5555555555', 'Hubballi, Hosur', 'doc@rahul.com', 'ENT', '123456'),
(6, 'Ravi', '6666666666', 'Hubballi Unkal', 'doc@ravi.com', 'Cardiologist', '123456'),
(7, 'Basu', '7777777777', 'Deshpande Nagar Hubballi', 'doc@basu.com', 'Dermatologist', '123456'),
(8, 'Rohit', '8888888888', 'Old Hubli Hubballi', 'doc@rohit.com', 'Dermatologist', '123456'),
(9, 'John', '1212121212', 'Bengaluru', 'doc@john.com', 'Eye_Specialist', '123456'),
(10, 'Jack', '2121212121', 'Bengaluru', 'doc@jack.com', 'Eye_Specialist', '123456'),
(11, 'Susheel', '2323232323', 'Ramakrishna Nagar Hubballi', 'doc@susheel.com', 'Dermatologist', '123456'),
(12, 'Kartik', '3232323232', 'Arjun Vihar Hubballi', 'doc@kartik.com', 'Eye_Specialist', '123456'),
(13, 'xyz', '8123424254', 'hubballi gokul', 'xyz@doc.com', 'Eye_Specialist', '922260');

-- --------------------------------------------------------

-- 
-- Table structure for table `doctor_appointment`
-- 

CREATE TABLE `doctor_appointment` (
  `appointment_id` int(10) NOT NULL auto_increment,
  `appointment_patient_id` int(10) default NULL,
  `appointment_hospital_id` int(10) NOT NULL,
  `appointment_doctor_id` int(10) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `patient_age` int(3) default NULL,
  `appointment_status` varchar(20) NOT NULL,
  PRIMARY KEY  (`appointment_id`),
  KEY `appointment_patient_id` (`appointment_patient_id`),
  KEY `appointment_hospital_id` (`appointment_hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `doctor_appointment`
-- 

INSERT INTO `doctor_appointment` (`appointment_id`, `appointment_patient_id`, `appointment_hospital_id`, `appointment_doctor_id`, `appointment_date`, `appointment_time`, `patient_age`, `appointment_status`) VALUES 
(1, 41, 1, 1, '2017-06-23', '18:12:00', NULL, 'canceled'),
(2, 41, 1, 1, '2017-06-24', '18:37:00', NULL, 'attended'),
(3, 41, 1, 1, '2017-06-25', '18:42:00', NULL, 'attended'),
(4, 41, 1, 2, '2017-06-26', '19:05:00', NULL, 'approved');

-- --------------------------------------------------------

-- 
-- Table structure for table `hosdoc_mapper`
-- 

CREATE TABLE `hosdoc_mapper` (
  `doctor_id` int(10) NOT NULL,
  `hospital_id` int(10) NOT NULL,
  PRIMARY KEY  (`doctor_id`,`hospital_id`),
  KEY `hospital_id` (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `hosdoc_mapper`
-- 

INSERT INTO `hosdoc_mapper` (`doctor_id`, `hospital_id`) VALUES 
(1, 1),
(2, 1),
(3, 1),
(8, 1),
(10, 1),
(1, 2),
(2, 2),
(3, 2),
(5, 2),
(8, 2),
(10, 2),
(1, 4),
(2, 4),
(3, 4),
(8, 4),
(10, 4);

-- --------------------------------------------------------

-- 
-- Table structure for table `hospital`
-- 

CREATE TABLE `hospital` (
  `hospital_id` int(10) NOT NULL auto_increment,
  `hospital_name` varchar(100) NOT NULL,
  `hospital_address` varchar(100) NOT NULL,
  `hospital_phno` varchar(20) NOT NULL,
  `hospital_email` varchar(100) NOT NULL,
  `hospital_fax` varchar(20) NOT NULL,
  `hospital_password` varchar(100) default NULL,
  `hospital_mobile` varchar(10) default NULL,
  PRIMARY KEY  (`hospital_id`),
  UNIQUE KEY `hospital_phno` (`hospital_phno`),
  UNIQUE KEY `hospital_email` (`hospital_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `hospital`
-- 

INSERT INTO `hospital` (`hospital_id`, `hospital_name`, `hospital_address`, `hospital_phno`, `hospital_email`, `hospital_fax`, `hospital_password`, `hospital_mobile`) VALUES 
(1, 'KIMS', 'KMC Hubballi', '083612121212', 'hos@kims.com', '083621212121', '654321', '8970819338'),
(2, 'KLE', 'KLE Belagavi', '083123232323', 'hos@kle.com', '083132323232', '123456', '8970819338'),
(3, 'SDM', 'SDM Dharwad', '083634343434', 'hos@sdm.com', '083643434343', '123456', '8970819338'),
(4, 'R.B. Patil', 'Hosur Hubballi', '083645454545', 'hos@rbpatil.com', '083654545454', '123456', '8970819338'),
(5, 'Fortis', 'Hosur', '54456684', 'fortis@gmail.com', '664654354', '123456', '8970819338');

-- --------------------------------------------------------

-- 
-- Table structure for table `patient`
-- 

CREATE TABLE `patient` (
  `patient_id` int(10) NOT NULL auto_increment,
  `patient_name` varchar(100) NOT NULL,
  `patient_address` varchar(100) NOT NULL,
  `patient_phone` varchar(10) NOT NULL,
  `patient_email` varchar(100) default NULL,
  `patient_gender` varchar(10) NOT NULL,
  `patient_age` int(3) default NULL,
  `patient_password` varchar(100) NOT NULL,
  `patient_aadhar_number` varchar(15) default NULL,
  PRIMARY KEY  (`patient_id`),
  UNIQUE KEY `patient_phone` (`patient_phone`),
  UNIQUE KEY `patient_email` (`patient_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

-- 
-- Dumping data for table `patient`
-- 

INSERT INTO `patient` (`patient_id`, `patient_name`, `patient_address`, `patient_phone`, `patient_email`, `patient_gender`, `patient_age`, `patient_password`, `patient_aadhar_number`) VALUES 
(40, 'ggg', 'jjj', '8861523267', 'ggg@hh.com', 'Male', 31, 'e12def6ceed94fc95cefd2fcffad029f945af41d', NULL),
(41, 'nimita', 'hubli', '8884580551', 'nikitaghatikar2@gmail.com', 'Female', 21, 'f81641303eff7e5caaa0023c1f28618544bdab08', '123456789123');

-- 
-- Constraints for dumped tables
-- 

-- 
-- Constraints for table `doctor_appointment`
-- 
ALTER TABLE `doctor_appointment`
  ADD CONSTRAINT `doctor_appointment_ibfk_1` FOREIGN KEY (`appointment_patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doctor_appointment_ibfk_2` FOREIGN KEY (`appointment_hospital_id`) REFERENCES `hospital` (`hospital_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doctor_appointment_ibfk_3` FOREIGN KEY (`appointment_hospital_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Constraints for table `hosdoc_mapper`
-- 
ALTER TABLE `hosdoc_mapper`
  ADD CONSTRAINT `hosdoc_mapper_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hosdoc_mapper_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`) ON DELETE CASCADE;
