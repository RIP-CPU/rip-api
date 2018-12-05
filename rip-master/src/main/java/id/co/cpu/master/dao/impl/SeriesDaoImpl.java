package id.co.cpu.master.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import id.co.cpu.master.dao.AbstractJpaDao;
import id.co.cpu.master.dao.SeriesDao;
import id.co.cpu.master.entity.SeriesDicomEntity;

@Repository
public class SeriesDaoImpl extends AbstractJpaDao<SeriesDicomEntity>   implements SeriesDao {	
	
	@PersistenceContext(unitName = "rip")
	private EntityManager entityManager;
	
	public SeriesDaoImpl(){
		super();
		setClazz(SeriesDicomEntity.class);
	}
		
	@Override
	public List<SeriesDicomEntity> findByStudyId(String studyId){
		
		try{
			return entityManager.createQuery("select sr from SeriesDicomEntity sr  where sr.study.id = :studyId", SeriesDicomEntity.class)
			.setParameter("studyId", studyId)			
			.getResultList();
		}catch(Exception e){			
			return null;		
		}
	}	

	@Override 
	public synchronized SeriesDicomEntity findBySeriesInstanceUID(String seriesInstanceUID){
		
		try{
			return entityManager.createQuery("select sr from SeriesDicomEntity sr  where sr.seriesInstanceUID = :seriesInstanceUID", SeriesDicomEntity.class)
			.setParameter("seriesInstanceUID", seriesInstanceUID)			
			.getSingleResult();
		}catch(Exception e){			
			return null;		
		}
	}
	
	@Override 
	public SeriesDicomEntity findBySeriesInstanceUID(String seriesInstanceUID, Integer seriesNumber){
		
		try{
			return entityManager.createQuery("select sr from SeriesDicomEntity sr  where sr.seriesNumber = :seriesNumber AND sr.seriesInstanceUID = :seriesInstanceUID", SeriesDicomEntity.class)
			.setParameter("seriesInstanceUID", seriesInstanceUID)
			.setParameter("seriesNumber", seriesNumber)
			.getSingleResult();
		}catch(Exception e){			
			return null;		
		}
	}
	
	@Override 
	public List<SeriesDicomEntity> findAllByPatientId(String patientId){
		
		try{
			
			return entityManager.createQuery("select sr from SeriesDicomEntity sr LEFT OUTER JOIN sr.study st " +
					"LEFT OUTER JOIN sr.study.patient p " +
					"where p.id = :patientId", SeriesDicomEntity.class)
					.setParameter("patientId", patientId)	
					.getResultList();
			
		}catch(Exception e){
			return null;
		}
	}
	
	
}
