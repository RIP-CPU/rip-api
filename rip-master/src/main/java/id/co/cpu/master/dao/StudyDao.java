package id.co.cpu.master.dao;


import java.util.List;

import id.co.cpu.master.entity.Study;


public interface StudyDao{

	void save(Study study);
	Study update(Study study);
	List<Study> findAll(int firstResult, int maxResults);
	Long count();
	Study findById(String id);
	List<Study> findByPatientId(String patientId);
	Study findByStudyInstanceUID(String studyInstanceUID);
}
