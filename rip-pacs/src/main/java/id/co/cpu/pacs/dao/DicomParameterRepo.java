package id.co.cpu.pacs.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import id.co.cpu.pacs.entity.DicomParameterEntity;

public interface DicomParameterRepo extends JpaRepository<DicomParameterEntity, String>, JpaSpecificationExecutor<DicomParameterEntity> {
	
	
}