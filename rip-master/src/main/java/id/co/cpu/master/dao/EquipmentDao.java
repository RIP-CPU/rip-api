package id.co.cpu.master.dao;

import java.util.List;

import id.co.cpu.master.entity.Equipment;

public interface EquipmentDao {

	void save(Equipment equipment);
	Equipment update(Equipment equipment);
	List<Equipment> findAll(int firstResult, int maxResults);
	Long count();
	Equipment findById(long id);
	Equipment findBySeriesId(Long seriesId);
}
