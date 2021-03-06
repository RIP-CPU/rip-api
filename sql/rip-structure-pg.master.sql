CREATE TABLE master.mst_city (
	"id" int NOT NULL,
	code varchar(100),
	"name" varchar(200),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	province_id int NOT NULL,
	PRIMARY KEY ("id")
);
CREATE TABLE master.mst_country (
	country_uuid varchar(36) NOT NULL,
	country_code varchar(3) NOT NULL,
	country_name varchar(150) NOT NULL,
	capital varchar(150) NOT NULL,
	phone_prefix varchar(10),
	"flag" varchar(100),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (country_uuid)
);
CREATE TABLE master.mst_currency (
	currency_uuid varchar(36) NOT NULL,
	currency_code varchar(3) NOT NULL,
	currency_name varchar(150) NOT NULL,
	currency_sign varchar(10),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (currency_uuid)
);
CREATE TABLE master.mst_district (
	"id" int NOT NULL,
	code varchar(100),
	"name" varchar(200),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	city_id int NOT NULL,
	PRIMARY KEY ("id")
);
CREATE TABLE master.mst_equipment (
	equipment_uuid varchar(36) NOT NULL,
	equipment_id varchar(150),
	equipment_number varchar(150),
	equipment_name varchar(150) NOT NULL,
	equipment_model varchar(150),
	equipment_version varchar(150),
	software_version varchar(150),
	manufacture varchar(150),
	equipment_specification text,
	equipment_description text,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	modality_uuid varchar(36),
	PRIMARY KEY (equipment_uuid)
);
CREATE TABLE master.mst_file_metadata ( 
	file_metadata_uuid varchar(36) NOT NULL,
	file_checksum varchar(36) NOT NULL,
	file_full_name text NOT NULL,
	file_short_name text,
	file_extension varchar(100),
	file_full_path text,
	file_location text,
	file_size int,
	file_date timestamp,
	file_type varchar(255),
	file_download_count int,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (file_metadata_uuid)
);
CREATE TABLE master.mst_healthcare (
	healthcare_uuid varchar(36) NOT NULL,
	healthcare_code varchar(200) NOT NULL,
	healthcare_name varchar(200) NOT NULL,
	healthcare_description text,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	healthcare_type_uuid varchar(36) NOT NULL,
	PRIMARY KEY (healthcare_uuid)
);
CREATE TABLE master.mst_healthcare_type (
	healthcare_type_uuid varchar(36) NOT NULL,
	healthcare_type_code varchar(100) NOT NULL,
	healthcare_type_name varchar(150) NOT NULL,
	healthcare_type_description text,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (healthcare_type_uuid)
);
CREATE TABLE master.mst_language (
	language_uuid varchar(36) NOT NULL,
	language_code varchar(10) NOT NULL,
	language_identifier varchar(100) NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (language_uuid)
);
CREATE TABLE master.mst_modality (
	modality_uuid varchar(36) NOT NULL,
	modality_code varchar(10) NOT NULL,
	modality_name varchar(150) NOT NULL,
	modality_description text,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (modality_uuid)
);
CREATE TABLE master.mst_polyclinic (
	polyclinic_uuid varchar(36) NOT NULL,
	polyclinic_code varchar(100),
	polyclinic_name varchar(150) NOT NULL,
	polyclinic_description text,
	is_leaf boolean DEFAULT false NOT NULL,
	"level" int NOT NULL,
	"ordering" int NOT NULL,
	ordering_str varchar(150),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	parent_uuid varchar(36),
	PRIMARY KEY (polyclinic_uuid)
);
CREATE TABLE master.mst_polyclinic_i18n (
	polyclinic_i18n_uuid varchar(36) NOT NULL,
	polyclinic_uuid varchar(36) NOT NULL,
	locale_code varchar(10) NOT NULL,
	polyclinic_i18n_name varchar(150) NOT NULL,
	polyclinic_i18n_description text,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (polyclinic_i18n_uuid)
);
CREATE TABLE master.mst_province (
	"id" int NOT NULL,
	code varchar(100),
	"name" varchar(200),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	country_uuid varchar(36) NOT NULL,
	PRIMARY KEY ("id")
);
CREATE TABLE master.mst_r_country_currency (
	country_uuid varchar(36) NOT NULL,
	currency_uuid varchar(36) NOT NULL
);
CREATE TABLE master.mst_subdistrict (
	"id" int NOT NULL,
	code varchar(100),
	"name" varchar(200),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	district_id int NOT NULL,
	PRIMARY KEY ("id")
);
CREATE TABLE master.mst_zipcode (
	"id" int NOT NULL,
	zipcode varchar(100),
	subdistrict_id int,
	district_id int,
	city_id int,
	province_id int,
	country_uuid varchar(36),
	PRIMARY KEY ("id")
);
CREATE TABLE master.mst_locale (
	locale_uuid varchar(36) NOT NULL,
	locale_code varchar(10) NOT NULL,
	locale_identifier varchar(100) NOT NULL,
	locale_icon varchar(100),
	locale_default boolean DEFAULT false NOT NULL,
	locale_enabled boolean DEFAULT true NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (locale_uuid)
);
CREATE TABLE master.mst_parameter (
	parameter_uuid varchar(36) NOT NULL,
	parameter_code varchar(50) NOT NULL,
	parameter_value text NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	parameter_group_uuid varchar(36) NOT NULL,
	PRIMARY KEY (parameter_uuid)
);
CREATE TABLE master.mst_parameter_group (
	parameter_group_uuid varchar(36) NOT NULL,
	parameter_group_code varchar(50) NOT NULL,
	parameter_group_name varchar(100) NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (parameter_group_uuid)
);
CREATE TABLE master.mst_parameter_i18n (
	parameter_i18n_uuid varchar(36) NOT NULL,
	parameter_uuid varchar(36) NOT NULL,
	locale_uuid varchar(36) NOT NULL,
	parameter_value text NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (parameter_i18n_uuid)
);
ALTER TABLE master.mst_file_metadata ADD CONSTRAINT file_checksum UNIQUE (file_checksum);

