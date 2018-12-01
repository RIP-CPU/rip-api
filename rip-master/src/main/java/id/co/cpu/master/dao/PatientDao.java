package id.co.cpu.master.dao;

import java.util.List;

import id.co.cpu.master.entity.Patient;

public interface PatientDao {

	void save(Patient patient);
	Patient update(Patient patient);
	List<Patient> findAll(int firstResult, int maxResults);
	Long count();
	Patient findById(String id);
	Patient findByPatientId(String patientId);
}
