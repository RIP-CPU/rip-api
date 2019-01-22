CREATE TABLE pacs.dcm_equipment (
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
CREATE TABLE pacs.dcm_instance (
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
CREATE TABLE pacs.dcm_patient (
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
CREATE TABLE pacs.dcm_series (
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
CREATE TABLE pacs.dcm_study (
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

CREATE TABLE pacs.rip_dicom_parameter (
	dicom_parameter_uuid varchar(36) NOT NULL,
	corporate_id varchar(50) NOT NULL,
	corporate_name varchar(255) NOT NULL,
	ae_title varchar(50) NOT NULL,
	dicom_host varchar(150),
	dicom_port int NOT NULL,
	dicom_storage text,
	activated boolean DEFAULT false NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (dicom_parameter_uuid)
);
CREATE TABLE pacs.rip_study_group (
	study_group_uuid varchar(36) NOT NULL,
	patient_id varchar(50),
	patient_name varchar(150) NOT NULL,
	patient_sex varchar(10) NOT NULL,
	patient_birthday date NOT NULL,
	patient_age varchar(10) DEFAULT NULL,
	corporate_id varchar(50),
	corporate_name varchar(255),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	PRIMARY KEY (study_group_uuid)
);
CREATE TABLE pacs.rip_study_details (
	study_details_uuid varchar(36) NOT NULL,
	study_uuid varchar(36),
	diagnose text,
	notes text,
	referring_physician_id varchar(50),
	referring_physician_name varchar(100),
	radiographer_id varchar(50),
	radiographer_name varchar(100),
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	study_group_uuid varchar(36) NOT NULL,
	PRIMARY KEY (study_details_uuid)
);
CREATE TABLE pacs.rip_dicom_history (
	dicom_history_uuid varchar(36) NOT NULL,
	file_checksum varchar(36) NOT NULL,
	dicom_state text,
	storescu boolean DEFAULT true NOT NULL,
	upload boolean DEFAULT false NOT NULL,
	"version" int DEFAULT 0 NOT NULL,
	is_active boolean DEFAULT true NOT NULL,
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(25),
	modified_date timestamp,
	modified_by varchar(25),
	study_details_uuid varchar(36) NOT NULL,
	instance_uuid varchar(36) NOT NULL,
	PRIMARY KEY (dicom_history_uuid)
);
CREATE TABLE pacs.rip_nurse (
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
CREATE TABLE pacs.rip_patient (
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
CREATE TABLE pacs.rip_patient_appointment (
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
CREATE TABLE pacs.rip_physician (
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
CREATE TABLE pacs.rip_r_radiographer_healthcare (
	radiographer_uuid varchar(36) NOT NULL,
	healthcare_code varchar(200) NOT NULL,
	healthcare_name varchar(200) NOT NULL
);
CREATE TABLE pacs.rip_radiographer (
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

ALTER TABLE pacs.rip_patient ADD CONSTRAINT patient_id UNIQUE (patient_id);
ALTER TABLE pacs.rip_physician ADD CONSTRAINT physician_id UNIQUE (physician_id);
ALTER TABLE pacs.rip_radiographer ADD CONSTRAINT radiographer_id UNIQUE (radiographer_id);
ALTER TABLE pacs.rip_nurse ADD CONSTRAINT nurse_id UNIQUE (nurse_id);

ALTER TABLE pacs.dcm_equipment
	ADD FOREIGN KEY (series_uuid) 
	REFERENCES pacs.dcm_series (series_uuid);

ALTER TABLE pacs.dcm_instance
	ADD FOREIGN KEY (series_uuid) 
	REFERENCES pacs.dcm_series (series_uuid);

ALTER TABLE pacs.dcm_series
	ADD FOREIGN KEY (study_uuid) 
	REFERENCES pacs.dcm_study (study_uuid);

ALTER TABLE pacs.dcm_study
	ADD FOREIGN KEY (patient_uuid) 
	REFERENCES pacs.dcm_patient (patient_uuid);

ALTER TABLE pacs.rip_study_details
	ADD FOREIGN KEY (study_group_uuid) 
	REFERENCES pacs.rip_study_group (study_group_uuid);

ALTER TABLE pacs.rip_dicom_history
	ADD FOREIGN KEY (study_details_uuid) 
	REFERENCES pacs.rip_study_details (study_details_uuid);

ALTER TABLE pacs.rip_dicom_history
	ADD FOREIGN KEY (instance_uuid) 
	REFERENCES pacs.dcm_instance (instance_uuid);

ALTER TABLE pacs.rip_patient
	ADD FOREIGN KEY (parent_uuid) 
	REFERENCES pacs.rip_patient (patient_uuid);

ALTER TABLE pacs.rip_r_radiographer_healthcare
	ADD FOREIGN KEY (radiographer_uuid) 
	REFERENCES pacs.rip_radiographer (radiographer_uuid);
