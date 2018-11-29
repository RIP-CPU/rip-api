package id.co.cpu.master.dao;


import java.util.List;

import id.co.cpu.master.entity.Study;


public interface StudyDao{

	void save(Study study);
	Study update(Study study);
	List<Study> findAll(int firstResult, int maxResults);
	Long count();
	Study findById(long id);
	List<Study> findByPatientId(Long patientId);
	Study findByStudyInstanceUID(String studyInstanceUID);
}
