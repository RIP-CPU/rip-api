package id.co.cpu.master.dao;

import java.util.List;

import id.co.cpu.master.entity.EquipmentDicomEntity;

public interface EquipmentDao {

	void save(EquipmentDicomEntity equipment);
	EquipmentDicomEntity update(EquipmentDicomEntity equipment);
	List<EquipmentDicomEntity> findAll(int firstResult, int maxResults);
	Long count();
	EquipmentDicomEntity findById(String id);
	EquipmentDicomEntity findBySeriesId(String seriesId);
}
