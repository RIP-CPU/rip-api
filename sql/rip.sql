-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2018 at 05:21 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rip`
--

-- --------------------------------------------------------

--
-- Table structure for table `mst_equipment`
--

CREATE TABLE `mst_equipment` (
  `id` bigint(20) NOT NULL,
  `modality` varchar(50) NOT NULL,
  `conversion_type` varchar(50) NOT NULL,
  `station_name` varchar(60) NOT NULL,
  `institution_name` varchar(100) NOT NULL,
  `institution_address` varchar(150) NOT NULL,
  `institutional_department_name` varchar(50) NOT NULL,
  `manufacturer` varchar(100) NOT NULL,
  `manufacturer_model_name` varchar(100) NOT NULL,
  `software_version` varchar(100) NOT NULL,
  `device_serial_number` varchar(100) NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `series_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_instance`
--

CREATE TABLE `mst_instance` (
  `id` bigint(20) NOT NULL,
  `sop_instance_uid` varchar(100) NOT NULL,
  `sop_class_uid` varchar(100) NOT NULL,
  `instance_number` int(11) NOT NULL,
  `patient_orientation` varchar(40) NOT NULL,
  `media_storage_sop_instance_uid` varchar(100) NOT NULL,
  `transfer_syntax_uid` varchar(100) NOT NULL,
  `acquisition_date_time` date NOT NULL,
  `image_type` varchar(40) NOT NULL,
  `pixel_spacing` float NOT NULL,
  `image_orientation` varchar(40) NOT NULL,
  `image_position` varchar(80) NOT NULL,
  `slice_thickness` float NOT NULL,
  `slice_location` float NOT NULL,
  `window_center` varchar(40) NOT NULL,
  `window_width` varchar(40) NOT NULL,
  `xray_tube_current` int(11) NOT NULL,
  `exposure_time` int(11) NOT NULL,
  `kvp` varchar(40) NOT NULL,
  `content_date_time` date NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `series_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_patient`
--

CREATE TABLE `mst_patient` (
  `id` bigint(20) NOT NULL,
  `patient_id` varchar(100) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `patient_sex` varchar(10) NOT NULL,
  `patient_birthday` date NOT NULL,
  `patient_age` varchar(10) NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_series`
--

CREATE TABLE `mst_series` (
  `id` bigint(20) NOT NULL,
  `series_instance_uid` varchar(100) NOT NULL,
  `series_number` int(20) NOT NULL,
  `series_description` varchar(100) NOT NULL,
  `body_part_examined` varchar(40) NOT NULL,
  `patient_position` varchar(30) NOT NULL,
  `laterality` varchar(100) NOT NULL,
  `protocol_name` varchar(100) NOT NULL,
  `operators_name` varchar(50) NOT NULL,
  `series_date_time` date NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `study_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_study`
--

CREATE TABLE `mst_study` (
  `id` bigint(20) NOT NULL,
  `study_id` varchar(50) NOT NULL,
  `study_description` text NOT NULL,
  `study_instance_uid` varchar(100) NOT NULL,
  `accession_number` varchar(30) NOT NULL,
  `study_date_time` date NOT NULL,
  `referring_physician_name` varchar(100) NOT NULL,
  `additional_patient_history` text,
  `admitting_diagnoses_description` varchar(200) DEFAULT NULL,
  `study_status_id` varchar(40) NOT NULL,
  `study_priority_id` varchar(40) NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `patient_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mst_equipment`
--
ALTER TABLE `mst_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `series_id` (`series_id`);

--
-- Indexes for table `mst_instance`
--
ALTER TABLE `mst_instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `series_id` (`series_id`);

--
-- Indexes for table `mst_patient`
--
ALTER TABLE `mst_patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_series`
--
ALTER TABLE `mst_series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `study_id` (`study_id`);

--
-- Indexes for table `mst_study`
--
ALTER TABLE `mst_study`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mst_study_ibfk_1` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mst_equipment`
--
ALTER TABLE `mst_equipment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_instance`
--
ALTER TABLE `mst_instance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_patient`
--
ALTER TABLE `mst_patient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mst_series`
--
ALTER TABLE `mst_series`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_study`
--
ALTER TABLE `mst_study`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mst_equipment`
--
ALTER TABLE `mst_equipment`
  ADD CONSTRAINT `mst_equipment_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `mst_series` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mst_instance`
--
ALTER TABLE `mst_instance`
  ADD CONSTRAINT `mst_instance_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `mst_series` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mst_series`
--
ALTER TABLE `mst_series`
  ADD CONSTRAINT `mst_series_ibfk_1` FOREIGN KEY (`study_id`) REFERENCES `mst_study` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mst_study`
--
ALTER TABLE `mst_study`
  ADD CONSTRAINT `mst_study_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `mst_patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
