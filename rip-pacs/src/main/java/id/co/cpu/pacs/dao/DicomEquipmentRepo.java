package id.co.cpu.pacs.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import id.co.cpu.pacs.entity.EquipmentDicomEntity;

public interface DicomEquipmentRepo extends JpaRepository<EquipmentDicomEntity, String>, JpaSpecificationExecutor<EquipmentDicomEntity> {
	
	EquipmentDicomEntity findBySeries_Id(String id);

}