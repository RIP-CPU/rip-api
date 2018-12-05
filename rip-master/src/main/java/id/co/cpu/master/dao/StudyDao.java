package id.co.cpu.master.dao;


import java.util.List;

import id.co.cpu.master.entity.StudyDicomEntity;


public interface StudyDao{

	void save(StudyDicomEntity study);
	StudyDicomEntity update(StudyDicomEntity study);
	List<StudyDicomEntity> findAll(int firstResult, int maxResults);
	Long count();
	StudyDicomEntity findById(String id);
	List<StudyDicomEntity> findByPatientId(String patientId);
	StudyDicomEntity findByStudyInstanceUID(String studyInstanceUID);
}
