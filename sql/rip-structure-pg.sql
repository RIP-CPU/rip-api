CREATE TABLE dcm_equipment (
	equipment_uuid varchar(36) NOT NULL,
	modality varchar(50),
	conversion_type varchar(50),
	station_name varchar(60) NOT NULL,
	institution_name varchar(100) NOT NULL,
	institution_address varchar(150),
	institutional_department_name varchar(50),
	manufacturer varchar(100) NOT NULL,
	manufacturer_model_name varchar(100),
	software_version varchar(100) NOT NULL,
	device_serial_number varchar(100),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	series_uuid varchar(36) NOT NULL,
	PRIMARY KEY (equipment_uuid)
);
CREATE TABLE dcm_instance (
	instance_uuid varchar(36) NOT NULL,
	sop_instance_uid varchar(100) NOT NULL,
	sop_class_uid varchar(100) NOT NULL,
	instance_number int NOT NULL,
	patient_orientation varchar(40),
	media_storage_sop_instance_uid varchar(100),
	transfer_syntax_uid varchar(100) NOT NULL,
	acquisition_date_time timestamp NOT NULL,
	image_type varchar(40) NOT NULL,
	pixel_spacing float NOT NULL,
	image_orientation varchar(40),
	image_position varchar(80),
	slice_thickness float,
	slice_location float,
	window_center varchar(40),
	window_width varchar(40),
	xray_tube_current int,
	exposure_time int,
	kvp varchar(40),
	content_date_time timestamp NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	series_uuid varchar(36) NOT NULL,
	PRIMARY KEY (instance_uuid)
);
CREATE TABLE dcm_patient (
	patient_uuid varchar(36) NOT NULL,
	patient_id varchar(100) NOT NULL,
	patient_name varchar(100) NOT NULL,
	patient_sex varchar(10) NOT NULL,
	patient_birthday date NOT NULL,
	patient_age varchar(10),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (patient_uuid)
);
CREATE TABLE dcm_series (
	series_uuid varchar(36) NOT NULL,
	series_instance_uid varchar(100) NOT NULL,
	series_number int NOT NULL,
	series_description varchar(100),
	body_part_examined varchar(40),
	patient_position varchar(30),
	laterality varchar(100),
	protocol_name varchar(100),
	operators_name varchar(50),
	series_date_time timestamp NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	study_uuid varchar(36) NOT NULL,
	PRIMARY KEY (series_uuid)
);
CREATE TABLE dcm_study (
	study_uuid varchar(36) NOT NULL,
	study_id varchar(50),
	study_description text,
	study_instance_uid varchar(100),
	accession_number varchar(30),
	study_date_time date NOT NULL,
	referring_physician_name varchar(100),
	additional_patient_history text,
	admitting_diagnoses_description varchar(200),
	study_status_id varchar(40),
	study_priority_id varchar(40),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	patient_uuid varchar(36) NOT NULL,
	PRIMARY KEY (study_uuid)
);
CREATE TABLE mst_city (
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
CREATE TABLE mst_country (
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
CREATE TABLE mst_currency (
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
CREATE TABLE mst_district (
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
CREATE TABLE mst_equipment (
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
CREATE TABLE mst_file_group (
	file_group_uuid varchar(36) NOT NULL,
	file_group_name varchar(150),
	file_group_description text,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (file_group_uuid)
);
CREATE TABLE mst_file_metadata (
	file_metadata_uuid varchar(36) NOT NULL,
	file_checksum varchar(36),
	file_extension varchar(255),
	file_path text,
	file_location text,
	file_name text,
	file_type varchar(255),
	file_download_count int,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	file_group_uuid varchar(36) NOT NULL,
	PRIMARY KEY (file_metadata_uuid)
);
CREATE TABLE mst_healthcare (
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
CREATE TABLE mst_healthcare_type (
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
CREATE TABLE mst_language (
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
CREATE TABLE mst_modality (
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
CREATE TABLE mst_polyclinic (
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
CREATE TABLE mst_polyclinic_i18n (
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
CREATE TABLE mst_province (
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
CREATE TABLE mst_r_country_currency (
	country_uuid varchar(36) NOT NULL,
	currency_uuid varchar(36) NOT NULL
);
CREATE TABLE mst_subdistrict (
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
CREATE TABLE mst_zipcode (
	"id" int NOT NULL,
	zipcode varchar(100),
	subdistrict_id int,
	district_id int,
	city_id int,
	province_id int,
	country_uuid varchar(36),
	PRIMARY KEY ("id")
);
CREATE TABLE oauth_access_token (
	token_id varchar(255),
	"token" bytea,
	authentication_id varchar(255) NOT NULL,
	user_name varchar(255),
	client_id varchar(255),
	authentication bytea,
	refresh_token varchar(255),
	PRIMARY KEY (authentication_id)
);
CREATE TABLE oauth_approvals (
	userId varchar(255),
	clientId varchar(255),
	"scope" varchar(255),
	status varchar(10),
	expiresAt timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	lastModifiedAt timestamp
);
CREATE TABLE oauth_client_details (
	client_id varchar(255) NOT NULL,
	resource_ids varchar(255),
	client_secret varchar(255),
	"scope" varchar(255),
	authorized_grant_types varchar(255),
	web_server_redirect_uri varchar(255),
	authorities varchar(255),
	access_token_validity int,
	refresh_token_validity int,
	additional_information varchar(4096),
	autoapprove varchar(255),
	PRIMARY KEY (client_id)
);
CREATE TABLE oauth_client_token (
	token_id varchar(255),
	"token" bytea,
	authentication_id varchar(255) NOT NULL,
	user_name varchar(255),
	client_id varchar(255),
	PRIMARY KEY (authentication_id)
);
CREATE TABLE oauth_code (
	code varchar(255),
	authentication bytea
);
CREATE TABLE oauth_refresh_token (
	token_id varchar(255),
	"token" bytea,
	authentication bytea
);
CREATE TABLE rip_nurse (
	nurse_uuid varchar(36) NOT NULL,
	nurse_id varchar(50) NOT NULL,
	nurse_name varchar(150) NOT NULL,
	nurse_degree text,
	polyclinic_code varchar(100),
	polyclinic_name varchar(150),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (nurse_uuid)
);
CREATE TABLE rip_patient (
	patient_uuid varchar(36) NOT NULL,
	patient_id varchar(50) NOT NULL,
	id_card varchar(100),
	gender varchar(25),
	birthdate date NOT NULL,
	patient_status varchar(150),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	parent_uuid varchar(36),
	family_status varchar(30),
	PRIMARY KEY (patient_uuid)
);
CREATE TABLE rip_patient_appointment (
	patient_appointment_uuid varchar(36) NOT NULL,
	appointment_date timestamp NOT NULL,
	appointment_status varchar(100),
	visit_date timestamp,
	patient_id varchar(50),
	patient_name varchar(150) NOT NULL,
	radiographer_id varchar(50),
	radiographer_name varchar(150),
	modality_code varchar(10),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (patient_appointment_uuid)
);
CREATE TABLE rip_physician (
	physician_uuid varchar(36) NOT NULL,
	physician_id varchar(50) NOT NULL,
	physician_name varchar(150) NOT NULL,
	physician_degree text,
	physician_status varchar(150),
	physician_speciality varchar(150),
	polyclinic_code varchar(100),
	polyclinic_name varchar(150),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (physician_uuid)
);
CREATE TABLE rip_r_radiographer_healthcare (
	radiographer_uuid varchar(36) NOT NULL,
	healthcare_code varchar(200) NOT NULL,
	healthcare_name varchar(200) NOT NULL
);
CREATE TABLE rip_radiographer (
	radiographer_uuid varchar(36) NOT NULL,
	radiographer_id varchar(50) NOT NULL,
	radiographer_name varchar(150) NOT NULL,
	radiographer_degree text,
	radiographer_status varchar(150),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (radiographer_uuid)
);
CREATE TABLE rip_radiology_assessment (
	radiology_assessment_uuid varchar(36) NOT NULL,
	study_uuid varchar(36),
	file_group_uuid varchar(36) NOT NULL,
	patient_id varchar(100) NOT NULL,
	patient_name varchar(100) NOT NULL,
	referring_physician_id text,
	referring_physician_fullname varchar(100),
	radiographer_id varchar(50),
	radiographer_fullname text,
	radiology_diagnose text,
	notes text,
	checkup_date date,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (radiology_assessment_uuid)
);
CREATE TABLE sec_function (
	function_uuid varchar(36) NOT NULL,
	menu_uuid varchar(36) NOT NULL,
	role_uuid varchar(36) NOT NULL,
	"access" varchar(30) DEFAULT 'INQ,GET,ADD,PUT,DEL,APV' NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (function_uuid)
);
CREATE TABLE sec_menu (
	menu_uuid varchar(36) NOT NULL,
	title varchar(100) NOT NULL,
	url text,
	"level" int NOT NULL,
	"ordering" int NOT NULL,
	ordering_str varchar(100),
	icon varchar(100),
	is_leaf boolean DEFAULT false NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	parent_uuid varchar(36),
	PRIMARY KEY (menu_uuid)
);
CREATE TABLE sec_menu_i18n (
	menu_i18n_uuid varchar(36) NOT NULL,
	menu_uuid varchar(36) NOT NULL,
	locale_code varchar(10) NOT NULL,
	title varchar(100) NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (menu_i18n_uuid)
);
CREATE TABLE sec_r_user_nurse (
	user_uuid varchar(36) NOT NULL,
	nurse_id varchar(50) NOT NULL
);
CREATE TABLE sec_r_user_patient (
	user_uuid varchar(36) NOT NULL,
	patient_id varchar(50) NOT NULL
);
CREATE TABLE sec_r_user_physician (
	user_uuid varchar(36) NOT NULL,
	physician_id varchar(50) NOT NULL
);
CREATE TABLE sec_r_user_radiographer (
	user_uuid varchar(36) NOT NULL,
	radiographer_id varchar(50) NOT NULL
);
CREATE TABLE sec_r_user_role (
	user_uuid varchar(36) NOT NULL,
	role_uuid varchar(36) NOT NULL
);
CREATE TABLE sec_role (
	role_uuid varchar(36) NOT NULL,
	role_name varchar(50) NOT NULL,
	description text,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (role_uuid)
);
CREATE TABLE sec_user (
	user_uuid varchar(36) NOT NULL,
	username varchar(25) NOT NULL,
	"password" text NOT NULL,
	account_enabled boolean DEFAULT true NOT NULL,
	account_non_expired boolean DEFAULT true NOT NULL,
	account_non_locker boolean DEFAULT true NOT NULL,
	credentials_non_expired boolean DEFAULT true NOT NULL,
	fullname varchar(200) NOT NULL,
	email varchar(150) NOT NULL,
	address text,
	city varchar(200),
	province varchar(200),
	district_code varchar(100),
	phone_number varchar(20),
	mobile_number varchar(20),
	image varchar(250),
	description text,
	verification_code varchar(100),
	raw text,
	locale varchar(10) DEFAULT 'en-US' NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (user_uuid)
);
CREATE TABLE sys_locale (
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
CREATE TABLE sys_parameter (
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
CREATE TABLE sys_parameter_group (
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
CREATE TABLE sys_parameter_i18n (
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
CREATE TABLE wfl_delegation (
	delegation_uuid varchar(36) NOT NULL,
	user_from varchar(36),
	user_to varchar(36),
	delegate_reason text,
	start_date date,
	end_date date,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (delegation_uuid)
);
CREATE TABLE wfl_document_status (
	document_status_uuid varchar(36) NOT NULL,
	document_status_code varchar(50) NOT NULL,
	document_status_name varchar(200) NOT NULL,
	document_status_description text,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (document_status_uuid)
);
CREATE TABLE wfl_document_status_i18n (
	document_status_i18n_uuid varchar(36) NOT NULL,
	locale_code varchar(10) NOT NULL,
	document_status_uuid varchar(36) NOT NULL,
	document_status_name varchar(100) NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (document_status_i18n_uuid)
);
CREATE TABLE wfl_document_transition (
	document_transition_uuid varchar(36) NOT NULL,
	doc_status_from varchar(36),
	doc_status_to varchar(36),
	document_type_uuid varchar(36),
	role_from varchar(50),
	role_to varchar(50),
	"start" boolean DEFAULT false,
	"end" boolean DEFAULT false,
	raw text,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (document_transition_uuid)
);
CREATE TABLE wfl_document_type (
	document_type_uuid varchar(36) NOT NULL,
	document_type_code varchar(50) NOT NULL,
	document_type_name varchar(150) NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (document_type_uuid)
);
CREATE TABLE wfl_tasklist (
	task_uuid varchar(36) NOT NULL,
	document_type_uuid varchar(36),
	document_status varchar(36),
	document_transition varchar(36),
	document_no varchar(36),
	delegation varchar(36),
	"user" varchar(36),
	"role" varchar(36),
	start_date timestamp,
	end_date timestamp,
	sla_days int,
	sla_hours int,
	sla_minutes int,
	PRIMARY KEY (task_uuid)
);
CREATE TABLE wfl_tasklist_detail (
	task_detail_uuid varchar(36) NOT NULL,
	task_uuid varchar(36) NOT NULL,
	document_status_uuid varchar(36),
	document_transition_uuid varchar(36),
	delegation_uuid varchar(36),
	user_from varchar(36),
	role_from varchar(36),
	user_to varchar(36),
	role_to varchar(36),
	start_date timestamp,
	end_date timestamp,
	sla_days int,
	sla_hours int,
	sla_minutes int,
	PRIMARY KEY (task_detail_uuid)
);

ALTER TABLE rip_patient ADD CONSTRAINT patient_id UNIQUE (patient_id);
ALTER TABLE rip_physician ADD CONSTRAINT physician_id UNIQUE (physician_id);
ALTER TABLE rip_radiographer ADD CONSTRAINT radiographer_id UNIQUE (radiographer_id);
ALTER TABLE rip_nurse ADD CONSTRAINT nurse_id UNIQUE (nurse_id);

ALTER TABLE dcm_equipment
	ADD FOREIGN KEY (series_uuid) 
	REFERENCES dcm_series (series_uuid);


ALTER TABLE dcm_instance
	ADD FOREIGN KEY (series_uuid) 
	REFERENCES dcm_series (series_uuid);


ALTER TABLE dcm_series
	ADD FOREIGN KEY (study_uuid) 
	REFERENCES dcm_study (study_uuid);


ALTER TABLE dcm_study
	ADD FOREIGN KEY (patient_uuid) 
	REFERENCES dcm_patient (patient_uuid);


ALTER TABLE mst_city
	ADD FOREIGN KEY (province_id) 
	REFERENCES mst_province ("id");


ALTER TABLE mst_district
	ADD FOREIGN KEY (city_id) 
	REFERENCES mst_city ("id");


ALTER TABLE mst_equipment
	ADD FOREIGN KEY (modality_uuid) 
	REFERENCES mst_modality (modality_uuid);


ALTER TABLE mst_file_metadata
	ADD FOREIGN KEY (file_group_uuid) 
	REFERENCES mst_file_group (file_group_uuid);


ALTER TABLE mst_healthcare
	ADD FOREIGN KEY (healthcare_type_uuid) 
	REFERENCES mst_healthcare_type (healthcare_type_uuid);


ALTER TABLE mst_polyclinic
	ADD FOREIGN KEY (parent_uuid) 
	REFERENCES mst_polyclinic (polyclinic_uuid);


ALTER TABLE mst_polyclinic_i18n
	ADD FOREIGN KEY (polyclinic_uuid) 
	REFERENCES mst_polyclinic (polyclinic_uuid);


ALTER TABLE mst_province
	ADD FOREIGN KEY (country_uuid) 
	REFERENCES mst_country (country_uuid);


ALTER TABLE mst_r_country_currency
	ADD FOREIGN KEY (country_uuid) 
	REFERENCES mst_country (country_uuid);

ALTER TABLE mst_r_country_currency
	ADD FOREIGN KEY (currency_uuid) 
	REFERENCES mst_currency (currency_uuid);


ALTER TABLE mst_subdistrict
	ADD FOREIGN KEY (district_id) 
	REFERENCES mst_district ("id");


ALTER TABLE mst_zipcode
	ADD FOREIGN KEY (city_id) 
	REFERENCES mst_city ("id");

ALTER TABLE mst_zipcode
	ADD FOREIGN KEY (country_uuid) 
	REFERENCES mst_country (country_uuid);

ALTER TABLE mst_zipcode
	ADD FOREIGN KEY (district_id) 
	REFERENCES mst_district ("id");

ALTER TABLE mst_zipcode
	ADD FOREIGN KEY (province_id) 
	REFERENCES mst_province ("id");

ALTER TABLE mst_zipcode
	ADD FOREIGN KEY (subdistrict_id) 
	REFERENCES mst_subdistrict ("id");

ALTER TABLE rip_patient
	ADD FOREIGN KEY (parent_uuid) 
	REFERENCES rip_patient (patient_uuid);

ALTER TABLE rip_r_radiographer_healthcare
	ADD FOREIGN KEY (radiographer_uuid) 
	REFERENCES rip_radiographer (radiographer_uuid);

ALTER TABLE sec_function
	ADD FOREIGN KEY (role_uuid) 
	REFERENCES sec_role (role_uuid);

ALTER TABLE sec_function
	ADD FOREIGN KEY (menu_uuid) 
	REFERENCES sec_menu (menu_uuid);


ALTER TABLE sec_menu
	ADD FOREIGN KEY (parent_uuid) 
	REFERENCES sec_menu (menu_uuid);


ALTER TABLE sec_menu_i18n
	ADD FOREIGN KEY (menu_uuid) 
	REFERENCES sec_menu (menu_uuid);


ALTER TABLE sec_r_user_nurse
	ADD FOREIGN KEY (user_uuid) 
	REFERENCES sec_user (user_uuid);


ALTER TABLE sec_r_user_patient
	ADD FOREIGN KEY (user_uuid) 
	REFERENCES sec_user (user_uuid);


ALTER TABLE sec_r_user_physician
	ADD FOREIGN KEY (user_uuid) 
	REFERENCES sec_user (user_uuid);


ALTER TABLE sec_r_user_radiographer
	ADD FOREIGN KEY (user_uuid) 
	REFERENCES sec_user (user_uuid);


ALTER TABLE sec_r_user_role
	ADD FOREIGN KEY (role_uuid) 
	REFERENCES sec_role (role_uuid);

ALTER TABLE sec_r_user_role
	ADD FOREIGN KEY (user_uuid) 
	REFERENCES sec_user (user_uuid);


ALTER TABLE sys_parameter
	ADD FOREIGN KEY (parameter_group_uuid) 
	REFERENCES sys_parameter_group (parameter_group_uuid);


ALTER TABLE sys_parameter_i18n
	ADD FOREIGN KEY (parameter_uuid) 
	REFERENCES sys_parameter (parameter_uuid);

ALTER TABLE sys_parameter_i18n
	ADD FOREIGN KEY (locale_uuid) 
	REFERENCES sys_locale (locale_uuid);


ALTER TABLE wfl_document_status_i18n
	ADD FOREIGN KEY (document_status_uuid) 
	REFERENCES wfl_document_status (document_status_uuid);


ALTER TABLE wfl_document_transition
	ADD FOREIGN KEY (doc_status_from) 
	REFERENCES wfl_document_status (document_status_uuid);

ALTER TABLE wfl_document_transition
	ADD FOREIGN KEY (document_type_uuid) 
	REFERENCES wfl_document_type (document_type_uuid);

ALTER TABLE wfl_document_transition
	ADD FOREIGN KEY (doc_status_to) 
	REFERENCES wfl_document_status (document_status_uuid);


ALTER TABLE wfl_tasklist
	ADD FOREIGN KEY (document_type_uuid) 
	REFERENCES wfl_document_type (document_type_uuid);

ALTER TABLE wfl_tasklist
	ADD FOREIGN KEY (document_transition) 
	REFERENCES wfl_document_transition (document_transition_uuid);

ALTER TABLE wfl_tasklist
	ADD FOREIGN KEY (document_status) 
	REFERENCES wfl_document_status (document_status_uuid);

ALTER TABLE wfl_tasklist
	ADD FOREIGN KEY (delegation) 
	REFERENCES wfl_delegation (delegation_uuid);


ALTER TABLE wfl_tasklist_detail
	ADD FOREIGN KEY (task_uuid) 
	REFERENCES wfl_tasklist (task_uuid);

ALTER TABLE wfl_tasklist_detail
	ADD FOREIGN KEY (document_transition_uuid) 
	REFERENCES wfl_document_transition (document_transition_uuid);

ALTER TABLE wfl_tasklist_detail
	ADD FOREIGN KEY (document_status_uuid) 
	REFERENCES wfl_document_status (document_status_uuid);

ALTER TABLE wfl_tasklist_detail
	ADD FOREIGN KEY (delegation_uuid) 
	REFERENCES wfl_delegation (delegation_uuid);


