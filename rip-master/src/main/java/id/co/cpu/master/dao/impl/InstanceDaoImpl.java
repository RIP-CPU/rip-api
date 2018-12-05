package id.co.cpu.master.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import id.co.cpu.master.dao.AbstractJpaDao;
import id.co.cpu.master.dao.InstanceDao;
import id.co.cpu.master.entity.InstanceDicomEntity;

@Repository
public class InstanceDaoImpl extends AbstractJpaDao<InstanceDicomEntity> implements InstanceDao {
	
	@PersistenceContext(unitName = "rip")
	private EntityManager entityManager;
	
	public InstanceDaoImpl(){
		super();
		setClazz(InstanceDicomEntity.class);
	}
		
	@Override
	public List<InstanceDicomEntity> findBySeriesId(String seriesId){
		
		try{
			return entityManager.createQuery("select i from InstanceDicomEntity i  where i.series.id = :seriesId", InstanceDicomEntity.class)
			.setParameter("seriesId", seriesId)			
			.getResultList();
		}catch(Exception e){			
			return null;		
		}
	}
	
	@Override 
	public InstanceDicomEntity findBySopInstanceUID(String sopInstanceUID){
		
		try{
			return entityManager.createQuery("select i from InstanceDicomEntity i  where i.sopInstanceUID = :sopInstanceUID", InstanceDicomEntity.class)
			.setParameter("sopInstanceUID", sopInstanceUID)
			.getSingleResult();
		}catch(Exception e){			
			return null;		
		}
	}
	
	@Override 
	public List<InstanceDicomEntity> findAllByPatientId(String patientId){
		
		try{
			
			return entityManager.createQuery("select i from InstanceDicomEntity i LEFT OUTER JOIN i.series s " +
					"LEFT OUTER JOIN i.series.study st " +
					"LEFT OUTER JOIN i.series.study.patient p " +
					"where p.id = :patientId", InstanceDicomEntity.class)
					.setParameter("patientId", patientId)	
					.getResultList();
			
		}catch(Exception e){
			return null;
		}
	}

}
