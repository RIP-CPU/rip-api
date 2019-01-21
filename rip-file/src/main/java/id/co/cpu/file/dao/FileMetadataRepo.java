package id.co.cpu.file.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import id.co.cpu.file.entity.FileMetadataEntity;

public interface FileMetadataRepo extends JpaRepository<FileMetadataEntity, String>, JpaSpecificationExecutor<FileMetadataEntity> {

}