ALTER TABLE master.mst_city
	ADD FOREIGN KEY (province_id) 
	REFERENCES master.mst_province ("id");

ALTER TABLE master.mst_district
	ADD FOREIGN KEY (city_id) 
	REFERENCES master.mst_city ("id");

ALTER TABLE master.mst_equipment
	ADD FOREIGN KEY (modality_uuid) 
	REFERENCES master.mst_modality (modality_uuid);

ALTER TABLE master.mst_healthcare
	ADD FOREIGN KEY (healthcare_type_uuid) 
	REFERENCES master.mst_healthcare_type (healthcare_type_uuid);

ALTER TABLE master.mst_polyclinic
	ADD FOREIGN KEY (parent_uuid) 
	REFERENCES master.mst_polyclinic (polyclinic_uuid);

ALTER TABLE master.mst_polyclinic_i18n
	ADD FOREIGN KEY (polyclinic_uuid) 
	REFERENCES master.mst_polyclinic (polyclinic_uuid);

ALTER TABLE master.mst_province
	ADD FOREIGN KEY (country_uuid) 
	REFERENCES master.mst_country (country_uuid);

ALTER TABLE master.mst_r_country_currency
	ADD FOREIGN KEY (country_uuid) 
	REFERENCES master.mst_country (country_uuid);

ALTER TABLE master.mst_r_country_currency
	ADD FOREIGN KEY (currency_uuid) 
	REFERENCES master.mst_currency (currency_uuid);

ALTER TABLE master.mst_subdistrict
	ADD FOREIGN KEY (district_id) 
	REFERENCES master.mst_district ("id");

ALTER TABLE master.mst_zipcode
	ADD FOREIGN KEY (city_id) 
	REFERENCES master.mst_city ("id");

ALTER TABLE master.mst_zipcode
	ADD FOREIGN KEY (country_uuid) 
	REFERENCES master.mst_country (country_uuid);

ALTER TABLE master.mst_zipcode
	ADD FOREIGN KEY (district_id) 
	REFERENCES master.mst_district ("id");

ALTER TABLE master.mst_zipcode
	ADD FOREIGN KEY (province_id) 
	REFERENCES master.mst_province ("id");

ALTER TABLE master.mst_zipcode
	ADD FOREIGN KEY (subdistrict_id) 
	REFERENCES master.mst_subdistrict ("id");

ALTER TABLE master.mst_parameter
	ADD FOREIGN KEY (parameter_group_uuid) 
	REFERENCES master.mst_parameter_group (parameter_group_uuid);

ALTER TABLE master.mst_parameter_i18n
	ADD FOREIGN KEY (parameter_uuid) 
	REFERENCES master.mst_parameter (parameter_uuid);

ALTER TABLE master.mst_parameter_i18n
	ADD FOREIGN KEY (locale_uuid) 
	REFERENCES master.mst_locale (locale_uuid);
