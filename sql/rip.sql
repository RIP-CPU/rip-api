-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2018 at 03:56 AM
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
  `equipment_uuid` varchar(36) NOT NULL,
  `modality` varchar(50) DEFAULT NULL,
  `conversion_type` varchar(50) DEFAULT NULL,
  `station_name` varchar(60) NOT NULL,
  `institution_name` varchar(100) NOT NULL,
  `institution_address` varchar(150) DEFAULT NULL,
  `institutional_department_name` varchar(50) DEFAULT NULL,
  `manufacturer` varchar(100) NOT NULL,
  `manufacturer_model_name` varchar(100) DEFAULT NULL,
  `software_version` varchar(100) NOT NULL,
  `device_serial_number` varchar(100) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `series_uuid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_instance`
--

CREATE TABLE `mst_instance` (
  `instance_uuid` varchar(36) NOT NULL,
  `sop_instance_uid` varchar(100) NOT NULL,
  `sop_class_uid` varchar(100) NOT NULL,
  `instance_number` int(11) NOT NULL,
  `patient_orientation` varchar(40) DEFAULT NULL,
  `media_storage_sop_instance_uid` varchar(100) DEFAULT NULL,
  `transfer_syntax_uid` varchar(100) NOT NULL,
  `acquisition_date_time` datetime NOT NULL,
  `image_type` varchar(40) NOT NULL,
  `pixel_spacing` float NOT NULL,
  `image_orientation` varchar(40) DEFAULT NULL,
  `image_position` varchar(80) DEFAULT NULL,
  `slice_thickness` float DEFAULT NULL,
  `slice_location` float DEFAULT NULL,
  `window_center` varchar(40) DEFAULT NULL,
  `window_width` varchar(40) DEFAULT NULL,
  `xray_tube_current` int(11) DEFAULT NULL,
  `exposure_time` int(11) DEFAULT NULL,
  `kvp` varchar(40) DEFAULT NULL,
  `content_date_time` datetime NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `series_uuid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_patient`
--

CREATE TABLE `mst_patient` (
  `patient_uuid` varchar(36) NOT NULL,
  `patient_id` varchar(100) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `patient_sex` varchar(10) NOT NULL,
  `patient_birthday` date NOT NULL,
  `patient_age` varchar(10) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_series`
--

CREATE TABLE `mst_series` (
  `series_uuid` varchar(36) NOT NULL,
  `series_instance_uid` varchar(100) NOT NULL,
  `series_number` int(20) NOT NULL,
  `series_description` varchar(100) DEFAULT NULL,
  `body_part_examined` varchar(40) DEFAULT NULL,
  `patient_position` varchar(30) DEFAULT NULL,
  `laterality` varchar(100) DEFAULT NULL,
  `protocol_name` varchar(100) DEFAULT NULL,
  `operators_name` varchar(50) DEFAULT NULL,
  `series_date_time` datetime NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `study_uuid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_study`
--

CREATE TABLE `mst_study` (
  `study_uuid` varchar(36) NOT NULL,
  `study_id` varchar(50) DEFAULT NULL,
  `study_description` text,
  `study_instance_uid` varchar(100) DEFAULT NULL,
  `accession_number` varchar(30) DEFAULT NULL,
  `study_date_time` date NOT NULL,
  `referring_physician_name` varchar(100) DEFAULT NULL,
  `additional_patient_history` text,
  `admitting_diagnoses_description` varchar(200) DEFAULT NULL,
  `study_status_id` varchar(40) DEFAULT NULL,
  `study_priority_id` varchar(40) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `patient_uuid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_token`
--

CREATE TABLE `oauth_access_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` binary(1) DEFAULT NULL,
  `authentication_id` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `authentication` binary(1) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_approvals`
--

CREATE TABLE `oauth_approvals` (
  `userId` varchar(255) DEFAULT NULL,
  `clientId` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModifiedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_client_details`
--

CREATE TABLE `oauth_client_details` (
  `client_id` varchar(255) NOT NULL,
  `resource_ids` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `authorized_grant_types` varchar(255) DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_client_details`
--

INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES
('appclient', 'marketplace', 'appclient001', 'demo', 'client_credentials', '', 'APP_CLIENT_OAUTH2', 7200, 0, NULL, '1'),
('jsclient', 'marketplace', NULL, 'demo', 'implicit', '', 'APP_CLIENT_OAUTH2', 7200, 0, NULL, '1'),
('rip-core', 'profile', 'secretrip01', 'full', 'password', '', 'APP_CLIENT_OAUTH2', 7200, 0, NULL, '1'),
('webclient', 'marketplace', 'webclient123', 'demo', 'authorization_code, refresh_token', 'http://rip.cpu.co.id:69', 'APP_CLIENT_OAUTH2', 180, 1800, NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_client_token`
--

CREATE TABLE `oauth_client_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` binary(1) DEFAULT NULL,
  `authentication_id` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_code`
--

CREATE TABLE `oauth_code` (
  `code` varchar(255) DEFAULT NULL,
  `authentication` binary(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_token`
--

CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` binary(1) DEFAULT NULL,
  `authentication` binary(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sec_role`
--

CREATE TABLE `sec_role` (
  `role_uuid` varchar(36) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` text,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sec_role`
--

INSERT INTO `sec_role` (`role_uuid`, `role_name`, `description`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('06be80df-5c41-42a7-9050-b328312d2f3a', 'ROLE_ADMIN', 'Role Administrator', 0, 1, '2018-12-02 20:52:28', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sec_r_user_role`
--

CREATE TABLE `sec_r_user_role` (
  `user_uuid` varchar(36) NOT NULL,
  `role_uuid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sec_r_user_role`
--

INSERT INTO `sec_r_user_role` (`user_uuid`, `role_uuid`) VALUES
('1ac29215-75e8-4e19-b4f1-e076da7ca1ab', '06be80df-5c41-42a7-9050-b328312d2f3a');

-- --------------------------------------------------------

--
-- Table structure for table `sec_user`
--

CREATE TABLE `sec_user` (
  `user_uuid` varchar(36) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` text NOT NULL,
  `account_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `account_non_expired` tinyint(1) NOT NULL DEFAULT '1',
  `account_non_locker` tinyint(1) NOT NULL DEFAULT '1',
  `credentials_non_expired` tinyint(1) NOT NULL DEFAULT '1',
  `fullname` varchar(200) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` text,
  `division_code` varchar(100) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `province` varchar(200) DEFAULT NULL,
  `district_code` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `description` text,
  `verification_code` varchar(100) DEFAULT NULL,
  `raw` text,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sec_user`
--

INSERT INTO `sec_user` (`user_uuid`, `username`, `password`, `account_enabled`, `account_non_expired`, `account_non_locker`, `credentials_non_expired`, `fullname`, `email`, `address`, `division_code`, `city`, `province`, `district_code`, `phone_number`, `mobile_number`, `description`, `verification_code`, `raw`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('1ac29215-75e8-4e19-b4f1-e076da7ca1ab', 'admin', '$2a$13$WlKVWzXzLLFi5bCRQJ6Ao.oDh61Ptm/ePWb8Y6E3fkxet/Q2.VEi.', 1, 1, 1, 1, 'Administrator', 'admin@cpu.co.id', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2018-12-02 20:50:29', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mst_equipment`
--
ALTER TABLE `mst_equipment`
  ADD PRIMARY KEY (`equipment_uuid`),
  ADD KEY `mst_equipment_ibfk_1` (`series_uuid`);

--
-- Indexes for table `mst_instance`
--
ALTER TABLE `mst_instance`
  ADD PRIMARY KEY (`instance_uuid`),
  ADD KEY `mst_instance_ibfk_1` (`series_uuid`);

--
-- Indexes for table `mst_patient`
--
ALTER TABLE `mst_patient`
  ADD PRIMARY KEY (`patient_uuid`);

--
-- Indexes for table `mst_series`
--
ALTER TABLE `mst_series`
  ADD PRIMARY KEY (`series_uuid`),
  ADD KEY `study_uuid` (`study_uuid`);

--
-- Indexes for table `mst_study`
--
ALTER TABLE `mst_study`
  ADD PRIMARY KEY (`study_uuid`),
  ADD KEY `patient_uuid` (`patient_uuid`);

--
-- Indexes for table `oauth_access_token`
--
ALTER TABLE `oauth_access_token`
  ADD PRIMARY KEY (`authentication_id`);

--
-- Indexes for table `oauth_client_details`
--
ALTER TABLE `oauth_client_details`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `oauth_client_token`
--
ALTER TABLE `oauth_client_token`
  ADD PRIMARY KEY (`authentication_id`);

--
-- Indexes for table `sec_role`
--
ALTER TABLE `sec_role`
  ADD PRIMARY KEY (`role_uuid`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `sec_r_user_role`
--
ALTER TABLE `sec_r_user_role`
  ADD KEY `user_uuid` (`user_uuid`),
  ADD KEY `role_uuid` (`role_uuid`);

--
-- Indexes for table `sec_user`
--
ALTER TABLE `sec_user`
  ADD PRIMARY KEY (`user_uuid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mst_equipment`
--
ALTER TABLE `mst_equipment`
  ADD CONSTRAINT `mst_equipment_ibfk_1` FOREIGN KEY (`series_uuid`) REFERENCES `mst_series` (`series_uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mst_instance`
--
ALTER TABLE `mst_instance`
  ADD CONSTRAINT `mst_instance_ibfk_1` FOREIGN KEY (`series_uuid`) REFERENCES `mst_series` (`series_uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mst_series`
--
ALTER TABLE `mst_series`
  ADD CONSTRAINT `mst_series_ibfk_1` FOREIGN KEY (`study_uuid`) REFERENCES `mst_study` (`study_uuid`);

--
-- Constraints for table `mst_study`
--
ALTER TABLE `mst_study`
  ADD CONSTRAINT `mst_study_ibfk_1` FOREIGN KEY (`patient_uuid`) REFERENCES `mst_patient` (`patient_uuid`);

--
-- Constraints for table `sec_r_user_role`
--
ALTER TABLE `sec_r_user_role`
  ADD CONSTRAINT `sec_r_user_role_ibfk_1` FOREIGN KEY (`user_uuid`) REFERENCES `sec_user` (`user_uuid`),
  ADD CONSTRAINT `sec_r_user_role_ibfk_2` FOREIGN KEY (`role_uuid`) REFERENCES `sec_role` (`role_uuid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
