package id.co.cpu.pacs.dao.impl;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import id.co.cpu.pacs.dao.AbstractJpaDao;
import id.co.cpu.pacs.dao.EquipmentDao;
import id.co.cpu.pacs.entity.EquipmentDicomEntity;

@Repository
public class EquipmentDaoImpl extends AbstractJpaDao<EquipmentDicomEntity> implements EquipmentDao {
	
	@PersistenceContext(unitName = "rip")
	private EntityManager entityManager;
	
	public EquipmentDaoImpl(){
		super();
		setClazz(EquipmentDicomEntity.class);
	}
	
	/*@Transactional
	@Override
	public void save(Equipment equipment) {
		entityManager.persist(equipment);
		entityManager.flush();
	}

	@Override
	public List<Equipment> findAll() {
		try{			
			TypedQuery<Equipment> query = entityManager.createQuery("select e FROM Equipment e", Equipment.class);			 
			return query.getResultList();
			
		}catch(Exception e){			
			return null;		
		}
	}

	@Override
	public Equipment findByID(long pkTBLEquipmentID) {
		try{			
			return entityManager.find(Equipment.class, pkTBLEquipmentID);
			
		}catch(Exception e){			
			return null;
		}
	}*/
	
	@Override 
	public EquipmentDicomEntity findBySeriesId(String seriesId){
		
		try{
			return entityManager.createQuery("select e from EquipmentDicomEntity e  where e.series.id LIKE :seriesId", EquipmentDicomEntity.class)
			.setParameter("seriesId", seriesId)			
			.getSingleResult();
		}catch(Exception e){			
			return null;		
		}
	}

}
