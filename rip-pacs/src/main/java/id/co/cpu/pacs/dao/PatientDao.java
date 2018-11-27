package id.co.cpu.pacs.dao;

import java.util.List;

import id.co.cpu.pacs.entity.Patient;

public interface PatientDao {

	void save(Patient patient);
	Patient update(Patient patient);
	List<Patient> findAll(int firstResult, int maxResults);
	Long count();
	Patient findById(long pkTBLPatientID);
	Patient findByPatientID(String patientID);
}
