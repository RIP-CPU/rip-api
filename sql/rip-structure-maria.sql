-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2018 at 04:23 AM
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
-- Table structure for table `dcm_equipment`
--

CREATE TABLE `dcm_equipment` (
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
-- Table structure for table `dcm_instance`
--

CREATE TABLE `dcm_instance` (
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
-- Table structure for table `dcm_patient`
--

CREATE TABLE `dcm_patient` (
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
-- Table structure for table `dcm_series`
--

CREATE TABLE `dcm_series` (
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
-- Table structure for table `dcm_study`
--

CREATE TABLE `dcm_study` (
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
-- Table structure for table `mst_city`
--

CREATE TABLE `mst_city` (
  `id` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_country`
--

CREATE TABLE `mst_country` (
  `country_uuid` varchar(36) NOT NULL,
  `country_code` varchar(3) NOT NULL COMMENT 'ISO 3166-1 alpha-3',
  `country_name` varchar(150) NOT NULL,
  `capital` varchar(150) NOT NULL,
  `phone_prefix` varchar(10) DEFAULT NULL,
  `flag` varchar(100) DEFAULT NULL COMMENT 'ISO 3166-1 alpha-2',
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_currency`
--

CREATE TABLE `mst_currency` (
  `currency_uuid` varchar(36) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_name` varchar(150) NOT NULL,
  `currency_sign` varchar(10) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_district`
--

CREATE TABLE `mst_district` (
  `id` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_equipment`
--

CREATE TABLE `mst_equipment` (
  `equipment_uuid` varchar(36) NOT NULL,
  `equipment_id` varchar(150) DEFAULT NULL,
  `equipment_number` varchar(150) DEFAULT NULL,
  `equipment_name` varchar(150) NOT NULL,
  `equipment_model` varchar(150) DEFAULT NULL,
  `equipment_version` varchar(150) DEFAULT NULL,
  `software_version` varchar(150) DEFAULT NULL,
  `manufacture` varchar(150) DEFAULT NULL,
  `equipment_specification` text,
  `equipment_description` text,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `modality_uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_file_group`
--

CREATE TABLE `mst_file_group` (
  `file_group_uuid` varchar(36) NOT NULL,
  `file_group_name` varchar(150) DEFAULT NULL,
  `file_group_description` text,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_file_metadata`
--

CREATE TABLE `mst_file_metadata` (
  `file_metadata_uuid` varchar(36) NOT NULL,
  `file_checksum` varchar(36) DEFAULT NULL,
  `file_extension` varchar(255) DEFAULT NULL,
  `file_path` text,
  `file_location` text,
  `file_name` text,
  `file_type` varchar(255) DEFAULT NULL,
  `file_download_count` int(11) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `file_group_uuid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_healthcare`
--

CREATE TABLE `mst_healthcare` (
  `healthcare_uuid` varchar(36) NOT NULL,
  `healthcare_code` varchar(200) NOT NULL,
  `healthcare_name` varchar(200) NOT NULL,
  `healthcare_description` text,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `healthcare_type_uuid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_healthcare_type`
--

CREATE TABLE `mst_healthcare_type` (
  `healthcare_type_uuid` varchar(36) NOT NULL,
  `healthcare_type_code` varchar(100) NOT NULL,
  `healthcare_type_name` varchar(150) NOT NULL,
  `healthcare_type_description` text,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_language`
--

CREATE TABLE `mst_language` (
  `language_uuid` varchar(36) NOT NULL,
  `language_code` varchar(10) NOT NULL,
  `language_identifier` varchar(100) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_modality`
--

CREATE TABLE `mst_modality` (
  `modality_uuid` varchar(36) NOT NULL,
  `modality_code` varchar(10) NOT NULL,
  `modality_name` varchar(150) NOT NULL,
  `modality_description` text,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_polyclinic`
--

CREATE TABLE `mst_polyclinic` (
  `polyclinic_uuid` varchar(36) NOT NULL,
  `polyclinic_code` varchar(100) DEFAULT NULL,
  `polyclinic_name` varchar(150) NOT NULL,
  `polyclinic_description` text,
  `is_leaf` tinyint(1) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `ordering_str` varchar(150) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `parent_uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_polyclinic_i18n`
--

CREATE TABLE `mst_polyclinic_i18n` (
  `polyclinic_i18n_uuid` varchar(36) NOT NULL,
  `polyclinic_uuid` varchar(36) NOT NULL,
  `locale_code` varchar(10) NOT NULL,
  `polyclinic_i18n_name` varchar(150) NOT NULL,
  `polyclinic_i18n_description` text,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_province`
--

CREATE TABLE `mst_province` (
  `id` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `country_uuid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_r_country_currency`
--

CREATE TABLE `mst_r_country_currency` (
  `country_uuid` varchar(36) NOT NULL,
  `currency_uuid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_subdistrict`
--

CREATE TABLE `mst_subdistrict` (
  `id` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_zipcode`
--

CREATE TABLE `mst_zipcode` (
  `id` int(11) NOT NULL,
  `zipcode` varchar(100) DEFAULT NULL,
  `subdistrict_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `country_uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_token`
--

CREATE TABLE `oauth_access_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `authentication` blob,
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
  `lastModifiedAt` timestamp NULL DEFAULT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `oauth_client_token`
--

CREATE TABLE `oauth_client_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` blob,
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
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_token`
--

CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rip_nurse`
--

CREATE TABLE `rip_nurse` (
  `nurse_uuid` varchar(36) NOT NULL,
  `nurse_id` varchar(50) NOT NULL,
  `nurse_name` varchar(150) NOT NULL,
  `nurse_degree` text,
  `polyclinic_code` varchar(100) DEFAULT NULL,
  `polyclinic_name` varchar(150) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rip_patient`
--

CREATE TABLE `rip_patient` (
  `patient_uuid` varchar(36) NOT NULL,
  `patient_id` varchar(50) NOT NULL COMMENT 'Medical Record Number',
  `id_card` varchar(100) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `patient_status` varchar(150) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `parent_uuid` varchar(36) DEFAULT NULL,
  `family_status` varchar(30) DEFAULT NULL COMMENT 'family status to parent_uuid'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rip_patient_appointment`
--

CREATE TABLE `rip_patient_appointment` (
  `patient_appointment_uuid` varchar(36) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `appointment_status` varchar(100) DEFAULT NULL,
  `visit_date` datetime DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  `patient_name` varchar(150) NOT NULL,
  `radiographer_id` varchar(50) DEFAULT NULL,
  `radiographer_name` varchar(150) DEFAULT NULL,
  `modality_code` varchar(10) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rip_physician`
--

CREATE TABLE `rip_physician` (
  `physician_uuid` varchar(36) NOT NULL,
  `physician_id` varchar(50) NOT NULL,
  `physician_name` varchar(150) NOT NULL,
  `physician_degree` text,
  `physician_status` varchar(150) DEFAULT NULL,
  `physician_speciality` varchar(150) DEFAULT NULL,
  `polyclinic_code` varchar(100) DEFAULT NULL,
  `polyclinic_name` varchar(150) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rip_radiographer`
--

CREATE TABLE `rip_radiographer` (
  `radiographer_uuid` varchar(36) NOT NULL,
  `radiographer_id` varchar(50) NOT NULL,
  `radiographer_name` varchar(150) NOT NULL,
  `radiographer_degree` text,
  `radiographer_status` varchar(150) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rip_radiology_assessment`
--

CREATE TABLE `rip_radiology_assessment` (
  `radiology_assessment_uuid` varchar(36) NOT NULL,
  `study_uuid` varchar(36) DEFAULT NULL,
  `file_group_uuid` varchar(36) NOT NULL,
  `patient_id` varchar(100) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `referring_physician_id` text,
  `referring_physician_fullname` varchar(100) DEFAULT NULL,
  `radiographer_id` varchar(50) DEFAULT NULL,
  `radiographer_fullname` text,
  `radiology_diagnose` text,
  `notes` text,
  `checkup_date` date DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rip_r_radiographer_healthcare`
--

CREATE TABLE `rip_r_radiographer_healthcare` (
  `radiographer_uuid` varchar(36) NOT NULL,
  `healthcare_code` varchar(200) NOT NULL,
  `healthcare_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sec_function`
--

CREATE TABLE `sec_function` (
  `function_uuid` varchar(36) NOT NULL,
  `menu_uuid` varchar(36) NOT NULL,
  `role_uuid` varchar(36) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `access` varchar(30) NOT NULL DEFAULT 'INQ,GET,ADD,PUT,DEL,APV',
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sec_menu`
--

CREATE TABLE `sec_menu` (
  `menu_uuid` varchar(36) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` text,
  `level` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `is_leaf` tinyint(1) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `parent_uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sec_menu_i18n`
--

CREATE TABLE `sec_menu_i18n` (
  `menu_i18n_uuid` varchar(36) NOT NULL,
  `menu_uuid` varchar(36) NOT NULL,
  `locale_code` varchar(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `sec_r_user_nurse`
--

CREATE TABLE `sec_r_user_nurse` (
  `user_uuid` varchar(36) NOT NULL,
  `nurse_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sec_r_user_patient`
--

CREATE TABLE `sec_r_user_patient` (
  `user_uuid` varchar(36) NOT NULL,
  `patient_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sec_r_user_physician`
--

CREATE TABLE `sec_r_user_physician` (
  `user_uuid` varchar(36) NOT NULL,
  `physician_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sec_r_user_radiographer`
--

CREATE TABLE `sec_r_user_radiographer` (
  `user_uuid` varchar(36) NOT NULL,
  `radiographer_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sec_r_user_role`
--

CREATE TABLE `sec_r_user_role` (
  `user_uuid` varchar(36) NOT NULL,
  `role_uuid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `city` varchar(200) DEFAULT NULL,
  `province` varchar(200) DEFAULT NULL,
  `district_code` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `description` text,
  `verification_code` varchar(100) DEFAULT NULL,
  `raw` text,
  `locale` varchar(10) NOT NULL DEFAULT 'en-US',
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sys_locale`
--

CREATE TABLE `sys_locale` (
  `locale_uuid` varchar(36) NOT NULL,
  `locale_code` varchar(10) NOT NULL,
  `locale_identifier` varchar(100) NOT NULL,
  `locale_icon` varchar(100) DEFAULT NULL,
  `locale_default` tinyint(1) NOT NULL DEFAULT '0',
  `locale_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sys_parameter`
--

CREATE TABLE `sys_parameter` (
  `parameter_uuid` varchar(36) NOT NULL,
  `parameter_code` varchar(50) NOT NULL,
  `parameter_value` text NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `parameter_group_uuid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sys_parameter_group`
--

CREATE TABLE `sys_parameter_group` (
  `parameter_group_uuid` varchar(36) NOT NULL,
  `parameter_group_code` varchar(50) NOT NULL,
  `parameter_group_name` varchar(100) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sys_parameter_i18n`
--

CREATE TABLE `sys_parameter_i18n` (
  `parameter_i18n_uuid` varchar(36) NOT NULL,
  `parameter_uuid` varchar(36) NOT NULL,
  `locale_uuid` varchar(36) NOT NULL,
  `parameter_value` text NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wfl_delegation`
--

CREATE TABLE `wfl_delegation` (
  `delegation_uuid` varchar(36) NOT NULL,
  `user_from` varchar(36) DEFAULT NULL,
  `user_to` varchar(36) DEFAULT NULL,
  `delegate_reason` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wfl_document_status`
--

CREATE TABLE `wfl_document_status` (
  `document_status_uuid` varchar(36) NOT NULL,
  `document_status_code` varchar(50) NOT NULL,
  `document_status_name` varchar(200) NOT NULL,
  `document_status_description` text,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wfl_document_status_i18n`
--

CREATE TABLE `wfl_document_status_i18n` (
  `document_status_i18n_uuid` varchar(36) NOT NULL,
  `locale_code` varchar(10) NOT NULL,
  `document_status_uuid` varchar(36) NOT NULL,
  `document_status_name` varchar(100) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wfl_document_transition`
--

CREATE TABLE `wfl_document_transition` (
  `document_transition_uuid` varchar(36) NOT NULL,
  `doc_status_from` varchar(36) DEFAULT NULL,
  `doc_status_to` varchar(36) DEFAULT NULL,
  `document_type_uuid` varchar(36) DEFAULT NULL,
  `role_from` varchar(50) DEFAULT NULL,
  `role_to` varchar(50) DEFAULT NULL,
  `start` tinyint(1) DEFAULT '0',
  `end` tinyint(1) DEFAULT '0',
  `raw` text,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wfl_document_type`
--

CREATE TABLE `wfl_document_type` (
  `document_type_uuid` varchar(36) NOT NULL,
  `document_type_code` varchar(50) NOT NULL,
  `document_type_name` varchar(150) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wfl_tasklist`
--

CREATE TABLE `wfl_tasklist` (
  `task_uuid` varchar(36) NOT NULL,
  `document_type_uuid` varchar(36) DEFAULT NULL,
  `document_status` varchar(36) DEFAULT NULL,
  `document_transition` varchar(36) DEFAULT NULL,
  `document_no` varchar(36) DEFAULT NULL,
  `delegation` varchar(36) DEFAULT NULL,
  `user` varchar(36) DEFAULT NULL,
  `role` varchar(36) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `sla_days` int(11) DEFAULT NULL,
  `sla_hours` int(11) DEFAULT NULL,
  `sla_minutes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wfl_tasklist_detail`
--

CREATE TABLE `wfl_tasklist_detail` (
  `task_detail_uuid` varchar(36) NOT NULL,
  `task_uuid` varchar(36) NOT NULL,
  `document_status_uuid` varchar(36) DEFAULT NULL,
  `document_transition_uuid` varchar(36) DEFAULT NULL,
  `delegation_uuid` varchar(36) DEFAULT NULL,
  `user_from` varchar(36) DEFAULT NULL,
  `role_from` varchar(36) DEFAULT NULL,
  `user_to` varchar(36) DEFAULT NULL,
  `role_to` varchar(36) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `sla_days` int(11) DEFAULT NULL,
  `sla_hours` int(11) DEFAULT NULL,
  `sla_minutes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dcm_equipment`
--
ALTER TABLE `dcm_equipment`
  ADD PRIMARY KEY (`equipment_uuid`),
  ADD KEY `mst_equipment_ibfk_1` (`series_uuid`);

--
-- Indexes for table `dcm_instance`
--
ALTER TABLE `dcm_instance`
  ADD PRIMARY KEY (`instance_uuid`),
  ADD KEY `mst_instance_ibfk_1` (`series_uuid`);

--
-- Indexes for table `dcm_patient`
--
ALTER TABLE `dcm_patient`
  ADD PRIMARY KEY (`patient_uuid`);

--
-- Indexes for table `dcm_series`
--
ALTER TABLE `dcm_series`
  ADD PRIMARY KEY (`series_uuid`),
  ADD KEY `study_uuid` (`study_uuid`);

--
-- Indexes for table `dcm_study`
--
ALTER TABLE `dcm_study`
  ADD PRIMARY KEY (`study_uuid`),
  ADD KEY `patient_uuid` (`patient_uuid`);

--
-- Indexes for table `mst_city`
--
ALTER TABLE `mst_city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province_id` (`province_id`);

--
-- Indexes for table `mst_country`
--
ALTER TABLE `mst_country`
  ADD PRIMARY KEY (`country_uuid`),
  ADD UNIQUE KEY `country_code` (`country_code`);

--
-- Indexes for table `mst_currency`
--
ALTER TABLE `mst_currency`
  ADD PRIMARY KEY (`currency_uuid`),
  ADD UNIQUE KEY `currency_code` (`currency_code`);

--
-- Indexes for table `mst_district`
--
ALTER TABLE `mst_district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `mst_equipment`
--
ALTER TABLE `mst_equipment`
  ADD PRIMARY KEY (`equipment_uuid`),
  ADD KEY `modality_uuid` (`modality_uuid`);

--
-- Indexes for table `mst_file_group`
--
ALTER TABLE `mst_file_group`
  ADD PRIMARY KEY (`file_group_uuid`);

--
-- Indexes for table `mst_file_metadata`
--
ALTER TABLE `mst_file_metadata`
  ADD PRIMARY KEY (`file_metadata_uuid`),
  ADD KEY `file_group_uuid` (`file_group_uuid`);

--
-- Indexes for table `mst_healthcare`
--
ALTER TABLE `mst_healthcare`
  ADD PRIMARY KEY (`healthcare_uuid`),
  ADD KEY `healthcare_type_uuid` (`healthcare_type_uuid`);

--
-- Indexes for table `mst_healthcare_type`
--
ALTER TABLE `mst_healthcare_type`
  ADD PRIMARY KEY (`healthcare_type_uuid`);

--
-- Indexes for table `mst_language`
--
ALTER TABLE `mst_language`
  ADD PRIMARY KEY (`language_uuid`);

--
-- Indexes for table `mst_modality`
--
ALTER TABLE `mst_modality`
  ADD PRIMARY KEY (`modality_uuid`);

--
-- Indexes for table `mst_polyclinic`
--
ALTER TABLE `mst_polyclinic`
  ADD PRIMARY KEY (`polyclinic_uuid`),
  ADD KEY `parent_uuid` (`parent_uuid`);

--
-- Indexes for table `mst_polyclinic_i18n`
--
ALTER TABLE `mst_polyclinic_i18n`
  ADD PRIMARY KEY (`polyclinic_i18n_uuid`),
  ADD KEY `polyclinic_uuid` (`polyclinic_uuid`);

--
-- Indexes for table `mst_province`
--
ALTER TABLE `mst_province`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_uuid` (`country_uuid`);

--
-- Indexes for table `mst_r_country_currency`
--
ALTER TABLE `mst_r_country_currency`
  ADD KEY `country_uuid` (`country_uuid`),
  ADD KEY `currency_uuid` (`currency_uuid`);

--
-- Indexes for table `mst_subdistrict`
--
ALTER TABLE `mst_subdistrict`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_id` (`district_id`);

--
-- Indexes for table `mst_zipcode`
--
ALTER TABLE `mst_zipcode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subdistrict_id` (`subdistrict_id`),
  ADD KEY `district_id` (`district_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `province_id` (`province_id`),
  ADD KEY `country_uuid` (`country_uuid`);

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
-- Indexes for table `rip_nurse`
--
ALTER TABLE `rip_nurse`
  ADD PRIMARY KEY (`nurse_uuid`);

--
-- Indexes for table `rip_patient`
--
ALTER TABLE `rip_patient`
  ADD PRIMARY KEY (`patient_uuid`),
  ADD UNIQUE KEY `patient_id` (`patient_id`),
  ADD KEY `parent_uuid` (`parent_uuid`);

--
-- Indexes for table `rip_patient_appointment`
--
ALTER TABLE `rip_patient_appointment`
  ADD PRIMARY KEY (`patient_appointment_uuid`);

--
-- Indexes for table `rip_physician`
--
ALTER TABLE `rip_physician`
  ADD PRIMARY KEY (`physician_uuid`),
  ADD UNIQUE KEY `physician_id` (`physician_id`);

--
-- Indexes for table `rip_radiographer`
--
ALTER TABLE `rip_radiographer`
  ADD PRIMARY KEY (`radiographer_uuid`),
  ADD UNIQUE KEY `radiographer_id` (`radiographer_id`);

--
-- Indexes for table `rip_radiology_assessment`
--
ALTER TABLE `rip_radiology_assessment`
  ADD PRIMARY KEY (`radiology_assessment_uuid`);

--
-- Indexes for table `rip_r_radiographer_healthcare`
--
ALTER TABLE `rip_r_radiographer_healthcare`
  ADD KEY `radiographer_uuid` (`radiographer_uuid`);

--
-- Indexes for table `sec_function`
--
ALTER TABLE `sec_function`
  ADD PRIMARY KEY (`function_uuid`),
  ADD KEY `menu_uuid` (`menu_uuid`),
  ADD KEY `role_uuid` (`role_uuid`);

--
-- Indexes for table `sec_menu`
--
ALTER TABLE `sec_menu`
  ADD PRIMARY KEY (`menu_uuid`),
  ADD KEY `parent_uuid` (`parent_uuid`);

--
-- Indexes for table `sec_menu_i18n`
--
ALTER TABLE `sec_menu_i18n`
  ADD PRIMARY KEY (`menu_i18n_uuid`),
  ADD KEY `menu_uuid` (`menu_uuid`);

--
-- Indexes for table `sec_role`
--
ALTER TABLE `sec_role`
  ADD PRIMARY KEY (`role_uuid`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `sec_r_user_nurse`
--
ALTER TABLE `sec_r_user_nurse`
  ADD KEY `user_uuid` (`user_uuid`);

--
-- Indexes for table `sec_r_user_patient`
--
ALTER TABLE `sec_r_user_patient`
  ADD KEY `user_uuid` (`user_uuid`);

--
-- Indexes for table `sec_r_user_physician`
--
ALTER TABLE `sec_r_user_physician`
  ADD KEY `user_uuid` (`user_uuid`);

--
-- Indexes for table `sec_r_user_radiographer`
--
ALTER TABLE `sec_r_user_radiographer`
  ADD KEY `user_uuid` (`user_uuid`);

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
-- Indexes for table `sys_locale`
--
ALTER TABLE `sys_locale`
  ADD PRIMARY KEY (`locale_uuid`);

--
-- Indexes for table `sys_parameter`
--
ALTER TABLE `sys_parameter`
  ADD PRIMARY KEY (`parameter_uuid`),
  ADD KEY `parameter_group_uuid` (`parameter_group_uuid`);

--
-- Indexes for table `sys_parameter_group`
--
ALTER TABLE `sys_parameter_group`
  ADD PRIMARY KEY (`parameter_group_uuid`);

--
-- Indexes for table `sys_parameter_i18n`
--
ALTER TABLE `sys_parameter_i18n`
  ADD PRIMARY KEY (`parameter_i18n_uuid`),
  ADD KEY `parameter_uuid` (`parameter_uuid`),
  ADD KEY `locale_uuid` (`locale_uuid`);

--
-- Indexes for table `wfl_delegation`
--
ALTER TABLE `wfl_delegation`
  ADD PRIMARY KEY (`delegation_uuid`);

--
-- Indexes for table `wfl_document_status`
--
ALTER TABLE `wfl_document_status`
  ADD PRIMARY KEY (`document_status_uuid`);

--
-- Indexes for table `wfl_document_status_i18n`
--
ALTER TABLE `wfl_document_status_i18n`
  ADD PRIMARY KEY (`document_status_i18n_uuid`),
  ADD KEY `document_status_uuid` (`document_status_uuid`);

--
-- Indexes for table `wfl_document_transition`
--
ALTER TABLE `wfl_document_transition`
  ADD PRIMARY KEY (`document_transition_uuid`),
  ADD KEY `doc_status_from` (`doc_status_from`),
  ADD KEY `doc_status_to` (`doc_status_to`),
  ADD KEY `document_type_uuid` (`document_type_uuid`);

--
-- Indexes for table `wfl_document_type`
--
ALTER TABLE `wfl_document_type`
  ADD PRIMARY KEY (`document_type_uuid`);

--
-- Indexes for table `wfl_tasklist`
--
ALTER TABLE `wfl_tasklist`
  ADD PRIMARY KEY (`task_uuid`),
  ADD KEY `document_type_uuid` (`document_type_uuid`),
  ADD KEY `document_status` (`document_status`),
  ADD KEY `document_transition` (`document_transition`),
  ADD KEY `delegation` (`delegation`);

--
-- Indexes for table `wfl_tasklist_detail`
--
ALTER TABLE `wfl_tasklist_detail`
  ADD PRIMARY KEY (`task_detail_uuid`),
  ADD KEY `task_uuid` (`task_uuid`),
  ADD KEY `document_status_uuid` (`document_status_uuid`),
  ADD KEY `document_transition_uuid` (`document_transition_uuid`),
  ADD KEY `delegation_uuid` (`delegation_uuid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dcm_equipment`
--
ALTER TABLE `dcm_equipment`
  ADD CONSTRAINT `dcm_equipment_ibfk_1` FOREIGN KEY (`series_uuid`) REFERENCES `dcm_series` (`series_uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dcm_instance`
--
ALTER TABLE `dcm_instance`
  ADD CONSTRAINT `dcm_instance_ibfk_1` FOREIGN KEY (`series_uuid`) REFERENCES `dcm_series` (`series_uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dcm_series`
--
ALTER TABLE `dcm_series`
  ADD CONSTRAINT `dcm_series_ibfk_1` FOREIGN KEY (`study_uuid`) REFERENCES `dcm_study` (`study_uuid`);

--
-- Constraints for table `dcm_study`
--
ALTER TABLE `dcm_study`
  ADD CONSTRAINT `dcm_study_ibfk_1` FOREIGN KEY (`patient_uuid`) REFERENCES `dcm_patient` (`patient_uuid`);

--
-- Constraints for table `mst_city`
--
ALTER TABLE `mst_city`
  ADD CONSTRAINT `mst_city_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `mst_province` (`id`);

--
-- Constraints for table `mst_district`
--
ALTER TABLE `mst_district`
  ADD CONSTRAINT `mst_district_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `mst_city` (`id`);

--
-- Constraints for table `mst_equipment`
--
ALTER TABLE `mst_equipment`
  ADD CONSTRAINT `mst_equipment_ibfk_1` FOREIGN KEY (`modality_uuid`) REFERENCES `mst_modality` (`modality_uuid`);

--
-- Constraints for table `mst_file_metadata`
--
ALTER TABLE `mst_file_metadata`
  ADD CONSTRAINT `mst_file_metadata_ibfk_1` FOREIGN KEY (`file_group_uuid`) REFERENCES `mst_file_group` (`file_group_uuid`);

--
-- Constraints for table `mst_healthcare`
--
ALTER TABLE `mst_healthcare`
  ADD CONSTRAINT `mst_healthcare_ibfk_1` FOREIGN KEY (`healthcare_type_uuid`) REFERENCES `mst_healthcare_type` (`healthcare_type_uuid`);

--
-- Constraints for table `mst_polyclinic`
--
ALTER TABLE `mst_polyclinic`
  ADD CONSTRAINT `mst_polyclinic_ibfk_1` FOREIGN KEY (`parent_uuid`) REFERENCES `mst_polyclinic` (`polyclinic_uuid`);

--
-- Constraints for table `mst_polyclinic_i18n`
--
ALTER TABLE `mst_polyclinic_i18n`
  ADD CONSTRAINT `mst_polyclinic_i18n_ibfk_1` FOREIGN KEY (`polyclinic_uuid`) REFERENCES `mst_polyclinic` (`polyclinic_uuid`);

--
-- Constraints for table `mst_province`
--
ALTER TABLE `mst_province`
  ADD CONSTRAINT `mst_province_ibfk_1` FOREIGN KEY (`country_uuid`) REFERENCES `mst_country` (`country_uuid`);

--
-- Constraints for table `mst_r_country_currency`
--
ALTER TABLE `mst_r_country_currency`
  ADD CONSTRAINT `mst_r_country_currency_ibfk_1` FOREIGN KEY (`country_uuid`) REFERENCES `mst_country` (`country_uuid`),
  ADD CONSTRAINT `mst_r_country_currency_ibfk_2` FOREIGN KEY (`currency_uuid`) REFERENCES `mst_currency` (`currency_uuid`);

--
-- Constraints for table `mst_subdistrict`
--
ALTER TABLE `mst_subdistrict`
  ADD CONSTRAINT `mst_subdistrict_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `mst_district` (`id`);

--
-- Constraints for table `mst_zipcode`
--
ALTER TABLE `mst_zipcode`
  ADD CONSTRAINT `mst_zipcode_ibfk_1` FOREIGN KEY (`subdistrict_id`) REFERENCES `mst_subdistrict` (`id`),
  ADD CONSTRAINT `mst_zipcode_ibfk_2` FOREIGN KEY (`district_id`) REFERENCES `mst_district` (`id`),
  ADD CONSTRAINT `mst_zipcode_ibfk_3` FOREIGN KEY (`city_id`) REFERENCES `mst_city` (`id`),
  ADD CONSTRAINT `mst_zipcode_ibfk_4` FOREIGN KEY (`province_id`) REFERENCES `mst_province` (`id`),
  ADD CONSTRAINT `mst_zipcode_ibfk_5` FOREIGN KEY (`country_uuid`) REFERENCES `mst_country` (`country_uuid`);

--
-- Constraints for table `rip_patient`
--
ALTER TABLE `rip_patient`
  ADD CONSTRAINT `rip_patient_ibfk_1` FOREIGN KEY (`parent_uuid`) REFERENCES `rip_patient` (`patient_uuid`);

--
-- Constraints for table `rip_r_radiographer_healthcare`
--
ALTER TABLE `rip_r_radiographer_healthcare`
  ADD CONSTRAINT `rip_r_radiographer_healthcare_ibfk_1` FOREIGN KEY (`radiographer_uuid`) REFERENCES `rip_radiographer` (`radiographer_uuid`);

--
-- Constraints for table `sec_function`
--
ALTER TABLE `sec_function`
  ADD CONSTRAINT `sec_function_ibfk_1` FOREIGN KEY (`menu_uuid`) REFERENCES `sec_menu` (`menu_uuid`),
  ADD CONSTRAINT `sec_function_ibfk_2` FOREIGN KEY (`role_uuid`) REFERENCES `sec_role` (`role_uuid`);

--
-- Constraints for table `sec_menu`
--
ALTER TABLE `sec_menu`
  ADD CONSTRAINT `sec_menu_ibfk_1` FOREIGN KEY (`parent_uuid`) REFERENCES `sec_menu` (`menu_uuid`);

--
-- Constraints for table `sec_menu_i18n`
--
ALTER TABLE `sec_menu_i18n`
  ADD CONSTRAINT `sec_menu_i18n_ibfk_1` FOREIGN KEY (`menu_uuid`) REFERENCES `sec_menu` (`menu_uuid`);

--
-- Constraints for table `sec_r_user_nurse`
--
ALTER TABLE `sec_r_user_nurse`
  ADD CONSTRAINT `sec_r_user_nurse_ibfk_1` FOREIGN KEY (`user_uuid`) REFERENCES `sec_user` (`user_uuid`);

--
-- Constraints for table `sec_r_user_patient`
--
ALTER TABLE `sec_r_user_patient`
  ADD CONSTRAINT `sec_r_user_patient_ibfk_1` FOREIGN KEY (`user_uuid`) REFERENCES `sec_user` (`user_uuid`);

--
-- Constraints for table `sec_r_user_physician`
--
ALTER TABLE `sec_r_user_physician`
  ADD CONSTRAINT `sec_r_user_physician_ibfk_1` FOREIGN KEY (`user_uuid`) REFERENCES `sec_user` (`user_uuid`);

--
-- Constraints for table `sec_r_user_radiographer`
--
ALTER TABLE `sec_r_user_radiographer`
  ADD CONSTRAINT `sec_r_user_radiographer_ibfk_1` FOREIGN KEY (`user_uuid`) REFERENCES `sec_user` (`user_uuid`);

--
-- Constraints for table `sec_r_user_role`
--
ALTER TABLE `sec_r_user_role`
  ADD CONSTRAINT `sec_r_user_role_ibfk_1` FOREIGN KEY (`user_uuid`) REFERENCES `sec_user` (`user_uuid`),
  ADD CONSTRAINT `sec_r_user_role_ibfk_2` FOREIGN KEY (`role_uuid`) REFERENCES `sec_role` (`role_uuid`);

--
-- Constraints for table `sys_parameter`
--
ALTER TABLE `sys_parameter`
  ADD CONSTRAINT `sys_parameter_ibfk_1` FOREIGN KEY (`parameter_group_uuid`) REFERENCES `sys_parameter_group` (`parameter_group_uuid`);

--
-- Constraints for table `sys_parameter_i18n`
--
ALTER TABLE `sys_parameter_i18n`
  ADD CONSTRAINT `sys_parameter_i18n_ibfk_1` FOREIGN KEY (`parameter_uuid`) REFERENCES `sys_parameter` (`parameter_uuid`),
  ADD CONSTRAINT `sys_parameter_i18n_ibfk_2` FOREIGN KEY (`locale_uuid`) REFERENCES `sys_locale` (`locale_uuid`);

--
-- Constraints for table `wfl_document_status_i18n`
--
ALTER TABLE `wfl_document_status_i18n`
  ADD CONSTRAINT `wfl_document_status_i18n_ibfk_1` FOREIGN KEY (`document_status_uuid`) REFERENCES `wfl_document_status` (`document_status_uuid`);

--
-- Constraints for table `wfl_document_transition`
--
ALTER TABLE `wfl_document_transition`
  ADD CONSTRAINT `wfl_document_transition_ibfk_1` FOREIGN KEY (`doc_status_from`) REFERENCES `wfl_document_status` (`document_status_uuid`),
  ADD CONSTRAINT `wfl_document_transition_ibfk_2` FOREIGN KEY (`doc_status_to`) REFERENCES `wfl_document_status` (`document_status_uuid`),
  ADD CONSTRAINT `wfl_document_transition_ibfk_3` FOREIGN KEY (`document_type_uuid`) REFERENCES `wfl_document_type` (`document_type_uuid`);

--
-- Constraints for table `wfl_tasklist`
--
ALTER TABLE `wfl_tasklist`
  ADD CONSTRAINT `wfl_tasklist_ibfk_1` FOREIGN KEY (`document_type_uuid`) REFERENCES `wfl_document_type` (`document_type_uuid`),
  ADD CONSTRAINT `wfl_tasklist_ibfk_2` FOREIGN KEY (`document_status`) REFERENCES `wfl_document_status` (`document_status_uuid`),
  ADD CONSTRAINT `wfl_tasklist_ibfk_3` FOREIGN KEY (`document_transition`) REFERENCES `wfl_document_transition` (`document_transition_uuid`),
  ADD CONSTRAINT `wfl_tasklist_ibfk_4` FOREIGN KEY (`delegation`) REFERENCES `wfl_delegation` (`delegation_uuid`);

--
-- Constraints for table `wfl_tasklist_detail`
--
ALTER TABLE `wfl_tasklist_detail`
  ADD CONSTRAINT `wfl_tasklist_detail_ibfk_1` FOREIGN KEY (`task_uuid`) REFERENCES `wfl_tasklist` (`task_uuid`),
  ADD CONSTRAINT `wfl_tasklist_detail_ibfk_3` FOREIGN KEY (`document_status_uuid`) REFERENCES `wfl_document_status` (`document_status_uuid`),
  ADD CONSTRAINT `wfl_tasklist_detail_ibfk_4` FOREIGN KEY (`document_transition_uuid`) REFERENCES `wfl_document_transition` (`document_transition_uuid`),
  ADD CONSTRAINT `wfl_tasklist_detail_ibfk_5` FOREIGN KEY (`delegation_uuid`) REFERENCES `wfl_delegation` (`delegation_uuid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
