package id.co.cpu.master.dao.impl;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import id.co.cpu.master.dao.AbstractJpaDao;
import id.co.cpu.master.dao.EquipmentDao;
import id.co.cpu.master.entity.Equipment;

@Repository
public class EquipmentDaoImpl extends AbstractJpaDao<Equipment> implements EquipmentDao {
	
	@PersistenceContext(unitName = "dbdicom")
	private EntityManager entityManager;
	
	public EquipmentDaoImpl(){
		super();
		setClazz(Equipment.class);
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
	public Equipment findBySeriesId(String seriesId){
		
		try{
			return entityManager.createQuery("select e from Equipment e  where e.series.id LIKE :seriesId", Equipment.class)
			.setParameter("seriesId", seriesId)			
			.getSingleResult();
		}catch(Exception e){			
			return null;		
		}
	}

}
