package id.co.cpu.pacs.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import id.co.cpu.pacs.dao.AbstractJpaDao;
import id.co.cpu.pacs.dao.InstanceDao;
import id.co.cpu.pacs.entity.Instance;

@Repository
public class InstanceDaoImpl extends AbstractJpaDao<Instance> implements InstanceDao {
	
	@PersistenceContext(unitName = "dbdicom")
	private EntityManager entityManager;
	
	public InstanceDaoImpl(){
		super();
		setClazz(Instance.class);
	}
		
	@Override
	public List<Instance> findByPkTBLSeriesID(Long pkTBLSeriesID){
		
		try{
			return entityManager.createQuery("select i from Instance i  where i.series.pkTBLSeriesID = :pkTBLSeriesID", Instance.class)
			.setParameter("pkTBLSeriesID", pkTBLSeriesID)			
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
	public List<Instance> findAllByPkTBLPatientID(Long pkTBLPatientID){
		
		try{
			
			return entityManager.createQuery("select i from Instance i LEFT OUTER JOIN i.series s " +
					"LEFT OUTER JOIN i.series.study st " +
					"LEFT OUTER JOIN i.series.study.patient p " +
					"where p.pkTBLPatientID = :pkTBLPatientID", Instance.class)
					.setParameter("pkTBLPatientID", pkTBLPatientID)	
					.getResultList();
			
		}catch(Exception e){
			return null;
		}
	}

}
