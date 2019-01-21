package id.co.cpu.pacs.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import id.co.cpu.pacs.entity.StudyDicomEntity;

public interface DicomStudyRepo extends JpaRepository<StudyDicomEntity, String>, JpaSpecificationExecutor<StudyDicomEntity> {
	
	List<StudyDicomEntity> findByPatient_PatientId(String patientId);

	StudyDicomEntity findByStudyInstanceUID(String studyInstanceUID);
	
}