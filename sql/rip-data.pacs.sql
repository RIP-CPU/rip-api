--
-- Dumping data for table rip_dicom_parameter
--

INSERT INTO pacs.rip_dicom_parameter(dicom_parameter_uuid, corporate_id, corporate_name, ae_title, dicom_host, dicom_port, dicom_storage, activated) VALUES
	('65e75489-0d8a-4bfe-ba81-1544f5e3d1f3', 'CPU', 'PT. Cipta Pusaka Utama', 'AE-CPU', 'localhost', 104, './tmp/dicom/cpu', true),
	('08029046-b846-4cb2-acbe-6e5178730d07', 'DUMMY', 'Dummy Hospital', 'AE-DUMMY', 'localhost', 11112, './tmp/dicom/dummy', true);
