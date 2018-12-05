package id.co.cpu.master.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import id.co.cpu.master.dao.AbstractJpaDao;
import id.co.cpu.master.dao.StudyDao;
import id.co.cpu.master.entity.StudyDicomEntity;

@Repository
public class StudyDaoImpl extends AbstractJpaDao<StudyDicomEntity> implements StudyDao {
	
	@PersistenceContext(unitName = "rip")
	private EntityManager entityManager;	
	
	public StudyDaoImpl(){
		super();
		setClazz(StudyDicomEntity.class);
	}
		
	@Override
	public List<StudyDicomEntity> findByPatientId(String patientId){
		
		try{
			return entityManager.createQuery("select s from StudyDicomEntity s  where s.patient.id = :patientId", StudyDicomEntity.class)
			.setParameter("patientId", patientId)			
			.getResultList();
		}catch(Exception e){			
			return null;		
		}
	}
	
	@Override 
	public StudyDicomEntity findByStudyInstanceUID(String studyInstanceUID){
		
		try{
			return entityManager.createQuery("select s from StudyDicomEntity s  where s.studyInstanceUID = :studyInstanceUID", StudyDicomEntity.class)
			.setParameter("studyInstanceUID", studyInstanceUID)			
			.getSingleResult();
		}catch(Exception e){			
			return null;		
		}
	}
	
	

}
