-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2018 at 08:59 AM
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

--
-- Dumping data for table `mst_country`
--

INSERT INTO `mst_country` (`country_uuid`, `country_code`, `country_name`, `capital`, `phone_prefix`, `flag`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('010baa8f-f973-43ec-9a11-b65eee917484', 'CYM', 'Cayman Islands', 'George Town', NULL, 'ky', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('025aac2d-5a5c-41b1-840e-645de7b5ceab', 'SJM', 'Svalbard and Jan Mayen', 'Longyearbyen', NULL, 'sj', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('02e8516e-c75f-4dd2-a6cb-ed1352edffc2', 'BMU', 'Bermuda', 'Hamilton', NULL, 'bm', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('040a6d89-51fc-4ce1-9cde-08f0ef406b03', 'THA', 'Thailand', 'Bangkok', NULL, 'th', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('040ca195-8943-4c6e-a06f-def483964b79', 'MHL', 'Marshall Islands', 'Majuro', NULL, 'mh', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0490d930-b7b6-41eb-8e66-9b6db5e4d095', 'YEM', 'Yemen', 'Sanaa', NULL, 'ye', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('04bcf5d7-978d-4400-bde5-04c3ab8eae8b', 'TCD', 'Chad', 'N\'Djamena', NULL, 'td', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('04bdd768-af74-4a2a-965c-d410b8e924b7', 'ZMB', 'Zambia', 'Lusaka', NULL, 'zm', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('050a80c4-5d2f-4ac4-9d3a-cf82b7757f58', 'MMR', 'Myanmar', 'Nay Pyi Taw', NULL, 'mm', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('05c0c26d-a3c6-4ccb-a7f4-5d78bd952051', 'NAM', 'Namibia', 'Windhoek', NULL, 'na', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('067bf653-74c9-4987-911a-13077e8b8716', 'STP', 'Sao Tome and Principe', 'Sao Tome', NULL, 'st', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0823599a-05ce-4047-a93b-9453089b5f97', 'MRT', 'Mauritania', 'Nouakchott', NULL, 'mr', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('09759c08-6263-4f00-9d3b-95f961274b1d', 'PRT', 'Portugal', 'Lisbon', NULL, 'pt', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0a11a62f-0886-45fa-8e81-0c3b32fcff31', 'SUR', 'Suriname', 'Paramaribo', NULL, 'sr', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0a8fb47b-4572-419e-b72c-d73ca43cd58f', 'ATF', 'French Southern Territories', 'Port-aux-Francais', NULL, 'tf', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0af05b70-e6e9-4611-b8be-6cec75979464', 'BOL', 'Bolivia', 'Sucre', NULL, 'bo', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0b3789a5-36d9-4b51-bc7f-17f7dcd07326', 'SYR', 'Syria', 'Damascus', NULL, 'sy', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0bfd2f3d-a9b7-4d91-9db2-4f151c793a5a', 'JPN', 'Japan', 'Tokyo', NULL, 'jp', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0c945ab9-0afe-4f59-abac-b874f5311edc', 'MKD', 'Macedonia', 'Skopje', NULL, 'mk', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0de02195-5882-4e39-b274-bb3b9e531d4b', 'GIB', 'Gibraltar', 'Gibraltar', NULL, 'gi', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0e01f90b-cc81-49b4-a03a-b86221eb40c6', 'ISL', 'Iceland', 'Reykjavik', NULL, 'is', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0f11d598-d43f-4240-8ff0-5055e4fc2217', 'MSR', 'Montserrat', 'Plymouth', NULL, 'ms', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('12639209-0e38-4ff4-b695-728f80308b36', 'MLI', 'Mali', 'Bamako', NULL, 'ml', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('14146646-7347-4119-91f6-2ee5dd8e19b8', 'MEX', 'Mexico', 'Mexico City', NULL, 'mx', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('143663cd-a645-46c1-afd7-df5ea1de0ff9', 'REU', 'Reunion', 'Saint-Denis', NULL, 're', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('15226976-8474-433a-ae53-104fd84dc791', 'TWN', 'Taiwan', 'Taipei', NULL, 'tw', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('16646b91-51fe-4a25-9fd4-1482f129aac7', 'MWI', 'Malawi', 'Lilongwe', NULL, 'mw', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('16fc24b5-dc35-4953-831b-aa64b7713068', 'VCT', 'Saint Vincent and the Grenadines', 'Kingstown', NULL, 'vc', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1786aecc-549a-4649-aae2-7a4ef299dd8e', 'ALA', 'Aland Islands', 'Mariehamn', NULL, 'ax', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('183e11fd-dc76-493b-bc45-a6e3ae6d469c', 'AFG', 'Afghanistan', 'Kabul', NULL, 'af', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('18858705-cd87-4ccc-937b-d9a1be7b312c', 'BHR', 'Bahrain', 'Manama', NULL, 'bh', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1a24f98b-aebf-41fc-aa3a-6a73e117c625', 'CHL', 'Chile', 'Santiago', NULL, 'cl', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1ab60de5-deb3-4d7a-b803-ae5f1f4c69ff', 'MAF', 'Saint Martin', 'Marigot', NULL, 'mf', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1ab72323-cbf2-4bc7-97b9-4e8be3c0cae9', 'RUS', 'Russia', 'Moscow', NULL, 'ru', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1b8eef25-09b6-47ee-9ee4-a0ac2e8baae0', 'FJI', 'Fiji', 'Suva', NULL, 'fj', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1bbd44a6-0e33-4f01-bd6e-a626e4bf5a10', 'PAN', 'Panama', 'Panama City', NULL, 'pa', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1d2373b8-4138-459c-ba88-673210b08c5d', 'VUT', 'Vanuatu', 'Port Vila', NULL, 'vu', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('20790050-3e30-4bf6-930b-f8bdfa1af9d4', 'LVA', 'Latvia', 'Riga', NULL, 'lv', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('250251bd-f2e0-4b55-8e65-72d7ba8c1c6c', 'BDI', 'Burundi', 'Bujumbura', NULL, 'bi', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('252ac5ff-a624-4edd-9349-f049df30ffbe', 'JEY', 'Jersey', 'Saint Helier', NULL, 'je', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('25b46fc9-180b-4191-89dd-d2de6dfc46b5', 'SCG', 'Serbia and Montenegro', 'Belgrade', NULL, 'cs', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('25ca173e-fd72-4843-ac80-ce02a54471be', 'SYC', 'Seychelles', 'Victoria', NULL, 'sc', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('26487413-4c22-4295-bfd2-13773fcc4b1e', 'BRN', 'Brunei', 'Bandar Seri Begawan', NULL, 'bn', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2704b793-0d4b-49aa-a296-d41abaeaaa6f', 'ABW', 'Aruba', 'Oranjestad', NULL, 'aw', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2afc5569-9495-47a7-8b85-b41705008b26', 'MTQ', 'Martinique', 'Fort-de-France', NULL, 'mq', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2c3bde44-0ca7-4c92-bea9-4c629ab951f6', 'JOR', 'Jordan', 'Amman', NULL, 'jo', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2cb257ad-9b0e-4065-a66b-2a9f3adb3c5f', 'SSD', 'South Sudan', 'Juba', NULL, 'ss', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2db98553-d132-4590-ae67-6db608e2c2f4', 'BGR', 'Bulgaria', 'Sofia', NULL, 'bg', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2e304585-8ac2-400a-b4f3-6fdf4930b37f', 'COK', 'Cook Islands', 'Avarua', NULL, 'ck', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2e7b0a55-da57-43ff-9023-72473d13b414', 'IMN', 'Isle of Man', 'Douglas', NULL, 'im', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('3014cfae-5a46-498e-bcc8-d14c4abd5398', 'LIE', 'Liechtenstein', 'Vaduz', NULL, 'li', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('31899795-fe12-4b33-aafd-41ed8d3c5cac', 'AUT', 'Austria', 'Vienna', NULL, 'at', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('338f0ed6-5493-428c-9204-9c5a725fb618', 'POL', 'Poland', 'Warsaw', NULL, 'pl', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('33bdd32f-3a1e-4c53-b638-6e37bd756d6e', 'BRB', 'Barbados', 'Bridgetown', NULL, 'bb', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('34ee3669-73df-4d67-bf57-ba1b04ada0f7', 'VNM', 'Vietnam', 'Hanoi', NULL, 'vn', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('36d675f7-228a-4da8-b419-6257f977f7c6', 'UGA', 'Uganda', 'Kampala', NULL, 'ug', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('39e33244-ceda-4a34-89b5-07bc300c7303', 'LBR', 'Liberia', 'Monrovia', NULL, 'lr', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('3ba4da18-3d4d-43c8-9e1f-853a1515bf54', 'MLT', 'Malta', 'Valletta', NULL, 'mt', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('3ee53a34-b63f-47c1-a735-97696721d12f', 'FRO', 'Faroe Islands', 'Torshavn', NULL, 'fo', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('40fc2011-0701-4ee0-954b-5c856c3c9561', 'BES', 'Bonaire, Saint Eustatius and Saba ', '', NULL, 'bq', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('410e9dd3-5aac-4998-9289-6459f1402a07', 'ERI', 'Eritrea', 'Asmara', NULL, 'er', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('42bb7332-fab9-4fc8-bd6d-5dd15eb4d1cb', 'GUF', 'French Guiana', 'Cayenne', NULL, 'gf', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('42c56507-feff-493c-a87c-2cbf28653fca', 'SMR', 'San Marino', 'San Marino', NULL, 'sm', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('42d0a6e3-9091-4642-93d1-84b6a5576036', 'MCO', 'Monaco', 'Monaco', NULL, 'mc', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4474beed-52ee-42c0-81c1-1bb75e297a88', 'DJI', 'Djibouti', 'Djibouti', NULL, 'dj', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('45390fb0-47bc-41f5-a9b1-c3806104b4e4', 'CUB', 'Cuba', 'Havana', NULL, 'cu', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('455c5650-dece-4e48-a50e-bd9be4a3fc78', 'MNG', 'Mongolia', 'Ulan Bator', NULL, 'mn', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4562becb-57de-49f9-8fc1-ec24195bfc81', 'SOM', 'Somalia', 'Mogadishu', NULL, 'so', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('48bc0fe4-f87a-4c11-b84b-8ac844ff1e52', 'ARM', 'Armenia', 'Yerevan', NULL, 'am', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('48d3eaaf-cb14-4266-94e8-bc500dd176b7', 'HRV', 'Croatia', 'Zagreb', NULL, 'hr', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('49bdbc35-4502-4db8-8d05-65fa7594c56b', 'SLV', 'El Salvador', 'San Salvador', NULL, 'sv', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('49d568e6-19e8-412b-b2e1-0d59ab204977', 'BLR', 'Belarus', 'Minsk', NULL, 'by', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4afd053b-6f5e-4361-bf19-f2a9eba81196', 'GEO', 'Georgia', 'Tbilisi', NULL, 'ge', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4b67ac60-f3c8-49f1-a311-b63134e5f471', 'ASM', 'American Samoa', 'Pago Pago', NULL, 'as', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4be3145e-86d5-465a-aec6-f00f46562c72', 'KGZ', 'Kyrgyzstan', 'Bishkek', NULL, 'kg', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4d969701-5a2c-44d9-9fff-bd61bd9a4720', 'SWZ', 'Swaziland', 'Mbabane', NULL, 'sz', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4f54e9fb-68fa-4508-a66b-f55024397aab', 'DEU', 'Germany', 'Berlin', NULL, 'de', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('509b3873-aed4-46e2-96bc-70809f8fa6f7', 'ETH', 'Ethiopia', 'Addis Ababa', NULL, 'et', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('52479b0b-002d-4864-9f3e-44d057b095fd', 'IOT', 'British Indian Ocean Territory', 'Diego Garcia', NULL, 'io', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('55874952-11f5-4677-aa79-76b8c0fa2531', 'BEN', 'Benin', 'Porto-Novo', NULL, 'bj', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('566fe657-5180-4057-ab23-476b6db9d7b8', 'TGO', 'Togo', 'Lome', NULL, 'tg', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5717a2a9-7d53-447a-9da0-c331c2a1755f', 'GAB', 'Gabon', 'Libreville', NULL, 'ga', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('57627aea-4193-44e5-a5cd-a28cc9d5d099', 'SDN', 'Sudan', 'Khartoum', NULL, 'sd', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('57790d27-1380-4c00-93aa-e4398e47e8a8', 'PRK', 'North Korea', 'Pyongyang', NULL, 'kp', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('57e21285-216a-49f0-b60b-cd94f185d740', 'ATG', 'Antigua and Barbuda', 'St. John\'s', NULL, 'ag', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('58432a38-fe8c-4242-8311-49e2feda70c7', 'MDA', 'Moldova', 'Chisinau', NULL, 'md', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('58e558ed-f535-46d2-b1bf-d3e752f51306', 'TUR', 'Turkey', 'Ankara', NULL, 'tr', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5937bfea-4ed2-41a4-a298-8fa8f15d085f', 'NIC', 'Nicaragua', 'Managua', NULL, 'ni', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('59908e16-db71-4b08-b11f-461dfc890b57', 'ZAF', 'South Africa', 'Pretoria', NULL, 'za', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('59b2348f-f062-4cc5-a9be-271f13b1fae3', 'GRC', 'Greece', 'Athens', NULL, 'gr', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5ab9b5d5-c63a-4bd8-9b88-6aa8db5e1477', 'NGA', 'Nigeria', 'Abuja', NULL, 'ng', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5b2e4f4f-4e14-4315-83e7-cf6d3b186e14', 'GHA', 'Ghana', 'Accra', NULL, 'gh', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5bc4e785-7c32-4888-b517-98b8e82af015', 'BLZ', 'Belize', 'Belmopan', NULL, 'bz', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5be22e47-1e03-4508-84f1-8ee20b46f959', 'PLW', 'Palau', 'Melekeok', NULL, 'pw', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5cf5f2f7-db09-43f9-b494-8974288c014c', 'TTO', 'Trinidad and Tobago', 'Port of Spain', NULL, 'tt', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5d74bab0-e483-4e57-be4a-e3342ba341de', 'KNA', 'Saint Kitts and Nevis', 'Basseterre', NULL, 'kn', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5ecfb4cd-664f-412e-87e3-f488d0bad482', 'CCK', 'Cocos Islands', 'West Island', NULL, 'cc', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5f21c5d8-eef8-42af-86a8-76e89ebabf96', 'CPV', 'Cape Verde', 'Praia', NULL, 'cv', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5f639fc6-b7c8-45cf-8fb1-cc4b8182dbc2', 'SLB', 'Solomon Islands', 'Honiara', NULL, 'sb', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6114daf7-b7c2-4132-8ab6-7b07145a92bc', 'TCA', 'Turks and Caicos Islands', 'Cockburn Town', NULL, 'tc', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('61dac06b-6e77-4749-8700-c3091a32391a', 'NPL', 'Nepal', 'Kathmandu', NULL, 'np', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('622ff085-5566-441e-9906-8674b4ca120f', 'GGY', 'Guernsey', 'St Peter Port', NULL, 'gg', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('63a55713-b6f1-423d-8ac3-d2a1927ef9fe', 'HUN', 'Hungary', 'Budapest', NULL, 'hu', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('63ddcda7-0f7c-46b7-992d-3f434fade7f8', 'QAT', 'Qatar', 'Doha', NULL, 'qa', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('63df775f-29c7-4642-93ad-1fba5b270abc', 'NLD', 'Netherlands', 'Amsterdam', NULL, 'nl', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('646338d6-4c58-451d-8864-205707460ae5', 'GTM', 'Guatemala', 'Guatemala City', NULL, 'gt', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('65e72c42-0247-4940-8262-6db2f8124a26', 'BVT', 'Bouvet Island', '', NULL, 'bv', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6a0eeeab-9ad8-4f3f-8692-b0495eaf1cd3', 'GNB', 'Guinea-Bissau', 'Bissau', NULL, 'gw', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6a5a4edf-a10b-4a85-a8bb-99d3b569b12a', 'SAU', 'Saudi Arabia', 'Riyadh', NULL, 'sa', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6af0d0d2-346e-4e50-9e4d-c9921ad580e0', 'BFA', 'Burkina Faso', 'Ouagadougou', NULL, 'bf', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6b691214-da90-4ba1-a8ba-e20f41656400', 'ITA', 'Italy', 'Rome', NULL, 'it', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6ef06a69-f813-4104-b763-90e2f64ef352', 'GNQ', 'Equatorial Guinea', 'Malabo', NULL, 'gq', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6f7467f4-27db-47d7-a5bb-85e6d5fdd212', 'PCN', 'Pitcairn', 'Adamstown', NULL, 'pn', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('70ba35f3-2fa8-4b3a-b0fe-5ff5b733ede5', 'SWE', 'Sweden', 'Stockholm', NULL, 'se', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('71895443-796f-4dd2-9611-05aef07395bd', 'MNP', 'Northern Mariana Islands', 'Saipan', NULL, 'mp', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('73cebb35-c29e-465f-ad88-f1ed31168f2f', 'KAZ', 'Kazakhstan', 'Astana', NULL, 'kz', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('741ba998-3ad7-4c2e-93d3-48ea94e296ed', 'BEL', 'Belgium', 'Brussels', NULL, 'be', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('75f6d1dc-5818-464d-aa30-eb722b87f9e6', 'CXR', 'Christmas Island', 'Flying Fish Cove', NULL, 'cx', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('76400944-7a48-449e-ac89-ad62a401c2af', 'CAN', 'Canada', 'Ottawa', NULL, 'ca', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('76c5fafc-b8b9-4f1a-9d5c-51e03ed07643', 'MYT', 'Mayotte', 'Mamoudzou', NULL, 'yt', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7877dbd1-7db1-4835-b05e-4ffcd29f932c', 'SGS', 'South Georgia and the South Sandwich Islands', 'Grytviken', NULL, 'gs', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('79546002-4bc0-4c6f-a191-2a6eb2aacfac', 'VIR', 'U.S. Virgin Islands', 'Charlotte Amalie', NULL, 'vi', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7a702207-008d-4b35-8fba-eb6cff6c3e8f', 'AND', 'Andorra', 'Andorra la Vella', NULL, 'ad', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7b3c4f0b-2b02-4076-b01d-c4116c33e6dc', 'CHN', 'China', 'Beijing', NULL, 'cn', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7b81430d-7d4f-4d27-a878-7ddcaa3bb9b4', 'SEN', 'Senegal', 'Dakar', NULL, 'sn', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7bcf640f-479e-4fc5-ac22-67cdba4c951a', 'BTN', 'Bhutan', 'Thimphu', NULL, 'bt', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7c3402cd-7404-4499-9a00-aac230d08529', 'ISR', 'Israel', 'Jerusalem', NULL, 'il', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7c4fb155-8e36-454e-8a89-d5aa5b066486', 'IRN', 'Iran', 'Tehran', NULL, 'ir', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7c906a1a-20a8-48a7-aabf-498a8ee53dee', 'SLE', 'Sierra Leone', 'Freetown', NULL, 'sl', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7d9cfb04-d587-4634-a6f1-516f36f660cb', 'ARE', 'United Arab Emirates', 'Abu Dhabi', NULL, 'ae', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7e31e3a6-00cd-40fc-9c6e-847f51b99861', 'EST', 'Estonia', 'Tallinn', NULL, 'ee', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7f20b7cc-a1d2-410f-9cd3-8f1c035ad096', 'LSO', 'Lesotho', 'Maseru', NULL, 'ls', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7ff38c53-f260-4271-86ff-7e5c6bb86ed1', 'PNG', 'Papua New Guinea', 'Port Moresby', NULL, 'pg', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('807307c0-0ff3-4fb0-aacf-7daa53bc609a', 'UKR', 'Ukraine', 'Kyiv', NULL, 'ua', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('81a7b7f1-91b4-474f-af64-cf203a49d3ee', 'TJK', 'Tajikistan', 'Dushanbe', NULL, 'tj', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('83b80c5e-0859-4253-a56f-4806525b9bac', 'BHS', 'Bahamas', 'Nassau', NULL, 'bs', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('84d0e3f2-3461-4a39-9c2e-e63e5f6dd0f5', 'COD', 'Democratic Republic of the Congo', 'Kinshasa', NULL, 'cd', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('87078509-c8f3-4d96-865b-e371ac477d3f', 'PHL', 'Philippines', 'Manila', NULL, 'ph', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('871fe7cb-8faf-46db-a06e-9600516335ec', 'URY', 'Uruguay', 'Montevideo', NULL, 'uy', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('88933f01-f7d2-4ba2-a301-5c94ea2e0247', 'GUM', 'Guam', 'Hagatna', NULL, 'gu', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('88f5c1dc-51d3-43f3-9111-2a0bca1fb241', 'CUW', 'Curacao', ' Willemstad', NULL, 'cw', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('8a6515ce-40af-4e02-9baa-954ef7af2e7a', 'PRY', 'Paraguay', 'Asuncion', NULL, 'py', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('8f7b879b-4f9f-4fc7-a403-6d56cbf4ee70', 'VGB', 'British Virgin Islands', 'Road Town', NULL, 'vg', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('8f7f6bfe-a475-43aa-b121-3b56f4b80acd', 'MNE', 'Montenegro', 'Podgorica', NULL, 'me', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('8f95c42f-9698-44fd-ad65-ebb64ea075c1', 'BIH', 'Bosnia and Herzegovina', 'Sarajevo', NULL, 'ba', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('918e9067-4d7b-48e3-bf94-dcc4e9f4b119', 'COM', 'Comoros', 'Moroni', NULL, 'km', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('92916cc9-502b-459a-b515-6eca00b57743', 'KIR', 'Kiribati', 'Tarawa', NULL, 'ki', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('92ae615a-2fa6-4cdb-9681-dcf07df054d9', 'NIU', 'Niue', 'Alofi', NULL, 'nu', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('93d76704-32dd-4992-930d-034a04b00c2b', 'HKG', 'Hong Kong', 'Hong Kong', NULL, 'hk', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('93dcfda9-b0aa-4c64-94f8-272c856c92b2', 'FSM', 'Micronesia', 'Palikir', NULL, 'fm', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('946503dd-233b-45da-b714-e386827eba8d', 'PRI', 'Puerto Rico', 'San Juan', NULL, 'pr', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('98c51600-3499-412e-bf43-21f15fc4de32', 'PAK', 'Pakistan', 'Islamabad', NULL, 'pk', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('99ee0204-0462-4007-8ec4-ad8aedc6fc0a', 'KEN', 'Kenya', 'Nairobi', NULL, 'ke', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('9b3b30ee-d8d2-4e52-9d7e-451082b39318', 'LTU', 'Lithuania', 'Vilnius', NULL, 'lt', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('9b80d010-c435-41db-90b9-c67e06b65276', 'SPM', 'Saint Pierre and Miquelon', 'Saint-Pierre', NULL, 'pm', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('9bc99490-4cda-426f-a9e7-14dd53769634', 'BLM', 'Saint Barthelemy', 'Gustavia', NULL, 'bl', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('9f436fb8-d720-4346-b809-316d881d7928', 'GBR', 'United Kingdom', 'London', NULL, 'gb', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('9f58ae68-e47c-42af-b64c-049a46ac5195', 'AUS', 'Australia', 'Canberra', NULL, 'au', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a0bae906-de4f-4a42-93a1-37b356347749', 'DOM', 'Dominican Republic', 'Santo Domingo', NULL, 'do', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a0fd203a-0b0c-4184-bf17-356974d0ee66', 'EGY', 'Egypt', 'Cairo', NULL, 'eg', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a28dea04-95a6-4268-94a5-9864ef9b2ef6', 'USA', 'United States', 'Washington', NULL, 'us', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a3b1fbb6-1a6a-40f9-96dd-b20ee8dd5c1a', 'UZB', 'Uzbekistan', 'Tashkent', NULL, 'uz', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a4f9b23e-882d-4413-bdcf-42443bd3b47b', 'CHE', 'Switzerland', 'Bern', NULL, 'ch', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a5034947-3810-4755-9f99-21d838710806', 'SXM', 'Sint Maarten', 'Philipsburg', NULL, 'sx', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a57a9912-77ed-4b5a-aab8-0e8d2db29f9a', 'KOR', 'South Korea', 'Seoul', NULL, 'kr', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a739f52c-7dc7-4c70-9ecb-ba23c928be20', 'HMD', 'Heard Island and McDonald Islands', '', NULL, 'hm', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a9497508-9a72-4326-aa7b-11eaa68e4426', 'ALB', 'Albania', 'Tirana', NULL, 'al', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ab56e14b-dc40-4e54-9875-52e3c79ebf5c', 'SRB', 'Serbia', 'Belgrade', NULL, 'rs', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ac706ad2-04ab-44fa-93f9-6c9fefe3ba3d', 'LBN', 'Lebanon', 'Beirut', NULL, 'lb', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ae2ad8ed-5499-40a4-8714-f5e54a56dba7', 'GIN', 'Guinea', 'Conakry', NULL, 'gn', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('af63e7a3-c130-4ef7-b7fa-1448d71c2a12', 'COL', 'Colombia', 'Bogota', NULL, 'co', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b00ea617-3ff1-46dc-a792-c710493832c7', 'CAF', 'Central African Republic', 'Bangui', NULL, 'cf', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b34553eb-ba32-476b-97c3-d20bb5a921aa', 'CRI', 'Costa Rica', 'San Jose', NULL, 'cr', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b354d927-add4-425d-89fe-3122ff096cf5', 'LBY', 'Libya', 'Tripoli', NULL, 'ly', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b39d0083-e9a1-4148-b70a-78f3d76eff1e', 'CYP', 'Cyprus', 'Nicosia', NULL, 'cy', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b40fee99-0d7e-4d30-b4f0-b2b792152025', 'AGO', 'Angola', 'Luanda', NULL, 'ao', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b5a01970-5ea6-40e2-90dc-f0f7c7075887', 'TKL', 'Tokelau', '', NULL, 'tk', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b5de4dfd-d4d1-4e5d-aca1-6ab3962a037a', 'RWA', 'Rwanda', 'Kigali', NULL, 'rw', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b7669c27-87e4-44d9-b026-ffeb487d6e16', 'TKM', 'Turkmenistan', 'Ashgabat', NULL, 'tm', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b81276f2-2b8f-41ad-9603-04523d525476', 'SHN', 'Saint Helena', 'Jamestown', NULL, 'sh', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b82a365c-3955-45ed-aa03-390061cb0869', 'TLS', 'Timor Leste', 'Dili', NULL, 'tl', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ba4d7066-aa7f-4dec-86fc-13a73c457480', 'NCL', 'New Caledonia', 'Noumea', NULL, 'nc', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('bacfe7f8-0e6b-466f-8c36-3a462aef6ac9', 'SVN', 'Slovenia', 'Ljubljana', NULL, 'si', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('baff1c7f-d033-46ea-82d0-1108c0f2beee', 'GMB', 'Gambia', 'Banjul', NULL, 'gm', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('bc3a065c-a2e3-432e-8e4e-009e9374c28c', 'ECU', 'Ecuador', 'Quito', NULL, 'ec', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('bcb9825a-f17f-483e-9b24-ca757ed282c1', 'AZE', 'Azerbaijan', 'Baku', NULL, 'az', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('be3aba62-d18a-4a18-9de3-5845a84a4acb', 'IRQ', 'Iraq', 'Baghdad', NULL, 'iq', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c0352dc1-80f3-424b-977f-6ceeb3c7ea0e', 'GLP', 'Guadeloupe', 'Basse-Terre', NULL, 'gp', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c0cc01fd-e8dd-4c89-80a0-b834698033d4', 'TUN', 'Tunisia', 'Tunis', NULL, 'tn', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c0d408e8-5ced-44b3-9858-db281c88e9f0', 'WLF', 'Wallis and Futuna', 'Mata Utu', NULL, 'wf', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c11e0064-7f1b-449e-9e99-1d156ab31c00', 'UMI', 'United States Minor Outlying Islands', '', NULL, 'um', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c259b2fb-5a3c-40fc-b033-d559da956bba', 'IRL', 'Ireland', 'Dublin', NULL, 'ie', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c4aa5585-0d33-45ef-b9d2-b8374df3945f', 'KWT', 'Kuwait', 'Kuwait City', NULL, 'kw', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c4d74274-ecfc-4bae-9fba-bb69b21902a7', 'ARG', 'Argentina', 'Buenos Aires', NULL, 'ar', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c56269cc-bc26-4cf8-a394-31bad1bbab1a', 'MOZ', 'Mozambique', 'Maputo', NULL, 'mz', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c5ad73bd-45f4-4c21-aa3a-ecbc54348a66', 'GRL', 'Greenland', 'Nuuk', NULL, 'gl', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c5b25062-5b98-4ba0-a769-dbd4649a74a5', 'BGD', 'Bangladesh', 'Dhaka', NULL, 'bd', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c74fd42b-cb5f-4120-bd31-bf616b998e53', 'DZA', 'Algeria', 'Algiers', NULL, 'dz', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c7595b1c-7195-49b5-be19-2cbac80935aa', 'CMR', 'Cameroon', 'Yaounde', NULL, 'cm', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c900b460-f554-4bc0-a198-4803f71a4cc6', 'FIN', 'Finland', 'Helsinki', NULL, 'fi', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c93d4220-ac7d-4dd5-8991-6953ba343a51', 'MUS', 'Mauritius', 'Port Louis', NULL, 'mu', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c9fc73ea-143a-4c7e-9a6f-57b9b08215f8', 'MYS', 'Malaysia', 'Kuala Lumpur', NULL, 'my', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ca384124-e2df-4274-aa64-53dcac1c9372', 'LCA', 'Saint Lucia', 'Castries', NULL, 'lc', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('cb04156c-4b09-413f-b60b-711cebf0fc22', 'BWA', 'Botswana', 'Gaborone', NULL, 'bw', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('cb68cf05-6353-4242-8184-3ad094377722', 'DMA', 'Dominica', 'Roseau', NULL, 'dm', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('cbcfdaa0-465d-4442-8594-2df24c9aaed1', 'LUX', 'Luxembourg', 'Luxembourg', NULL, 'lu', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('cda9ae0b-7ad8-4602-9303-1e8ba536ed2e', 'NFK', 'Norfolk Island', 'Kingston', NULL, 'nf', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('cea542f2-b1fe-438f-8de2-86bf2bc3cb24', 'CZE', 'Czechia', 'Prague', NULL, 'cz', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('d14d9883-c2ee-411f-b0a1-45ff3b25ab52', 'PSE', 'Palestinian Territory', 'East Jerusalem', NULL, 'ps', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('d3608251-6a95-48a1-9b7a-affcff38e9c7', 'ESP', 'Spain', 'Madrid', NULL, 'es', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('d61a20c5-2e5c-47b8-8689-af78765a07d2', 'HND', 'Honduras', 'Tegucigalpa', NULL, 'hn', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('d6959d01-7da7-4a6f-b706-27b850e6683a', 'GUY', 'Guyana', 'Georgetown', NULL, 'gy', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('d8592199-42b7-4b3d-91b6-8b66f7c74bb7', 'CIV', 'Ivory Coast', 'Yamoussoukro', NULL, 'ci', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('d8c9ee80-f8dc-4ea4-ac76-1bb226dddfe3', 'PYF', 'French Polynesia', 'Papeete', NULL, 'pf', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('dc29d0a8-956a-4199-9bce-ee0ed54e863e', 'LKA', 'Sri Lanka', 'Colombo', NULL, 'lk', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('de701ab3-5e48-4dbb-b86e-bc56d4760961', 'OMN', 'Oman', 'Muscat', NULL, 'om', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('dec59b08-126e-48b4-b51f-77befa0c6c46', 'XKX', 'Kosovo', 'Pristina', NULL, 'xk', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('df1b9962-c88f-43e5-b98e-e2006eb1c6d1', 'MDV', 'Maldives', 'Male', NULL, 'mv', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('df612e34-6031-4c90-8dfb-1155dba9768b', 'AIA', 'Anguilla', 'The Valley', NULL, 'ai', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e3d17879-7fa7-43d2-bbbb-081be3dde13b', 'VEN', 'Venezuela', 'Caracas', NULL, 've', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e4691702-d2db-4099-b7de-5cfbc2ee5542', 'ZWE', 'Zimbabwe', 'Harare', NULL, 'zw', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e46d9f85-c807-47cf-a5bd-a55f580aa749', 'ESH', 'Western Sahara', 'El-Aaiun', NULL, 'eh', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e4d74059-d56d-47ee-99c9-b958a4fbae9e', 'JAM', 'Jamaica', 'Kingston', NULL, 'jm', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e4f44d1c-8813-435a-b268-a390d4a8eaa9', 'NRU', 'Nauru', 'Yaren', NULL, 'nr', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e573863e-a6ac-4819-9d99-3ba2da993863', 'SVK', 'Slovakia', 'Bratislava', NULL, 'sk', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e831875c-8b9c-43f7-8ee5-5ded2f52c8e0', 'TUV', 'Tuvalu', 'Funafuti', NULL, 'tv', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ea1e4d33-efd3-4faa-8e0e-e527e03a09b0', 'FRA', 'France', 'Paris', NULL, 'fr', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ea2e12d9-b7b6-4a90-88ff-1b29eb1448bf', 'GRD', 'Grenada', 'St. George\'s', NULL, 'gd', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ea4c70b5-a56b-4879-851a-116f39898a6b', 'IDN', 'Indonesia', 'Jakarta', NULL, 'id', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('eaf68ea8-fa41-4b3d-b69e-3def29e43f23', 'DNK', 'Denmark', 'Copenhagen', NULL, 'dk', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ed1e4ed3-11ff-474c-b209-612cb11c6a5e', 'MAC', 'Macao', 'Macao', NULL, 'mo', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ed29456b-d2db-4ede-9509-1a3829cbafc0', 'NER', 'Niger', 'Niamey', NULL, 'ne', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f1e5fabe-2015-4317-bac3-41db3b0ec5c4', 'BRA', 'Brazil', 'Brasilia', NULL, 'br', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f2d35b5e-1553-4274-b787-3ca3ae9f6c60', 'NOR', 'Norway', 'Oslo', NULL, 'no', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f3e27891-738f-4842-87a0-782292193d83', 'ROU', 'Romania', 'Bucharest', NULL, 'ro', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f41819d6-41d1-440b-ba0a-da7680909cc5', 'MAR', 'Morocco', 'Rabat', NULL, 'ma', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f48f6e5b-9f43-4c2b-80c6-36ef8ccba115', 'MDG', 'Madagascar', 'Antananarivo', NULL, 'mg', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f4a13ec2-d4d9-4dd4-ab6d-ed0519abd58b', 'LAO', 'Laos', 'Vientiane', NULL, 'la', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f75a3e9f-6824-4d6b-a8f2-f87261c86dd5', 'WSM', 'Samoa', 'Apia', NULL, 'ws', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f87c241e-b223-46d2-a21d-c4f6246abe94', 'TON', 'Tonga', 'Nuku\'alofa', NULL, 'to', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f8ff9ea4-72c9-4344-b806-7cb06e67bf63', 'FLK', 'Falkland Islands', 'Stanley', NULL, 'fk', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f9a52d0d-2418-494a-9fb3-66902083dede', 'PER', 'Peru', 'Lima', NULL, 'pe', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fa362921-0ed1-4cf6-ad07-a6e52eb96a9d', 'TZA', 'Tanzania', 'Dodoma', NULL, 'tz', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fa9c6c4a-9f66-4eb3-8794-1214a60ade95', 'IND', 'India', 'New Delhi', NULL, 'in', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fab6ef95-b996-478d-a974-0d7ec1abb65f', 'ANT', 'Netherlands Antilles', 'Willemstad', NULL, 'an', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fb46418f-0efb-45ff-a20e-db2503cd2a18', 'KHM', 'Cambodia', 'Phnom Penh', NULL, 'kh', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fbda2826-0bcc-4468-905c-3988e6a83e22', 'COG', 'Republic of the Congo', 'Brazzaville', NULL, 'cg', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fbe9c49a-cd7a-42a6-a282-e7419f50e142', 'HTI', 'Haiti', 'Port-au-Prince', NULL, 'ht', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fc72643d-dcf1-4811-b8d3-f5121b67dc22', 'VAT', 'Vatican', 'Vatican City', NULL, 'va', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fded8ee3-a338-416a-8094-55b48fc8d408', 'SGP', 'Singapore', 'Singapore', NULL, 'sg', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ff5ac6fb-b67f-4249-bd40-a46d176d153f', 'NZL', 'New Zealand', 'Wellington', NULL, 'nz', 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL);

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

--
-- Dumping data for table `mst_currency`
--

INSERT INTO `mst_currency` (`currency_uuid`, `currency_code`, `currency_name`, `currency_sign`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('0186a9f4-03e8-453f-8ee1-d4546893eca4', 'LAK', 'Kip', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('02611702-a62b-4172-b971-5a2c5f6e0c23', 'GIP', 'Pound', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('03d0c637-fe12-47dc-a999-3cf7b808fe3c', 'VND', 'Dong', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('04fbf7b6-645f-4611-804a-0b543699b92d', 'CRC', 'Colon', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('0633c06a-bca9-47d7-b89c-ebc0058c8853', 'GNF', 'Franc', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('09f3a78d-6a73-41a8-9ed2-1ce6c1293011', 'CVE', 'Escudo', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('0b40b1e2-102a-4446-bdf5-78a1e338f5da', 'UGX', 'Shilling', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('0e069a3f-f096-49db-a898-e1ec362af30d', 'VES', 'Bolivar Soberano', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('0f9aea4c-b528-493a-94d2-a648dbc5a341', 'HUF', 'Forint', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('11205dba-862d-46af-9605-c9bf0db65159', 'ZWL', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('12327455-70cf-4835-813f-e5958d28690d', 'FJD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('141624d3-e7f6-4031-aa82-2e5a706301fd', 'TRY', 'Lira', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('16b6f927-9614-4fe4-af8c-433e7e2450c7', 'CAD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('1c5e197d-0da4-4af9-82bc-e6d39c78e8b3', 'SYP', 'Pound', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('2137d6b2-a424-4eac-b974-7a09525d4cad', 'KES', 'Shilling', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('22ceef18-f454-469d-9967-9b3837ec84ce', 'PHP', 'Peso', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('23249f07-e07f-42b8-879f-bcfa41049b84', 'MUR', 'Rupee', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('2351332c-545d-438e-b429-7ed30d0b61a3', 'PGK', 'Kina', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('26b32709-61db-4b86-a4c5-e69a0596b2fe', 'ERN', 'Nakfa', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('29116177-a0bf-4ee4-8cd1-2bffc3752392', 'FKP', 'Pound', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('296cd59a-3b26-4752-a057-fba49968bd6d', 'CDF', 'Franc', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('297e63e3-b72f-4ae6-95f0-dbf425d21be0', 'KRW', 'Won', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('2b90f230-227e-46e3-a4ff-ad23658c2955', 'WST', 'Tala', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('2e046d8f-9a8f-4d12-9f07-54b58e07aef5', 'ARS', 'Peso', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('2e598704-6ee2-4c79-91fa-aa879275b768', 'BTN', 'Ngultrum', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('2ebc2562-a942-47e6-8996-0c7f1e9bcbca', 'KHR', 'Riels', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('309648e7-de79-435b-905a-cd5a0883d0ab', 'ILS', 'Shekel', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('309c892d-f02d-4aa0-9913-f4d24d85c80f', 'NAD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('346b147e-d9c5-4ef5-98a3-375c51edccdf', 'MVR', 'Rufiyaa', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('362f7812-c791-4970-9aa9-a77dd3d4545d', 'CUP', 'Peso', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('38f9eca2-c3de-4f3d-a658-d7462bb071b7', 'STD', 'Dobra', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('3cf22638-18ca-4170-9477-02471ca7f7f0', 'YER', 'Rial', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('3f154fdb-7a05-4ba7-9510-2077b7d7bf60', 'DOP', 'Peso', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('43ade1b1-3cfa-44e8-8636-f3ba4839a356', 'TMT', 'Manat', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('44220973-9ef8-4270-99d6-a96a98126674', 'CNY', 'Yuan Renminbi', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('457be06a-ef54-436f-b454-fec96f0a06d7', 'ALL', 'Lek', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('4662b982-4d2c-44a5-8559-41ac6dc0afb3', 'MWK', 'Kwacha', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('46f98d56-9963-438b-a67b-6c743b399613', 'XOF', 'Franc', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('47295c67-93fa-4535-91d3-b3d3f160d134', 'SCR', 'Rupee', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('4766c6d7-1e6f-44ed-b078-01d5b9b8b4e7', 'TJS', 'Somoni', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('48184cb9-839c-4224-9713-b6ed84e66b37', 'TOP', 'Pa\'anga', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('4a305917-bd23-4593-871d-3e5fd463c06f', 'AED', 'Dirham', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('4b8b2680-df01-4def-b068-1617272a682a', 'AWG', 'Guilder', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('4c50f3b6-99bd-4fe6-bd43-fe1a051c5e29', 'GMD', 'Dalasi', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('50a9e7a0-b0d1-4a88-8a2e-e8111593aed6', 'QAR', 'Rial', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('535cd0dc-3996-4f87-a675-e72c9d137ffa', 'AOA', 'Kwanza', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('559f8221-f38e-4610-a840-1502f7fb879f', 'VUV', 'Vatu', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('563057d0-4ad7-4aa0-960e-789f693db10b', 'LRD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('565afc10-bdc1-4da9-aeca-d6f9991edf42', 'IQD', 'Dinar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('58280858-1093-4adb-9e57-eb6cfb8e2b38', 'CLP', 'Peso', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('58c4facb-670c-469a-af18-0391258eef82', 'GTQ', 'Quetzal', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('59618949-6286-476f-a378-5e9488b6796d', 'TTD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('59ef40b5-f15e-4c94-a6e8-80c676ab33a9', 'GEL', 'Lari', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('5cc09387-a7e1-4fb7-8a34-39bce3286efb', 'BGN', 'Lev', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('5d438d40-030d-4321-b16c-bd475bbba92a', 'SEK', 'Krona', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('5d6e8664-5acd-4015-b0ee-93a7f5972ac7', 'AFN', 'Afghani', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('5daa8067-c7a7-41a6-a7e6-905b0d6fc94f', 'INR', 'Rupee', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('5de9164b-f471-4400-8501-7c852931226e', 'SAR', 'Rial', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('5fe4f095-e66b-4571-b755-d41c50d6ea22', 'BND', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('6084e3f9-258a-478d-98ef-8b1c81b23112', 'LYD', 'Dinar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('626ded52-95fb-41a9-9ebe-fb328901893f', 'NGN', 'Naira', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('63cf3ef0-9558-4d44-8ba4-3081bca5d537', 'CZK', 'Koruna', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('6420932b-1f6f-4c6e-8169-820af6dbbda7', 'BAM', 'Marka', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('646c1e4b-ebf6-4528-bd18-dfff4e28b0b1', 'BIF', 'Franc', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('6573c589-4a97-4238-b305-d69ca62c4de0', 'JPY', 'Yen', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('65adc2c6-7bba-48da-82e6-d8daea30a8eb', 'PEN', 'Sol', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('66254341-3345-48c9-af7e-0bc702d85c35', 'ZAR', 'Rand', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('685cd55e-d077-43cb-a5b1-3d1dca82f561', 'COP', 'Peso', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('686b459f-4f62-466a-84d8-c8b27a73af59', 'MMK', 'Kyat', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('694490b5-eb6a-4650-8f85-612bcc9cbd0e', 'RWF', 'Franc', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('71b1a1a8-3cb3-4f0a-a49b-ea027b645fac', 'JOD', 'Dinar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('73a31ec6-65c1-4107-80a3-f52e3d87bb78', 'LBP', 'Pound', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('752ab2ce-8ee2-43e6-943c-a9a0189f3a0a', 'MNT', 'Tugrik', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('763a0736-0092-46be-b9fc-0932180645bf', 'NOK', 'Krone', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('774b1e3b-5677-490c-ac0a-6beb8bce1b72', 'SSP', 'Pound', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('778c22ce-6ec4-42c8-9537-7baf51ead860', 'RUB', 'Ruble', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('784f8170-dbe3-447b-9a16-a1c3d27104ae', 'DKK', 'Krone', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('78b1094a-0332-4cf3-995e-9aa4e7a32ae4', 'KPW', 'Won', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('7c127175-05ac-40fd-acef-bfc75946d01c', 'TND', 'Dinar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('7ca454c5-e7e8-43b7-859b-c8a16cb70d91', 'PYG', 'Guarani', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('7d8c9221-a616-4528-aaa9-a7a9037f0bf4', 'XCD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('7f86d557-70d1-44b5-82f8-00a5f9c974ce', 'KGS', 'Som', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('80d0f129-e7a9-4ebb-b70a-320b660f2265', 'AUD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('86b2e48b-af45-4b41-90f4-496d6d9f2217', 'TWD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('890ba68e-c3ea-488e-b220-463f4ad945a4', 'THB', 'Baht', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('8c0ce838-f863-48c3-b5f0-d83a06961441', 'BDT', 'Taka', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('8feb6a92-2630-418f-aaab-4c17e315cd90', 'DZD', 'Dinar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('8fed7883-dde7-4a01-a249-62d129dea41f', 'MGA', 'Ariary', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('8ff86e08-6887-4e98-96d7-2c2790f0f777', 'UAH', 'Hryvnia', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('93ab6b1c-395a-4bc9-a7ef-38486c036fb4', 'SHP', 'Pound', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('963eba7b-5f86-4ef0-93d1-5c1bd0057786', 'HTG', 'Gourde', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('975790d5-65db-4c18-9610-8b7f6b330a0d', 'RSD', 'Dinar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('999ad959-bc70-402a-9723-d5cdafb93465', 'OMR', 'Rial', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('9a39dbd2-baf7-48f4-a67a-fde08d99f3c8', 'UZS', 'Som', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('9ad5edbe-0dd0-42ac-8409-9fcc48601b23', 'XAF', 'Franc', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('9b88ae7b-1e61-42de-b86f-9552795cb4d1', 'KYD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('9c340201-9c0e-4807-926e-500b469dadd2', 'MXN', 'Peso', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('a2a9cedd-8b01-4ca6-993c-fb08f8c0db29', 'NPR', 'Rupee', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('a3405abe-e851-478c-9f06-4a6b06d614e2', 'IDR', 'Rupiah', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('a7e36058-0213-44c5-8968-67bd519568ff', 'SLL', 'Leone', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('a9cac414-4dc0-4aa5-a4bb-5a1cce883d9d', 'MYR', 'Ringgit', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('aaa0de94-1fe2-43e7-b683-01747ccad1b7', 'BRL', 'Real', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('ab5667bf-41a8-4f6e-b307-45e497225a68', 'MDL', 'Leu', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('ac270b53-acba-4a51-b62d-48ecf0241fe2', 'BWP', 'Pula', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('ad19ab3c-7e54-4f90-a00e-99027a7bdf98', 'SGD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('af312926-8717-42f7-9c85-2bb04c686f38', 'SRD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('bc45eab5-d1da-487e-97ec-ab1a75489df1', 'HRK', 'Kuna', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('bd0820ca-eea0-4156-b88f-31da0fcc2d52', 'BYN', 'Belarusian ruble', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('bebe945b-5b8d-4671-8d7c-ae825ead17ca', 'BMD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('bfa561bf-2313-40ea-970b-19d6de800ae9', 'ANG', 'Guilder', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('bfc17260-b916-4bfa-9f57-391ad4d9d07c', 'ETB', 'Birr', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('c20567c9-b104-4a7f-84c6-e32784d74cdb', 'MOP', 'Pataca', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('c314483c-2061-48a2-8602-93dee0252038', 'BOB', 'Boliviano', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('c35055d9-618b-4726-8c58-74419365ae04', 'DJF', 'Franc', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('cbe3d1ed-dcb5-4506-b166-f98fd56aeccb', 'BBD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('cdab7142-7a0a-4140-bb9b-c62e09a2916b', 'LSL', 'Loti', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('cecab59f-4b5e-4852-81b7-0047eed26c04', 'IRR', 'Rial', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('d1441ff3-b772-4afa-b7bc-70e4c74df5d3', 'BHD', 'Dinar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('d190fcd1-635e-434d-8312-790ac2291305', 'GHS', 'Cedi', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('d222b767-c84f-47a6-a9d6-388edb25ec41', 'NZD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('d2ba20f9-8150-4612-b1fb-2888762e3220', 'SOS', 'Shilling', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('d3ce26e2-a652-40be-8a56-b9315dd73540', 'USD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('d4770a10-2ece-4553-978d-859dae711d21', 'EUR', 'Euro', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('d48ffe93-6ff6-4aed-9772-0b206e82dbfc', 'ISK', 'Krona', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('d5851f89-1951-41ba-801f-7bd85a942ef4', 'PKR', 'Rupee', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('d6656da6-32f4-4910-be9b-2b61bc4642ee', 'TZS', 'Shilling', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('d7a8be59-f29a-44ec-abe7-b183a411c786', 'GBP', 'Pound', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('d810f9f8-c6c8-42c9-a1ce-cdc95c039b16', 'NIO', 'Cordoba', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('da9452b2-abd7-42eb-94f0-4538eeb867c9', 'ZMW', 'Kwacha', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('de3acb8c-98c3-408b-8b3f-7f31cca1fad9', 'SBD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('dfb796e6-d421-4b4f-bed8-f6922a4a9f7c', 'AMD', 'Dram', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('e0dc05b3-c24a-42e3-b670-bea3e70dd52f', 'AZN', 'Manat', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('e1aab584-bf65-4692-b751-02881cc36d36', 'CHF', 'Franc', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('e1d8de67-696e-42ba-89a0-337cf9ab1816', 'JMD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('e31acc81-7818-4600-bb21-cb51bc2e6b68', 'BSD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('e33131c1-d0ed-489a-b980-473cce9f318a', 'KZT', 'Tenge', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('e3745e32-9b4b-4c46-8036-8b6d08c42363', 'BZD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('e5ce925b-da20-47fe-9ee2-b40fb38852db', 'PLN', 'Zloty', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('e8f28fe1-1766-4590-9b56-9258b140fac9', 'SDG', 'Pound', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('ead26bea-1ea1-43a6-aa66-b6b1b22f94fe', 'KWD', 'Dinar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('ec4146a0-37f9-431f-bdf2-f065198f7196', 'HKD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('ed028dfb-481b-4a8e-b5f6-0e2b2d6b43e5', 'GYD', 'Dollar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('edf17b43-c203-4fd8-967f-757d73be122c', 'MRO', 'Ouguiya', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('efc34850-d149-40fd-8a2f-86715bb7739f', 'XPF', 'Franc', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('f1208541-7b68-4137-a141-729d12a113c9', 'KMF', 'Franc', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('f25ead9c-05ce-4484-b46f-982aaa4edf1e', 'SZL', 'Lilangeni', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('f2eb955c-a946-453a-9b4d-5824181d1698', 'MZN', 'Metical', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('f2f8a577-3229-4b89-a55e-ead589bf5d06', 'EGP', 'Pound', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('f3850cbd-1b03-4445-879c-3579c0b8449a', 'PAB', 'Balboa', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('f7526e80-c898-43d0-b435-073dc0349bf6', 'MKD', 'Denar', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('f8936395-a22a-4512-aa78-56cf66fa25a2', 'HNL', 'Lempira', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('fba21b1f-2113-4a0a-8140-e1e1d405e4ac', 'MAD', 'Dirham', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('fc44f1bf-4800-444f-9c13-92879243930f', 'LKR', 'Rupee', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('fc6a9f80-7239-4f26-a470-5295c9f75896', 'UYU', 'Peso', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL),
('fe4001ea-6353-4294-8d94-82566d67850e', 'RON', 'Leu', NULL, 0, 1, '2018-12-03 23:17:38', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_device`
--

CREATE TABLE `mst_device` (
  `device_uuid` varchar(36) NOT NULL,
  `device_id` varchar(150) DEFAULT NULL,
  `device_number` varchar(150) NOT NULL,
  `device_name` varchar(150) NOT NULL,
  `device_model` varchar(150) DEFAULT NULL,
  `device_version` varchar(150) DEFAULT NULL,
  `software_version` varchar(150) DEFAULT NULL,
  `manufacturer` varchar(150) DEFAULT NULL,
  `device_specification` text,
  `device_description` text,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `device_type_uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_device_type`
--

CREATE TABLE `mst_device_type` (
  `device_type_uuid` varchar(36) NOT NULL,
  `device_type_name` varchar(150) NOT NULL,
  `device_type_description` text,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_device_type`
--

INSERT INTO `mst_device_type` (`device_type_uuid`, `device_type_name`, `device_type_description`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('1441d74d-b875-4b34-8bb3-4ebf757b97c2', 'X-Ray', 'X-Ray', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL),
('15a16a53-01c2-42da-bbb3-2566f107a072', 'Endoscopy', 'Endoscopy', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL),
('25847ae9-305b-4d62-be42-06334c057467', 'Fluoroscopy', 'Fluoroscopy', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL),
('2cf7976c-a0b8-4c1e-9d66-a6e6cbf2c8b3', 'SPECT', 'Single Photon Emission Computed Tomography', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL),
('4b69b247-3c5b-4173-a3f1-33220ef9ae1c', 'Whole Slide Imaging', 'Whole Slide Imaging', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL),
('622d58c4-0d2a-4343-a5d1-131d33e14084', 'MRI', 'Magnetic Resonance Imaging', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL),
('68312153-6780-4a8b-a522-44dbe25ffb15', 'Angiography', 'Angiography', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL),
('6fc5defd-bc13-4d08-bd0a-e261f1b88b9a', 'OCT', 'Optical Coherence Tomography', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL),
('7dc8749d-28f3-4621-8a73-dbf014081c37', 'Breast Tomosynthesis', 'Breast Tomosynthesis', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL),
('8cc7be88-a933-4714-a0d1-2073243b48eb', 'Microscopy', 'Microscopy', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL),
('8fc11ccb-f808-43d5-9b83-abbe5f66b3ef', 'Ultrasound', 'Ultrasound', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL),
('9c4af663-38ec-4770-92c5-7dafa0ed514f', 'PET', 'Positron Emission Tomography', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL),
('b9526431-4951-4dff-a37e-967ddcd635e7', 'Mammography', 'Mammography', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL),
('d0e2f5ce-0b59-4b5d-ae57-c5886500a783', 'CT', 'Computed Tomography', 0, 1, '2018-12-05 09:53:45', NULL, NULL, NULL);

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

--
-- Dumping data for table `mst_language`
--

INSERT INTO `mst_language` (`language_uuid`, `language_code`, `language_identifier`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('00187e5f-f370-4596-9332-f69c256cba4d', 'sms-FI', 'Sami (Skolt) (Finland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('00a84e84-34ea-4abd-a9b5-17b2d32aaf10', 'ml-IN', 'Malayalam (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('02a9999f-8572-4549-87f9-fe89a5791738', 'smj-SE', 'Sami (Lule) (Sweden)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('06fdfd9e-8073-49d0-a7ec-026a7657f83a', 'or-IN', 'Oriya (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('078bd99f-5d5c-42e8-8e9b-e88171dab306', 'as-IN', 'Assamese (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('0a7d315f-a2ed-42c9-85f2-fce780d68212', 'es-CL', 'Spanish (Chile)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('0c2927d1-8b73-47b1-9b7f-7a704b983a6f', 'ar-BH', 'Arabic (Bahrain)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('0d5d56f7-a58f-4c2e-93c3-83ceb7ac36a2', 'da-DK', 'Danish (Denmark)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('0db737b8-d668-4b1b-a5d9-b46fcf7c6300', 'es-PA', 'Spanish (Panama)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('0e1422ec-0caf-424e-a33f-d048cffb9312', 'ka-GE', 'Georgian (Georgia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('0e7433f4-85c6-4740-b2d0-e810eaeb70eb', 'sw-KE', 'Kiswahili (Kenya)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1487695c-2a09-46e2-9b74-a4d73372f730', 'be-BY', 'Belarusian (Belarus)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('153df727-3464-4d36-8023-286c03e4062f', 'ar-LY', 'Arabic (Libya)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('15bb19c6-cd04-498b-a155-98747ee3cedb', 'sq-AL', 'Albanian (Albania)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('15ce2f51-2494-4019-9f87-a86ab986bdff', 'es-EC', 'Spanish (Ecuador)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('16a79509-a483-433b-9152-a195a3ba1f47', 'dv-MV', 'Divehi (Maldives)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('184e0b74-c863-4f3a-b05a-82652f7b97e3', 'es-SV', 'Spanish (El Salvador)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1a020402-f608-4233-ba04-7a2ddb248ac3', 'sr-BA', 'Serbian (Cyrillic) (Bosnia and Herzegovina)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1a6fb198-ce05-4631-9483-4641f3a94c21', 'ar-DZ', 'Arabic (Algeria)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1aa6bfcf-c3be-49a7-9785-4fc9e694135b', 'smj-NO', 'Sami (Lule) (Norway)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1b2f0952-7b28-451e-b789-b12a4b462ade', 'gu-IN', 'Gujarati (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1db05fa0-7ed5-4439-abb3-0050713ce786', 'mk-MK', 'Macedonian (FYROM) (Macedonia (FYROM))', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1dfdebb6-a844-4f8c-80d9-c84ee76b4964', 'ne-NP', 'Nepali (Nepal)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1e8596f0-1fd3-4a8a-9f4c-9403a75bbc23', 'sr-BA', 'Serbian (Latin) (Bosnia and Herzegovina)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1f20d508-bdcf-42f7-b6fe-bfb956dedd52', 'es-GT', 'Spanish (Guatemala)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('22745665-9c35-41dc-9cec-ebc9872d4d2c', 'prs-AF', 'Dari (Afghanistan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('22ed84a6-5663-4957-8d19-80611375e898', 'ky-KG', 'Kyrgyz (Kyrgyzstan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('2348aff5-70cc-42d3-948d-8d47cb9cce59', 'el-GR', 'Greek (Greece)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('24d6b752-f802-4055-8c8a-728619147a25', 'es-HN', 'Spanish (Honduras)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('2587f97a-e9dd-4e2b-848a-11695772b192', 'qut-GT', 'K\'iche (Guatemala)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('263f12ed-3018-4441-a096-765bdf539917', 'hsb-DE', 'Upper Sorbian (Germany)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('278e97f1-d656-4189-ae5f-20aaf454a78c', 'ar-LB', 'Arabic (Lebanon)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('291a8c59-381e-4b11-93b1-f5b8cab0ebbe', 'en-MY', 'English (Malaysia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('29e3a279-1384-45d4-8ff0-b4afef68c1dc', 'zh-SG', 'Chinese (Simplified) Legacy (Singapore)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('2d0afd46-4946-495a-abb9-07e78f1f051a', 'ms-MY', 'Malay (Malaysia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('2e365396-c11d-4021-ba68-acc68f699f67', 'oc-FR', 'Occitan (France)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('30def87e-3932-4e9f-bed7-50d43abe08de', 'es-PR', 'Spanish (Puerto Rico)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('3118e419-29b0-479d-92fa-61b2b61943a3', 'mn-MN', 'Mongolian (Cyrillic) (Mongolia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('31bf220a-bd77-46c8-92de-f6c52fef466f', 'af-ZA', 'Afrikaans (South Africa)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('31e3b24b-0290-4df1-9d98-8fe3a2983c11', 'zh-TW', 'Chinese (Traditional) Legacy (Taiwan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('31f259c8-109d-4452-bde0-5ae66de39e09', 'ca-ES', 'Catalan (Spain)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('32b95c26-b834-44a2-b1be-6c70dbbe08d2', 'fr-CH', 'French (Switzerland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('32fec58d-ef7a-46f5-bfbb-69a2fdfe3ff2', 'hi-IN', 'Hindi (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('345c6b63-0cbb-459b-a557-2fe1a16699cf', 'ar-KW', 'Arabic (Kuwait)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('3575f35e-6953-40a0-b8a3-de6582850a0b', 'br-FR', 'Breton (France)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('35b3966c-caf2-4e38-a8f5-3c43c018bc43', 'ja-JP', 'Japanese (Japan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('36d189d2-bb08-47f8-901d-27b8a9b1d7ef', 'en-GB', 'English (United Kingdom)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('38bd0d1f-8ab9-496f-b4e2-ea67a32c24fd', 'cs-CZ', 'Czech (Czech Republic)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('3a3d43f1-d5a7-41c4-8b1d-25bb270e8a2d', 'fr-CA', 'French (Canada)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('3b160556-8262-4289-9adf-35b3171588f3', 'es-UY', 'Spanish (Uruguay)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('3c22e418-e3e5-4b7f-a502-8adad258f0e9', 'en-US', 'English (United States)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('3d1f4021-e8c3-4f5b-98fd-2169fe1f5a97', 'es-BO', 'Spanish (Bolivia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('4173d0eb-4050-44c4-a6d8-7576abdc87b4', 'eu-ES', 'Basque (Spain)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('420961b2-90a2-480b-865e-069fcab83fa5', 'ar-SY', 'Arabic (Syria)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('43f1d83c-af81-4bdc-8ed9-7ace6956cf75', 'es-CO', 'Spanish (Colombia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('4a1eeac6-a089-4a9f-ac30-894a835a0ecb', 'es-AR', 'Spanish (Argentina)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('4bde7a9d-da1d-4fbd-be64-2e7d465cdbb0', 'mt-MT', 'Maltese (Malta)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('4d32b073-f297-4436-90ae-d99b06d581f6', 'ar-TN', 'Arabic (Tunisia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('4eeb9cb0-b5f6-46e2-a2b6-91665cfddc61', 'yo-NG', 'Yoruba (Nigeria)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('4f069be7-fc20-424b-b350-6ca8b06e21ec', 'cy-GB', 'Welsh (United Kingdom)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('534685ed-acdf-496a-8900-ac575ca4e04a', 'ur-PK', 'Urdu (Islamic Republic of Pakistan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('53c27fa9-53eb-4b56-b200-e9e61edc66be', 'sr-CS', 'Serbian (Cyrillic) (Serbia and Montenegro (Former))', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('540cc315-b1b9-49f5-87fa-bc17f9fb459f', 'es-MX', 'Spanish (Mexico)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('543f0c77-7255-4efb-9943-c104624d1ebc', 'tr-TR', 'Turkish (Turkey)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('5510007b-93c2-4822-8e2c-6f3098107afa', 'fr-BE', 'French (Belgium)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('55559ace-1ffb-420a-9079-246551c64fcf', 'sr-RS', 'Serbian (Latin) (Serbia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('57a59cdb-3007-4365-b3f1-1b359b3ce098', 'bn-IN', 'Bengali (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('59f509b3-750f-4b65-8df4-59e5df4068d9', 'en-NZ', 'English (New Zealand)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('5a237009-480f-4d2d-8143-74907587481b', 'fr-MC', 'French (Principality of Monaco)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('5c22531a-2540-4bae-956b-d52f0f9d0777', 'ar-OM', 'Arabic (Oman)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('5d46d07a-ed06-4d86-b443-b3d30eccba74', 'en-JM', 'English (Jamaica)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('5e9d0a8a-5d96-4136-afd5-e04f5699efb4', 'nn-NO', 'Norwegian (Nynorsk) (Norway)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6165ae24-de1a-4631-8268-0539aa569f50', 'kok-IN', 'Konkani (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('622daaa7-0140-4c27-8c50-a324bfcb347a', 'kl-GL', 'Greenlandic (Greenland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('626b2607-f399-47ce-9bfa-b7e4ee8b09ad', 'it-CH', 'Italian (Switzerland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('64bb90e3-3cbd-44d8-9780-403b9b9279a9', 'th-TH', 'Thai (Thailand)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('66298cfd-db0f-4192-a8d4-466ecd968d47', 'es-PE', 'Spanish (Peru)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('66e10e28-2fd5-4adc-96d1-054fac837272', 'sr-ME', 'Serbian (Cyrillic) (Montenegro)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('67160101-75c1-4693-a983-f3cb6d5c5dad', 'wo-SN', 'Wolof (Senegal)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6735efb7-449e-4882-bd2a-3a18011dea94', 'pa-IN', 'Punjabi (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('67e2ea89-1325-43ac-9062-070db164ae74', 'sk-SK', 'Slovak (Slovakia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('68019110-f0a2-4402-99bc-1595d570ee10', 'ar-MA', 'Arabic (Morocco)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('68472d81-2e2e-4494-a1f8-fa95d9b91c33', 'mr-IN', 'Marathi (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('68816eb0-4956-4fd3-b1c9-7ca02757574c', 'se-NO', 'Sami (Northern) (Norway)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6973727f-a163-4b4a-9198-097e2a389036', 'te-IN', 'Telugu (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('69aecf3e-522e-4663-87ff-3e8f9226a09e', 'arn-CL', 'Mapudungun (Chile)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6b4b8801-024b-4b48-b396-1ab2bceccc84', 'tzm-DZ', 'Tamazight (Latin) (Algeria)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6c894665-4f8a-4a8e-899d-d08ea0db833a', 'iu-CA', 'Inuktitut (Latin) (Canada)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6d2f6ff6-95cd-4ebe-baea-1693bd90e10f', 'en-ZA', 'English (South Africa)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6e06cedf-99a9-4246-b263-44646cd9a098', 'sr-RS', 'Serbian (Cyrillic) (Serbia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6ea7dda1-567c-4a8a-b75e-865730ab7ae9', 'uk-UA', 'Ukrainian (Ukraine)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('71459d33-82f9-443f-a7c5-2e19482fc364', 'vi-VN', 'Vietnamese (Vietnam)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('72231293-2222-42c5-918e-7024de524d6e', 'zu-ZA', 'isiZulu (South Africa)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('72c4f213-df7a-4b27-8dd7-e39df9d3af18', 'ko-KR', 'Korean (Korea)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('75876e49-0650-490b-8825-bd0a6703c1bf', 'gl-ES', 'Galician (Spain)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('75c80e96-95e2-4e5b-acb5-842d152d2da5', 'sv-SE', 'Swedish (Sweden)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('773429a7-b6da-40cf-9c6e-03c507c275a3', 'se-FI', 'Sami (Northern) (Finland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('77cf1de1-879d-4bc5-b77b-031e044e91a3', 'de-CH', 'German (Switzerland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('79ad40ba-d9b4-424a-a9f7-2165d3f2ddd2', 'ar-YE', 'Arabic (Yemen)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7a917212-2d63-4ffd-83b7-ca2b700f615e', 'bn-BD', 'Bengali (Bangladesh)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7bbb1937-629b-426b-92de-8cc918ccb986', 'en-SG', 'English (Singapore)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7c50e743-35da-49d3-aacf-e4a1ec36fd2c', 'sr-CS', 'Serbian (Latin) (Serbia and Montenegro (Former))', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7c5d4d39-47e1-45f5-ae91-c588855b11b3', 'moh-CA', 'Mohawk (Canada)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7e8a76c7-e9eb-47b8-8cb3-f77f62633266', 'es-US', 'Spanish (United States)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7ed545d5-9c06-47f4-87a1-53402f740878', 'fi-FI', 'Finnish (Finland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7ee93680-53d5-4916-a542-f0b5df06662b', 'si-LK', 'Sinhala (Sri Lanka)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8241cc45-9c12-4d5e-ae77-0f4b6772d401', 'de-LI', 'German (Liechtenstein)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8700ba64-cf97-4a6c-9bf0-97b8eceb137f', 'lb-LU', 'Luxembourgish (Luxembourg)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('872752f8-7867-4379-a066-9758b35b3213', 'en-029', 'English (Caribbean)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8774e704-5da0-4516-84b4-8f4600659a96', 'ig-NG', 'Igbo (Nigeria)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('88d5004e-b275-4435-8e6c-abf9b59740a0', 'ar-SA', 'Arabic (Saudi Arabia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('898541a2-c990-4cdc-b120-0ef8db8a7cc0', 'km-KH', 'Khmer (Cambodia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8a8049d9-a262-4a10-bbde-1a91a817c3c8', 'ps-AF', 'Pashto (Afghanistan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8d365e48-9d89-4efa-9670-1178dce3cc09', 'ar-EG', 'Arabic (Egypt)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8d5cdb0b-94b5-4693-b485-c5368be1a4af', 'es-DO', 'Spanish (Dominican Republic)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8dc40dab-6063-42ca-930f-a39a9dd71afa', 'fy-NL', 'Frisian (Netherlands)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8dc61da1-3d29-4304-a5f1-16e55e019429', 'sma-NO', 'Sami (Southern) (Norway)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9018270b-46f5-46c5-a55e-824c389454ff', 'uz-UZ', 'Uzbek (Latin) (Uzbekistan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('916a7399-ae09-476e-b679-09b903c3d2ee', 'co-FR', 'Corsican (France)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('91f3a3b2-64c1-444c-968b-517de902efbf', 'bs-BA', 'Bosnian (Latin) (Bosnia and Herzegovina)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('951d1b3b-9649-4ba7-9c3e-7eb4d7cfdaf0', 'lt-LT', 'Lithuanian (Lithuania)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('95516dad-9c9a-49bf-88da-f40339b79179', 'syr-SY', 'Syriac (Syria)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('971848ae-146c-4f86-aa84-23cceab557a1', 'ar-QA', 'Arabic (Qatar)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('97310a4e-6692-4f0f-97ba-5bda909e931a', 'pl-PL', 'Polish (Poland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('97afbb22-e81c-4abc-b57f-a9241da9ea79', 'bg-BG', 'Bulgarian (Bulgaria)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9820c1c3-b8a2-44ad-8d6d-fab9f2720c72', 'tg-TJ', 'Tajik (Cyrillic) (Tajikistan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('98c2f2a0-2cc6-422d-ba85-dab62296ed6c', 'pt-PT', 'Portuguese (Portugal)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('98c624ab-6c86-48d8-b1b2-f76ed2e53a14', 'ii-CN', 'Yi (People\'s Republic of China)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('99058dde-7723-4821-97d1-e3829eb0876e', 'mi-NZ', 'Maori (New Zealand)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9af1cf66-5449-4569-b77f-00b3bbbae602', 'he-IL', 'Hebrew (Israel)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9b5957dd-c40c-464c-af30-d6f3ee09a5db', 'es-PY', 'Spanish (Paraguay)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9ba6682f-7ee5-49b9-bd22-61c92287d281', 'ta-IN', 'Tamil (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9bcb9334-8d73-4675-8a72-d415b426bad0', 'hu-HU', 'Hungarian (Hungary)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9bfb4802-1fea-40ec-a975-d68ada620ee3', 'en-PH', 'English (Republic of the Philippines)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9c3274ce-1996-43eb-8dce-f6481ad5fd3b', 'de-LU', 'German (Luxembourg)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9d662be6-1548-46df-8967-c172bea55de4', 'ar-JO', 'Arabic (Jordan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9ec7741c-2b67-48ae-bb7e-6ad2a77ad266', 'fr-FR', 'French (France)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9f8c34c2-c331-4c47-aa44-dd27b3844c40', 'quz-BO', 'Quechua (Bolivia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('a1cdd1a2-2fca-4472-937c-ef122c6d91c0', 'gsw-FR', 'Alsatian (France)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('a2513fd1-217f-41f9-a582-f9d4b87f394e', 'ga-IE', 'Irish (Ireland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('a8495d30-9c63-4114-9363-39e81dd79fca', 'en-IN', 'English (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('a9871f24-7a40-4bb5-94d7-e049186e8d0c', 'de-DE', 'German (Germany)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('aa843891-7fde-433e-ab8a-15d9f0baabb9', 'kn-IN', 'Kannada (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('aaec8a05-652c-4fe3-8925-1fa6ca57ffa5', 'tk-TM', 'Turkmen (Turkmenistan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ad239fd0-34d2-4a12-a3bd-55d9038f6153', 'zh-HK', 'Chinese (Traditional) Legacy (Hong Kong S.A.R.)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('add83fbd-dfb4-4370-8385-9657957ef67d', 'quz-PE', 'Quechua (Peru)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b002c636-fc52-48ef-9365-b8c04982e9dc', 'hr-BA', 'Croatian (Bosnia and Herzegovina)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b156c462-91e9-4992-987b-2b931acb246a', 'sl-SI', 'Slovenian (Slovenia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b159d695-7971-48f9-b5f5-951651181c20', 'tt-RU', 'Tatar (Russia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b44be7ec-d836-4ccb-a254-1371c803e363', 'se-SE', 'Sami (Northern) (Sweden)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b6f6542e-e4eb-454d-ba40-dde0c6aa8127', 'lv-LV', 'Latvian (Latvia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b703268f-ae04-488b-8a81-6b1e03ee7bc0', 'is-IS', 'Icelandic (Iceland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b7fe0858-d311-4bc7-b0d9-05e7c9e25c16', 'ba-RU', 'Bashkir (Russia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ba428373-cc68-477c-a912-d7191c54c016', 'lo-LA', 'Lao (Lao P.D.R.)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('bac36f12-8f8f-499a-808d-ae244e26ce9f', 'en-CA', 'English (Canada)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('be507765-5c89-4855-b6a9-4968593af0fe', 'es-ES', 'Spanish (Spain)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c045e63e-f619-426b-b402-2afe5040f3f9', 'az-AZ', 'Azeri (Latin) (Azerbaijan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c0b493db-a4bb-4240-8175-f2b91715cb16', 'iu-CA', 'Inuktitut (Syllabics) (Canada)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c0b6c7aa-b61e-4960-a6a4-fe57a2e59ef0', 'nl-BE', 'Dutch (Belgium)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c139635e-2cfb-432c-abcc-561400c951d8', 'quz-EC', 'Quechua (Ecuador)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c4265799-5f09-46c0-a304-849a98d401ed', 'es-CR', 'Spanish (Costa Rica)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c5c695bb-187a-407d-97e4-ba5b1e3bd36d', 'nso-ZA', 'Sesotho sa Leboa (South Africa)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c60d8513-ffcd-4292-81e2-aa7d88ac53ce', 'gd-GB', 'Scottish Gaelic (United Kingdom)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c64a3121-b2ca-44e3-b091-93bf60465ebc', 'ha-NG', 'Hausa (Latin) (Nigeria)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c65ce29c-7018-42c2-9753-aa95ae694c45', 'dsb-DE', 'Lower Sorbian (Germany)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c68e5c42-9c9d-443f-8794-99a2f59ce39e', 'fa-IR', 'Persian (Iran)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c75e0985-bc4a-42ac-a0ee-3608c4ef1fc3', 'bs-BA', 'Bosnian (Cyrillic) (Bosnia and Herzegovina)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c81f6c71-5b54-4d7f-8ceb-4115b84e90f4', 'nl-NL', 'Dutch (Netherlands)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ca7ca05a-a18e-48a9-b861-40bed1eb5ebf', 'nb-NO', 'Norwegian (Bokmal) (Norway)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('cb1a4b5e-4ac0-447b-b5f2-11537cfef983', 'hr-HR', 'Croatian (Croatia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('cf105689-6433-4013-b04b-4a58c8408cd3', 'am-ET', 'Amharic (Ethiopia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('cf69cbc7-e647-4690-a54b-8456cdfa4cdd', 'mn-CN', 'Mongolian (Traditional Mongolian) (People\'s Republic of China)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('d0c35bad-6708-4a01-924e-d547a0cffdb1', 'et-EE', 'Estonian (Estonia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('d2779e16-dd93-48ae-95e3-b3edf9b168dc', 'xh-ZA', 'isiXhosa (South Africa)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('d2db84ba-70b7-4fdd-a0f8-d74297d3bbb4', 'bo-CN', 'Tibetan (People\'s Republic of China)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('d4e289b0-2c20-4fc4-87a7-eca90f96c694', 'ar-IQ', 'Arabic (Iraq)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('d7c38420-8f0d-41d0-ac71-abcc023441ad', 'en-TT', 'English (Trinidad and Tobago)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('da1d0af7-4c6f-4b67-befc-74014c9458a7', 'id-ID', 'Indonesian (Indonesia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('dcb21177-fe06-48ee-93ac-defd32cfed98', 'zh-MO', 'Chinese (Traditional) Legacy (Macao S.A.R.)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('dcbe49cf-09f1-4b07-bd2e-9ce3f6064524', 'az-AZ', 'Azeri (Cyrillic) (Azerbaijan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('dcdaf0ac-d28f-4708-b5bd-8913695f53ff', 'ru-RU', 'Russian (Russia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ddf9e4c8-30d5-4a1f-ba44-e83280520ba7', 'en-IE', 'English (Ireland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('dec24104-2129-405a-83ce-774cad7a09ec', 'fo-FO', 'Faroese (Faroe Islands)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('dfaa8f5d-a136-41b0-b013-3acbd922ea91', 'sa-IN', 'Sanskrit (India)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e13aa866-f071-4a33-98f1-0d663e24bbb2', 'sah-RU', 'Yakut (Russia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e231a153-585b-4372-a3c6-3d30842305fd', 'rm-CH', 'Romansh (Switzerland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e4cb3da2-574f-4611-acd3-5dce7b4c9ae4', 'ro-RO', 'Romanian (Romania)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e6acecc8-8cfd-4fcd-b432-423050040bf9', 'smn-FI', 'Sami (Inari) (Finland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e785967d-f759-4683-83c8-41cd84162cf3', 'de-AT', 'German (Austria)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e8bbf0c7-4365-434f-965e-9ca46fac8667', 'es-VE', 'Spanish (Bolivarian Republic of Venezuela)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e9b7b988-3fcd-4ecf-8ff5-6cf4d9f8deaf', 'en-AU', 'English (Australia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('eb61d879-070f-4118-b167-0beef494bd29', 'it-IT', 'Italian (Italy)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ece937c8-e789-46a9-a6e5-e6d4d20b02da', 'en-ZW', 'English (Zimbabwe)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ee29ce52-79f3-44b2-bd4c-73f90feef5a8', 'kk-KZ', 'Kazakh (Kazakhstan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ee4381ef-9d9e-459c-bc13-d0d15d11e9af', 'sv-FI', 'Swedish (Finland)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ef1e4316-a51f-4f79-90fe-129b86cf1ba5', 'uz-UZ', 'Uzbek (Cyrillic) (Uzbekistan)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ef65caf9-d8bd-47f6-a6ea-8ec9b1eb6748', 'fil-PH', 'Filipino (Philippines)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f01e6079-3337-4940-88b9-6ae2146cb0c5', 'ar-AE', 'Arabic (U.A.E.)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f0fcae1c-ea75-4b0d-a090-0499cb6b460e', 'sr-ME', 'Serbian (Latin) (Montenegro)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f2120c24-9668-4268-ad4b-5d946ef94152', 'zh-CN', 'Chinese (Simplified) Legacy (People\'s Republic of China)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f3de5593-b572-4f51-8c59-fd89b6bc2aa3', 'es-NI', 'Spanish (Nicaragua)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f4dcd701-5169-449e-bb7d-5742f01aa9e9', 'ug-CN', 'Uyghur (People\'s Republic of China)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f59fe0e6-65f1-44bd-b0be-6d5c4be001ee', 'sma-SE', 'Sami (Southern) (Sweden)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f709c572-326d-47e2-b0a8-962f47b1c8c9', 'en-BZ', 'English (Belize)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f71b360b-936f-4ad4-8ac7-7a61d816ff59', 'tn-ZA', 'Setswana (South Africa)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f86524cd-3d94-4315-aed2-5b25675ff655', 'ms-BN', 'Malay (Brunei Darussalam)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('fc22c403-2c0c-4bd9-9761-48e25468067d', 'pt-BR', 'Portuguese (Brazil)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('fd83311f-239d-4b3b-b4a8-02ac010af3d2', 'hy-AM', 'Armenian (Armenia)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('fed16c2b-68ee-4318-a985-173a4171be91', 'rw-RW', 'Kinyarwanda (Rwanda)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ff8b49f4-5b28-487b-8678-84f36e64f573', 'fr-LU', 'French (Luxembourg)', 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_patient`
--

CREATE TABLE `mst_patient` (
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
-- Table structure for table `mst_physician`
--

CREATE TABLE `mst_physician` (
  `physician_uuid` varchar(36) NOT NULL,
  `physician_id` varchar(50) DEFAULT NULL,
  `physician_name` varchar(150) NOT NULL,
  `physician_degree` varchar(150) DEFAULT NULL,
  `physician_status` varchar(150) DEFAULT NULL,
  `physician_speciality` varchar(150) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL,
  `polyclinic_uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_polyclinic`
--

CREATE TABLE `mst_polyclinic` (
  `polyclinic_uuid` varchar(36) NOT NULL,
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

--
-- Dumping data for table `mst_polyclinic`
--

INSERT INTO `mst_polyclinic` (`polyclinic_uuid`, `polyclinic_name`, `polyclinic_description`, `is_leaf`, `level`, `ordering`, `ordering_str`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`, `parent_uuid`) VALUES
('156a57f0-c105-4a6e-8156-9464668483d9', 'General Surgery', 'General Surgery', 0, 2, 0, '001.003.000', 0, 1, '2018-12-05 14:15:20', NULL, NULL, NULL, 'd22372df-74da-4133-a49a-a2fd2d0bb96e'),
('21b7d99d-c873-4f4c-9d3b-a0352f377b9b', 'Obsteric & Gynaecology Clinic', 'Obsteric & Gynaecology Clinic', 0, 1, 2, '001.002', 0, 1, '2018-12-05 13:57:51', NULL, NULL, NULL, NULL),
('2a66903c-03b5-43e5-bbbe-61c697f93462', 'Nutrition Clinic', 'Nutrition Clinic', 0, 1, 9, '001.009', 0, 1, '2018-12-05 13:57:51', NULL, NULL, NULL, NULL),
('37e07383-4eca-459b-af5d-110675fab90e', 'Specialist Clinic', 'Specialist Clinic', 1, 0, 1, '001', 0, 1, '2018-12-05 13:50:03', NULL, NULL, NULL, NULL),
('3d31e0c0-9854-4e11-83fc-929706dcb33a', 'Neuroscience Clinic', 'Neuroscience Clinic', 0, 1, 4, '001.004', 0, 1, '2018-12-05 13:57:51', NULL, NULL, NULL, NULL),
('4973e9f2-e513-4a8c-99c4-9fd99c866a30', 'Nephrology', 'Nephrology', 0, 2, 0, '001.001.000', 0, 1, '2018-12-05 14:00:45', NULL, NULL, NULL, '9790f276-1ad8-446d-b337-d936935b8251'),
('58360613-490c-4308-aa89-3c13164d2703', 'Urology Surgery', 'Urology Surgery', 0, 2, 4, '001.003.004', 0, 1, '2018-12-05 14:15:20', NULL, NULL, NULL, 'd22372df-74da-4133-a49a-a2fd2d0bb96e'),
('795304dc-c3a2-4e8a-9d25-13e2821e00f0', 'Eye Clinic', 'Eye Clinic', 0, 1, 7, '001.007', 0, 1, '2018-12-05 13:57:51', NULL, NULL, NULL, NULL),
('798d9105-6ee7-4fd8-adca-7f34bdbec667', 'Neuro Surgery', 'Neuro Surgery', 0, 2, 1, '001.003.001', 0, 1, '2018-12-05 14:15:20', NULL, NULL, NULL, 'd22372df-74da-4133-a49a-a2fd2d0bb96e'),
('8bc831e8-18f0-4eeb-9593-db0437264ec4', 'General Clinic', 'General Clinic', 1, 0, 0, '000', 0, 1, '2018-12-05 13:50:03', NULL, NULL, NULL, NULL),
('918ae698-083b-4498-aea9-d59f34b23fd0', 'Psychology Clinic', 'Psychology Clinic', 0, 1, 6, '001.006', 0, 1, '2018-12-05 13:57:51', NULL, NULL, NULL, NULL),
('977035a7-4c17-4b18-8a60-4b64102a3c1c', 'Digestive Surgery', 'Digestive Surgery', 0, 2, 2, '001.003.002', 0, 1, '2018-12-05 14:15:20', NULL, NULL, NULL, 'd22372df-74da-4133-a49a-a2fd2d0bb96e'),
('9790f276-1ad8-446d-b337-d936935b8251', 'Internal Medicine Clinic', 'Internal Medicine Clinic', 0, 1, 1, '001.001', 0, 1, '2018-12-05 13:52:36', NULL, NULL, NULL, '37e07383-4eca-459b-af5d-110675fab90e'),
('9d99ed07-d089-4882-94e6-d563d3b9b1de', 'Paediatric Surgery', 'Paediatric Surgery', 0, 2, 3, '001.003.003', 0, 1, '2018-12-05 14:15:20', NULL, NULL, NULL, 'd22372df-74da-4133-a49a-a2fd2d0bb96e'),
('ada5bb12-6d2e-4649-820d-224b4ab24c81', 'Psychiatry Clinic', 'Psychiatry Clinic', 0, 1, 5, '001.005', 0, 1, '2018-12-05 13:57:51', NULL, NULL, NULL, NULL),
('c4a7a5a7-78e1-4974-ad5e-b5559c451f63', 'Pulmonary Clinic', 'Pulmonary Clinic', 0, 1, 10, '001.010', 0, 1, '2018-12-05 13:57:51', NULL, NULL, NULL, NULL),
('d22372df-74da-4133-a49a-a2fd2d0bb96e', 'Surgery Clinic', 'Surgery Clinic', 0, 1, 3, '001.003', 0, 1, '2018-12-05 13:57:51', NULL, NULL, NULL, NULL),
('def2dbea-6ac3-4077-af3a-e60c8075a100', 'ENT Clinic', 'ENT Clinic', 0, 1, 8, '001.008', 0, 1, '2018-12-05 13:57:51', NULL, NULL, NULL, NULL),
('e1feae48-6ea9-4669-a400-0840d0b64912', 'Paediatric Clinic', 'Paediatric Clinic', 0, 1, 0, '001.000', 0, 1, '2018-12-05 13:52:36', NULL, NULL, NULL, '37e07383-4eca-459b-af5d-110675fab90e'),
('f1eec631-1457-4edd-8bec-5dc84e87aba3', 'Gastroenterology', 'Gastroenterology', 0, 2, 1, '001.001.001', 0, 1, '2018-12-05 14:00:45', NULL, NULL, NULL, '9790f276-1ad8-446d-b337-d936935b8251'),
('f366809a-6531-45c2-83b9-6541d4be267d', 'Endocrinology', 'Endocrinology', 0, 2, 2, '001.001.002', 0, 1, '2018-12-05 14:00:45', NULL, NULL, NULL, '9790f276-1ad8-446d-b337-d936935b8251');

-- --------------------------------------------------------

--
-- Table structure for table `mst_polyclinic_locale`
--

CREATE TABLE `mst_polyclinic_locale` (
  `polyclinic_locale_uuid` varchar(36) NOT NULL,
  `polyclinic_uuid` varchar(36) NOT NULL,
  `locale_uuid` varchar(36) NOT NULL,
  `polyclinic_locale_name` varchar(150) NOT NULL,
  `polyclinic_locale_description` text,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_polyclinic_locale`
--

INSERT INTO `mst_polyclinic_locale` (`polyclinic_locale_uuid`, `polyclinic_uuid`, `locale_uuid`, `polyclinic_locale_name`, `polyclinic_locale_description`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('075c0385-c625-471b-95cc-a3d8b8ca0b09', '795304dc-c3a2-4e8a-9d25-13e2821e00f0', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Klinik Mata', 'Klinik Mata', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('109ea82b-0cf3-4f3f-bbdb-0fc378eeda0e', '37e07383-4eca-459b-af5d-110675fab90e', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Klinik Spesialis', 'Klinik Spesialis', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('10cf1415-e0c7-454a-8eea-4f98f7f074ab', 'e1feae48-6ea9-4669-a400-0840d0b64912', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Klinik Anak', 'Klinik Anak', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('11de9154-b58d-4f74-8f21-db0943863508', '2a66903c-03b5-43e5-bbbe-61c697f93462', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Klinik Gizi', 'Klinik Gizi', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('29c7909f-6f98-460e-a527-8d316c01451c', '918ae698-083b-4498-aea9-d59f34b23fd0', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Klinik Psikologi', 'Klinik Psikologi', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('4238a8bb-a289-41c0-9c5f-cdbf59b53c6f', '9d99ed07-d089-4882-94e6-d563d3b9b1de', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Bedah Anak', 'Bedah Anak', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('48b848b1-b4f6-4aa4-9221-26d61939a148', '58360613-490c-4308-aa89-3c13164d2703', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Bedah Saluran Kemih – ESWL', 'Bedah Saluran Kemih – ESWL', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('4d56883e-6f57-4354-a0ab-f9998f018f56', '798d9105-6ee7-4fd8-adca-7f34bdbec667', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Bedah Saraf', 'Bedah Saraf', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('52649521-9603-4e3e-9517-26de1f4fd7a8', 'c4a7a5a7-78e1-4974-ad5e-b5559c451f63', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Klinik Paru', 'Klinik Paru', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('58e5d96c-f213-4a71-91fb-899dc4703a96', '977035a7-4c17-4b18-8a60-4b64102a3c1c', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Bedah Saluran Cerna & Hati', 'Bedah Saluran Cerna & Hati', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('637b40fb-60f6-41b7-b855-9723d5ad0fc1', '9790f276-1ad8-446d-b337-d936935b8251', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Klinik Penyakit Dalam', 'Klinik Penyakit Dalam', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('805f9b01-c348-4dbf-9288-f752c670aa31', '4973e9f2-e513-4a8c-99c4-9fd99c866a30', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Nephrology', 'Nephrology', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('b0c76231-61a8-4ab2-930b-344e04ab7517', 'def2dbea-6ac3-4077-af3a-e60c8075a100', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Klinik THT', 'Klinik THT', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('b20d7ebb-850c-4bc9-88c3-3aa20133952f', 'f1eec631-1457-4edd-8bec-5dc84e87aba3', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Endocrinology', 'Endocrinology', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('b8cf4338-2b1c-4c6e-869e-49b8e7414f88', '21b7d99d-c873-4f4c-9d3b-a0352f377b9b', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Klinik Kebidanan & Kandungan', 'Klinik Kebidanan & Kandungan', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('bd5200b8-0f96-4157-976e-8a77a8232990', '3d31e0c0-9854-4e11-83fc-929706dcb33a', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Klinik Penyakit Saraf', 'Klinik Penyakit Saraf', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('c7c7206b-ba4c-4b69-9d9b-dbef6ea480cf', '156a57f0-c105-4a6e-8156-9464668483d9', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Bedah Umum', 'Bedah Umum', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('d88d37ca-3e98-4492-a7c9-46ace05cce56', 'd22372df-74da-4133-a49a-a2fd2d0bb96e', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Klinik Bedah', 'Klinik Bedah', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('e31834e6-6e17-47ba-835d-dd0a84314045', 'f366809a-6531-45c2-83b9-6541d4be267d', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Gastroenterology', 'Gastroenterology', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('e91dc40b-435b-4c26-a725-70c441644b49', '8bc831e8-18f0-4eeb-9593-db0437264ec4', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Klinik Umum', 'Klinik Umum', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL),
('fc0f66f7-f032-4e5f-a1e2-132921c1ba95', 'ada5bb12-6d2e-4649-820d-224b4ab24c81', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Klinik Kesehatan Jiwa', 'Klinik Kesehatan Jiwa', 0, 1, '2018-12-05 14:42:17', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_r_country_currency`
--

CREATE TABLE `mst_r_country_currency` (
  `country_uuid` varchar(36) NOT NULL,
  `currency_uuid` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_r_country_currency`
--

INSERT INTO `mst_r_country_currency` (`country_uuid`, `currency_uuid`) VALUES
('7a702207-008d-4b35-8fba-eb6cff6c3e8f', 'd4770a10-2ece-4553-978d-859dae711d21'),
('7d9cfb04-d587-4634-a6f1-516f36f660cb', '4a305917-bd23-4593-871d-3e5fd463c06f'),
('183e11fd-dc76-493b-bc45-a6e3ae6d469c', '5d6e8664-5acd-4015-b0ee-93a7f5972ac7'),
('57e21285-216a-49f0-b60b-cd94f185d740', '7d8c9221-a616-4528-aaa9-a7a9037f0bf4'),
('df612e34-6031-4c90-8dfb-1155dba9768b', '7d8c9221-a616-4528-aaa9-a7a9037f0bf4'),
('a9497508-9a72-4326-aa7b-11eaa68e4426', '457be06a-ef54-436f-b454-fec96f0a06d7'),
('48bc0fe4-f87a-4c11-b84b-8ac844ff1e52', 'dfb796e6-d421-4b4f-bed8-f6922a4a9f7c'),
('b40fee99-0d7e-4d30-b4f0-b2b792152025', '535cd0dc-3996-4f87-a675-e72c9d137ffa'),
('c4d74274-ecfc-4bae-9fba-bb69b21902a7', '2e046d8f-9a8f-4d12-9f07-54b58e07aef5'),
('4b67ac60-f3c8-49f1-a311-b63134e5f471', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('31899795-fe12-4b33-aafd-41ed8d3c5cac', 'd4770a10-2ece-4553-978d-859dae711d21'),
('9f58ae68-e47c-42af-b64c-049a46ac5195', '80d0f129-e7a9-4ebb-b70a-320b660f2265'),
('2704b793-0d4b-49aa-a296-d41abaeaaa6f', '4b8b2680-df01-4def-b068-1617272a682a'),
('1786aecc-549a-4649-aae2-7a4ef299dd8e', 'd4770a10-2ece-4553-978d-859dae711d21'),
('bcb9825a-f17f-483e-9b24-ca757ed282c1', 'e0dc05b3-c24a-42e3-b670-bea3e70dd52f'),
('8f95c42f-9698-44fd-ad65-ebb64ea075c1', '6420932b-1f6f-4c6e-8169-820af6dbbda7'),
('33bdd32f-3a1e-4c53-b638-6e37bd756d6e', 'cbe3d1ed-dcb5-4506-b166-f98fd56aeccb'),
('c5b25062-5b98-4ba0-a769-dbd4649a74a5', '8c0ce838-f863-48c3-b5f0-d83a06961441'),
('741ba998-3ad7-4c2e-93d3-48ea94e296ed', 'd4770a10-2ece-4553-978d-859dae711d21'),
('6af0d0d2-346e-4e50-9e4d-c9921ad580e0', '46f98d56-9963-438b-a67b-6c743b399613'),
('2db98553-d132-4590-ae67-6db608e2c2f4', '5cc09387-a7e1-4fb7-8a34-39bce3286efb'),
('18858705-cd87-4ccc-937b-d9a1be7b312c', 'd1441ff3-b772-4afa-b7bc-70e4c74df5d3'),
('250251bd-f2e0-4b55-8e65-72d7ba8c1c6c', '646c1e4b-ebf6-4528-bd18-dfff4e28b0b1'),
('55874952-11f5-4677-aa79-76b8c0fa2531', '46f98d56-9963-438b-a67b-6c743b399613'),
('9bc99490-4cda-426f-a9e7-14dd53769634', 'd4770a10-2ece-4553-978d-859dae711d21'),
('02e8516e-c75f-4dd2-a6cb-ed1352edffc2', 'bebe945b-5b8d-4671-8d7c-ae825ead17ca'),
('26487413-4c22-4295-bfd2-13773fcc4b1e', '5fe4f095-e66b-4571-b755-d41c50d6ea22'),
('0af05b70-e6e9-4611-b8be-6cec75979464', 'c314483c-2061-48a2-8602-93dee0252038'),
('40fc2011-0701-4ee0-954b-5c856c3c9561', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('f1e5fabe-2015-4317-bac3-41db3b0ec5c4', 'aaa0de94-1fe2-43e7-b683-01747ccad1b7'),
('83b80c5e-0859-4253-a56f-4806525b9bac', 'e31acc81-7818-4600-bb21-cb51bc2e6b68'),
('7bcf640f-479e-4fc5-ac22-67cdba4c951a', '2e598704-6ee2-4c79-91fa-aa879275b768'),
('65e72c42-0247-4940-8262-6db2f8124a26', '763a0736-0092-46be-b9fc-0932180645bf'),
('cb04156c-4b09-413f-b60b-711cebf0fc22', 'ac270b53-acba-4a51-b62d-48ecf0241fe2'),
('49d568e6-19e8-412b-b2e1-0d59ab204977', 'bd0820ca-eea0-4156-b88f-31da0fcc2d52'),
('5bc4e785-7c32-4888-b517-98b8e82af015', 'e3745e32-9b4b-4c46-8036-8b6d08c42363'),
('76400944-7a48-449e-ac89-ad62a401c2af', '16b6f927-9614-4fe4-af8c-433e7e2450c7'),
('5ecfb4cd-664f-412e-87e3-f488d0bad482', '80d0f129-e7a9-4ebb-b70a-320b660f2265'),
('84d0e3f2-3461-4a39-9c2e-e63e5f6dd0f5', '296cd59a-3b26-4752-a057-fba49968bd6d'),
('b00ea617-3ff1-46dc-a792-c710493832c7', '9ad5edbe-0dd0-42ac-8409-9fcc48601b23'),
('fbda2826-0bcc-4468-905c-3988e6a83e22', '9ad5edbe-0dd0-42ac-8409-9fcc48601b23'),
('a4f9b23e-882d-4413-bdcf-42443bd3b47b', 'e1aab584-bf65-4692-b751-02881cc36d36'),
('d8592199-42b7-4b3d-91b6-8b66f7c74bb7', '46f98d56-9963-438b-a67b-6c743b399613'),
('2e304585-8ac2-400a-b4f3-6fdf4930b37f', 'd222b767-c84f-47a6-a9d6-388edb25ec41'),
('1a24f98b-aebf-41fc-aa3a-6a73e117c625', '58280858-1093-4adb-9e57-eb6cfb8e2b38'),
('c7595b1c-7195-49b5-be19-2cbac80935aa', '9ad5edbe-0dd0-42ac-8409-9fcc48601b23'),
('7b3c4f0b-2b02-4076-b01d-c4116c33e6dc', '44220973-9ef8-4270-99d6-a96a98126674'),
('af63e7a3-c130-4ef7-b7fa-1448d71c2a12', '685cd55e-d077-43cb-a5b1-3d1dca82f561'),
('b34553eb-ba32-476b-97c3-d20bb5a921aa', '04fbf7b6-645f-4611-804a-0b543699b92d'),
('45390fb0-47bc-41f5-a9b1-c3806104b4e4', '362f7812-c791-4970-9aa9-a77dd3d4545d'),
('5f21c5d8-eef8-42af-86a8-76e89ebabf96', '09f3a78d-6a73-41a8-9ed2-1ce6c1293011'),
('88f5c1dc-51d3-43f3-9111-2a0bca1fb241', 'bfa561bf-2313-40ea-970b-19d6de800ae9'),
('75f6d1dc-5818-464d-aa30-eb722b87f9e6', '80d0f129-e7a9-4ebb-b70a-320b660f2265'),
('b39d0083-e9a1-4148-b70a-78f3d76eff1e', 'd4770a10-2ece-4553-978d-859dae711d21'),
('cea542f2-b1fe-438f-8de2-86bf2bc3cb24', '63cf3ef0-9558-4d44-8ba4-3081bca5d537'),
('4f54e9fb-68fa-4508-a66b-f55024397aab', 'd4770a10-2ece-4553-978d-859dae711d21'),
('4474beed-52ee-42c0-81c1-1bb75e297a88', 'c35055d9-618b-4726-8c58-74419365ae04'),
('eaf68ea8-fa41-4b3d-b69e-3def29e43f23', '784f8170-dbe3-447b-9a16-a1c3d27104ae'),
('cb68cf05-6353-4242-8184-3ad094377722', '7d8c9221-a616-4528-aaa9-a7a9037f0bf4'),
('a0bae906-de4f-4a42-93a1-37b356347749', '3f154fdb-7a05-4ba7-9510-2077b7d7bf60'),
('c74fd42b-cb5f-4120-bd31-bf616b998e53', '8feb6a92-2630-418f-aaab-4c17e315cd90'),
('bc3a065c-a2e3-432e-8e4e-009e9374c28c', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('7e31e3a6-00cd-40fc-9c6e-847f51b99861', 'd4770a10-2ece-4553-978d-859dae711d21'),
('a0fd203a-0b0c-4184-bf17-356974d0ee66', 'f2f8a577-3229-4b89-a55e-ead589bf5d06'),
('e46d9f85-c807-47cf-a5bd-a55f580aa749', 'fba21b1f-2113-4a0a-8140-e1e1d405e4ac'),
('410e9dd3-5aac-4998-9289-6459f1402a07', '26b32709-61db-4b86-a4c5-e69a0596b2fe'),
('d3608251-6a95-48a1-9b7a-affcff38e9c7', 'd4770a10-2ece-4553-978d-859dae711d21'),
('509b3873-aed4-46e2-96bc-70809f8fa6f7', 'bfc17260-b916-4bfa-9f57-391ad4d9d07c'),
('c900b460-f554-4bc0-a198-4803f71a4cc6', 'd4770a10-2ece-4553-978d-859dae711d21'),
('1b8eef25-09b6-47ee-9ee4-a0ac2e8baae0', '12327455-70cf-4835-813f-e5958d28690d'),
('f8ff9ea4-72c9-4344-b806-7cb06e67bf63', '29116177-a0bf-4ee4-8cd1-2bffc3752392'),
('93dcfda9-b0aa-4c64-94f8-272c856c92b2', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('3ee53a34-b63f-47c1-a735-97696721d12f', '784f8170-dbe3-447b-9a16-a1c3d27104ae'),
('ea1e4d33-efd3-4faa-8e0e-e527e03a09b0', 'd4770a10-2ece-4553-978d-859dae711d21'),
('5717a2a9-7d53-447a-9da0-c331c2a1755f', '9ad5edbe-0dd0-42ac-8409-9fcc48601b23'),
('9f436fb8-d720-4346-b809-316d881d7928', 'd7a8be59-f29a-44ec-abe7-b183a411c786'),
('ea2e12d9-b7b6-4a90-88ff-1b29eb1448bf', '7d8c9221-a616-4528-aaa9-a7a9037f0bf4'),
('4afd053b-6f5e-4361-bf19-f2a9eba81196', '59ef40b5-f15e-4c94-a6e8-80c676ab33a9'),
('42bb7332-fab9-4fc8-bd6d-5dd15eb4d1cb', 'd4770a10-2ece-4553-978d-859dae711d21'),
('622ff085-5566-441e-9906-8674b4ca120f', 'd7a8be59-f29a-44ec-abe7-b183a411c786'),
('5b2e4f4f-4e14-4315-83e7-cf6d3b186e14', 'd190fcd1-635e-434d-8312-790ac2291305'),
('0de02195-5882-4e39-b274-bb3b9e531d4b', '02611702-a62b-4172-b971-5a2c5f6e0c23'),
('c5ad73bd-45f4-4c21-aa3a-ecbc54348a66', '784f8170-dbe3-447b-9a16-a1c3d27104ae'),
('baff1c7f-d033-46ea-82d0-1108c0f2beee', '4c50f3b6-99bd-4fe6-bd43-fe1a051c5e29'),
('ae2ad8ed-5499-40a4-8714-f5e54a56dba7', '0633c06a-bca9-47d7-b89c-ebc0058c8853'),
('c0352dc1-80f3-424b-977f-6ceeb3c7ea0e', 'd4770a10-2ece-4553-978d-859dae711d21'),
('6ef06a69-f813-4104-b763-90e2f64ef352', '9ad5edbe-0dd0-42ac-8409-9fcc48601b23'),
('59b2348f-f062-4cc5-a9be-271f13b1fae3', 'd4770a10-2ece-4553-978d-859dae711d21'),
('7877dbd1-7db1-4835-b05e-4ffcd29f932c', 'd7a8be59-f29a-44ec-abe7-b183a411c786'),
('646338d6-4c58-451d-8864-205707460ae5', '58c4facb-670c-469a-af18-0391258eef82'),
('88933f01-f7d2-4ba2-a301-5c94ea2e0247', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('6a0eeeab-9ad8-4f3f-8692-b0495eaf1cd3', '46f98d56-9963-438b-a67b-6c743b399613'),
('d6959d01-7da7-4a6f-b706-27b850e6683a', 'ed028dfb-481b-4a8e-b5f6-0e2b2d6b43e5'),
('93d76704-32dd-4992-930d-034a04b00c2b', 'ec4146a0-37f9-431f-bdf2-f065198f7196'),
('a739f52c-7dc7-4c70-9ecb-ba23c928be20', '80d0f129-e7a9-4ebb-b70a-320b660f2265'),
('d61a20c5-2e5c-47b8-8689-af78765a07d2', 'f8936395-a22a-4512-aa78-56cf66fa25a2'),
('48d3eaaf-cb14-4266-94e8-bc500dd176b7', 'bc45eab5-d1da-487e-97ec-ab1a75489df1'),
('fbe9c49a-cd7a-42a6-a282-e7419f50e142', '963eba7b-5f86-4ef0-93d1-5c1bd0057786'),
('63a55713-b6f1-423d-8ac3-d2a1927ef9fe', '0f9aea4c-b528-493a-94d2-a648dbc5a341'),
('ea4c70b5-a56b-4879-851a-116f39898a6b', 'a3405abe-e851-478c-9f06-4a6b06d614e2'),
('c259b2fb-5a3c-40fc-b033-d559da956bba', 'd4770a10-2ece-4553-978d-859dae711d21'),
('7c3402cd-7404-4499-9a00-aac230d08529', '309648e7-de79-435b-905a-cd5a0883d0ab'),
('2e7b0a55-da57-43ff-9023-72473d13b414', 'd7a8be59-f29a-44ec-abe7-b183a411c786'),
('fa9c6c4a-9f66-4eb3-8794-1214a60ade95', '5daa8067-c7a7-41a6-a7e6-905b0d6fc94f'),
('52479b0b-002d-4864-9f3e-44d057b095fd', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('be3aba62-d18a-4a18-9de3-5845a84a4acb', '565afc10-bdc1-4da9-aeca-d6f9991edf42'),
('7c4fb155-8e36-454e-8a89-d5aa5b066486', 'cecab59f-4b5e-4852-81b7-0047eed26c04'),
('0e01f90b-cc81-49b4-a03a-b86221eb40c6', 'd48ffe93-6ff6-4aed-9772-0b206e82dbfc'),
('6b691214-da90-4ba1-a8ba-e20f41656400', 'd4770a10-2ece-4553-978d-859dae711d21'),
('252ac5ff-a624-4edd-9349-f049df30ffbe', 'd7a8be59-f29a-44ec-abe7-b183a411c786'),
('e4d74059-d56d-47ee-99c9-b958a4fbae9e', 'e1d8de67-696e-42ba-89a0-337cf9ab1816'),
('2c3bde44-0ca7-4c92-bea9-4c629ab951f6', '71b1a1a8-3cb3-4f0a-a49b-ea027b645fac'),
('0bfd2f3d-a9b7-4d91-9db2-4f151c793a5a', '6573c589-4a97-4238-b305-d69ca62c4de0'),
('99ee0204-0462-4007-8ec4-ad8aedc6fc0a', '2137d6b2-a424-4eac-b974-7a09525d4cad'),
('4be3145e-86d5-465a-aec6-f00f46562c72', '7f86d557-70d1-44b5-82f8-00a5f9c974ce'),
('fb46418f-0efb-45ff-a20e-db2503cd2a18', '2ebc2562-a942-47e6-8996-0c7f1e9bcbca'),
('92916cc9-502b-459a-b515-6eca00b57743', '80d0f129-e7a9-4ebb-b70a-320b660f2265'),
('918e9067-4d7b-48e3-bf94-dcc4e9f4b119', 'f1208541-7b68-4137-a141-729d12a113c9'),
('5d74bab0-e483-4e57-be4a-e3342ba341de', '7d8c9221-a616-4528-aaa9-a7a9037f0bf4'),
('57790d27-1380-4c00-93aa-e4398e47e8a8', '78b1094a-0332-4cf3-995e-9aa4e7a32ae4'),
('a57a9912-77ed-4b5a-aab8-0e8d2db29f9a', '297e63e3-b72f-4ae6-95f0-dbf425d21be0'),
('dec59b08-126e-48b4-b51f-77befa0c6c46', 'd4770a10-2ece-4553-978d-859dae711d21'),
('c4aa5585-0d33-45ef-b9d2-b8374df3945f', 'ead26bea-1ea1-43a6-aa66-b6b1b22f94fe'),
('010baa8f-f973-43ec-9a11-b65eee917484', '9b88ae7b-1e61-42de-b86f-9552795cb4d1'),
('73cebb35-c29e-465f-ad88-f1ed31168f2f', 'e33131c1-d0ed-489a-b980-473cce9f318a'),
('f4a13ec2-d4d9-4dd4-ab6d-ed0519abd58b', '0186a9f4-03e8-453f-8ee1-d4546893eca4'),
('ac706ad2-04ab-44fa-93f9-6c9fefe3ba3d', '73a31ec6-65c1-4107-80a3-f52e3d87bb78'),
('ca384124-e2df-4274-aa64-53dcac1c9372', '7d8c9221-a616-4528-aaa9-a7a9037f0bf4'),
('3014cfae-5a46-498e-bcc8-d14c4abd5398', 'e1aab584-bf65-4692-b751-02881cc36d36'),
('dc29d0a8-956a-4199-9bce-ee0ed54e863e', 'fc44f1bf-4800-444f-9c13-92879243930f'),
('39e33244-ceda-4a34-89b5-07bc300c7303', '563057d0-4ad7-4aa0-960e-789f693db10b'),
('7f20b7cc-a1d2-410f-9cd3-8f1c035ad096', 'cdab7142-7a0a-4140-bb9b-c62e09a2916b'),
('9b3b30ee-d8d2-4e52-9d7e-451082b39318', 'd4770a10-2ece-4553-978d-859dae711d21'),
('cbcfdaa0-465d-4442-8594-2df24c9aaed1', 'd4770a10-2ece-4553-978d-859dae711d21'),
('20790050-3e30-4bf6-930b-f8bdfa1af9d4', 'd4770a10-2ece-4553-978d-859dae711d21'),
('b354d927-add4-425d-89fe-3122ff096cf5', '6084e3f9-258a-478d-98ef-8b1c81b23112'),
('f41819d6-41d1-440b-ba0a-da7680909cc5', 'fba21b1f-2113-4a0a-8140-e1e1d405e4ac'),
('42d0a6e3-9091-4642-93d1-84b6a5576036', 'd4770a10-2ece-4553-978d-859dae711d21'),
('58432a38-fe8c-4242-8311-49e2feda70c7', 'ab5667bf-41a8-4f6e-b307-45e497225a68'),
('8f7f6bfe-a475-43aa-b121-3b56f4b80acd', 'd4770a10-2ece-4553-978d-859dae711d21'),
('1ab60de5-deb3-4d7a-b803-ae5f1f4c69ff', 'd4770a10-2ece-4553-978d-859dae711d21'),
('f48f6e5b-9f43-4c2b-80c6-36ef8ccba115', '8fed7883-dde7-4a01-a249-62d129dea41f'),
('040ca195-8943-4c6e-a06f-def483964b79', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('0c945ab9-0afe-4f59-abac-b874f5311edc', 'f7526e80-c898-43d0-b435-073dc0349bf6'),
('12639209-0e38-4ff4-b695-728f80308b36', '46f98d56-9963-438b-a67b-6c743b399613'),
('050a80c4-5d2f-4ac4-9d3a-cf82b7757f58', '686b459f-4f62-466a-84d8-c8b27a73af59'),
('455c5650-dece-4e48-a50e-bd9be4a3fc78', '752ab2ce-8ee2-43e6-943c-a9a0189f3a0a'),
('ed1e4ed3-11ff-474c-b209-612cb11c6a5e', 'c20567c9-b104-4a7f-84c6-e32784d74cdb'),
('71895443-796f-4dd2-9611-05aef07395bd', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('2afc5569-9495-47a7-8b85-b41705008b26', 'd4770a10-2ece-4553-978d-859dae711d21'),
('0823599a-05ce-4047-a93b-9453089b5f97', 'edf17b43-c203-4fd8-967f-757d73be122c'),
('0f11d598-d43f-4240-8ff0-5055e4fc2217', '7d8c9221-a616-4528-aaa9-a7a9037f0bf4'),
('3ba4da18-3d4d-43c8-9e1f-853a1515bf54', 'd4770a10-2ece-4553-978d-859dae711d21'),
('c93d4220-ac7d-4dd5-8991-6953ba343a51', '23249f07-e07f-42b8-879f-bcfa41049b84'),
('df1b9962-c88f-43e5-b98e-e2006eb1c6d1', '346b147e-d9c5-4ef5-98a3-375c51edccdf'),
('16646b91-51fe-4a25-9fd4-1482f129aac7', '4662b982-4d2c-44a5-8559-41ac6dc0afb3'),
('14146646-7347-4119-91f6-2ee5dd8e19b8', '9c340201-9c0e-4807-926e-500b469dadd2'),
('c9fc73ea-143a-4c7e-9a6f-57b9b08215f8', 'a9cac414-4dc0-4aa5-a4bb-5a1cce883d9d'),
('c56269cc-bc26-4cf8-a394-31bad1bbab1a', 'f2eb955c-a946-453a-9b4d-5824181d1698'),
('05c0c26d-a3c6-4ccb-a7f4-5d78bd952051', '309c892d-f02d-4aa0-9913-f4d24d85c80f'),
('ba4d7066-aa7f-4dec-86fc-13a73c457480', 'efc34850-d149-40fd-8a2f-86715bb7739f'),
('ed29456b-d2db-4ede-9509-1a3829cbafc0', '46f98d56-9963-438b-a67b-6c743b399613'),
('cda9ae0b-7ad8-4602-9303-1e8ba536ed2e', '80d0f129-e7a9-4ebb-b70a-320b660f2265'),
('5ab9b5d5-c63a-4bd8-9b88-6aa8db5e1477', '626ded52-95fb-41a9-9ebe-fb328901893f'),
('5937bfea-4ed2-41a4-a298-8fa8f15d085f', 'd810f9f8-c6c8-42c9-a1ce-cdc95c039b16'),
('63df775f-29c7-4642-93ad-1fba5b270abc', 'd4770a10-2ece-4553-978d-859dae711d21'),
('f2d35b5e-1553-4274-b787-3ca3ae9f6c60', '763a0736-0092-46be-b9fc-0932180645bf'),
('61dac06b-6e77-4749-8700-c3091a32391a', 'a2a9cedd-8b01-4ca6-993c-fb08f8c0db29'),
('e4f44d1c-8813-435a-b268-a390d4a8eaa9', '80d0f129-e7a9-4ebb-b70a-320b660f2265'),
('92ae615a-2fa6-4cdb-9681-dcf07df054d9', 'd222b767-c84f-47a6-a9d6-388edb25ec41'),
('ff5ac6fb-b67f-4249-bd40-a46d176d153f', 'd222b767-c84f-47a6-a9d6-388edb25ec41'),
('de701ab3-5e48-4dbb-b86e-bc56d4760961', '999ad959-bc70-402a-9723-d5cdafb93465'),
('1bbd44a6-0e33-4f01-bd6e-a626e4bf5a10', 'f3850cbd-1b03-4445-879c-3579c0b8449a'),
('f9a52d0d-2418-494a-9fb3-66902083dede', '65adc2c6-7bba-48da-82e6-d8daea30a8eb'),
('d8c9ee80-f8dc-4ea4-ac76-1bb226dddfe3', 'efc34850-d149-40fd-8a2f-86715bb7739f'),
('7ff38c53-f260-4271-86ff-7e5c6bb86ed1', '2351332c-545d-438e-b429-7ed30d0b61a3'),
('87078509-c8f3-4d96-865b-e371ac477d3f', '22ceef18-f454-469d-9967-9b3837ec84ce'),
('98c51600-3499-412e-bf43-21f15fc4de32', 'd5851f89-1951-41ba-801f-7bd85a942ef4'),
('338f0ed6-5493-428c-9204-9c5a725fb618', 'e5ce925b-da20-47fe-9ee2-b40fb38852db'),
('9b80d010-c435-41db-90b9-c67e06b65276', 'd4770a10-2ece-4553-978d-859dae711d21'),
('6f7467f4-27db-47d7-a5bb-85e6d5fdd212', 'd222b767-c84f-47a6-a9d6-388edb25ec41'),
('946503dd-233b-45da-b714-e386827eba8d', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('d14d9883-c2ee-411f-b0a1-45ff3b25ab52', '309648e7-de79-435b-905a-cd5a0883d0ab'),
('09759c08-6263-4f00-9d3b-95f961274b1d', 'd4770a10-2ece-4553-978d-859dae711d21'),
('5be22e47-1e03-4508-84f1-8ee20b46f959', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('8a6515ce-40af-4e02-9baa-954ef7af2e7a', '7ca454c5-e7e8-43b7-859b-c8a16cb70d91'),
('63ddcda7-0f7c-46b7-992d-3f434fade7f8', '50a9e7a0-b0d1-4a88-8a2e-e8111593aed6'),
('143663cd-a645-46c1-afd7-df5ea1de0ff9', 'd4770a10-2ece-4553-978d-859dae711d21'),
('f3e27891-738f-4842-87a0-782292193d83', 'fe4001ea-6353-4294-8d94-82566d67850e'),
('ab56e14b-dc40-4e54-9875-52e3c79ebf5c', '975790d5-65db-4c18-9610-8b7f6b330a0d'),
('1ab72323-cbf2-4bc7-97b9-4e8be3c0cae9', '778c22ce-6ec4-42c8-9537-7baf51ead860'),
('b5de4dfd-d4d1-4e5d-aca1-6ab3962a037a', '694490b5-eb6a-4650-8f85-612bcc9cbd0e'),
('6a5a4edf-a10b-4a85-a8bb-99d3b569b12a', '5de9164b-f471-4400-8501-7c852931226e'),
('5f639fc6-b7c8-45cf-8fb1-cc4b8182dbc2', 'de3acb8c-98c3-408b-8b3f-7f31cca1fad9'),
('25ca173e-fd72-4843-ac80-ce02a54471be', '47295c67-93fa-4535-91d3-b3d3f160d134'),
('57627aea-4193-44e5-a5cd-a28cc9d5d099', 'e8f28fe1-1766-4590-9b56-9258b140fac9'),
('2cb257ad-9b0e-4065-a66b-2a9f3adb3c5f', '774b1e3b-5677-490c-ac0a-6beb8bce1b72'),
('70ba35f3-2fa8-4b3a-b0fe-5ff5b733ede5', '5d438d40-030d-4321-b16c-bd475bbba92a'),
('fded8ee3-a338-416a-8094-55b48fc8d408', 'ad19ab3c-7e54-4f90-a00e-99027a7bdf98'),
('b81276f2-2b8f-41ad-9603-04523d525476', '93ab6b1c-395a-4bc9-a7ef-38486c036fb4'),
('bacfe7f8-0e6b-466f-8c36-3a462aef6ac9', 'd4770a10-2ece-4553-978d-859dae711d21'),
('025aac2d-5a5c-41b1-840e-645de7b5ceab', '763a0736-0092-46be-b9fc-0932180645bf'),
('e573863e-a6ac-4819-9d99-3ba2da993863', 'd4770a10-2ece-4553-978d-859dae711d21'),
('7c906a1a-20a8-48a7-aabf-498a8ee53dee', 'a7e36058-0213-44c5-8968-67bd519568ff'),
('42c56507-feff-493c-a87c-2cbf28653fca', 'd4770a10-2ece-4553-978d-859dae711d21'),
('7b81430d-7d4f-4d27-a878-7ddcaa3bb9b4', '46f98d56-9963-438b-a67b-6c743b399613'),
('4562becb-57de-49f9-8fc1-ec24195bfc81', 'd2ba20f9-8150-4612-b1fb-2888762e3220'),
('0a11a62f-0886-45fa-8e81-0c3b32fcff31', 'af312926-8717-42f7-9c85-2bb04c686f38'),
('067bf653-74c9-4987-911a-13077e8b8716', '38f9eca2-c3de-4f3d-a658-d7462bb071b7'),
('49bdbc35-4502-4db8-8d05-65fa7594c56b', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('a5034947-3810-4755-9f99-21d838710806', 'bfa561bf-2313-40ea-970b-19d6de800ae9'),
('0b3789a5-36d9-4b51-bc7f-17f7dcd07326', '1c5e197d-0da4-4af9-82bc-e6d39c78e8b3'),
('4d969701-5a2c-44d9-9fff-bd61bd9a4720', 'f25ead9c-05ce-4484-b46f-982aaa4edf1e'),
('6114daf7-b7c2-4132-8ab6-7b07145a92bc', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('04bcf5d7-978d-4400-bde5-04c3ab8eae8b', '9ad5edbe-0dd0-42ac-8409-9fcc48601b23'),
('0a8fb47b-4572-419e-b72c-d73ca43cd58f', 'd4770a10-2ece-4553-978d-859dae711d21'),
('566fe657-5180-4057-ab23-476b6db9d7b8', '46f98d56-9963-438b-a67b-6c743b399613'),
('040a6d89-51fc-4ce1-9cde-08f0ef406b03', '890ba68e-c3ea-488e-b220-463f4ad945a4'),
('81a7b7f1-91b4-474f-af64-cf203a49d3ee', '4766c6d7-1e6f-44ed-b078-01d5b9b8b4e7'),
('b5a01970-5ea6-40e2-90dc-f0f7c7075887', 'd222b767-c84f-47a6-a9d6-388edb25ec41'),
('b82a365c-3955-45ed-aa03-390061cb0869', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('b7669c27-87e4-44d9-b026-ffeb487d6e16', '43ade1b1-3cfa-44e8-8636-f3ba4839a356'),
('c0cc01fd-e8dd-4c89-80a0-b834698033d4', '7c127175-05ac-40fd-acef-bfc75946d01c'),
('f87c241e-b223-46d2-a21d-c4f6246abe94', '48184cb9-839c-4224-9713-b6ed84e66b37'),
('58e558ed-f535-46d2-b1bf-d3e752f51306', '141624d3-e7f6-4031-aa82-2e5a706301fd'),
('5cf5f2f7-db09-43f9-b494-8974288c014c', '59618949-6286-476f-a378-5e9488b6796d'),
('e831875c-8b9c-43f7-8ee5-5ded2f52c8e0', '80d0f129-e7a9-4ebb-b70a-320b660f2265'),
('15226976-8474-433a-ae53-104fd84dc791', '86b2e48b-af45-4b41-90f4-496d6d9f2217'),
('fa362921-0ed1-4cf6-ad07-a6e52eb96a9d', 'd6656da6-32f4-4910-be9b-2b61bc4642ee'),
('807307c0-0ff3-4fb0-aacf-7daa53bc609a', '8ff86e08-6887-4e98-96d7-2c2790f0f777'),
('36d675f7-228a-4da8-b419-6257f977f7c6', '0b40b1e2-102a-4446-bdf5-78a1e338f5da'),
('c11e0064-7f1b-449e-9e99-1d156ab31c00', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('a28dea04-95a6-4268-94a5-9864ef9b2ef6', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('871fe7cb-8faf-46db-a06e-9600516335ec', 'fc6a9f80-7239-4f26-a470-5295c9f75896'),
('a3b1fbb6-1a6a-40f9-96dd-b20ee8dd5c1a', '9a39dbd2-baf7-48f4-a67a-fde08d99f3c8'),
('fc72643d-dcf1-4811-b8d3-f5121b67dc22', 'd4770a10-2ece-4553-978d-859dae711d21'),
('16fc24b5-dc35-4953-831b-aa64b7713068', '7d8c9221-a616-4528-aaa9-a7a9037f0bf4'),
('e3d17879-7fa7-43d2-bbbb-081be3dde13b', '0e069a3f-f096-49db-a898-e1ec362af30d'),
('8f7b879b-4f9f-4fc7-a403-6d56cbf4ee70', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('79546002-4bc0-4c6f-a191-2a6eb2aacfac', 'd3ce26e2-a652-40be-8a56-b9315dd73540'),
('34ee3669-73df-4d67-bf57-ba1b04ada0f7', '03d0c637-fe12-47dc-a999-3cf7b808fe3c'),
('1d2373b8-4138-459c-ba88-673210b08c5d', '559f8221-f38e-4610-a840-1502f7fb879f'),
('c0d408e8-5ced-44b3-9858-db281c88e9f0', 'efc34850-d149-40fd-8a2f-86715bb7739f'),
('f75a3e9f-6824-4d6b-a8f2-f87261c86dd5', '2b90f230-227e-46e3-a4ff-ad23658c2955'),
('0490d930-b7b6-41eb-8e66-9b6db5e4d095', '3cf22638-18ca-4170-9477-02471ca7f7f0'),
('76c5fafc-b8b9-4f1a-9d5c-51e03ed07643', 'd4770a10-2ece-4553-978d-859dae711d21'),
('59908e16-db71-4b08-b11f-461dfc890b57', '66254341-3345-48c9-af7e-0bc702d85c35'),
('04bdd768-af74-4a2a-965c-d410b8e924b7', 'da9452b2-abd7-42eb-94f0-4538eeb867c9'),
('e4691702-d2db-4099-b7de-5cfbc2ee5542', '11205dba-862d-46af-9605-c9bf0db65159'),
('25b46fc9-180b-4191-89dd-d2de6dfc46b5', '975790d5-65db-4c18-9610-8b7f6b330a0d'),
('fab6ef95-b996-478d-a974-0d7ec1abb65f', 'bfa561bf-2313-40ea-970b-19d6de800ae9');

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

--
-- Dumping data for table `oauth_access_token`
--

INSERT INTO `oauth_access_token` (`token_id`, `token`, `authentication_id`, `user_name`, `client_id`, `authentication`, `refresh_token`) VALUES
('e4c7467ae02e54b87c5131c350508b7d', 0xaced0005737200436f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f4175746832416363657373546f6b656e0cb29e361b24face0200064c00156164646974696f6e616c496e666f726d6174696f6e74000f4c6a6176612f7574696c2f4d61703b4c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b4c000c72656672657368546f6b656e74003f4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f636f6d6d6f6e2f4f417574683252656672657368546f6b656e3b4c000573636f706574000f4c6a6176612f7574696c2f5365743b4c0009746f6b656e547970657400124c6a6176612f6c616e672f537472696e673b4c000576616c756571007e00057870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000006770800000008000000057400046e616d6574000d41646d696e6973747261746f7274000969704164647265737374000f303a303a303a303a303a303a303a317400066465766963657400734d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f37302e302e333533382e313130205361666172692f3533372e3336740005656d61696c74000f61646d696e406370752e636f2e69647400036a746974002432316564623330662d306664662d346338302d386438312d37626532326164343430646378007372000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000167728de78b78737200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c756571007e0005787074026c65794a68624763694f694a49557a49314e694973496e523563434936496b705856434a392e65794a68645751694f6c736963484a765a6d6c735a534a644c434a316332567958323568625755694f694a685a47317062694973496e4e6a6233426c496a7062496d5a31624777695853776959585270496a6f694d6a466c5a47497a4d4759744d475a6b5a693030597a67774c54686b4f4445744e324a6c4d6a4a685a4451304d47526a49697769626d46745a534936496b466b62576c7561584e30636d4630623349694c434a706345466b5a484a6c63334d694f6949774f6a41364d446f774f6a41364d446f774f6a45694c434a6b5a585a70593255694f694a4e62337070624778684c7a55754d43416f56326c755a4739336379424f564341784d4334774f794258615734324e447367654459304b534242634842735a56646c596b7470644338314d7a63754d7a59674b4574495645314d4c4342736157746c4945646c593274764b53424461484a76625755764e7a41754d43347a4e544d344c6a45784d43425459575a68636d6b764e544d334c6a4d32496977695958563061473979615852705a584d694f6c7369556b394d525639425245314a54694a644c434a7164476b694f6949784e6d49314e44686b4d533079597a51314c54526b4e325174596a59344e69316b4d7a4e694f4449314e474979597a59694c434a6c6257467062434936496d466b62576c7551474e776453356a627935705a434973496d4e7361575675644639705a434936496e4a706343316a62334a6c496e302e4942585a6c576530456670695746695543795270757849444e4646317176384e583664795f3555375f4573737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c0001637400164c6a6176612f7574696c2f436f6c6c656374696f6e3b7870737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000174000466756c6c7874000662656172657274024765794a68624763694f694a49557a49314e694973496e523563434936496b705856434a392e65794a68645751694f6c736963484a765a6d6c735a534a644c434a316332567958323568625755694f694a685a47317062694973496e4e6a6233426c496a7062496d5a316247776958537769626d46745a534936496b466b62576c7561584e30636d4630623349694c434a706345466b5a484a6c63334d694f6949774f6a41364d446f774f6a41364d446f774f6a45694c434a6c654841694f6a45314e444d344d5455784e6a4573496d526c646d6c6a5a534936496b3176656d6c73624745764e533477494368586157356b6233647a49453555494445774c6a413749466470626a59304f7942344e6a5170494546776347786c5632566953326c304c7a557a4e79347a4e69416f533068555455777349477870613255675232566a6132387049454e6f636d39745a5338334d4334774c6a4d314d7a67754d54457749464e685a6d4679615338314d7a63754d7a59694c434a686458526f62334a7064476c6c6379493657794a53543078465830464554556c4f496c3073496d703061534936496a49785a5752694d7a426d4c54426d5a4759744e474d344d4330345a4467784c5464695a544979595751304e44426b59794973496d567459576c73496a6f695957527461573541593342314c6d4e764c6d6c6b49697769593278705a57353058326c6b496a6f69636d6c774c574e76636d556966512e476f306157744f64624248517349385836447a4d4d465a4f506b6a6c5767486d3361497a554f4b6c615045, '21c6912b9b5cb7062b39032561a1de47', 'admin', 'rip-core', 0xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017372002469642e636f2e6370752e73656375726974792e656e746974792e526f6c65456e74697479ae89047391fd9b0a0200044c0009617574686f726974797400124c6a6176612f6c616e672f537472696e673b4c000b6465736372697074696f6e71007e000e4c0002696471007e000e4c0005757365727374000f4c6a6176612f7574696c2f5365743b7872002769642e636f2e6370752e636f6d6d6f6e2e656e746974792e426173654175646974456e7469747900000000000000010200065a000661637469766549000776657273696f6e4c000963726561746564427971007e000e4c000b63726561746564446174657400104c6a6176612f7574696c2f446174653b4c000a6d6f646966696564427971007e000e4c000c6d6f6469666965644461746571007e00117870010000000070737200126a6176612e73716c2e54696d657374616d702618d5c80153bf650200014900056e616e6f737872000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001676f3119607800000000707074000a524f4c455f41444d494e740012526f6c652041646d696e6973747261746f7274002430366265383064662d356334312d343261372d393035302d6233323833313264326633617372002f6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e50657273697374656e7453657486e4fda1f2eee0af0200014c000373657471007e000f7872003e6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e416273747261637450657273697374656e74436f6c6c656374696f6e627400d05f55733c02000a5a001b616c6c6f774c6f61644f7574736964655472616e73616374696f6e49000a63616368656453697a655a000564697274795a000b696e697469616c697a65645a000d697354656d7053657373696f6e4c00036b65797400164c6a6176612f696f2f53657269616c697a61626c653b4c00056f776e657271007e00054c0004726f6c6571007e000e4c001273657373696f6e466163746f72795575696471007e000e4c000e73746f726564536e617073686f7471007e001b787000ffffffff00000071007e001871007e001274002a69642e636f2e6370752e73656375726974792e656e746974792e526f6c65456e746974792e75736572737070707871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200075a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c00077265667265736874003b4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f546f6b656e526571756573743b4c000b7265736f7572636549647371007e000f4c000d726573706f6e7365547970657371007e000f787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e001f4c000573636f706571007e000f78707400087269702d636f7265737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e001f7870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000067708000000080000000374000a6772616e745f7479706574000870617373776f7264740009636c69656e745f69647400087269702d636f7265740008757365726e616d6574000561646d696e78737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000174000466756c6c78017371007e0031770c000000103f40000000000001737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001a40200014c0004726f6c6571007e000e78707400114150505f434c49454e545f4f4155544832787371007e00263f40000000000000770800000010000000007870707371007e0031770c000000103f4000000000000174000770726f66696c65787371007e0031770c000000103f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001a40200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000177040000000171007e00127871007e003f737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00263f400000000000067708000000080000000371007e002871007e002971007e002a71007e002b71007e002c71007e002d7800707372002469642e636f2e6370752e73656375726974792e656e746974792e55736572456e74697479de198690286fa77e0200145a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c00076164647265737371007e000e4c00046369747971007e000e4c000b6465736372697074696f6e71007e000e4c000c6469737472696374436f646571007e000e4c000c6469766973696f6e436f646571007e000e4c0005656d61696c71007e000e4c0002696471007e000e4c000c6d6f62696c654e756d62657271007e000e4c00046e616d6571007e000e4c000870617373776f726471007e000e4c000b70686f6e654e756d62657271007e000e4c000870726f76696e636571007e000e4c000372617771007e000e4c0005726f6c657371007e000f4c0008757365726e616d6571007e000e4c0010766572696669636174696f6e436f646571007e000e7871007e00100100000000707371007e00137708000001676f2f488878000000007070010101017400007070707074000f61646d696e406370752e636f2e696474002431616332393231352d373565382d346531392d623466312d6530373664613763613161627074000d41646d696e6973747261746f7274003c24326124313324576c4b56577a587a4c4c466935624352514a36416f2e6f4468363150746d2f655057623859364533666b7865742f51322e5645692e7070707371007e001900ffffffff00010071007e004771007e004374002a69642e636f2e6370752e73656375726974792e656e746974792e55736572456e746974792e726f6c6573707371007e00263f400000000000017708000000020000000171007e001271007e0012787371007e0031770c000000103f4000000000000171007e00127874000561646d696e70, 'ebbfcda11759725117ff562d6124208e'),
('0d5eeb80fabce6a5576b4fe539f75c0e', 0xaced0005737200436f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f4175746832416363657373546f6b656e0cb29e361b24face0200064c00156164646974696f6e616c496e666f726d6174696f6e74000f4c6a6176612f7574696c2f4d61703b4c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b4c000c72656672657368546f6b656e74003f4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f636f6d6d6f6e2f4f417574683252656672657368546f6b656e3b4c000573636f706574000f4c6a6176612f7574696c2f5365743b4c0009746f6b656e547970657400124c6a6176612f6c616e672f537472696e673b4c000576616c756571007e00057870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000006770800000008000000057400046e616d6574000d41646d696e6973747261746f7274000969704164647265737374000f303a303a303a303a303a303a303a317400066465766963657400734d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f37302e302e333533382e313130205361666172692f3533372e3336740005656d61696c74000f61646d696e406370752e636f2e69647400036a746974002466623331623234382d366430392d343361622d616564622d33373936343532363964333378007372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001677420fe86787372004c6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744578706972696e674f417574683252656672657368546f6b656e2fdf47639dd0c9b70200014c000a65787069726174696f6e71007e0002787200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c756571007e000578707402d165794a68624763694f694a49557a49314e694973496e523563434936496b705856434a392e65794a68645751694f6c73696332566a64584a7064486b694c434a77636d396d6157786c49697769636d567762334a30496977696257467a64475679496c3073496e567a5a584a66626d46745a534936496d466b62576c754969776963324e76634755694f6c7369636d56685a434973496e64796158526c4969776964484a31633351694c434a6a6147566a613139306232746c62694a644c434a6864476b694f694a6d596a4d78596a49304f4330325a4441354c54517a595749745957566b5969307a4e7a6b324e4455794e6a6c6b4d7a4d694c434a755957316c496a6f695157527461573570633352795958527663694973496d6c775157526b636d567a63794936496a41364d446f774f6a41364d446f774f6a41364d534973496d5634634349364d5455304d7a677a4e7a6b334f4377695a47563261574e6c496a6f695457393661577873595338314c6a41674b466470626d527664334d67546c51674d5441754d44736756326c754e6a5137494867324e436b6751584277624756585a574a4c615851764e544d334c6a4d324943684c5346524e5443776762476c725a5342485a574e7262796b67513268796232316c4c7a63774c6a41754d7a557a4f4334784d5441675532466d59584a704c7a557a4e79347a4e694973496d463164476876636d6c306157567a496a7062496c4a50544556665155524e5355346958537769616e5270496a6f694d47557a4d7a41324e5455744d444669596930304d6a51324c574669595745744e474e6959324531593249354d575a68496977695a573168615777694f694a685a473170626b426a6348557559323875615751694c434a6a62476c6c626e5266615751694f694a7961584174593239795a534a392e516f4870567356465a71782d57744f576b4563715032536376704b7949492d365f397a6e4f593279624d557371007e001477080000016773ea100578737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c0001637400164c6a6176612f7574696c2f436f6c6c656374696f6e3b7870737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f40000000000004740004726561647400057772697465740005747275737474000b636865636b5f746f6b656e7874000662656172657274029565794a68624763694f694a49557a49314e694973496e523563434936496b705856434a392e65794a68645751694f6c73696332566a64584a7064486b694c434a77636d396d6157786c49697769636d567762334a30496977696257467a64475679496c3073496e567a5a584a66626d46745a534936496d466b62576c754969776963324e76634755694f6c7369636d56685a434973496e64796158526c4969776964484a31633351694c434a6a6147566a613139306232746c62694a644c434a755957316c496a6f695157527461573570633352795958527663694973496d6c775157526b636d567a63794936496a41364d446f774f6a41364d446f774f6a41364d534973496d5634634349364d5455304d7a67304d5455334f4377695a47563261574e6c496a6f695457393661577873595338314c6a41674b466470626d527664334d67546c51674d5441754d44736756326c754e6a5137494867324e436b6751584277624756585a574a4c615851764e544d334c6a4d324943684c5346524e5443776762476c725a5342485a574e7262796b67513268796232316c4c7a63774c6a41754d7a557a4f4334784d5441675532466d59584a704c7a557a4e79347a4e694973496d463164476876636d6c306157567a496a7062496c4a50544556665155524e5355346958537769616e5270496a6f695a6d497a4d5749794e4467744e6d51774f5330304d3246694c57466c5a4749744d7a63354e6a51314d6a59355a444d7a496977695a573168615777694f694a685a473170626b426a6348557559323875615751694c434a6a62476c6c626e5266615751694f694a7961584174593239795a534a392e624e784161515a70736e6c6877456d595f5f4f435653645359674b3746336c44436749764b3362314a3130, '342f0b71b779ee26d3fd300d73e5d211', 'admin', 'rip-core', 0xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017372002469642e636f2e6370752e73656375726974792e656e746974792e526f6c65456e74697479ae89047391fd9b0a0200044c0009617574686f726974797400124c6a6176612f6c616e672f537472696e673b4c000b6465736372697074696f6e71007e000e4c0002696471007e000e4c0005757365727374000f4c6a6176612f7574696c2f5365743b7872002769642e636f2e6370752e636f6d6d6f6e2e656e746974792e426173654175646974456e7469747900000000000000010200065a000661637469766549000776657273696f6e4c000963726561746564427971007e000e4c000b63726561746564446174657400104c6a6176612f7574696c2f446174653b4c000a6d6f646966696564427971007e000e4c000c6d6f6469666965644461746571007e00117870010000000070737200126a6176612e73716c2e54696d657374616d702618d5c80153bf650200014900056e616e6f737872000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001676f3119607800000000707074000a524f4c455f41444d494e740012526f6c652041646d696e6973747261746f7274002430366265383064662d356334312d343261372d393035302d6233323833313264326633617372002f6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e50657273697374656e7453657486e4fda1f2eee0af0200014c000373657471007e000f7872003e6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e416273747261637450657273697374656e74436f6c6c656374696f6e627400d05f55733c02000a5a001b616c6c6f774c6f61644f7574736964655472616e73616374696f6e49000a63616368656453697a655a000564697274795a000b696e697469616c697a65645a000d697354656d7053657373696f6e4c00036b65797400164c6a6176612f696f2f53657269616c697a61626c653b4c00056f776e657271007e00054c0004726f6c6571007e000e4c001273657373696f6e466163746f72795575696471007e000e4c000e73746f726564536e617073686f7471007e001b787000ffffffff00000071007e001871007e001274002a69642e636f2e6370752e73656375726974792e656e746974792e526f6c65456e746974792e75736572737070707871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200075a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c00077265667265736874003b4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f546f6b656e526571756573743b4c000b7265736f7572636549647371007e000f4c000d726573706f6e7365547970657371007e000f787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e001f4c000573636f706571007e000f78707400087269702d636f7265737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e001f7870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000067708000000080000000374000a6772616e745f7479706574000870617373776f7264740009636c69656e745f69647400087269702d636f7265740008757365726e616d6574000561646d696e78737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f40000000000004740004726561647400057772697465740005747275737474000b636865636b5f746f6b656e78017371007e0031770c000000103f40000000000004737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001a40200014c0004726f6c6571007e000e787074000b524f4c455f444f43544f527371007e0038740008524f4c455f454e447371007e003874000a524f4c455f41444d494e7371007e0038740011524f4c455f524144494f47524150484552787371007e00263f40000000000000770800000010000000007870707371007e0031770c000000103f40000000000004740008736563757269747974000770726f66696c657400067265706f72747400066d6173746572787371007e0031770c000000103f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001a40200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000177040000000171007e00127871007e004b737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00263f400000000000067708000000080000000371007e002871007e002971007e002a71007e002b71007e002c71007e002d7800707372002469642e636f2e6370752e73656375726974792e656e746974792e55736572456e74697479de198690286fa77e0200145a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c00076164647265737371007e000e4c00046369747971007e000e4c000b6465736372697074696f6e71007e000e4c000c6469737472696374436f646571007e000e4c000c6469766973696f6e436f646571007e000e4c0005656d61696c71007e000e4c0002696471007e000e4c000c6d6f62696c654e756d62657271007e000e4c00046e616d6571007e000e4c000870617373776f726471007e000e4c000b70686f6e654e756d62657271007e000e4c000870726f76696e636571007e000e4c000372617771007e000e4c0005726f6c657371007e000f4c0008757365726e616d6571007e000e4c0010766572696669636174696f6e436f646571007e000e7871007e00100100000000707371007e00137708000001676f2f488878000000007070010101017400007070707074000f61646d696e406370752e636f2e696474002431616332393231352d373565382d346531392d623466312d6530373664613763613161627074000d41646d696e6973747261746f7274003c243261243133246e6e6332774c77565577312e73776b5833353351544f46596f535a67515a50555576624164306d67585637444d75354b6f724b772e7070707371007e001900ffffffff00010071007e005371007e004f74002a69642e636f2e6370752e73656375726974792e656e746974792e55736572456e746974792e726f6c6573707371007e00263f400000000000017708000000020000000171007e001271007e0012787371007e0031770c000000103f4000000000000171007e00127874000561646d696e70, '933f25b135ac0097073ed0b11cee6603'),
('34edf373041fcffc629206dd0f84543d', 0xaced0005737200436f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f4175746832416363657373546f6b656e0cb29e361b24face0200064c00156164646974696f6e616c496e666f726d6174696f6e74000f4c6a6176612f7574696c2f4d61703b4c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b4c000c72656672657368546f6b656e74003f4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f636f6d6d6f6e2f4f417574683252656672657368546f6b656e3b4c000573636f706574000f4c6a6176612f7574696c2f5365743b4c0009746f6b656e547970657400124c6a6176612f6c616e672f537472696e673b4c000576616c756571007e00057870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c770800000010000000057400046e616d6574000a50617469656e7420303174000969704164647265737374000f303a303a303a303a303a303a303a317400066465766963657400734d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f37302e302e333533382e313130205361666172692f3533372e3336740005656d61696c74001370617469656e743031406370752e636f2e69647400036a746974002437616439326661652d613836622d346365632d383762372d39633561333139343434353378007372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001677328cdc2787372004c6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744578706972696e674f417574683252656672657368546f6b656e2fdf47639dd0c9b70200014c000a65787069726174696f6e71007e0002787200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c756571007e000578707402d365794a68624763694f694a49557a49314e694973496e523563434936496b705856434a392e65794a68645751694f6c73696332566a64584a7064486b694c434a77636d396d6157786c49697769636d567762334a30496977696257467a64475679496c3073496e567a5a584a66626d46745a534936496e426864476c6c626e51694c434a7a593239775a53493657794a795a57466b4969776964334a70644755694c434a30636e567a64434973496d4e6f5a574e725833527661325675496c3073496d463061534936496a64685a446b795a6d466c4c5745344e6d49744e474e6c597930344e3249334c546c6a4e57457a4d546b304e4451314d794973496d3568625755694f694a51595852705a5735304944417849697769615842425a4752795a584e7a496a6f694d446f774f6a41364d446f774f6a41364d446f78496977695a586877496a6f784e54517a4f4449784e7a457a4c434a6b5a585a70593255694f694a4e62337070624778684c7a55754d43416f56326c755a4739336379424f564341784d4334774f794258615734324e447367654459304b534242634842735a56646c596b7470644338314d7a63754d7a59674b4574495645314d4c4342736157746c4945646c593274764b53424461484a76625755764e7a41754d43347a4e544d344c6a45784d43425459575a68636d6b764e544d334c6a4d32496977695958563061473979615852705a584d694f6c7369556b394d52563946546b516958537769616e5270496a6f694e5745784f4455774e6a6b744e474930596930304e546b354c5749344e7a4174596a42684e6d4d344f4463354d57466b496977695a573168615777694f694a77595852705a5735304d444641593342314c6d4e764c6d6c6b49697769593278705a57353058326c6b496a6f69636d6c774c574e76636d556966512e5f516d49694c345f764b434141766f72614e4b515f6969526b486b41396966665a50446f785a587954754d7371007e001477080000016772f1df4178737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c0001637400164c6a6176612f7574696c2f436f6c6c656374696f6e3b7870737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000083f40000000000004740004726561647400057772697465740005747275737474000b636865636b5f746f6b656e7874000662656172657274029765794a68624763694f694a49557a49314e694973496e523563434936496b705856434a392e65794a68645751694f6c73696332566a64584a7064486b694c434a77636d396d6157786c49697769636d567762334a30496977696257467a64475679496c3073496e567a5a584a66626d46745a534936496e426864476c6c626e51694c434a7a593239775a53493657794a795a57466b4969776964334a70644755694c434a30636e567a64434973496d4e6f5a574e725833527661325675496c3073496d3568625755694f694a51595852705a5735304944417849697769615842425a4752795a584e7a496a6f694d446f774f6a41364d446f774f6a41364d446f78496977695a586877496a6f784e54517a4f4449314d7a457a4c434a6b5a585a70593255694f694a4e62337070624778684c7a55754d43416f56326c755a4739336379424f564341784d4334774f794258615734324e447367654459304b534242634842735a56646c596b7470644338314d7a63754d7a59674b4574495645314d4c4342736157746c4945646c593274764b53424461484a76625755764e7a41754d43347a4e544d344c6a45784d43425459575a68636d6b764e544d334c6a4d32496977695958563061473979615852705a584d694f6c7369556b394d52563946546b516958537769616e5270496a6f694e32466b4f544a6d5957557459546732596930305932566a4c546733596a63744f574d3159544d784f5451304e44557a496977695a573168615777694f694a77595852705a5735304d444641593342314c6d4e764c6d6c6b49697769593278705a57353058326c6b496a6f69636d6c774c574e76636d556966512e7959476e5f57334c6f5f326452686c6435563735654f6843354570303748697866517a6561336479317355, '7e20bda0cfb75c247b935dfd02a37c30', 'patient', 'rip-core', 0xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017372002469642e636f2e6370752e73656375726974792e656e746974792e526f6c65456e74697479ae89047391fd9b0a0200044c0009617574686f726974797400124c6a6176612f6c616e672f537472696e673b4c000b6465736372697074696f6e71007e000e4c0002696471007e000e4c0005757365727374000f4c6a6176612f7574696c2f5365743b7872002769642e636f2e6370752e636f6d6d6f6e2e656e746974792e426173654175646974456e7469747900000000000000010200065a000661637469766549000776657273696f6e4c000963726561746564427971007e000e4c000b63726561746564446174657400104c6a6176612f7574696c2f446174653b4c000a6d6f646966696564427971007e000e4c000c6d6f6469666965644461746571007e00117870010000000070737200126a6176612e73716c2e54696d657374616d702618d5c80153bf650200014900056e616e6f737872000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000167726dc60078000000007070740008524f4c455f454e4474000c526f6c652050617469656e7474002464363861326561372d663163622d343834632d613364342d6236363965663366663363387372002f6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e50657273697374656e7453657486e4fda1f2eee0af0200014c000373657471007e000f7872003e6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e416273747261637450657273697374656e74436f6c6c656374696f6e627400d05f55733c02000a5a001b616c6c6f774c6f61644f7574736964655472616e73616374696f6e49000a63616368656453697a655a000564697274795a000b696e697469616c697a65645a000d697354656d7053657373696f6e4c00036b65797400164c6a6176612f696f2f53657269616c697a61626c653b4c00056f776e657271007e00054c0004726f6c6571007e000e4c001273657373696f6e466163746f72795575696471007e000e4c000e73746f726564536e617073686f7471007e001b787000ffffffff00000071007e001871007e001274002a69642e636f2e6370752e73656375726974792e656e746974792e526f6c65456e746974792e75736572737070707871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200075a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c00077265667265736874003b4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f546f6b656e526571756573743b4c000b7265736f7572636549647371007e000f4c000d726573706f6e7365547970657371007e000f787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e001f4c000573636f706571007e000f78707400087269702d636f7265737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e001f7870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000067708000000080000000374000a6772616e745f7479706574000870617373776f7264740009636c69656e745f69647400087269702d636f7265740008757365726e616d6574000770617469656e7478737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f40000000000004740004726561647400057772697465740005747275737474000b636865636b5f746f6b656e78017371007e0031770c000000103f40000000000004737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001a40200014c0004726f6c6571007e000e787074000b524f4c455f444f43544f527371007e0038740008524f4c455f454e447371007e003874000a524f4c455f41444d494e7371007e0038740011524f4c455f524144494f47524150484552787371007e00263f40000000000000770800000010000000007870707371007e0031770c000000103f40000000000004740008736563757269747974000770726f66696c657400067265706f72747400066d6173746572787371007e0031770c000000103f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001a40200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000177040000000171007e00127871007e004b737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00263f400000000000067708000000080000000371007e002871007e002971007e002a71007e002b71007e002c71007e002d7800707372002469642e636f2e6370752e73656375726974792e656e746974792e55736572456e74697479de198690286fa77e0200145a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c00076164647265737371007e000e4c00046369747971007e000e4c000b6465736372697074696f6e71007e000e4c000c6469737472696374436f646571007e000e4c000c6469766973696f6e436f646571007e000e4c0005656d61696c71007e000e4c0002696471007e000e4c000c6d6f62696c654e756d62657271007e000e4c00046e616d6571007e000e4c000870617373776f726471007e000e4c000b70686f6e654e756d62657271007e000e4c000870726f76696e636571007e000e4c000372617771007e000e4c0005726f6c657371007e000f4c0008757365726e616d6571007e000e4c0010766572696669636174696f6e436f646571007e000e7871007e00100100000000707371007e001377080000016772ac59887800000000707001010101707070707074001370617469656e743031406370752e636f2e696474002461646664643935382d623966652d346562652d626631652d3161313963303633373037317074000a50617469656e7420303174003c2432612431332469797652456e486372796a5a626e47774c6b614a73756737634f426d6b30365174624c4e2f4c376b356e634a46504c696c646f31797070707371007e001900ffffffff00010071007e005271007e004f74002a69642e636f2e6370752e73656375726974792e656e746974792e55736572456e746974792e726f6c6573707371007e00263f400000000000017708000000020000000171007e001271007e0012787371007e0031770c000000103f4000000000000171007e00127874000770617469656e7470, 'b841ab74b80ec7d9fdab80ea13a4f9d8');

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
('rip-3rd', 'profile,master', 'secretrip3rd01', 'read,write,check_token', 'authorization_code,refresh_token', 'http://rip.cpu.co.id:69/oauth/secure', 'ROLE_END', 3600, 1800, NULL, '0'),
('rip-core', 'profile,security,master,report', 'secretrip01', 'read,write,trust,check_token', 'password,refresh_token', '', 'ROLE_ADMIN,ROLE_RADIOGRAPHER,ROLE_DOCTOR,ROLE_END', 7200, 3600, NULL, '1'),
('rip-mobile', 'profile,security,master', 'secretrip02', 'read,write,check_token', 'password,refresh_token', '', 'ROLE_END', 7200, 3600, NULL, '1');

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

--
-- Dumping data for table `oauth_refresh_token`
--

INSERT INTO `oauth_refresh_token` (`token_id`, `token`, `authentication`) VALUES
('ebbfcda11759725117ff562d6124208e', 0xaced0005737200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c75657400124c6a6176612f6c616e672f537472696e673b787074026c65794a68624763694f694a49557a49314e694973496e523563434936496b705856434a392e65794a68645751694f6c736963484a765a6d6c735a534a644c434a316332567958323568625755694f694a685a47317062694973496e4e6a6233426c496a7062496d5a31624777695853776959585270496a6f694d6a466c5a47497a4d4759744d475a6b5a693030597a67774c54686b4f4445744e324a6c4d6a4a685a4451304d47526a49697769626d46745a534936496b466b62576c7561584e30636d4630623349694c434a706345466b5a484a6c63334d694f6949774f6a41364d446f774f6a41364d446f774f6a45694c434a6b5a585a70593255694f694a4e62337070624778684c7a55754d43416f56326c755a4739336379424f564341784d4334774f794258615734324e447367654459304b534242634842735a56646c596b7470644338314d7a63754d7a59674b4574495645314d4c4342736157746c4945646c593274764b53424461484a76625755764e7a41754d43347a4e544d344c6a45784d43425459575a68636d6b764e544d334c6a4d32496977695958563061473979615852705a584d694f6c7369556b394d525639425245314a54694a644c434a7164476b694f6949784e6d49314e44686b4d533079597a51314c54526b4e325174596a59344e69316b4d7a4e694f4449314e474979597a59694c434a6c6257467062434936496d466b62576c7551474e776453356a627935705a434973496d4e7361575675644639705a434936496e4a706343316a62334a6c496e302e4942585a6c576530456670695746695543795270757849444e4646317176384e583664795f3555375f4573, 0xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017372002469642e636f2e6370752e73656375726974792e656e746974792e526f6c65456e74697479ae89047391fd9b0a0200044c0009617574686f726974797400124c6a6176612f6c616e672f537472696e673b4c000b6465736372697074696f6e71007e000e4c0002696471007e000e4c0005757365727374000f4c6a6176612f7574696c2f5365743b7872002769642e636f2e6370752e636f6d6d6f6e2e656e746974792e426173654175646974456e7469747900000000000000010200065a000661637469766549000776657273696f6e4c000963726561746564427971007e000e4c000b63726561746564446174657400104c6a6176612f7574696c2f446174653b4c000a6d6f646966696564427971007e000e4c000c6d6f6469666965644461746571007e00117870010000000070737200126a6176612e73716c2e54696d657374616d702618d5c80153bf650200014900056e616e6f737872000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001676f3119607800000000707074000a524f4c455f41444d494e740012526f6c652041646d696e6973747261746f7274002430366265383064662d356334312d343261372d393035302d6233323833313264326633617372002f6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e50657273697374656e7453657486e4fda1f2eee0af0200014c000373657471007e000f7872003e6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e416273747261637450657273697374656e74436f6c6c656374696f6e627400d05f55733c02000a5a001b616c6c6f774c6f61644f7574736964655472616e73616374696f6e49000a63616368656453697a655a000564697274795a000b696e697469616c697a65645a000d697354656d7053657373696f6e4c00036b65797400164c6a6176612f696f2f53657269616c697a61626c653b4c00056f776e657271007e00054c0004726f6c6571007e000e4c001273657373696f6e466163746f72795575696471007e000e4c000e73746f726564536e617073686f7471007e001b787000ffffffff00000071007e001871007e001274002a69642e636f2e6370752e73656375726974792e656e746974792e526f6c65456e746974792e75736572737070707871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200075a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c00077265667265736874003b4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f546f6b656e526571756573743b4c000b7265736f7572636549647371007e000f4c000d726573706f6e7365547970657371007e000f787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e001f4c000573636f706571007e000f78707400087269702d636f7265737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e001f7870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000067708000000080000000374000a6772616e745f7479706574000870617373776f7264740009636c69656e745f69647400087269702d636f7265740008757365726e616d6574000561646d696e78737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000174000466756c6c78017371007e0031770c000000103f40000000000001737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001a40200014c0004726f6c6571007e000e78707400114150505f434c49454e545f4f4155544832787371007e00263f40000000000000770800000010000000007870707371007e0031770c000000103f4000000000000174000770726f66696c65787371007e0031770c000000103f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001a40200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000177040000000171007e00127871007e003f737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00263f400000000000067708000000080000000371007e002871007e002971007e002a71007e002b71007e002c71007e002d7800707372002469642e636f2e6370752e73656375726974792e656e746974792e55736572456e74697479de198690286fa77e0200145a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c00076164647265737371007e000e4c00046369747971007e000e4c000b6465736372697074696f6e71007e000e4c000c6469737472696374436f646571007e000e4c000c6469766973696f6e436f646571007e000e4c0005656d61696c71007e000e4c0002696471007e000e4c000c6d6f62696c654e756d62657271007e000e4c00046e616d6571007e000e4c000870617373776f726471007e000e4c000b70686f6e654e756d62657271007e000e4c000870726f76696e636571007e000e4c000372617771007e000e4c0005726f6c657371007e000f4c0008757365726e616d6571007e000e4c0010766572696669636174696f6e436f646571007e000e7871007e00100100000000707371007e00137708000001676f2f488878000000007070010101017400007070707074000f61646d696e406370752e636f2e696474002431616332393231352d373565382d346531392d623466312d6530373664613763613161627074000d41646d696e6973747261746f7274003c24326124313324576c4b56577a587a4c4c466935624352514a36416f2e6f4468363150746d2f655057623859364533666b7865742f51322e5645692e7070707371007e001900ffffffff00010071007e004771007e004374002a69642e636f2e6370752e73656375726974792e656e746974792e55736572456e746974792e726f6c6573707371007e00263f400000000000017708000000020000000171007e001271007e0012787371007e0031770c000000103f4000000000000171007e00127874000561646d696e70),
('b841ab74b80ec7d9fdab80ea13a4f9d8', 0xaced00057372004c6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744578706972696e674f417574683252656672657368546f6b656e2fdf47639dd0c9b70200014c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b787200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c75657400124c6a6176612f6c616e672f537472696e673b78707402d365794a68624763694f694a49557a49314e694973496e523563434936496b705856434a392e65794a68645751694f6c73696332566a64584a7064486b694c434a77636d396d6157786c49697769636d567762334a30496977696257467a64475679496c3073496e567a5a584a66626d46745a534936496e426864476c6c626e51694c434a7a593239775a53493657794a795a57466b4969776964334a70644755694c434a30636e567a64434973496d4e6f5a574e725833527661325675496c3073496d463061534936496a64685a446b795a6d466c4c5745344e6d49744e474e6c597930344e3249334c546c6a4e57457a4d546b304e4451314d794973496d3568625755694f694a51595852705a5735304944417849697769615842425a4752795a584e7a496a6f694d446f774f6a41364d446f774f6a41364d446f78496977695a586877496a6f784e54517a4f4449784e7a457a4c434a6b5a585a70593255694f694a4e62337070624778684c7a55754d43416f56326c755a4739336379424f564341784d4334774f794258615734324e447367654459304b534242634842735a56646c596b7470644338314d7a63754d7a59674b4574495645314d4c4342736157746c4945646c593274764b53424461484a76625755764e7a41754d43347a4e544d344c6a45784d43425459575a68636d6b764e544d334c6a4d32496977695958563061473979615852705a584d694f6c7369556b394d52563946546b516958537769616e5270496a6f694e5745784f4455774e6a6b744e474930596930304e546b354c5749344e7a4174596a42684e6d4d344f4463354d57466b496977695a573168615777694f694a77595852705a5735304d444641593342314c6d4e764c6d6c6b49697769593278705a57353058326c6b496a6f69636d6c774c574e76636d556966512e5f516d49694c345f764b434141766f72614e4b515f6969526b486b41396966665a50446f785a587954754d7372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000016772f1df4178, 0xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017372002469642e636f2e6370752e73656375726974792e656e746974792e526f6c65456e74697479ae89047391fd9b0a0200044c0009617574686f726974797400124c6a6176612f6c616e672f537472696e673b4c000b6465736372697074696f6e71007e000e4c0002696471007e000e4c0005757365727374000f4c6a6176612f7574696c2f5365743b7872002769642e636f2e6370752e636f6d6d6f6e2e656e746974792e426173654175646974456e7469747900000000000000010200065a000661637469766549000776657273696f6e4c000963726561746564427971007e000e4c000b63726561746564446174657400104c6a6176612f7574696c2f446174653b4c000a6d6f646966696564427971007e000e4c000c6d6f6469666965644461746571007e00117870010000000070737200126a6176612e73716c2e54696d657374616d702618d5c80153bf650200014900056e616e6f737872000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000167726dc60078000000007070740008524f4c455f454e4474000c526f6c652050617469656e7474002464363861326561372d663163622d343834632d613364342d6236363965663366663363387372002f6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e50657273697374656e7453657486e4fda1f2eee0af0200014c000373657471007e000f7872003e6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e416273747261637450657273697374656e74436f6c6c656374696f6e627400d05f55733c02000a5a001b616c6c6f774c6f61644f7574736964655472616e73616374696f6e49000a63616368656453697a655a000564697274795a000b696e697469616c697a65645a000d697354656d7053657373696f6e4c00036b65797400164c6a6176612f696f2f53657269616c697a61626c653b4c00056f776e657271007e00054c0004726f6c6571007e000e4c001273657373696f6e466163746f72795575696471007e000e4c000e73746f726564536e617073686f7471007e001b787000ffffffff00000071007e001871007e001274002a69642e636f2e6370752e73656375726974792e656e746974792e526f6c65456e746974792e75736572737070707871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200075a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c00077265667265736874003b4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f546f6b656e526571756573743b4c000b7265736f7572636549647371007e000f4c000d726573706f6e7365547970657371007e000f787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e001f4c000573636f706571007e000f78707400087269702d636f7265737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e001f7870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000067708000000080000000374000a6772616e745f7479706574000870617373776f7264740009636c69656e745f69647400087269702d636f7265740008757365726e616d6574000770617469656e7478737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f40000000000004740004726561647400057772697465740005747275737474000b636865636b5f746f6b656e78017371007e0031770c000000103f40000000000004737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001a40200014c0004726f6c6571007e000e787074000b524f4c455f444f43544f527371007e0038740008524f4c455f454e447371007e003874000a524f4c455f41444d494e7371007e0038740011524f4c455f524144494f47524150484552787371007e00263f40000000000000770800000010000000007870707371007e0031770c000000103f40000000000004740008736563757269747974000770726f66696c657400067265706f72747400066d6173746572787371007e0031770c000000103f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001a40200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000177040000000171007e00127871007e004b737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00263f400000000000067708000000080000000371007e002871007e002971007e002a71007e002b71007e002c71007e002d7800707372002469642e636f2e6370752e73656375726974792e656e746974792e55736572456e74697479de198690286fa77e0200145a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c00076164647265737371007e000e4c00046369747971007e000e4c000b6465736372697074696f6e71007e000e4c000c6469737472696374436f646571007e000e4c000c6469766973696f6e436f646571007e000e4c0005656d61696c71007e000e4c0002696471007e000e4c000c6d6f62696c654e756d62657271007e000e4c00046e616d6571007e000e4c000870617373776f726471007e000e4c000b70686f6e654e756d62657271007e000e4c000870726f76696e636571007e000e4c000372617771007e000e4c0005726f6c657371007e000f4c0008757365726e616d6571007e000e4c0010766572696669636174696f6e436f646571007e000e7871007e00100100000000707371007e001377080000016772ac59887800000000707001010101707070707074001370617469656e743031406370752e636f2e696474002461646664643935382d623966652d346562652d626631652d3161313963303633373037317074000a50617469656e7420303174003c2432612431332469797652456e486372796a5a626e47774c6b614a73756737634f426d6b30365174624c4e2f4c376b356e634a46504c696c646f31797070707371007e001900ffffffff00010071007e005271007e004f74002a69642e636f2e6370752e73656375726974792e656e746974792e55736572456e746974792e726f6c6573707371007e00263f400000000000017708000000020000000171007e001271007e0012787371007e0031770c000000103f4000000000000171007e00127874000770617469656e7470),
('933f25b135ac0097073ed0b11cee6603', 0xaced00057372004c6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744578706972696e674f417574683252656672657368546f6b656e2fdf47639dd0c9b70200014c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b787200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c75657400124c6a6176612f6c616e672f537472696e673b78707402d165794a68624763694f694a49557a49314e694973496e523563434936496b705856434a392e65794a68645751694f6c73696332566a64584a7064486b694c434a77636d396d6157786c49697769636d567762334a30496977696257467a64475679496c3073496e567a5a584a66626d46745a534936496d466b62576c754969776963324e76634755694f6c7369636d56685a434973496e64796158526c4969776964484a31633351694c434a6a6147566a613139306232746c62694a644c434a6864476b694f694a6d596a4d78596a49304f4330325a4441354c54517a595749745957566b5969307a4e7a6b324e4455794e6a6c6b4d7a4d694c434a755957316c496a6f695157527461573570633352795958527663694973496d6c775157526b636d567a63794936496a41364d446f774f6a41364d446f774f6a41364d534973496d5634634349364d5455304d7a677a4e7a6b334f4377695a47563261574e6c496a6f695457393661577873595338314c6a41674b466470626d527664334d67546c51674d5441754d44736756326c754e6a5137494867324e436b6751584277624756585a574a4c615851764e544d334c6a4d324943684c5346524e5443776762476c725a5342485a574e7262796b67513268796232316c4c7a63774c6a41754d7a557a4f4334784d5441675532466d59584a704c7a557a4e79347a4e694973496d463164476876636d6c306157567a496a7062496c4a50544556665155524e5355346958537769616e5270496a6f694d47557a4d7a41324e5455744d444669596930304d6a51324c574669595745744e474e6959324531593249354d575a68496977695a573168615777694f694a685a473170626b426a6348557559323875615751694c434a6a62476c6c626e5266615751694f694a7961584174593239795a534a392e516f4870567356465a71782d57744f576b4563715032536376704b7949492d365f397a6e4f593279624d557372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000016773ea100578, 0xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017372002469642e636f2e6370752e73656375726974792e656e746974792e526f6c65456e74697479ae89047391fd9b0a0200044c0009617574686f726974797400124c6a6176612f6c616e672f537472696e673b4c000b6465736372697074696f6e71007e000e4c0002696471007e000e4c0005757365727374000f4c6a6176612f7574696c2f5365743b7872002769642e636f2e6370752e636f6d6d6f6e2e656e746974792e426173654175646974456e7469747900000000000000010200065a000661637469766549000776657273696f6e4c000963726561746564427971007e000e4c000b63726561746564446174657400104c6a6176612f7574696c2f446174653b4c000a6d6f646966696564427971007e000e4c000c6d6f6469666965644461746571007e00117870010000000070737200126a6176612e73716c2e54696d657374616d702618d5c80153bf650200014900056e616e6f737872000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001676f3119607800000000707074000a524f4c455f41444d494e740012526f6c652041646d696e6973747261746f7274002430366265383064662d356334312d343261372d393035302d6233323833313264326633617372002f6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e50657273697374656e7453657486e4fda1f2eee0af0200014c000373657471007e000f7872003e6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e416273747261637450657273697374656e74436f6c6c656374696f6e627400d05f55733c02000a5a001b616c6c6f774c6f61644f7574736964655472616e73616374696f6e49000a63616368656453697a655a000564697274795a000b696e697469616c697a65645a000d697354656d7053657373696f6e4c00036b65797400164c6a6176612f696f2f53657269616c697a61626c653b4c00056f776e657271007e00054c0004726f6c6571007e000e4c001273657373696f6e466163746f72795575696471007e000e4c000e73746f726564536e617073686f7471007e001b787000ffffffff00000071007e001871007e001274002a69642e636f2e6370752e73656375726974792e656e746974792e526f6c65456e746974792e75736572737070707871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200075a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c00077265667265736874003b4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f546f6b656e526571756573743b4c000b7265736f7572636549647371007e000f4c000d726573706f6e7365547970657371007e000f787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e001f4c000573636f706571007e000f78707400087269702d636f7265737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e001f7870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000067708000000080000000374000a6772616e745f7479706574000870617373776f7264740009636c69656e745f69647400087269702d636f7265740008757365726e616d6574000561646d696e78737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f40000000000004740004726561647400057772697465740005747275737474000b636865636b5f746f6b656e78017371007e0031770c000000103f40000000000004737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001a40200014c0004726f6c6571007e000e787074000b524f4c455f444f43544f527371007e0038740008524f4c455f454e447371007e003874000a524f4c455f41444d494e7371007e0038740011524f4c455f524144494f47524150484552787371007e00263f40000000000000770800000010000000007870707371007e0031770c000000103f40000000000004740008736563757269747974000770726f66696c657400067265706f72747400066d6173746572787371007e0031770c000000103f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001a40200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000177040000000171007e00127871007e004b737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00263f400000000000067708000000080000000371007e002871007e002971007e002a71007e002b71007e002c71007e002d7800707372002469642e636f2e6370752e73656375726974792e656e746974792e55736572456e74697479de198690286fa77e0200145a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c00076164647265737371007e000e4c00046369747971007e000e4c000b6465736372697074696f6e71007e000e4c000c6469737472696374436f646571007e000e4c000c6469766973696f6e436f646571007e000e4c0005656d61696c71007e000e4c0002696471007e000e4c000c6d6f62696c654e756d62657271007e000e4c00046e616d6571007e000e4c000870617373776f726471007e000e4c000b70686f6e654e756d62657271007e000e4c000870726f76696e636571007e000e4c000372617771007e000e4c0005726f6c657371007e000f4c0008757365726e616d6571007e000e4c0010766572696669636174696f6e436f646571007e000e7871007e00100100000000707371007e00137708000001676f2f488878000000007070010101017400007070707074000f61646d696e406370752e636f2e696474002431616332393231352d373565382d346531392d623466312d6530373664613763613161627074000d41646d696e6973747261746f7274003c243261243133246e6e6332774c77565577312e73776b5833353351544f46596f535a67515a50555576624164306d67585637444d75354b6f724b772e7070707371007e001900ffffffff00010071007e005371007e004f74002a69642e636f2e6370752e73656375726974792e656e746974792e55736572456e746974792e726f6c6573707371007e00263f400000000000017708000000020000000171007e001271007e0012787371007e0031770c000000103f4000000000000171007e00127874000561646d696e70);

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

--
-- Dumping data for table `sec_menu`
--

INSERT INTO `sec_menu` (`menu_uuid`, `title`, `url`, `level`, `ordering`, `icon`, `is_leaf`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`, `parent_uuid`) VALUES
('b9029fd3-44cd-479c-965d-a8da1bfb20eb', 'Dashboard', '/app/dashboard', 0, 0, 'nb-home', 0, 0, 1, '2018-12-04 13:35:36', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sec_menu_locale`
--

CREATE TABLE `sec_menu_locale` (
  `menu_locale_uuid` varchar(36) NOT NULL,
  `menu_uuid` varchar(36) NOT NULL,
  `locale_uuid` varchar(36) NOT NULL,
  `title` varchar(100) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sec_menu_locale`
--

INSERT INTO `sec_menu_locale` (`menu_locale_uuid`, `menu_uuid`, `locale_uuid`, `title`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('8edd8eaa-c665-4d81-ab41-49a61df686ba', 'b9029fd3-44cd-479c-965d-a8da1bfb20eb', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Beranda', 0, 1, '2018-12-04 13:37:15', NULL, NULL, NULL);

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
('06be80df-5c41-42a7-9050-b328312d2f3a', 'ROLE_ADMIN', 'Role Administrator', 0, 1, '2018-12-02 20:52:28', NULL, NULL, NULL),
('1af2403b-a4f8-4492-94c1-5d6ab8b4a094', 'ROLE_RADIOGRAPHER', 'Role Radiographer', 0, 1, '2018-12-03 11:57:36', NULL, NULL, NULL),
('d46b4b13-4159-4f5c-923d-5d8dfe3f48de', 'ROLE_DOCTOR', 'Role Doctor', 0, 1, '2018-12-03 11:57:36', NULL, NULL, NULL),
('d68a2ea7-f1cb-484c-a3d4-b669ef3ff3c8', 'ROLE_END', 'Role Patient', 0, 1, '2018-12-03 11:57:36', NULL, NULL, NULL);

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
('1ac29215-75e8-4e19-b4f1-e076da7ca1ab', '06be80df-5c41-42a7-9050-b328312d2f3a'),
('adfdd958-b9fe-4ebe-bf1e-1a19c0637071', 'd68a2ea7-f1cb-484c-a3d4-b669ef3ff3c8'),
('181545af-9410-47ca-8de2-4fd29d9da5d9', 'd46b4b13-4159-4f5c-923d-5d8dfe3f48de'),
('38527ac6-edb6-4a4f-8e60-eede49c4c2a6', '1af2403b-a4f8-4492-94c1-5d6ab8b4a094');

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

--
-- Dumping data for table `sec_user`
--

INSERT INTO `sec_user` (`user_uuid`, `username`, `password`, `account_enabled`, `account_non_expired`, `account_non_locker`, `credentials_non_expired`, `fullname`, `email`, `address`, `city`, `province`, `district_code`, `phone_number`, `mobile_number`, `image`, `description`, `verification_code`, `raw`, `locale`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('181545af-9410-47ca-8de2-4fd29d9da5d9', 'doctor', '$2a$13$iyvREnHcryjZbnGwLkaJsug7cOBmk06QtbLN/L7k5ncJFPLildo1y', 1, 1, 1, 1, 'Doctor 01', 'doctor@cpu.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en-US', 0, 1, '2018-12-05 14:50:55', NULL, NULL, NULL),
('1ac29215-75e8-4e19-b4f1-e076da7ca1ab', 'admin', '$2a$13$nnc2wLwVUw1.swkX353QTOFYoSZgQZPUUvbAd0mgXV7DMu5KorKw.', 1, 1, 1, 1, 'Administrator', 'admin@cpu.co.id', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en-US', 0, 1, '2018-12-02 20:50:29', NULL, NULL, NULL),
('38527ac6-edb6-4a4f-8e60-eede49c4c2a6', 'radiographer', '$2a$13$iyvREnHcryjZbnGwLkaJsug7cOBmk06QtbLN/L7k5ncJFPLildo1y', 1, 1, 1, 1, 'Radiographer', 'radiographer@cpu.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en-US', 0, 1, '2018-12-05 14:50:55', NULL, NULL, NULL),
('adfdd958-b9fe-4ebe-bf1e-1a19c0637071', 'patient', '$2a$13$iyvREnHcryjZbnGwLkaJsug7cOBmk06QtbLN/L7k5ncJFPLildo1y', 1, 1, 1, 1, 'Patient 01', 'patient01@cpu.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en-US', 0, 1, '2018-12-03 13:05:57', NULL, NULL, NULL);

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

--
-- Dumping data for table `sys_locale`
--

INSERT INTO `sys_locale` (`locale_uuid`, `locale_code`, `locale_identifier`, `locale_icon`, `locale_default`, `locale_enabled`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('061e3d94-bfef-4e5f-bb24-735ba18e435f', 'id-ID', 'Indonesian (Indonesia)', 'id', 0, 1, 0, 1, '2018-12-04 08:59:55', NULL, NULL, NULL),
('6a6ae290-7c33-46bd-a05a-f6f3964e4cb4', 'en-US', 'English (United States)', 'us', 1, 1, 0, 1, '2018-12-04 08:59:55', NULL, NULL, NULL);

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

--
-- Dumping data for table `sys_parameter`
--

INSERT INTO `sys_parameter` (`parameter_uuid`, `parameter_code`, `parameter_value`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`, `parameter_group_uuid`) VALUES
('eb8c8621-c79c-4f1b-bd77-757d5ed106e5', 'GENDER.MALE', 'Male', 0, 1, '2018-12-05 11:46:40', NULL, NULL, NULL, 'a34ce03b-35e5-40d7-9e95-47cb77cf623a'),
('f6dd4b90-6c06-4066-84a3-0599d1a06003', 'GENDER.FEMALE', 'Female', 0, 1, '2018-12-05 11:46:40', NULL, NULL, NULL, 'a34ce03b-35e5-40d7-9e95-47cb77cf623a');

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

--
-- Dumping data for table `sys_parameter_group`
--

INSERT INTO `sys_parameter_group` (`parameter_group_uuid`, `parameter_group_code`, `parameter_group_name`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('a34ce03b-35e5-40d7-9e95-47cb77cf623a', 'GENDER', 'Gender', 0, 1, '2018-12-05 11:45:42', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_parameter_locale`
--

CREATE TABLE `sys_parameter_locale` (
  `parameter_locale_uuid` varchar(36) NOT NULL,
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

--
-- Dumping data for table `sys_parameter_locale`
--

INSERT INTO `sys_parameter_locale` (`parameter_locale_uuid`, `parameter_uuid`, `locale_uuid`, `parameter_value`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('4e1cf97d-da2b-4502-a8fb-8b7c56685061', 'eb8c8621-c79c-4f1b-bd77-757d5ed106e5', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Pria', 0, 1, '2018-12-05 11:48:40', NULL, NULL, NULL),
('fc74760b-a4f3-48db-a3a8-3fe2e230d3bd', 'f6dd4b90-6c06-4066-84a3-0599d1a06003', '061e3d94-bfef-4e5f-bb24-735ba18e435f', 'Wanita', 0, 1, '2018-12-05 11:48:40', NULL, NULL, NULL);

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
-- Indexes for table `mst_device`
--
ALTER TABLE `mst_device`
  ADD PRIMARY KEY (`device_uuid`),
  ADD KEY `device_type_uuid` (`device_type_uuid`);

--
-- Indexes for table `mst_device_type`
--
ALTER TABLE `mst_device_type`
  ADD PRIMARY KEY (`device_type_uuid`);

--
-- Indexes for table `mst_language`
--
ALTER TABLE `mst_language`
  ADD PRIMARY KEY (`language_uuid`);

--
-- Indexes for table `mst_patient`
--
ALTER TABLE `mst_patient`
  ADD PRIMARY KEY (`patient_uuid`),
  ADD UNIQUE KEY `patient_id` (`patient_id`),
  ADD KEY `parent_uuid` (`parent_uuid`);

--
-- Indexes for table `mst_physician`
--
ALTER TABLE `mst_physician`
  ADD PRIMARY KEY (`physician_uuid`),
  ADD UNIQUE KEY `physician_id` (`physician_id`),
  ADD KEY `polyclinic_uuid` (`polyclinic_uuid`);

--
-- Indexes for table `mst_polyclinic`
--
ALTER TABLE `mst_polyclinic`
  ADD PRIMARY KEY (`polyclinic_uuid`),
  ADD KEY `parent_uuid` (`parent_uuid`);

--
-- Indexes for table `mst_polyclinic_locale`
--
ALTER TABLE `mst_polyclinic_locale`
  ADD PRIMARY KEY (`polyclinic_locale_uuid`),
  ADD KEY `polyclinic_uuid` (`polyclinic_uuid`),
  ADD KEY `locale_uuid` (`locale_uuid`);

--
-- Indexes for table `mst_r_country_currency`
--
ALTER TABLE `mst_r_country_currency`
  ADD KEY `country_uuid` (`country_uuid`),
  ADD KEY `currency_uuid` (`currency_uuid`);

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
-- Indexes for table `sec_menu_locale`
--
ALTER TABLE `sec_menu_locale`
  ADD PRIMARY KEY (`menu_locale_uuid`),
  ADD KEY `menu_uuid` (`menu_uuid`),
  ADD KEY `locale_uuid` (`locale_uuid`);

--
-- Indexes for table `sec_role`
--
ALTER TABLE `sec_role`
  ADD PRIMARY KEY (`role_uuid`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `sec_r_user_patient`
--
ALTER TABLE `sec_r_user_patient`
  ADD KEY `user_uuid` (`user_uuid`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `sec_r_user_physician`
--
ALTER TABLE `sec_r_user_physician`
  ADD KEY `user_uuid` (`user_uuid`),
  ADD KEY `physician_id` (`physician_id`);

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
-- Indexes for table `sys_parameter_locale`
--
ALTER TABLE `sys_parameter_locale`
  ADD PRIMARY KEY (`parameter_locale_uuid`),
  ADD KEY `parameter_uuid` (`parameter_uuid`),
  ADD KEY `locale_uuid` (`locale_uuid`);

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
-- Constraints for table `mst_device`
--
ALTER TABLE `mst_device`
  ADD CONSTRAINT `mst_device_ibfk_1` FOREIGN KEY (`device_type_uuid`) REFERENCES `mst_device_type` (`device_type_uuid`);

--
-- Constraints for table `mst_patient`
--
ALTER TABLE `mst_patient`
  ADD CONSTRAINT `mst_patient_ibfk_1` FOREIGN KEY (`parent_uuid`) REFERENCES `mst_patient` (`patient_uuid`);

--
-- Constraints for table `mst_physician`
--
ALTER TABLE `mst_physician`
  ADD CONSTRAINT `mst_physician_ibfk_1` FOREIGN KEY (`polyclinic_uuid`) REFERENCES `mst_polyclinic` (`polyclinic_uuid`);

--
-- Constraints for table `mst_polyclinic`
--
ALTER TABLE `mst_polyclinic`
  ADD CONSTRAINT `mst_polyclinic_ibfk_1` FOREIGN KEY (`parent_uuid`) REFERENCES `mst_polyclinic` (`polyclinic_uuid`);

--
-- Constraints for table `mst_polyclinic_locale`
--
ALTER TABLE `mst_polyclinic_locale`
  ADD CONSTRAINT `mst_polyclinic_locale_ibfk_1` FOREIGN KEY (`polyclinic_uuid`) REFERENCES `mst_polyclinic` (`polyclinic_uuid`),
  ADD CONSTRAINT `mst_polyclinic_locale_ibfk_2` FOREIGN KEY (`locale_uuid`) REFERENCES `sys_locale` (`locale_uuid`);

--
-- Constraints for table `mst_r_country_currency`
--
ALTER TABLE `mst_r_country_currency`
  ADD CONSTRAINT `mst_r_country_currency_ibfk_1` FOREIGN KEY (`country_uuid`) REFERENCES `mst_country` (`country_uuid`),
  ADD CONSTRAINT `mst_r_country_currency_ibfk_2` FOREIGN KEY (`currency_uuid`) REFERENCES `mst_currency` (`currency_uuid`);

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
-- Constraints for table `sec_menu_locale`
--
ALTER TABLE `sec_menu_locale`
  ADD CONSTRAINT `sec_menu_locale_ibfk_1` FOREIGN KEY (`menu_uuid`) REFERENCES `sec_menu` (`menu_uuid`),
  ADD CONSTRAINT `sec_menu_locale_ibfk_2` FOREIGN KEY (`locale_uuid`) REFERENCES `sys_locale` (`locale_uuid`);

--
-- Constraints for table `sec_r_user_patient`
--
ALTER TABLE `sec_r_user_patient`
  ADD CONSTRAINT `sec_r_user_patient_ibfk_1` FOREIGN KEY (`user_uuid`) REFERENCES `sec_user` (`user_uuid`),
  ADD CONSTRAINT `sec_r_user_patient_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `mst_patient` (`patient_id`);

--
-- Constraints for table `sec_r_user_physician`
--
ALTER TABLE `sec_r_user_physician`
  ADD CONSTRAINT `sec_r_user_physician_ibfk_1` FOREIGN KEY (`user_uuid`) REFERENCES `sec_user` (`user_uuid`),
  ADD CONSTRAINT `sec_r_user_physician_ibfk_2` FOREIGN KEY (`physician_id`) REFERENCES `mst_physician` (`physician_id`);

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
-- Constraints for table `sys_parameter_locale`
--
ALTER TABLE `sys_parameter_locale`
  ADD CONSTRAINT `sys_parameter_locale_ibfk_1` FOREIGN KEY (`parameter_uuid`) REFERENCES `sys_parameter` (`parameter_uuid`),
  ADD CONSTRAINT `sys_parameter_locale_ibfk_2` FOREIGN KEY (`locale_uuid`) REFERENCES `sys_locale` (`locale_uuid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
