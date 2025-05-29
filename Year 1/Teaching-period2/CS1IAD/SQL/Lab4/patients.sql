-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2024 at 08:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `PatientNo` varchar(43) DEFAULT NULL,
  `Firstname` varchar(20) DEFAULT NULL,
  `Lastname` varchar(20) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `AddressLine1` varchar(40) DEFAULT NULL,
  `AddressLine2` varchar(40) DEFAULT NULL,
  `GP` char(3) DEFAULT NULL,
  `Room` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`PatientNo`, `Firstname`, `Lastname`, `DateOfBirth`, `AddressLine1`, `AddressLine2`, `GP`, `Room`) VALUES
('30', 'Mary', 'Krebbs', '1976-06-11', '12 Elm Street', 'Tamworth', 'ALW', 3),
('88', 'Bill', 'Pirie', '1982-09-28', 'Final Way', 'Lichfield', 'ALW', 5),
('35', 'Jane', 'Hughes', '1965-12-18', 'Rothamted Manor', 'Lichfield', 'JJK', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
