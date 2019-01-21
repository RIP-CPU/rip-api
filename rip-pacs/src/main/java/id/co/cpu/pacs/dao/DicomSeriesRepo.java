package id.co.cpu.pacs.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import id.co.cpu.pacs.entity.SeriesDicomEntity;

public interface DicomSeriesRepo extends JpaRepository<SeriesDicomEntity, String>, JpaSpecificationExecutor<SeriesDicomEntity> {

	List<SeriesDicomEntity> findByStudy_StudyId(String studyId);

	SeriesDicomEntity findBySeriesInstanceUID(String seriesInstanceUID);

	SeriesDicomEntity findBySeriesInstanceUIDAndSeriesNumber(String seriesInstanceUID, Integer seriesNumber);
	
	List<SeriesDicomEntity> findByStudy_Patient_PatientId(String patientId);

}