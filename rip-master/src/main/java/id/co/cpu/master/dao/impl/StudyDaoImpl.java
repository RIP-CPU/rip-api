package id.co.cpu.master.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import id.co.cpu.master.dao.AbstractJpaDao;
import id.co.cpu.master.dao.StudyDao;
import id.co.cpu.master.entity.Study;

@Repository
public class StudyDaoImpl extends AbstractJpaDao<Study> implements StudyDao {
	
	@PersistenceContext(unitName = "dbdicom")
	private EntityManager entityManager;	
	
	public StudyDaoImpl(){
		super();
		setClazz(Study.class);
	}
		
	@Override
	public List<Study> findByPatientId(Long patientId){
		
		try{
			return entityManager.createQuery("select s from Study s  where s.patient.id = :patientId", Study.class)
			.setParameter("patientId", patientId)			
			.getResultList();
		}catch(Exception e){			
			return null;		
		}
	}
	
	@Override 
	public Study findByStudyInstanceUID(String studyInstanceUID){
		
		try{
			return entityManager.createQuery("select s from Study s  where s.studyInstanceUID = :studyInstanceUID", Study.class)
			.setParameter("studyInstanceUID", studyInstanceUID)			
			.getSingleResult();
		}catch(Exception e){			
			return null;		
		}
	}
	
	

}
