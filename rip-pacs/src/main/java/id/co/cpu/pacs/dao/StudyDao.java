package id.co.cpu.pacs.dao;


import java.util.List;

import id.co.cpu.pacs.entity.Study;


public interface StudyDao{

	void save(Study study);
	Study update(Study study);
	List<Study> findAll(int firstResult, int maxResults);
	Long count();
	Study findById(long pkTBLStudyID);
	List<Study> findByPkTBLPatientID(Long pkTBLPatientID);
	Study findByStudyInstanceUID(String studyInstanceUID);
}
