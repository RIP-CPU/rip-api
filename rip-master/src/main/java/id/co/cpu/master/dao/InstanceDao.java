package id.co.cpu.master.dao;

import java.util.List;

import id.co.cpu.master.entity.InstanceDicomEntity;

public interface InstanceDao {

	void save(InstanceDicomEntity instance);
	InstanceDicomEntity update(InstanceDicomEntity instance);
	List<InstanceDicomEntity> findAll(int firstResult, int maxResults);
	Long count();
	InstanceDicomEntity findById(String id);
	List<InstanceDicomEntity> findBySeriesId(String seriesId);
	InstanceDicomEntity findBySopInstanceUID(String sopInstanceUID);
	List<InstanceDicomEntity> findAllByPatientId(String patientId);
}
