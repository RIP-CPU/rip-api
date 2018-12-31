package id.co.cpu.security.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import id.co.cpu.security.entity.RoleEntity;

public interface RoleRepo extends JpaRepository<RoleEntity, String>, JpaSpecificationExecutor<RoleEntity> {
	
}