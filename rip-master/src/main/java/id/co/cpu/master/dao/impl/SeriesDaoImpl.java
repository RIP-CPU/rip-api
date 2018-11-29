package id.co.cpu.master.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import id.co.cpu.master.dao.AbstractJpaDao;
import id.co.cpu.master.dao.SeriesDao;
import id.co.cpu.master.entity.Series;

@Repository
public class SeriesDaoImpl extends AbstractJpaDao<Series>   implements SeriesDao {	
	
	@PersistenceContext(unitName = "dbdicom")
	private EntityManager entityManager;
	
	public SeriesDaoImpl(){
		super();
		setClazz(Series.class);
	}
		
	@Override
	public List<Series> findByStudyId(Long studyId){
		
		try{
			return entityManager.createQuery("select sr from Series sr  where sr.study.id = :studyId", Series.class)
			.setParameter("studyId", studyId)			
			.getResultList();
		}catch(Exception e){			
			return null;		
		}
	}	

	@Override 
	public synchronized Series findBySeriesInstanceUID(String seriesInstanceUID){
		
		try{
			return entityManager.createQuery("select sr from Series sr  where sr.seriesInstanceUID = :seriesInstanceUID", Series.class)
			.setParameter("seriesInstanceUID", seriesInstanceUID)			
			.getSingleResult();
		}catch(Exception e){			
			return null;		
		}
	}
	
	@Override 
	public Series findBySeriesInstanceUID(String seriesInstanceUID, Integer seriesNumber){
		
		try{
			return entityManager.createQuery("select sr from Series sr  where sr.seriesNumber = :seriesNumber AND sr.seriesInstanceUID = :seriesInstanceUID", Series.class)
			.setParameter("seriesInstanceUID", seriesInstanceUID)
			.setParameter("seriesNumber", seriesNumber)
			.getSingleResult();
		}catch(Exception e){			
			return null;		
		}
	}
	
	@Override 
	public List<Series> findAllByPatientId(Long patientId){
		
		try{
			
			return entityManager.createQuery("select sr from Series sr LEFT OUTER JOIN sr.study st " +
					"LEFT OUTER JOIN sr.study.patient p " +
					"where p.id = :patientId", Series.class)
					.setParameter("patientId", patientId)	
					.getResultList();
			
		}catch(Exception e){
			return null;
		}
	}
	
	
}
