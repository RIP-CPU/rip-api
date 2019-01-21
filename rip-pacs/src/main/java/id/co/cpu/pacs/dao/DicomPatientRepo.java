package id.co.cpu.pacs.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import id.co.cpu.pacs.entity.PatientDicomEntity;

public interface DicomPatientRepo extends JpaRepository<PatientDicomEntity, String>, JpaSpecificationExecutor<PatientDicomEntity> {

	PatientDicomEntity findByPatientId(String patientId);
	
}