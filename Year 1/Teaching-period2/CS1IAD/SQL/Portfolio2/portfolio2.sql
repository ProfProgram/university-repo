-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2024 at 03:56 PM
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
-- Database: `portfolio2`
--

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `build_id` int(11) NOT NULL,
  `build_line1` varchar(50) NOT NULL,
  `build_line2` varchar(50) DEFAULT NULL,
  `build_postcode` varchar(8) NOT NULL,
  `build_country` varchar(15) NOT NULL DEFAULT 'UK'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`build_id`, `build_line1`, `build_line2`, `build_postcode`, `build_country`) VALUES
(1, 'Aston Uni', 'MB159', 'B4 7ET', 'UK'),
(2, 'London', NULL, 'EC4R 9HA', 'UK');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `org_name` varchar(20) NOT NULL,
  `contact_first_name` varchar(20) NOT NULL,
  `contact_last_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address_line1` varchar(50) NOT NULL,
  `address_line2` varchar(50) DEFAULT NULL,
  `address_postcode` varchar(8) NOT NULL,
  `address_country` varchar(15) NOT NULL DEFAULT 'UK',
  `preferred_contact` enum('email','post') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`org_name`, `contact_first_name`, `contact_last_name`, `email`, `address_line1`, `address_line2`, `address_postcode`, `address_country`, `preferred_contact`) VALUES
('Aston Uni', 'Nick', 'Powell', 'generic@email.com', 'Aston Uni', 'Nicks office', 'B4 7ET', 'UK', 'email'),
('Not A Ponzi Scheme', 'Charles', 'Ponzi', 'cPonzi1882@aol.com', '19 Slocum Road', 'Lexington', 'MA 02421', 'USA', 'post');

-- --------------------------------------------------------

--
-- Table structure for table `pool_members`
--

CREATE TABLE `pool_members` (
  `emp_no` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `build_id` int(11) NOT NULL,
  `home_line1` varchar(50) NOT NULL,
  `home_line2` varchar(50) DEFAULT NULL,
  `home_postcode` varchar(8) NOT NULL,
  `home_country` varchar(15) NOT NULL DEFAULT 'UK',
  `full_name` varchar(50) GENERATED ALWAYS AS (concat(`first_name`,' ',`last_name`)) STORED,
  `current_project` varchar(100) NOT NULL DEFAULT 'emlpoyee unassigned'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pool_members`
--

INSERT INTO `pool_members` (`emp_no`, `first_name`, `last_name`, `email`, `phone`, `salary`, `build_id`, `home_line1`, `home_line2`, `home_postcode`, `home_country`, `current_project`) VALUES
(1, 'Junaid', 'Ali', '210163492@aston.ac.uk', '+44 123456789', 42.00, 1, 'Aston Uni', 'Staniforth House', 'B4 7DN', 'UK', 'employee unassigned'),
(2, 'Generic', 'Human', 'gHuman@gmail.com', '+44 987654321', 10000.00, 2, '10 Downing Street', 'London', 'SW1A 2AA', 'UK', 'HTML website linked with ');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `title` varchar(25) NOT NULL,
  `org_name` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `short_desc` varchar(150) NOT NULL,
  `budget` int(11) NOT NULL,
  `current_phase` enum('employee unassigned','design','development','testing','deployemnt','complete') NOT NULL DEFAULT 'employee unassigned'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`title`, `org_name`, `start_date`, `end_date`, `short_desc`, `budget`, `current_phase`) VALUES
('HTML website linked with ', 'Not A Ponzi Scheme', '1882-03-03', '1920-08-12', 'This is just dummy data :)', 10000000, 'employee unassigned');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skill_id` varchar(25) NOT NULL,
  `skill_name` varchar(20) NOT NULL,
  `skull_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skill_id`, `skill_name`, `skull_type`) VALUES
('DB_SQL', 'SQL', 'databases'),
('HTML_WebDev', 'HTML/JSS/C++', 'WebDev'),
('JavaB', 'Java', 'Backend'),
('JavaF', 'Java', 'Frontend'),
('JUnit_Testing', 'JUnit', 'testing'),
('Python_ML', 'Python', 'machine lerning');

-- --------------------------------------------------------

--
-- Table structure for table `skill_list`
--

CREATE TABLE `skill_list` (
  `skill_list_id` int(11) NOT NULL,
  `skill_id` varchar(25) NOT NULL,
  `skill_level` enum('junior','senior') DEFAULT NULL,
  `emp_full_name` varchar(50) DEFAULT NULL,
  `project_title` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill_list`
--

INSERT INTO `skill_list` (`skill_list_id`, `skill_id`, `skill_level`, `emp_full_name`, `project_title`) VALUES
(1, 'DB_SQL', 'junior', 'Junaid Ali', NULL),
(2, 'HTML_WebDev', 'junior', 'Junaid Ali', NULL),
(3, 'JUnit_Testing', 'junior', 'Junaid Ali', NULL),
(4, 'JavaB', 'senior', 'Generic Human', NULL),
(5, 'Python_ML', 'senior', 'Generic Human', NULL),
(6, 'HTML_WebDev', 'senior', 'Generic Human', NULL),
(10, 'DB_SQL', 'senior', NULL, 'HTML website linked with '),
(11, 'HTML_WebDev', 'senior', NULL, 'HTML website linked with '),
(12, 'DB_SQL', 'senior', 'Generic Human', NULL);

--
-- Triggers `skill_list`
--
DELIMITER $$
CREATE TRIGGER `check_skill_for` BEFORE INSERT ON `skill_list` FOR EACH ROW begin 
if new.emp_full_name is not null and new.project_title is not null THEN
signal sqlstate '45000'
set message_text = 'Both emp_full_name and project_title cannot be set simultaniously';
end IF;
ENd
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`build_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`org_name`);

--
-- Indexes for table `pool_members`
--
ALTER TABLE `pool_members`
  ADD PRIMARY KEY (`emp_no`),
  ADD UNIQUE KEY `full_name` (`full_name`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`title`),
  ADD KEY `fk_org_name` (`org_name`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `skill_list`
--
ALTER TABLE `skill_list`
  ADD PRIMARY KEY (`skill_list_id`),
  ADD KEY `fk_skill_id` (`skill_id`),
  ADD KEY `fk_emp_full_name` (`emp_full_name`),
  ADD KEY `fk_project_title` (`project_title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `build_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pool_members`
--
ALTER TABLE `pool_members`
  MODIFY `emp_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `skill_list`
--
ALTER TABLE `skill_list`
  MODIFY `skill_list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `fk_org_name` FOREIGN KEY (`org_name`) REFERENCES `clients` (`org_name`);

--
-- Constraints for table `skill_list`
--
ALTER TABLE `skill_list`
  ADD CONSTRAINT `fk_emp_full_name` FOREIGN KEY (`emp_full_name`) REFERENCES `pool_members` (`full_name`),
  ADD CONSTRAINT `fk_project_title` FOREIGN KEY (`project_title`) REFERENCES `projects` (`title`),
  ADD CONSTRAINT `fk_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
