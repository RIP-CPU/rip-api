package id.co.cpu.master.dao;

import java.util.List;

import id.co.cpu.master.entity.PatientDicomEntity;

public interface PatientDao {

	void save(PatientDicomEntity patient);
	PatientDicomEntity update(PatientDicomEntity patient);
	List<PatientDicomEntity> findAll(int firstResult, int maxResults);
	Long count();
	PatientDicomEntity findById(String id);
	PatientDicomEntity findByPatientId(String patientId);
}
