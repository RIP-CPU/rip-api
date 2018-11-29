package id.co.cpu.master.dao;

import java.util.List;

import id.co.cpu.master.entity.Instance;

public interface InstanceDao {

	void save(Instance instance);
	Instance update(Instance instance);
	List<Instance> findAll(int firstResult, int maxResults);
	Long count();
	Instance findById(long id);
	List<Instance> findBySeriesId(Long seriesId);
	Instance  findBySopInstanceUID(String sopInstanceUID);
	List<Instance> findAllByPatientId(Long patientId);
}
