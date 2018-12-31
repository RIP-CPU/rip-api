package id.co.cpu.security.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import id.co.cpu.security.entity.MenuEntity;

public interface MenuRepo extends JpaRepository<MenuEntity, String>, JpaSpecificationExecutor<MenuEntity> {
	
}