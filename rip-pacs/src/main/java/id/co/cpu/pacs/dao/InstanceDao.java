package id.co.cpu.pacs.dao;

import java.util.List;

import id.co.cpu.pacs.entity.Instance;

public interface InstanceDao {

	void save(Instance instance);
	Instance update(Instance instance);
	List<Instance> findAll(int firstResult, int maxResults);
	Long count();
	Instance findById(long pkTBLInstanceID);
	List<Instance> findByPkTBLSeriesID(Long pkTBLSeriesID);
	Instance  findBySopInstanceUID(String sopInstanceUID);
	List<Instance> findAllByPkTBLPatientID(Long pkTBLPatientID);
}
