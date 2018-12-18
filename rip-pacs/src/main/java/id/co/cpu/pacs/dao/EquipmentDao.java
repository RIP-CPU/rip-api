package id.co.cpu.pacs.dao;

import java.util.List;

import id.co.cpu.pacs.entity.EquipmentDicomEntity;

public interface EquipmentDao {

	void save(EquipmentDicomEntity equipment);
	EquipmentDicomEntity update(EquipmentDicomEntity equipment);
	List<EquipmentDicomEntity> findAll(int firstResult, int maxResults);
	Long count();
	EquipmentDicomEntity findById(String id);
	EquipmentDicomEntity findBySeriesId(String seriesId);
}
