package id.co.cpu.security.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import id.co.cpu.security.entity.FunctionEntity;

public interface FunctionRepo extends JpaRepository<FunctionEntity, String>, JpaSpecificationExecutor<FunctionEntity> {
	
	@Query("SELECT f FROM FunctionEntity f JOIN FETCH f.menu m WHERE f.role.authority = :role")
	List<FunctionEntity> loadAllMenuByRole(@Param("role") String role);
	
	@Query("SELECT f FROM FunctionEntity f JOIN FETCH f.menu m JOIN m.menuI18n ml WHERE f.role.authority = :role AND ml.locale = :locale")
	List<FunctionEntity> loadAllMenuByRoleI18n(@Param("role") String role, @Param("locale") String locale);
	
}