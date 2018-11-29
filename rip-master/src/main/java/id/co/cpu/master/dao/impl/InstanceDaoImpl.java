package id.co.cpu.master.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import id.co.cpu.master.dao.AbstractJpaDao;
import id.co.cpu.master.dao.InstanceDao;
import id.co.cpu.master.entity.Instance;

@Repository
public class InstanceDaoImpl extends AbstractJpaDao<Instance> implements InstanceDao {
	
	@PersistenceContext(unitName = "dbdicom")
	private EntityManager entityManager;
	
	public InstanceDaoImpl(){
		super();
		setClazz(Instance.class);
	}
		
	@Override
	public List<Instance> findBySeriesId(Long seriesId){
		
		try{
			return entityManager.createQuery("select i from Instance i  where i.series.id = :seriesId", Instance.class)
			.setParameter("seriesId", seriesId)			
			.getResultList();
		}catch(Exception e){			
			return null;		
		}
	}
	
	@Override 
	public Instance findBySopInstanceUID(String sopInstanceUID){
		
		try{
			return entityManager.createQuery("select i from Instance i  where i.sopInstanceUID = :sopInstanceUID", Instance.class)
			.setParameter("sopInstanceUID", sopInstanceUID)
			.getSingleResult();
		}catch(Exception e){			
			return null;		
		}
	}
	
	@Override 
	public List<Instance> findAllByPatientId(Long patientId){
		
		try{
			
			return entityManager.createQuery("select i from Instance i LEFT OUTER JOIN i.series s " +
					"LEFT OUTER JOIN i.series.study st " +
					"LEFT OUTER JOIN i.series.study.patient p " +
					"where p.id = :patientId", Instance.class)
					.setParameter("patientId", patientId)	
					.getResultList();
			
		}catch(Exception e){
			return null;
		}
	}

}
