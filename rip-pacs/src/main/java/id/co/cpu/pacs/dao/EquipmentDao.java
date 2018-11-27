package id.co.cpu.pacs.dao;

import java.util.List;

import id.co.cpu.pacs.entity.Equipment;

public interface EquipmentDao {

	void save(Equipment equipment);
	Equipment update(Equipment equipment);
	List<Equipment> findAll(int firstResult, int maxResults);
	Long count();
	Equipment findById(long pkTBLEquipmentID);
	Equipment findByPkTBLSeriesID(Long pkTBLSeriesID);
}
