package id.co.cpu.pacs.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import id.co.cpu.pacs.entity.InstanceDicomEntity;

public interface DicomInstanceRepo extends JpaRepository<InstanceDicomEntity, String>, JpaSpecificationExecutor<InstanceDicomEntity> {
	
	List<InstanceDicomEntity> findBySeries_Id(String id);

	InstanceDicomEntity findBySopInstanceUID(String sopInstanceUID);
	List<InstanceDicomEntity> findBySeries_Study_Patient_PatientId(String patientId);
}