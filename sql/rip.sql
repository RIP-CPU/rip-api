-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2018 at 06:37 PM
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
-- Table structure for table `mst_country`
--

CREATE TABLE `mst_country` (
  `country_uuid` varchar(36) NOT NULL,
  `country_code` varchar(3) NOT NULL COMMENT 'ISO 3166-1 alpha-3',
  `country_name` varchar(150) NOT NULL,
  `capital` varchar(150) NOT NULL,
  `phone_prefix` varchar(10) DEFAULT NULL,
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

INSERT INTO `mst_country` (`country_uuid`, `country_code`, `country_name`, `capital`, `phone_prefix`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('010baa8f-f973-43ec-9a11-b65eee917484', 'CYM', 'Cayman Islands', 'George Town', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('025aac2d-5a5c-41b1-840e-645de7b5ceab', 'SJM', 'Svalbard and Jan Mayen', 'Longyearbyen', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('02e8516e-c75f-4dd2-a6cb-ed1352edffc2', 'BMU', 'Bermuda', 'Hamilton', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('040a6d89-51fc-4ce1-9cde-08f0ef406b03', 'THA', 'Thailand', 'Bangkok', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('040ca195-8943-4c6e-a06f-def483964b79', 'MHL', 'Marshall Islands', 'Majuro', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0490d930-b7b6-41eb-8e66-9b6db5e4d095', 'YEM', 'Yemen', 'Sanaa', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('04bcf5d7-978d-4400-bde5-04c3ab8eae8b', 'TCD', 'Chad', 'N\'Djamena', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('04bdd768-af74-4a2a-965c-d410b8e924b7', 'ZMB', 'Zambia', 'Lusaka', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('050a80c4-5d2f-4ac4-9d3a-cf82b7757f58', 'MMR', 'Myanmar', 'Nay Pyi Taw', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('05c0c26d-a3c6-4ccb-a7f4-5d78bd952051', 'NAM', 'Namibia', 'Windhoek', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('067bf653-74c9-4987-911a-13077e8b8716', 'STP', 'Sao Tome and Principe', 'Sao Tome', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0823599a-05ce-4047-a93b-9453089b5f97', 'MRT', 'Mauritania', 'Nouakchott', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('09759c08-6263-4f00-9d3b-95f961274b1d', 'PRT', 'Portugal', 'Lisbon', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0a11a62f-0886-45fa-8e81-0c3b32fcff31', 'SUR', 'Suriname', 'Paramaribo', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0a8fb47b-4572-419e-b72c-d73ca43cd58f', 'ATF', 'French Southern Territories', 'Port-aux-Francais', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0af05b70-e6e9-4611-b8be-6cec75979464', 'BOL', 'Bolivia', 'Sucre', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0b3789a5-36d9-4b51-bc7f-17f7dcd07326', 'SYR', 'Syria', 'Damascus', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0bfd2f3d-a9b7-4d91-9db2-4f151c793a5a', 'JPN', 'Japan', 'Tokyo', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0c945ab9-0afe-4f59-abac-b874f5311edc', 'MKD', 'Macedonia', 'Skopje', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0de02195-5882-4e39-b274-bb3b9e531d4b', 'GIB', 'Gibraltar', 'Gibraltar', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0e01f90b-cc81-49b4-a03a-b86221eb40c6', 'ISL', 'Iceland', 'Reykjavik', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('0f11d598-d43f-4240-8ff0-5055e4fc2217', 'MSR', 'Montserrat', 'Plymouth', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('12639209-0e38-4ff4-b695-728f80308b36', 'MLI', 'Mali', 'Bamako', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('14146646-7347-4119-91f6-2ee5dd8e19b8', 'MEX', 'Mexico', 'Mexico City', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('143663cd-a645-46c1-afd7-df5ea1de0ff9', 'REU', 'Reunion', 'Saint-Denis', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('15226976-8474-433a-ae53-104fd84dc791', 'TWN', 'Taiwan', 'Taipei', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('16646b91-51fe-4a25-9fd4-1482f129aac7', 'MWI', 'Malawi', 'Lilongwe', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('16fc24b5-dc35-4953-831b-aa64b7713068', 'VCT', 'Saint Vincent and the Grenadines', 'Kingstown', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1786aecc-549a-4649-aae2-7a4ef299dd8e', 'ALA', 'Aland Islands', 'Mariehamn', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('183e11fd-dc76-493b-bc45-a6e3ae6d469c', 'AFG', 'Afghanistan', 'Kabul', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('18858705-cd87-4ccc-937b-d9a1be7b312c', 'BHR', 'Bahrain', 'Manama', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1a24f98b-aebf-41fc-aa3a-6a73e117c625', 'CHL', 'Chile', 'Santiago', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1ab60de5-deb3-4d7a-b803-ae5f1f4c69ff', 'MAF', 'Saint Martin', 'Marigot', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1ab72323-cbf2-4bc7-97b9-4e8be3c0cae9', 'RUS', 'Russia', 'Moscow', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1b8eef25-09b6-47ee-9ee4-a0ac2e8baae0', 'FJI', 'Fiji', 'Suva', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1bbd44a6-0e33-4f01-bd6e-a626e4bf5a10', 'PAN', 'Panama', 'Panama City', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('1d2373b8-4138-459c-ba88-673210b08c5d', 'VUT', 'Vanuatu', 'Port Vila', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('20790050-3e30-4bf6-930b-f8bdfa1af9d4', 'LVA', 'Latvia', 'Riga', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('250251bd-f2e0-4b55-8e65-72d7ba8c1c6c', 'BDI', 'Burundi', 'Bujumbura', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('252ac5ff-a624-4edd-9349-f049df30ffbe', 'JEY', 'Jersey', 'Saint Helier', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('25b46fc9-180b-4191-89dd-d2de6dfc46b5', 'SCG', 'Serbia and Montenegro', 'Belgrade', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('25ca173e-fd72-4843-ac80-ce02a54471be', 'SYC', 'Seychelles', 'Victoria', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('26487413-4c22-4295-bfd2-13773fcc4b1e', 'BRN', 'Brunei', 'Bandar Seri Begawan', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2704b793-0d4b-49aa-a296-d41abaeaaa6f', 'ABW', 'Aruba', 'Oranjestad', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2afc5569-9495-47a7-8b85-b41705008b26', 'MTQ', 'Martinique', 'Fort-de-France', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2c3bde44-0ca7-4c92-bea9-4c629ab951f6', 'JOR', 'Jordan', 'Amman', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2cb257ad-9b0e-4065-a66b-2a9f3adb3c5f', 'SSD', 'South Sudan', 'Juba', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2db98553-d132-4590-ae67-6db608e2c2f4', 'BGR', 'Bulgaria', 'Sofia', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2e304585-8ac2-400a-b4f3-6fdf4930b37f', 'COK', 'Cook Islands', 'Avarua', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('2e7b0a55-da57-43ff-9023-72473d13b414', 'IMN', 'Isle of Man', 'Douglas', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('3014cfae-5a46-498e-bcc8-d14c4abd5398', 'LIE', 'Liechtenstein', 'Vaduz', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('31899795-fe12-4b33-aafd-41ed8d3c5cac', 'AUT', 'Austria', 'Vienna', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('338f0ed6-5493-428c-9204-9c5a725fb618', 'POL', 'Poland', 'Warsaw', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('33bdd32f-3a1e-4c53-b638-6e37bd756d6e', 'BRB', 'Barbados', 'Bridgetown', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('34ee3669-73df-4d67-bf57-ba1b04ada0f7', 'VNM', 'Vietnam', 'Hanoi', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('36d675f7-228a-4da8-b419-6257f977f7c6', 'UGA', 'Uganda', 'Kampala', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('39e33244-ceda-4a34-89b5-07bc300c7303', 'LBR', 'Liberia', 'Monrovia', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('3ba4da18-3d4d-43c8-9e1f-853a1515bf54', 'MLT', 'Malta', 'Valletta', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('3ee53a34-b63f-47c1-a735-97696721d12f', 'FRO', 'Faroe Islands', 'Torshavn', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('40fc2011-0701-4ee0-954b-5c856c3c9561', 'BES', 'Bonaire, Saint Eustatius and Saba ', '', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('410e9dd3-5aac-4998-9289-6459f1402a07', 'ERI', 'Eritrea', 'Asmara', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('42bb7332-fab9-4fc8-bd6d-5dd15eb4d1cb', 'GUF', 'French Guiana', 'Cayenne', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('42c56507-feff-493c-a87c-2cbf28653fca', 'SMR', 'San Marino', 'San Marino', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('42d0a6e3-9091-4642-93d1-84b6a5576036', 'MCO', 'Monaco', 'Monaco', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4474beed-52ee-42c0-81c1-1bb75e297a88', 'DJI', 'Djibouti', 'Djibouti', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('45390fb0-47bc-41f5-a9b1-c3806104b4e4', 'CUB', 'Cuba', 'Havana', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('455c5650-dece-4e48-a50e-bd9be4a3fc78', 'MNG', 'Mongolia', 'Ulan Bator', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4562becb-57de-49f9-8fc1-ec24195bfc81', 'SOM', 'Somalia', 'Mogadishu', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('48bc0fe4-f87a-4c11-b84b-8ac844ff1e52', 'ARM', 'Armenia', 'Yerevan', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('48d3eaaf-cb14-4266-94e8-bc500dd176b7', 'HRV', 'Croatia', 'Zagreb', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('49bdbc35-4502-4db8-8d05-65fa7594c56b', 'SLV', 'El Salvador', 'San Salvador', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('49d568e6-19e8-412b-b2e1-0d59ab204977', 'BLR', 'Belarus', 'Minsk', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4afd053b-6f5e-4361-bf19-f2a9eba81196', 'GEO', 'Georgia', 'Tbilisi', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4b67ac60-f3c8-49f1-a311-b63134e5f471', 'ASM', 'American Samoa', 'Pago Pago', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4be3145e-86d5-465a-aec6-f00f46562c72', 'KGZ', 'Kyrgyzstan', 'Bishkek', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4d969701-5a2c-44d9-9fff-bd61bd9a4720', 'SWZ', 'Swaziland', 'Mbabane', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('4f54e9fb-68fa-4508-a66b-f55024397aab', 'DEU', 'Germany', 'Berlin', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('509b3873-aed4-46e2-96bc-70809f8fa6f7', 'ETH', 'Ethiopia', 'Addis Ababa', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('52479b0b-002d-4864-9f3e-44d057b095fd', 'IOT', 'British Indian Ocean Territory', 'Diego Garcia', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('55874952-11f5-4677-aa79-76b8c0fa2531', 'BEN', 'Benin', 'Porto-Novo', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('566fe657-5180-4057-ab23-476b6db9d7b8', 'TGO', 'Togo', 'Lome', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5717a2a9-7d53-447a-9da0-c331c2a1755f', 'GAB', 'Gabon', 'Libreville', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('57627aea-4193-44e5-a5cd-a28cc9d5d099', 'SDN', 'Sudan', 'Khartoum', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('57790d27-1380-4c00-93aa-e4398e47e8a8', 'PRK', 'North Korea', 'Pyongyang', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('57e21285-216a-49f0-b60b-cd94f185d740', 'ATG', 'Antigua and Barbuda', 'St. John\'s', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('58432a38-fe8c-4242-8311-49e2feda70c7', 'MDA', 'Moldova', 'Chisinau', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('58e558ed-f535-46d2-b1bf-d3e752f51306', 'TUR', 'Turkey', 'Ankara', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5937bfea-4ed2-41a4-a298-8fa8f15d085f', 'NIC', 'Nicaragua', 'Managua', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('59908e16-db71-4b08-b11f-461dfc890b57', 'ZAF', 'South Africa', 'Pretoria', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('59b2348f-f062-4cc5-a9be-271f13b1fae3', 'GRC', 'Greece', 'Athens', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5ab9b5d5-c63a-4bd8-9b88-6aa8db5e1477', 'NGA', 'Nigeria', 'Abuja', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5b2e4f4f-4e14-4315-83e7-cf6d3b186e14', 'GHA', 'Ghana', 'Accra', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5bc4e785-7c32-4888-b517-98b8e82af015', 'BLZ', 'Belize', 'Belmopan', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5be22e47-1e03-4508-84f1-8ee20b46f959', 'PLW', 'Palau', 'Melekeok', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5cf5f2f7-db09-43f9-b494-8974288c014c', 'TTO', 'Trinidad and Tobago', 'Port of Spain', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5d74bab0-e483-4e57-be4a-e3342ba341de', 'KNA', 'Saint Kitts and Nevis', 'Basseterre', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5ecfb4cd-664f-412e-87e3-f488d0bad482', 'CCK', 'Cocos Islands', 'West Island', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5f21c5d8-eef8-42af-86a8-76e89ebabf96', 'CPV', 'Cape Verde', 'Praia', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('5f639fc6-b7c8-45cf-8fb1-cc4b8182dbc2', 'SLB', 'Solomon Islands', 'Honiara', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6114daf7-b7c2-4132-8ab6-7b07145a92bc', 'TCA', 'Turks and Caicos Islands', 'Cockburn Town', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('61dac06b-6e77-4749-8700-c3091a32391a', 'NPL', 'Nepal', 'Kathmandu', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('622ff085-5566-441e-9906-8674b4ca120f', 'GGY', 'Guernsey', 'St Peter Port', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('63a55713-b6f1-423d-8ac3-d2a1927ef9fe', 'HUN', 'Hungary', 'Budapest', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('63ddcda7-0f7c-46b7-992d-3f434fade7f8', 'QAT', 'Qatar', 'Doha', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('63df775f-29c7-4642-93ad-1fba5b270abc', 'NLD', 'Netherlands', 'Amsterdam', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('646338d6-4c58-451d-8864-205707460ae5', 'GTM', 'Guatemala', 'Guatemala City', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('65e72c42-0247-4940-8262-6db2f8124a26', 'BVT', 'Bouvet Island', '', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6a0eeeab-9ad8-4f3f-8692-b0495eaf1cd3', 'GNB', 'Guinea-Bissau', 'Bissau', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6a5a4edf-a10b-4a85-a8bb-99d3b569b12a', 'SAU', 'Saudi Arabia', 'Riyadh', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6af0d0d2-346e-4e50-9e4d-c9921ad580e0', 'BFA', 'Burkina Faso', 'Ouagadougou', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6b691214-da90-4ba1-a8ba-e20f41656400', 'ITA', 'Italy', 'Rome', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6ef06a69-f813-4104-b763-90e2f64ef352', 'GNQ', 'Equatorial Guinea', 'Malabo', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('6f7467f4-27db-47d7-a5bb-85e6d5fdd212', 'PCN', 'Pitcairn', 'Adamstown', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('70ba35f3-2fa8-4b3a-b0fe-5ff5b733ede5', 'SWE', 'Sweden', 'Stockholm', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('71895443-796f-4dd2-9611-05aef07395bd', 'MNP', 'Northern Mariana Islands', 'Saipan', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('73cebb35-c29e-465f-ad88-f1ed31168f2f', 'KAZ', 'Kazakhstan', 'Astana', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('741ba998-3ad7-4c2e-93d3-48ea94e296ed', 'BEL', 'Belgium', 'Brussels', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('75f6d1dc-5818-464d-aa30-eb722b87f9e6', 'CXR', 'Christmas Island', 'Flying Fish Cove', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('76400944-7a48-449e-ac89-ad62a401c2af', 'CAN', 'Canada', 'Ottawa', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('76c5fafc-b8b9-4f1a-9d5c-51e03ed07643', 'MYT', 'Mayotte', 'Mamoudzou', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7877dbd1-7db1-4835-b05e-4ffcd29f932c', 'SGS', 'South Georgia and the South Sandwich Islands', 'Grytviken', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('79546002-4bc0-4c6f-a191-2a6eb2aacfac', 'VIR', 'U.S. Virgin Islands', 'Charlotte Amalie', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7a702207-008d-4b35-8fba-eb6cff6c3e8f', 'AND', 'Andorra', 'Andorra la Vella', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7b3c4f0b-2b02-4076-b01d-c4116c33e6dc', 'CHN', 'China', 'Beijing', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7b81430d-7d4f-4d27-a878-7ddcaa3bb9b4', 'SEN', 'Senegal', 'Dakar', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7bcf640f-479e-4fc5-ac22-67cdba4c951a', 'BTN', 'Bhutan', 'Thimphu', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7c3402cd-7404-4499-9a00-aac230d08529', 'ISR', 'Israel', 'Jerusalem', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7c4fb155-8e36-454e-8a89-d5aa5b066486', 'IRN', 'Iran', 'Tehran', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7c906a1a-20a8-48a7-aabf-498a8ee53dee', 'SLE', 'Sierra Leone', 'Freetown', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7d9cfb04-d587-4634-a6f1-516f36f660cb', 'ARE', 'United Arab Emirates', 'Abu Dhabi', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7e31e3a6-00cd-40fc-9c6e-847f51b99861', 'EST', 'Estonia', 'Tallinn', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7f20b7cc-a1d2-410f-9cd3-8f1c035ad096', 'LSO', 'Lesotho', 'Maseru', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('7ff38c53-f260-4271-86ff-7e5c6bb86ed1', 'PNG', 'Papua New Guinea', 'Port Moresby', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('807307c0-0ff3-4fb0-aacf-7daa53bc609a', 'UKR', 'Ukraine', 'Kyiv', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('81a7b7f1-91b4-474f-af64-cf203a49d3ee', 'TJK', 'Tajikistan', 'Dushanbe', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('83b80c5e-0859-4253-a56f-4806525b9bac', 'BHS', 'Bahamas', 'Nassau', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('84d0e3f2-3461-4a39-9c2e-e63e5f6dd0f5', 'COD', 'Democratic Republic of the Congo', 'Kinshasa', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('87078509-c8f3-4d96-865b-e371ac477d3f', 'PHL', 'Philippines', 'Manila', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('871fe7cb-8faf-46db-a06e-9600516335ec', 'URY', 'Uruguay', 'Montevideo', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('88933f01-f7d2-4ba2-a301-5c94ea2e0247', 'GUM', 'Guam', 'Hagatna', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('88f5c1dc-51d3-43f3-9111-2a0bca1fb241', 'CUW', 'Curacao', ' Willemstad', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('8a6515ce-40af-4e02-9baa-954ef7af2e7a', 'PRY', 'Paraguay', 'Asuncion', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('8f7b879b-4f9f-4fc7-a403-6d56cbf4ee70', 'VGB', 'British Virgin Islands', 'Road Town', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('8f7f6bfe-a475-43aa-b121-3b56f4b80acd', 'MNE', 'Montenegro', 'Podgorica', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('8f95c42f-9698-44fd-ad65-ebb64ea075c1', 'BIH', 'Bosnia and Herzegovina', 'Sarajevo', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('918e9067-4d7b-48e3-bf94-dcc4e9f4b119', 'COM', 'Comoros', 'Moroni', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('92916cc9-502b-459a-b515-6eca00b57743', 'KIR', 'Kiribati', 'Tarawa', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('92ae615a-2fa6-4cdb-9681-dcf07df054d9', 'NIU', 'Niue', 'Alofi', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('93d76704-32dd-4992-930d-034a04b00c2b', 'HKG', 'Hong Kong', 'Hong Kong', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('93dcfda9-b0aa-4c64-94f8-272c856c92b2', 'FSM', 'Micronesia', 'Palikir', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('946503dd-233b-45da-b714-e386827eba8d', 'PRI', 'Puerto Rico', 'San Juan', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('98c51600-3499-412e-bf43-21f15fc4de32', 'PAK', 'Pakistan', 'Islamabad', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('99ee0204-0462-4007-8ec4-ad8aedc6fc0a', 'KEN', 'Kenya', 'Nairobi', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('9b3b30ee-d8d2-4e52-9d7e-451082b39318', 'LTU', 'Lithuania', 'Vilnius', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('9b80d010-c435-41db-90b9-c67e06b65276', 'SPM', 'Saint Pierre and Miquelon', 'Saint-Pierre', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('9bc99490-4cda-426f-a9e7-14dd53769634', 'BLM', 'Saint Barthelemy', 'Gustavia', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('9f436fb8-d720-4346-b809-316d881d7928', 'GBR', 'United Kingdom', 'London', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('9f58ae68-e47c-42af-b64c-049a46ac5195', 'AUS', 'Australia', 'Canberra', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a0bae906-de4f-4a42-93a1-37b356347749', 'DOM', 'Dominican Republic', 'Santo Domingo', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a0fd203a-0b0c-4184-bf17-356974d0ee66', 'EGY', 'Egypt', 'Cairo', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a28dea04-95a6-4268-94a5-9864ef9b2ef6', 'USA', 'United States', 'Washington', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a3b1fbb6-1a6a-40f9-96dd-b20ee8dd5c1a', 'UZB', 'Uzbekistan', 'Tashkent', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a4f9b23e-882d-4413-bdcf-42443bd3b47b', 'CHE', 'Switzerland', 'Bern', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a5034947-3810-4755-9f99-21d838710806', 'SXM', 'Sint Maarten', 'Philipsburg', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a57a9912-77ed-4b5a-aab8-0e8d2db29f9a', 'KOR', 'South Korea', 'Seoul', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a739f52c-7dc7-4c70-9ecb-ba23c928be20', 'HMD', 'Heard Island and McDonald Islands', '', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('a9497508-9a72-4326-aa7b-11eaa68e4426', 'ALB', 'Albania', 'Tirana', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ab56e14b-dc40-4e54-9875-52e3c79ebf5c', 'SRB', 'Serbia', 'Belgrade', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ac706ad2-04ab-44fa-93f9-6c9fefe3ba3d', 'LBN', 'Lebanon', 'Beirut', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ae2ad8ed-5499-40a4-8714-f5e54a56dba7', 'GIN', 'Guinea', 'Conakry', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('af63e7a3-c130-4ef7-b7fa-1448d71c2a12', 'COL', 'Colombia', 'Bogota', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b00ea617-3ff1-46dc-a792-c710493832c7', 'CAF', 'Central African Republic', 'Bangui', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b34553eb-ba32-476b-97c3-d20bb5a921aa', 'CRI', 'Costa Rica', 'San Jose', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b354d927-add4-425d-89fe-3122ff096cf5', 'LBY', 'Libya', 'Tripoli', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b39d0083-e9a1-4148-b70a-78f3d76eff1e', 'CYP', 'Cyprus', 'Nicosia', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b40fee99-0d7e-4d30-b4f0-b2b792152025', 'AGO', 'Angola', 'Luanda', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b5a01970-5ea6-40e2-90dc-f0f7c7075887', 'TKL', 'Tokelau', '', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b5de4dfd-d4d1-4e5d-aca1-6ab3962a037a', 'RWA', 'Rwanda', 'Kigali', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b7669c27-87e4-44d9-b026-ffeb487d6e16', 'TKM', 'Turkmenistan', 'Ashgabat', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b81276f2-2b8f-41ad-9603-04523d525476', 'SHN', 'Saint Helena', 'Jamestown', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('b82a365c-3955-45ed-aa03-390061cb0869', 'TLS', 'Timor Leste', 'Dili', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ba4d7066-aa7f-4dec-86fc-13a73c457480', 'NCL', 'New Caledonia', 'Noumea', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('bacfe7f8-0e6b-466f-8c36-3a462aef6ac9', 'SVN', 'Slovenia', 'Ljubljana', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('baff1c7f-d033-46ea-82d0-1108c0f2beee', 'GMB', 'Gambia', 'Banjul', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('bc3a065c-a2e3-432e-8e4e-009e9374c28c', 'ECU', 'Ecuador', 'Quito', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('bcb9825a-f17f-483e-9b24-ca757ed282c1', 'AZE', 'Azerbaijan', 'Baku', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('be3aba62-d18a-4a18-9de3-5845a84a4acb', 'IRQ', 'Iraq', 'Baghdad', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c0352dc1-80f3-424b-977f-6ceeb3c7ea0e', 'GLP', 'Guadeloupe', 'Basse-Terre', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c0cc01fd-e8dd-4c89-80a0-b834698033d4', 'TUN', 'Tunisia', 'Tunis', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c0d408e8-5ced-44b3-9858-db281c88e9f0', 'WLF', 'Wallis and Futuna', 'Mata Utu', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c11e0064-7f1b-449e-9e99-1d156ab31c00', 'UMI', 'United States Minor Outlying Islands', '', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c259b2fb-5a3c-40fc-b033-d559da956bba', 'IRL', 'Ireland', 'Dublin', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c4aa5585-0d33-45ef-b9d2-b8374df3945f', 'KWT', 'Kuwait', 'Kuwait City', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c4d74274-ecfc-4bae-9fba-bb69b21902a7', 'ARG', 'Argentina', 'Buenos Aires', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c56269cc-bc26-4cf8-a394-31bad1bbab1a', 'MOZ', 'Mozambique', 'Maputo', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c5ad73bd-45f4-4c21-aa3a-ecbc54348a66', 'GRL', 'Greenland', 'Nuuk', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c5b25062-5b98-4ba0-a769-dbd4649a74a5', 'BGD', 'Bangladesh', 'Dhaka', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c74fd42b-cb5f-4120-bd31-bf616b998e53', 'DZA', 'Algeria', 'Algiers', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c7595b1c-7195-49b5-be19-2cbac80935aa', 'CMR', 'Cameroon', 'Yaounde', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c900b460-f554-4bc0-a198-4803f71a4cc6', 'FIN', 'Finland', 'Helsinki', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c93d4220-ac7d-4dd5-8991-6953ba343a51', 'MUS', 'Mauritius', 'Port Louis', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('c9fc73ea-143a-4c7e-9a6f-57b9b08215f8', 'MYS', 'Malaysia', 'Kuala Lumpur', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ca384124-e2df-4274-aa64-53dcac1c9372', 'LCA', 'Saint Lucia', 'Castries', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('cb04156c-4b09-413f-b60b-711cebf0fc22', 'BWA', 'Botswana', 'Gaborone', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('cb68cf05-6353-4242-8184-3ad094377722', 'DMA', 'Dominica', 'Roseau', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('cbcfdaa0-465d-4442-8594-2df24c9aaed1', 'LUX', 'Luxembourg', 'Luxembourg', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('cda9ae0b-7ad8-4602-9303-1e8ba536ed2e', 'NFK', 'Norfolk Island', 'Kingston', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('cea542f2-b1fe-438f-8de2-86bf2bc3cb24', 'CZE', 'Czechia', 'Prague', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('d14d9883-c2ee-411f-b0a1-45ff3b25ab52', 'PSE', 'Palestinian Territory', 'East Jerusalem', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('d3608251-6a95-48a1-9b7a-affcff38e9c7', 'ESP', 'Spain', 'Madrid', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('d61a20c5-2e5c-47b8-8689-af78765a07d2', 'HND', 'Honduras', 'Tegucigalpa', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('d6959d01-7da7-4a6f-b706-27b850e6683a', 'GUY', 'Guyana', 'Georgetown', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('d8592199-42b7-4b3d-91b6-8b66f7c74bb7', 'CIV', 'Ivory Coast', 'Yamoussoukro', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('d8c9ee80-f8dc-4ea4-ac76-1bb226dddfe3', 'PYF', 'French Polynesia', 'Papeete', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('dc29d0a8-956a-4199-9bce-ee0ed54e863e', 'LKA', 'Sri Lanka', 'Colombo', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('de701ab3-5e48-4dbb-b86e-bc56d4760961', 'OMN', 'Oman', 'Muscat', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('dec59b08-126e-48b4-b51f-77befa0c6c46', 'XKX', 'Kosovo', 'Pristina', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('df1b9962-c88f-43e5-b98e-e2006eb1c6d1', 'MDV', 'Maldives', 'Male', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('df612e34-6031-4c90-8dfb-1155dba9768b', 'AIA', 'Anguilla', 'The Valley', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e3d17879-7fa7-43d2-bbbb-081be3dde13b', 'VEN', 'Venezuela', 'Caracas', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e4691702-d2db-4099-b7de-5cfbc2ee5542', 'ZWE', 'Zimbabwe', 'Harare', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e46d9f85-c807-47cf-a5bd-a55f580aa749', 'ESH', 'Western Sahara', 'El-Aaiun', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e4d74059-d56d-47ee-99c9-b958a4fbae9e', 'JAM', 'Jamaica', 'Kingston', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e4f44d1c-8813-435a-b268-a390d4a8eaa9', 'NRU', 'Nauru', 'Yaren', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e573863e-a6ac-4819-9d99-3ba2da993863', 'SVK', 'Slovakia', 'Bratislava', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('e831875c-8b9c-43f7-8ee5-5ded2f52c8e0', 'TUV', 'Tuvalu', 'Funafuti', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ea1e4d33-efd3-4faa-8e0e-e527e03a09b0', 'FRA', 'France', 'Paris', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ea2e12d9-b7b6-4a90-88ff-1b29eb1448bf', 'GRD', 'Grenada', 'St. George\'s', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ea4c70b5-a56b-4879-851a-116f39898a6b', 'IDN', 'Indonesia', 'Jakarta', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('eaf68ea8-fa41-4b3d-b69e-3def29e43f23', 'DNK', 'Denmark', 'Copenhagen', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ed1e4ed3-11ff-474c-b209-612cb11c6a5e', 'MAC', 'Macao', 'Macao', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ed29456b-d2db-4ede-9509-1a3829cbafc0', 'NER', 'Niger', 'Niamey', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f1e5fabe-2015-4317-bac3-41db3b0ec5c4', 'BRA', 'Brazil', 'Brasilia', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f2d35b5e-1553-4274-b787-3ca3ae9f6c60', 'NOR', 'Norway', 'Oslo', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f3e27891-738f-4842-87a0-782292193d83', 'ROU', 'Romania', 'Bucharest', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f41819d6-41d1-440b-ba0a-da7680909cc5', 'MAR', 'Morocco', 'Rabat', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f48f6e5b-9f43-4c2b-80c6-36ef8ccba115', 'MDG', 'Madagascar', 'Antananarivo', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f4a13ec2-d4d9-4dd4-ab6d-ed0519abd58b', 'LAO', 'Laos', 'Vientiane', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f75a3e9f-6824-4d6b-a8f2-f87261c86dd5', 'WSM', 'Samoa', 'Apia', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f87c241e-b223-46d2-a21d-c4f6246abe94', 'TON', 'Tonga', 'Nuku\'alofa', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f8ff9ea4-72c9-4344-b806-7cb06e67bf63', 'FLK', 'Falkland Islands', 'Stanley', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('f9a52d0d-2418-494a-9fb3-66902083dede', 'PER', 'Peru', 'Lima', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fa362921-0ed1-4cf6-ad07-a6e52eb96a9d', 'TZA', 'Tanzania', 'Dodoma', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fa9c6c4a-9f66-4eb3-8794-1214a60ade95', 'IND', 'India', 'New Delhi', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fab6ef95-b996-478d-a974-0d7ec1abb65f', 'ANT', 'Netherlands Antilles', 'Willemstad', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fb46418f-0efb-45ff-a20e-db2503cd2a18', 'KHM', 'Cambodia', 'Phnom Penh', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fbda2826-0bcc-4468-905c-3988e6a83e22', 'COG', 'Republic of the Congo', 'Brazzaville', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fbe9c49a-cd7a-42a6-a282-e7419f50e142', 'HTI', 'Haiti', 'Port-au-Prince', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fc72643d-dcf1-4811-b8d3-f5121b67dc22', 'VAT', 'Vatican', 'Vatican City', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('fded8ee3-a338-416a-8094-55b48fc8d408', 'SGP', 'Singapore', 'Singapore', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL),
('ff5ac6fb-b67f-4249-bd40-a46d176d153f', 'NZL', 'New Zealand', 'Wellington', NULL, 0, 1, '2018-12-03 23:22:28', NULL, NULL, NULL);

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
-- Table structure for table `mst_locale`
--

CREATE TABLE `mst_locale` (
  `locale_uuid` varchar(36) NOT NULL,
  `locale_code` varchar(10) NOT NULL,
  `locale_identifier` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_locale`
--

INSERT INTO `mst_locale` (`locale_uuid`, `locale_code`, `locale_identifier`, `enabled`, `version`, `is_active`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
('00187e5f-f370-4596-9332-f69c256cba4d', 'sms-FI', 'Sami (Skolt) (Finland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('00a84e84-34ea-4abd-a9b5-17b2d32aaf10', 'ml-IN', 'Malayalam (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('02a9999f-8572-4549-87f9-fe89a5791738', 'smj-SE', 'Sami (Lule) (Sweden)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('06fdfd9e-8073-49d0-a7ec-026a7657f83a', 'or-IN', 'Oriya (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('078bd99f-5d5c-42e8-8e9b-e88171dab306', 'as-IN', 'Assamese (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('0a7d315f-a2ed-42c9-85f2-fce780d68212', 'es-CL', 'Spanish (Chile)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('0c2927d1-8b73-47b1-9b7f-7a704b983a6f', 'ar-BH', 'Arabic (Bahrain)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('0d5d56f7-a58f-4c2e-93c3-83ceb7ac36a2', 'da-DK', 'Danish (Denmark)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('0db737b8-d668-4b1b-a5d9-b46fcf7c6300', 'es-PA', 'Spanish (Panama)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('0e1422ec-0caf-424e-a33f-d048cffb9312', 'ka-GE', 'Georgian (Georgia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('0e7433f4-85c6-4740-b2d0-e810eaeb70eb', 'sw-KE', 'Kiswahili (Kenya)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1487695c-2a09-46e2-9b74-a4d73372f730', 'be-BY', 'Belarusian (Belarus)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('153df727-3464-4d36-8023-286c03e4062f', 'ar-LY', 'Arabic (Libya)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('15bb19c6-cd04-498b-a155-98747ee3cedb', 'sq-AL', 'Albanian (Albania)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('15ce2f51-2494-4019-9f87-a86ab986bdff', 'es-EC', 'Spanish (Ecuador)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('16a79509-a483-433b-9152-a195a3ba1f47', 'dv-MV', 'Divehi (Maldives)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('184e0b74-c863-4f3a-b05a-82652f7b97e3', 'es-SV', 'Spanish (El Salvador)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1a020402-f608-4233-ba04-7a2ddb248ac3', 'sr-BA', 'Serbian (Cyrillic) (Bosnia and Herzegovina)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1a6fb198-ce05-4631-9483-4641f3a94c21', 'ar-DZ', 'Arabic (Algeria)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1aa6bfcf-c3be-49a7-9785-4fc9e694135b', 'smj-NO', 'Sami (Lule) (Norway)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1b2f0952-7b28-451e-b789-b12a4b462ade', 'gu-IN', 'Gujarati (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1db05fa0-7ed5-4439-abb3-0050713ce786', 'mk-MK', 'Macedonian (FYROM) (Macedonia (FYROM))', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1dfdebb6-a844-4f8c-80d9-c84ee76b4964', 'ne-NP', 'Nepali (Nepal)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1e8596f0-1fd3-4a8a-9f4c-9403a75bbc23', 'sr-BA', 'Serbian (Latin) (Bosnia and Herzegovina)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('1f20d508-bdcf-42f7-b6fe-bfb956dedd52', 'es-GT', 'Spanish (Guatemala)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('22745665-9c35-41dc-9cec-ebc9872d4d2c', 'prs-AF', 'Dari (Afghanistan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('22ed84a6-5663-4957-8d19-80611375e898', 'ky-KG', 'Kyrgyz (Kyrgyzstan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('2348aff5-70cc-42d3-948d-8d47cb9cce59', 'el-GR', 'Greek (Greece)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('24d6b752-f802-4055-8c8a-728619147a25', 'es-HN', 'Spanish (Honduras)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('2587f97a-e9dd-4e2b-848a-11695772b192', 'qut-GT', 'K\'iche (Guatemala)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('263f12ed-3018-4441-a096-765bdf539917', 'hsb-DE', 'Upper Sorbian (Germany)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('278e97f1-d656-4189-ae5f-20aaf454a78c', 'ar-LB', 'Arabic (Lebanon)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('291a8c59-381e-4b11-93b1-f5b8cab0ebbe', 'en-MY', 'English (Malaysia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('29e3a279-1384-45d4-8ff0-b4afef68c1dc', 'zh-SG', 'Chinese (Simplified) Legacy (Singapore)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('2d0afd46-4946-495a-abb9-07e78f1f051a', 'ms-MY', 'Malay (Malaysia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('2e365396-c11d-4021-ba68-acc68f699f67', 'oc-FR', 'Occitan (France)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('30def87e-3932-4e9f-bed7-50d43abe08de', 'es-PR', 'Spanish (Puerto Rico)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('3118e419-29b0-479d-92fa-61b2b61943a3', 'mn-MN', 'Mongolian (Cyrillic) (Mongolia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('31bf220a-bd77-46c8-92de-f6c52fef466f', 'af-ZA', 'Afrikaans (South Africa)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('31e3b24b-0290-4df1-9d98-8fe3a2983c11', 'zh-TW', 'Chinese (Traditional) Legacy (Taiwan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('31f259c8-109d-4452-bde0-5ae66de39e09', 'ca-ES', 'Catalan (Spain)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('32b95c26-b834-44a2-b1be-6c70dbbe08d2', 'fr-CH', 'French (Switzerland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('32fec58d-ef7a-46f5-bfbb-69a2fdfe3ff2', 'hi-IN', 'Hindi (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('345c6b63-0cbb-459b-a557-2fe1a16699cf', 'ar-KW', 'Arabic (Kuwait)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('3575f35e-6953-40a0-b8a3-de6582850a0b', 'br-FR', 'Breton (France)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('35b3966c-caf2-4e38-a8f5-3c43c018bc43', 'ja-JP', 'Japanese (Japan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('36d189d2-bb08-47f8-901d-27b8a9b1d7ef', 'en-GB', 'English (United Kingdom)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('38bd0d1f-8ab9-496f-b4e2-ea67a32c24fd', 'cs-CZ', 'Czech (Czech Republic)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('3a3d43f1-d5a7-41c4-8b1d-25bb270e8a2d', 'fr-CA', 'French (Canada)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('3b160556-8262-4289-9adf-35b3171588f3', 'es-UY', 'Spanish (Uruguay)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('3c22e418-e3e5-4b7f-a502-8adad258f0e9', 'en-US', 'English (United States)', 1, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('3d1f4021-e8c3-4f5b-98fd-2169fe1f5a97', 'es-BO', 'Spanish (Bolivia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('4173d0eb-4050-44c4-a6d8-7576abdc87b4', 'eu-ES', 'Basque (Spain)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('420961b2-90a2-480b-865e-069fcab83fa5', 'ar-SY', 'Arabic (Syria)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('43f1d83c-af81-4bdc-8ed9-7ace6956cf75', 'es-CO', 'Spanish (Colombia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('4a1eeac6-a089-4a9f-ac30-894a835a0ecb', 'es-AR', 'Spanish (Argentina)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('4bde7a9d-da1d-4fbd-be64-2e7d465cdbb0', 'mt-MT', 'Maltese (Malta)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('4d32b073-f297-4436-90ae-d99b06d581f6', 'ar-TN', 'Arabic (Tunisia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('4eeb9cb0-b5f6-46e2-a2b6-91665cfddc61', 'yo-NG', 'Yoruba (Nigeria)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('4f069be7-fc20-424b-b350-6ca8b06e21ec', 'cy-GB', 'Welsh (United Kingdom)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('534685ed-acdf-496a-8900-ac575ca4e04a', 'ur-PK', 'Urdu (Islamic Republic of Pakistan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('53c27fa9-53eb-4b56-b200-e9e61edc66be', 'sr-CS', 'Serbian (Cyrillic) (Serbia and Montenegro (Former))', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('540cc315-b1b9-49f5-87fa-bc17f9fb459f', 'es-MX', 'Spanish (Mexico)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('543f0c77-7255-4efb-9943-c104624d1ebc', 'tr-TR', 'Turkish (Turkey)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('5510007b-93c2-4822-8e2c-6f3098107afa', 'fr-BE', 'French (Belgium)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('55559ace-1ffb-420a-9079-246551c64fcf', 'sr-RS', 'Serbian (Latin) (Serbia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('57a59cdb-3007-4365-b3f1-1b359b3ce098', 'bn-IN', 'Bengali (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('59f509b3-750f-4b65-8df4-59e5df4068d9', 'en-NZ', 'English (New Zealand)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('5a237009-480f-4d2d-8143-74907587481b', 'fr-MC', 'French (Principality of Monaco)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('5c22531a-2540-4bae-956b-d52f0f9d0777', 'ar-OM', 'Arabic (Oman)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('5d46d07a-ed06-4d86-b443-b3d30eccba74', 'en-JM', 'English (Jamaica)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('5e9d0a8a-5d96-4136-afd5-e04f5699efb4', 'nn-NO', 'Norwegian (Nynorsk) (Norway)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6165ae24-de1a-4631-8268-0539aa569f50', 'kok-IN', 'Konkani (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('622daaa7-0140-4c27-8c50-a324bfcb347a', 'kl-GL', 'Greenlandic (Greenland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('626b2607-f399-47ce-9bfa-b7e4ee8b09ad', 'it-CH', 'Italian (Switzerland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('64bb90e3-3cbd-44d8-9780-403b9b9279a9', 'th-TH', 'Thai (Thailand)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('66298cfd-db0f-4192-a8d4-466ecd968d47', 'es-PE', 'Spanish (Peru)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('66e10e28-2fd5-4adc-96d1-054fac837272', 'sr-ME', 'Serbian (Cyrillic) (Montenegro)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('67160101-75c1-4693-a983-f3cb6d5c5dad', 'wo-SN', 'Wolof (Senegal)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6735efb7-449e-4882-bd2a-3a18011dea94', 'pa-IN', 'Punjabi (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('67e2ea89-1325-43ac-9062-070db164ae74', 'sk-SK', 'Slovak (Slovakia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('68019110-f0a2-4402-99bc-1595d570ee10', 'ar-MA', 'Arabic (Morocco)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('68472d81-2e2e-4494-a1f8-fa95d9b91c33', 'mr-IN', 'Marathi (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('68816eb0-4956-4fd3-b1c9-7ca02757574c', 'se-NO', 'Sami (Northern) (Norway)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6973727f-a163-4b4a-9198-097e2a389036', 'te-IN', 'Telugu (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('69aecf3e-522e-4663-87ff-3e8f9226a09e', 'arn-CL', 'Mapudungun (Chile)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6b4b8801-024b-4b48-b396-1ab2bceccc84', 'tzm-DZ', 'Tamazight (Latin) (Algeria)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6c894665-4f8a-4a8e-899d-d08ea0db833a', 'iu-CA', 'Inuktitut (Latin) (Canada)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6d2f6ff6-95cd-4ebe-baea-1693bd90e10f', 'en-ZA', 'English (South Africa)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6e06cedf-99a9-4246-b263-44646cd9a098', 'sr-RS', 'Serbian (Cyrillic) (Serbia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('6ea7dda1-567c-4a8a-b75e-865730ab7ae9', 'uk-UA', 'Ukrainian (Ukraine)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('71459d33-82f9-443f-a7c5-2e19482fc364', 'vi-VN', 'Vietnamese (Vietnam)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('72231293-2222-42c5-918e-7024de524d6e', 'zu-ZA', 'isiZulu (South Africa)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('72c4f213-df7a-4b27-8dd7-e39df9d3af18', 'ko-KR', 'Korean (Korea)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('75876e49-0650-490b-8825-bd0a6703c1bf', 'gl-ES', 'Galician (Spain)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('75c80e96-95e2-4e5b-acb5-842d152d2da5', 'sv-SE', 'Swedish (Sweden)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('773429a7-b6da-40cf-9c6e-03c507c275a3', 'se-FI', 'Sami (Northern) (Finland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('77cf1de1-879d-4bc5-b77b-031e044e91a3', 'de-CH', 'German (Switzerland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('79ad40ba-d9b4-424a-a9f7-2165d3f2ddd2', 'ar-YE', 'Arabic (Yemen)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7a917212-2d63-4ffd-83b7-ca2b700f615e', 'bn-BD', 'Bengali (Bangladesh)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7bbb1937-629b-426b-92de-8cc918ccb986', 'en-SG', 'English (Singapore)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7c50e743-35da-49d3-aacf-e4a1ec36fd2c', 'sr-CS', 'Serbian (Latin) (Serbia and Montenegro (Former))', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7c5d4d39-47e1-45f5-ae91-c588855b11b3', 'moh-CA', 'Mohawk (Canada)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7e8a76c7-e9eb-47b8-8cb3-f77f62633266', 'es-US', 'Spanish (United States)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7ed545d5-9c06-47f4-87a1-53402f740878', 'fi-FI', 'Finnish (Finland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('7ee93680-53d5-4916-a542-f0b5df06662b', 'si-LK', 'Sinhala (Sri Lanka)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8241cc45-9c12-4d5e-ae77-0f4b6772d401', 'de-LI', 'German (Liechtenstein)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8700ba64-cf97-4a6c-9bf0-97b8eceb137f', 'lb-LU', 'Luxembourgish (Luxembourg)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('872752f8-7867-4379-a066-9758b35b3213', 'en-029', 'English (Caribbean)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8774e704-5da0-4516-84b4-8f4600659a96', 'ig-NG', 'Igbo (Nigeria)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('88d5004e-b275-4435-8e6c-abf9b59740a0', 'ar-SA', 'Arabic (Saudi Arabia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('898541a2-c990-4cdc-b120-0ef8db8a7cc0', 'km-KH', 'Khmer (Cambodia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8a8049d9-a262-4a10-bbde-1a91a817c3c8', 'ps-AF', 'Pashto (Afghanistan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8d365e48-9d89-4efa-9670-1178dce3cc09', 'ar-EG', 'Arabic (Egypt)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8d5cdb0b-94b5-4693-b485-c5368be1a4af', 'es-DO', 'Spanish (Dominican Republic)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8dc40dab-6063-42ca-930f-a39a9dd71afa', 'fy-NL', 'Frisian (Netherlands)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('8dc61da1-3d29-4304-a5f1-16e55e019429', 'sma-NO', 'Sami (Southern) (Norway)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9018270b-46f5-46c5-a55e-824c389454ff', 'uz-UZ', 'Uzbek (Latin) (Uzbekistan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('916a7399-ae09-476e-b679-09b903c3d2ee', 'co-FR', 'Corsican (France)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('91f3a3b2-64c1-444c-968b-517de902efbf', 'bs-BA', 'Bosnian (Latin) (Bosnia and Herzegovina)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('951d1b3b-9649-4ba7-9c3e-7eb4d7cfdaf0', 'lt-LT', 'Lithuanian (Lithuania)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('95516dad-9c9a-49bf-88da-f40339b79179', 'syr-SY', 'Syriac (Syria)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('971848ae-146c-4f86-aa84-23cceab557a1', 'ar-QA', 'Arabic (Qatar)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('97310a4e-6692-4f0f-97ba-5bda909e931a', 'pl-PL', 'Polish (Poland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('97afbb22-e81c-4abc-b57f-a9241da9ea79', 'bg-BG', 'Bulgarian (Bulgaria)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9820c1c3-b8a2-44ad-8d6d-fab9f2720c72', 'tg-TJ', 'Tajik (Cyrillic) (Tajikistan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('98c2f2a0-2cc6-422d-ba85-dab62296ed6c', 'pt-PT', 'Portuguese (Portugal)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('98c624ab-6c86-48d8-b1b2-f76ed2e53a14', 'ii-CN', 'Yi (People\'s Republic of China)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('99058dde-7723-4821-97d1-e3829eb0876e', 'mi-NZ', 'Maori (New Zealand)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9af1cf66-5449-4569-b77f-00b3bbbae602', 'he-IL', 'Hebrew (Israel)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9b5957dd-c40c-464c-af30-d6f3ee09a5db', 'es-PY', 'Spanish (Paraguay)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9ba6682f-7ee5-49b9-bd22-61c92287d281', 'ta-IN', 'Tamil (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9bcb9334-8d73-4675-8a72-d415b426bad0', 'hu-HU', 'Hungarian (Hungary)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9bfb4802-1fea-40ec-a975-d68ada620ee3', 'en-PH', 'English (Republic of the Philippines)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9c3274ce-1996-43eb-8dce-f6481ad5fd3b', 'de-LU', 'German (Luxembourg)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9d662be6-1548-46df-8967-c172bea55de4', 'ar-JO', 'Arabic (Jordan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9ec7741c-2b67-48ae-bb7e-6ad2a77ad266', 'fr-FR', 'French (France)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('9f8c34c2-c331-4c47-aa44-dd27b3844c40', 'quz-BO', 'Quechua (Bolivia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('a1cdd1a2-2fca-4472-937c-ef122c6d91c0', 'gsw-FR', 'Alsatian (France)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('a2513fd1-217f-41f9-a582-f9d4b87f394e', 'ga-IE', 'Irish (Ireland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('a8495d30-9c63-4114-9363-39e81dd79fca', 'en-IN', 'English (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('a9871f24-7a40-4bb5-94d7-e049186e8d0c', 'de-DE', 'German (Germany)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('aa843891-7fde-433e-ab8a-15d9f0baabb9', 'kn-IN', 'Kannada (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('aaec8a05-652c-4fe3-8925-1fa6ca57ffa5', 'tk-TM', 'Turkmen (Turkmenistan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ad239fd0-34d2-4a12-a3bd-55d9038f6153', 'zh-HK', 'Chinese (Traditional) Legacy (Hong Kong S.A.R.)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('add83fbd-dfb4-4370-8385-9657957ef67d', 'quz-PE', 'Quechua (Peru)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b002c636-fc52-48ef-9365-b8c04982e9dc', 'hr-BA', 'Croatian (Bosnia and Herzegovina)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b156c462-91e9-4992-987b-2b931acb246a', 'sl-SI', 'Slovenian (Slovenia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b159d695-7971-48f9-b5f5-951651181c20', 'tt-RU', 'Tatar (Russia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b44be7ec-d836-4ccb-a254-1371c803e363', 'se-SE', 'Sami (Northern) (Sweden)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b6f6542e-e4eb-454d-ba40-dde0c6aa8127', 'lv-LV', 'Latvian (Latvia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b703268f-ae04-488b-8a81-6b1e03ee7bc0', 'is-IS', 'Icelandic (Iceland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('b7fe0858-d311-4bc7-b0d9-05e7c9e25c16', 'ba-RU', 'Bashkir (Russia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ba428373-cc68-477c-a912-d7191c54c016', 'lo-LA', 'Lao (Lao P.D.R.)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('bac36f12-8f8f-499a-808d-ae244e26ce9f', 'en-CA', 'English (Canada)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('be507765-5c89-4855-b6a9-4968593af0fe', 'es-ES', 'Spanish (Spain)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c045e63e-f619-426b-b402-2afe5040f3f9', 'az-AZ', 'Azeri (Latin) (Azerbaijan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c0b493db-a4bb-4240-8175-f2b91715cb16', 'iu-CA', 'Inuktitut (Syllabics) (Canada)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c0b6c7aa-b61e-4960-a6a4-fe57a2e59ef0', 'nl-BE', 'Dutch (Belgium)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c139635e-2cfb-432c-abcc-561400c951d8', 'quz-EC', 'Quechua (Ecuador)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c4265799-5f09-46c0-a304-849a98d401ed', 'es-CR', 'Spanish (Costa Rica)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c5c695bb-187a-407d-97e4-ba5b1e3bd36d', 'nso-ZA', 'Sesotho sa Leboa (South Africa)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c60d8513-ffcd-4292-81e2-aa7d88ac53ce', 'gd-GB', 'Scottish Gaelic (United Kingdom)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c64a3121-b2ca-44e3-b091-93bf60465ebc', 'ha-NG', 'Hausa (Latin) (Nigeria)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c65ce29c-7018-42c2-9753-aa95ae694c45', 'dsb-DE', 'Lower Sorbian (Germany)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c68e5c42-9c9d-443f-8794-99a2f59ce39e', 'fa-IR', 'Persian (Iran)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c75e0985-bc4a-42ac-a0ee-3608c4ef1fc3', 'bs-BA', 'Bosnian (Cyrillic) (Bosnia and Herzegovina)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('c81f6c71-5b54-4d7f-8ceb-4115b84e90f4', 'nl-NL', 'Dutch (Netherlands)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ca7ca05a-a18e-48a9-b861-40bed1eb5ebf', 'nb-NO', 'Norwegian (Bokmal) (Norway)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('cb1a4b5e-4ac0-447b-b5f2-11537cfef983', 'hr-HR', 'Croatian (Croatia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('cf105689-6433-4013-b04b-4a58c8408cd3', 'am-ET', 'Amharic (Ethiopia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('cf69cbc7-e647-4690-a54b-8456cdfa4cdd', 'mn-CN', 'Mongolian (Traditional Mongolian) (People\'s Republic of China)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('d0c35bad-6708-4a01-924e-d547a0cffdb1', 'et-EE', 'Estonian (Estonia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('d2779e16-dd93-48ae-95e3-b3edf9b168dc', 'xh-ZA', 'isiXhosa (South Africa)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('d2db84ba-70b7-4fdd-a0f8-d74297d3bbb4', 'bo-CN', 'Tibetan (People\'s Republic of China)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('d4e289b0-2c20-4fc4-87a7-eca90f96c694', 'ar-IQ', 'Arabic (Iraq)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('d7c38420-8f0d-41d0-ac71-abcc023441ad', 'en-TT', 'English (Trinidad and Tobago)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('da1d0af7-4c6f-4b67-befc-74014c9458a7', 'id-ID', 'Indonesian (Indonesia)', 1, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('dcb21177-fe06-48ee-93ac-defd32cfed98', 'zh-MO', 'Chinese (Traditional) Legacy (Macao S.A.R.)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('dcbe49cf-09f1-4b07-bd2e-9ce3f6064524', 'az-AZ', 'Azeri (Cyrillic) (Azerbaijan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('dcdaf0ac-d28f-4708-b5bd-8913695f53ff', 'ru-RU', 'Russian (Russia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ddf9e4c8-30d5-4a1f-ba44-e83280520ba7', 'en-IE', 'English (Ireland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('dec24104-2129-405a-83ce-774cad7a09ec', 'fo-FO', 'Faroese (Faroe Islands)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('dfaa8f5d-a136-41b0-b013-3acbd922ea91', 'sa-IN', 'Sanskrit (India)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e13aa866-f071-4a33-98f1-0d663e24bbb2', 'sah-RU', 'Yakut (Russia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e231a153-585b-4372-a3c6-3d30842305fd', 'rm-CH', 'Romansh (Switzerland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e4cb3da2-574f-4611-acd3-5dce7b4c9ae4', 'ro-RO', 'Romanian (Romania)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e6acecc8-8cfd-4fcd-b432-423050040bf9', 'smn-FI', 'Sami (Inari) (Finland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e785967d-f759-4683-83c8-41cd84162cf3', 'de-AT', 'German (Austria)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e8bbf0c7-4365-434f-965e-9ca46fac8667', 'es-VE', 'Spanish (Bolivarian Republic of Venezuela)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('e9b7b988-3fcd-4ecf-8ff5-6cf4d9f8deaf', 'en-AU', 'English (Australia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('eb61d879-070f-4118-b167-0beef494bd29', 'it-IT', 'Italian (Italy)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ece937c8-e789-46a9-a6e5-e6d4d20b02da', 'en-ZW', 'English (Zimbabwe)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ee29ce52-79f3-44b2-bd4c-73f90feef5a8', 'kk-KZ', 'Kazakh (Kazakhstan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ee4381ef-9d9e-459c-bc13-d0d15d11e9af', 'sv-FI', 'Swedish (Finland)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ef1e4316-a51f-4f79-90fe-129b86cf1ba5', 'uz-UZ', 'Uzbek (Cyrillic) (Uzbekistan)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ef65caf9-d8bd-47f6-a6ea-8ec9b1eb6748', 'fil-PH', 'Filipino (Philippines)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f01e6079-3337-4940-88b9-6ae2146cb0c5', 'ar-AE', 'Arabic (U.A.E.)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f0fcae1c-ea75-4b0d-a090-0499cb6b460e', 'sr-ME', 'Serbian (Latin) (Montenegro)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f2120c24-9668-4268-ad4b-5d946ef94152', 'zh-CN', 'Chinese (Simplified) Legacy (People\'s Republic of China)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f3de5593-b572-4f51-8c59-fd89b6bc2aa3', 'es-NI', 'Spanish (Nicaragua)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f4dcd701-5169-449e-bb7d-5742f01aa9e9', 'ug-CN', 'Uyghur (People\'s Republic of China)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f59fe0e6-65f1-44bd-b0be-6d5c4be001ee', 'sma-SE', 'Sami (Southern) (Sweden)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f709c572-326d-47e2-b0a8-962f47b1c8c9', 'en-BZ', 'English (Belize)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f71b360b-936f-4ad4-8ac7-7a61d816ff59', 'tn-ZA', 'Setswana (South Africa)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('f86524cd-3d94-4315-aed2-5b25675ff655', 'ms-BN', 'Malay (Brunei Darussalam)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('fc22c403-2c0c-4bd9-9761-48e25468067d', 'pt-BR', 'Portuguese (Brazil)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('fd83311f-239d-4b3b-b4a8-02ac010af3d2', 'hy-AM', 'Armenian (Armenia)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('fed16c2b-68ee-4318-a985-173a4171be91', 'rw-RW', 'Kinyarwanda (Rwanda)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL),
('ff8b49f4-5b28-487b-8678-84f36e64f573', 'fr-LU', 'French (Luxembourg)', 0, 0, 1, '2018-12-04 00:33:08', NULL, NULL, NULL);

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
('adfdd958-b9fe-4ebe-bf1e-1a19c0637071', 'd68a2ea7-f1cb-484c-a3d4-b669ef3ff3c8');

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
('1ac29215-75e8-4e19-b4f1-e076da7ca1ab', 'admin', '$2a$13$nnc2wLwVUw1.swkX353QTOFYoSZgQZPUUvbAd0mgXV7DMu5KorKw.', 1, 1, 1, 1, 'Administrator', 'admin@cpu.co.id', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2018-12-02 20:50:29', NULL, NULL, NULL),
('adfdd958-b9fe-4ebe-bf1e-1a19c0637071', 'patient', '$2a$13$iyvREnHcryjZbnGwLkaJsug7cOBmk06QtbLN/L7k5ncJFPLildo1y', 1, 1, 1, 1, 'Patient 01', 'patient01@cpu.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2018-12-03 13:05:57', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

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
-- Indexes for table `mst_locale`
--
ALTER TABLE `mst_locale`
  ADD PRIMARY KEY (`locale_uuid`);

--
-- Indexes for table `mst_patient`
--
ALTER TABLE `mst_patient`
  ADD PRIMARY KEY (`patient_uuid`);

--
-- Indexes for table `mst_r_country_currency`
--
ALTER TABLE `mst_r_country_currency`
  ADD KEY `country_uuid` (`country_uuid`),
  ADD KEY `currency_uuid` (`currency_uuid`);

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
-- Constraints for table `mst_r_country_currency`
--
ALTER TABLE `mst_r_country_currency`
  ADD CONSTRAINT `mst_r_country_currency_ibfk_1` FOREIGN KEY (`country_uuid`) REFERENCES `mst_country` (`country_uuid`),
  ADD CONSTRAINT `mst_r_country_currency_ibfk_2` FOREIGN KEY (`currency_uuid`) REFERENCES `mst_currency` (`currency_uuid`);

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
